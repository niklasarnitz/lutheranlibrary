"""Typeset one book: LuaLaTeX for the PDF, TeX4ht (make4ht / tex4ebook) for HTML and EPUB.

Each engine runs on its own copy of the book directory, so their auxiliary
files never mix, and the book directory itself stays untouched.
"""
import os
import re
import shutil
import signal
import subprocess
import zipfile
from pathlib import Path
from xml.sax.saxutils import escape

TEX = Path(__file__).resolve().parent / "tex"
JOB = "main"
# The library's own LaTeX classes and packages, copied next to every book (see TYPESETTING.md).
CLASS_FILES = sorted(p.name for p in TEX.iterdir() if p.suffix in {".cls", ".sty"})
STEP_TIMEOUT = int(os.environ.get("STEP_TIMEOUT", "600"))
# LaTeX output that may lie around in a book directory from compiling it by hand.
BUILD_LEFTOVERS = {".pdf", ".aux", ".log", ".out", ".toc", ".fls", ".fdb_latexmk", ".gz", ".xdv",
                   ".html", ".css", ".epub", ".4ct", ".4tc", ".dvi", ".idv", ".lg", ".tmp", ".xref"}

ENV = os.environ | {
    "LANG": "C.UTF-8",
    # kpathsea: no shell escape; \openout stays below the build directory. Reads are
    # not restricted: openin_any=p breaks luaotfload.
    "shell_escape": "f",
    "openout_any": "p",
}


class StepFailed(Exception):
    pass


def source_files(book):
    return sorted(p for p in book.rglob("*") if p.is_file() and p.suffix not in BUILD_LEFTOVERS
                  and not any(part.startswith(".") for part in p.relative_to(book).parts))


def run(cmd, cwd):
    proc = subprocess.Popen(cmd, cwd=cwd, env=ENV, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT, start_new_session=True)
    try:
        out, _ = proc.communicate(timeout=STEP_TIMEOUT)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        proc.communicate()
        raise StepFailed(f"{cmd[0]} exceeded {STEP_TIMEOUT} s")
    return proc.returncode, out.decode("utf-8", "replace")


def tex_errors(log):
    """The '! ...' error blocks of a TeX log, which is what an editor needs to see."""
    lines = log.splitlines()
    return ["\n".join(lines[i:i + 3]) for i, line in enumerate(lines) if line.startswith("! ")][:20]


def read_log(path):
    return path.read_text("utf-8", "replace") if path.exists() else ""


def stage_dir(book, build, name):
    path = build / name
    path.mkdir(parents=True)
    for file in source_files(book):
        target = path / file.relative_to(book)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy(file, target)
    for shared in ("oll.cfg", *CLASS_FILES):
        shutil.copy(TEX / shared, path / shared)
    return path


def build_pdf(book, build):
    path = stage_dir(book, build, "pdf")
    cmd = ["lualatex", "-interaction=nonstopmode", "-file-line-error=no", f"{JOB}.tex"]
    for attempt in range(3):
        run(cmd, path)
        log = read_log(path / f"{JOB}.log")
        # Two passes settle the table of contents; a third only on request.
        if attempt >= 1 and not re.search(r"Rerun to get|Label\(s\) may have changed", log):
            break
    pdf = path / f"{JOB}.pdf"
    if not pdf.exists():
        raise StepFailed("LuaLaTeX produced no PDF.\n" + ("\n".join(tex_errors(log)) or log[-3000:]))
    pages = re.search(rf"Output written on {JOB}\.pdf \((\d+) pages?", log)
    return pdf, int(pages.group(1)) if pages else None, tex_errors(log)


def build_html(book, build):
    path = stage_dir(book, build, "html")
    code, out = run(["make4ht", "-l", "-a", "warning", "-c", "oll.cfg", "-f", "html5+common_domfilters",
                     "-d", "out", f"{JOB}.tex"], path)
    html = path / "out" / f"{JOB}.html"
    if not html.exists():
        raise StepFailed("TeX4ht produced no HTML.\n" + ("\n".join(tex_errors(read_log(path / f"{JOB}.log"))) or out[-3000:]))
    return html, path / "out" / f"{JOB}.css", tex_errors(read_log(path / f"{JOB}.log"))


def build_epub(book, build, meta):
    path = stage_dir(book, build, "epub")
    code, out = run(["tex4ebook", "-l", "-a", "warning", "-c", "oll.cfg", "-f", "epub3", f"{JOB}.tex"], path)
    epub = path / f"{JOB}.epub"
    if not epub.exists():
        raise StepFailed("tex4ebook produced no EPUB.\n" + ("\n".join(tex_errors(read_log(path / f"{JOB}.log"))) or out[-3000:]))
    fixed = path / "final.epub"
    finish_epub(epub, fixed, meta)
    return fixed


def finish_epub(src, dst, meta):
    """Set catalog metadata (sources rarely use \\title) and add the book stylesheet."""
    extra_css = (TEX / "epub.css").read_bytes()
    with zipfile.ZipFile(src) as zin, zipfile.ZipFile(dst, "w", zipfile.ZIP_DEFLATED) as zout:
        zout.writestr(zipfile.ZipInfo("mimetype"), zin.read("mimetype"), compress_type=zipfile.ZIP_STORED)
        for item in zin.infolist():
            if item.filename == "mimetype":
                continue
            data = zin.read(item.filename)
            if item.filename.endswith(".opf"):
                data = set_opf_metadata(data.decode("utf-8"), meta).encode("utf-8")
            elif item.filename.endswith(".css"):
                data += b"\n" + extra_css
            zout.writestr(item.filename, data)


def set_opf_metadata(opf, meta):
    for tag, value in (("title", meta.get("title")), ("creator", meta.get("author")), ("language", meta.get("language"))):
        if not value:
            continue
        element = f"<dc:{tag}>{escape(value)}</dc:{tag}>"
        pattern = re.compile(rf"<dc:{tag}\b[^>]*>.*?</dc:{tag}>|<dc:{tag}\b[^>]*/>", re.S)
        if pattern.search(opf):
            opf = pattern.sub(lambda m: element, opf, count=1)
        else:
            opf = opf.replace("</metadata>", element + "</metadata>", 1)
    return opf


def typeset(book, build, meta):
    """Build PDF, HTML and EPUB of the book directory into build/; returns their paths."""
    stage = "pdf"
    try:
        pdf, pages, warnings = build_pdf(book, build)
        stage = "html"
        html, css, html_warnings = build_html(book, build)
        stage = "epub"
        epub = build_epub(book, build, meta)
    except (StepFailed, OSError, UnicodeError, zipfile.BadZipFile) as exc:
        raise StepFailed(f"{stage}: {exc}") from exc
    return {"pdf": pdf, "html": html, "css": css, "epub": epub, "pages": pages,
            "warnings": warnings + html_warnings}
