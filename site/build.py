"""Build the static library site from the books in this repository.

A book is a top-level directory whose main.tex starts with a frontmatter block
(see README.md). Each book is typeset once per change of its sources: the PDF,
EPUB and reader HTML are cached in .cache/ under a hash of the sources and the
pipeline, so a rebuild only typesets what changed.

    python3 site/build.py [--out public] [--jobs 2]
"""
import argparse
import hashlib
import json
import re
import shutil
import sys
import tempfile
import unicodedata
import zipfile
from concurrent.futures import ThreadPoolExecutor
from dataclasses import dataclass, field
from datetime import date, datetime, timezone
from pathlib import Path

import jinja2
import yaml

from reader import reader_html
from typeset import JOB, StepFailed, source_files, typeset

SITE = Path(__file__).resolve().parent
ROOT = SITE.parent
# Bump to retypeset every book after a change the pipeline hash below cannot see.
PIPELINE_VERSION = "1"
PIPELINE_FILES = [SITE / "typeset.py", SITE / "reader.py", *sorted((SITE / "tex").iterdir())]
FRONTMATTER = re.compile(r"\A% ---[ \t]*\n((?:%.*\n)*?)% ---[ \t]*\n")
SLUG = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")
FONTS = {"libertinus": "Libertinus", "pagella": "TeX Gyre Pagella", "lmodern": "Latin Modern"}
LANGUAGES = {"de": "German", "en": "English", "la": "Latin", "el": "Greek"}


class BookError(Exception):
    pass


@dataclass
class Book:
    path: Path
    slug: str
    title: str
    author: str = ""
    subtitle: str = ""
    year: int | None = None
    language: str = "de"
    description: str = ""
    topics: list = field(default_factory=list)
    source: str = ""
    rights: str = ""
    # Filled in by the build.
    pages: int | None = None
    font: str = "libertinus"
    built_at: str = ""

    @property
    def full_title(self):
        return f"{self.title}. {self.subtitle}" if self.subtitle else self.title

    @property
    def url(self):
        return f"/works/{self.slug}/"


def slugify(text):
    text = unicodedata.normalize("NFKD", text.replace("ß", "ss")).encode("ascii", "ignore").decode()
    return re.sub(r"[^a-z0-9]+", "-", text.lower()).strip("-")


def frontmatter(text):
    """The YAML between `% ---` lines at the very top of main.tex, without the comment signs."""
    match = FRONTMATTER.match(text)
    if not match:
        return None
    lines = [re.sub(r"^% ?", "", line) for line in match.group(1).splitlines()]
    data = yaml.safe_load("\n".join(lines)) or {}
    if not isinstance(data, dict):
        raise BookError("frontmatter is not a mapping")
    return data


def load_book(path):
    data = frontmatter((path / f"{JOB}.tex").read_text("utf-8"))
    if data is None or data.get("draft"):
        return None
    known = {"title", "subtitle", "author", "year", "language", "description", "topics", "source", "rights", "slug",
             "draft"}
    unknown = set(data) - known
    if unknown:
        raise BookError(f"{path.name}: unknown frontmatter fields {', '.join(sorted(unknown))}")
    for required in ("title", "rights"):
        if not str(data.get(required) or "").strip():
            raise BookError(f"{path.name}: frontmatter needs `{required}`")
    slug = str(data.get("slug") or path.name)
    if not SLUG.match(slug):
        raise BookError(f"{path.name}: slug {slug!r} must be lowercase letters, digits and hyphens")
    topics = data.get("topics") or []
    if isinstance(topics, str):
        topics = [topics]
    return Book(
        path=path, slug=slug, title=str(data["title"]).strip(), subtitle=str(data.get("subtitle") or "").strip(),
        author=str(data.get("author") or "").strip(), year=data.get("year"),
        language=str(data.get("language") or "de"), description=" ".join(str(data.get("description") or "").split()),
        topics=[str(t) for t in topics], source=" ".join(str(data.get("source") or "").split()),
        rights=str(data["rights"]).strip(),
    )


def find_books(root=ROOT):
    books = []
    for path in sorted(p for p in root.iterdir() if p.is_dir() and not p.name.startswith(".")):
        if (path / f"{JOB}.tex").is_file():
            book = load_book(path)
            if book:
                books.append(book)
    seen = {}
    for book in books:
        if book.slug in seen:
            raise BookError(f"{book.path.name} and {seen[book.slug]} share the slug {book.slug}")
        seen[book.slug] = book.path.name
    return books


def main_font(source):
    """The reader uses a web copy of the font the document itself is set in."""
    match = re.search(r"\\setmainfont(?:\[[^\]]*\])?\{([^}]*)\}", source)
    if not match:
        return "lmodern"  # LuaLaTeX's default
    name = match.group(1).lower()
    return "pagella" if "pagella" in name or "palatino" in name else "libertinus"


def book_hash(book):
    digest = hashlib.sha256(PIPELINE_VERSION.encode())
    for file in PIPELINE_FILES:
        digest.update(file.name.encode() + b"\0" + file.read_bytes() + b"\0")
    for file in source_files(book.path):
        digest.update(file.relative_to(book.path).as_posix().encode() + b"\0" + file.read_bytes() + b"\0")
    return digest.hexdigest()


def edition(book, cache):
    """Typeset the book unless the cache holds this exact source; returns the cache directory."""
    target = cache / book.slug
    digest = book_hash(book)
    info_file = target / "info.json"
    if info_file.exists() and json.loads(info_file.read_text())["hash"] == digest:
        print(f"{book.slug}: unchanged", flush=True)
        return target
    print(f"{book.slug}: typesetting", flush=True)
    started = datetime.now(timezone.utc)
    with tempfile.TemporaryDirectory(prefix=f"oll-{book.slug}-") as build:
        meta = {"title": book.full_title, "author": book.author, "language": book.language}
        result = typeset(book.path, Path(build), meta)
        css = result["css"].read_text("utf-8", "replace") if result["css"].exists() else ""
        html, toc = reader_html(result["html"].read_text("utf-8", "replace"), css)
        fresh = cache / f"{book.slug}.tmp"
        shutil.rmtree(fresh, ignore_errors=True)
        fresh.mkdir(parents=True)
        shutil.copy(result["pdf"], fresh / "book.pdf")
        shutil.copy(result["epub"], fresh / "book.epub")
        (fresh / "body.html").write_text(html, "utf-8")
        (fresh / "toc.json").write_text(json.dumps(toc, ensure_ascii=False), "utf-8")
        (fresh / "info.json").write_text(json.dumps({
            "hash": digest, "pages": result["pages"], "warnings": result["warnings"],
            "font": main_font((book.path / f"{JOB}.tex").read_text("utf-8")),
            "built_at": started.isoformat(timespec="seconds"),
        }), "utf-8")
    shutil.rmtree(target, ignore_errors=True)
    fresh.rename(target)
    seconds = (datetime.now(timezone.utc) - started).total_seconds()
    print(f"{book.slug}: typeset in {seconds:.0f} s", flush=True)
    return target


def asset_url(static, name):
    """Static URLs carry a content hash, so they can be cached for good."""
    version = hashlib.sha256((static / name).read_bytes()).hexdigest()[:10]
    return f"/static/{name}?v={version}"


def source_zip(book, target):
    with zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED) as archive:
        for file in source_files(book.path):
            archive.write(file, f"{book.slug}/{file.relative_to(book.path).as_posix()}")


def write(out, path, text):
    target = out / path
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(text, "utf-8")


def render_site(books, editions, out):
    static = SITE / "static"
    env = jinja2.Environment(loader=jinja2.FileSystemLoader(SITE / "templates"), autoescape=True,
                             trim_blocks=True, lstrip_blocks=True)
    topics = {}
    for book in books:
        for name in book.topics:
            topics.setdefault(slugify(name), {"name": name, "slug": slugify(name), "books": []})["books"].append(book)
    env.globals.update(
        static=lambda name: asset_url(static, name), topic_slug=slugify, languages=LANGUAGES, fonts=FONTS,
        topics=sorted(topics.values(), key=lambda t: t["name"].lower()), today=date.today(),
    )
    books = sorted(books, key=lambda b: (b.author.split()[-1].lower() if b.author else "", b.title.lower(),
                                         b.subtitle.lower()))
    write(out, "index.html", env.get_template("catalog.html").render(books=books, page="catalog"))
    write(out, "topics/index.html", env.get_template("topics.html").render(page="topics"))
    for topic in topics.values():
        write(out, f"topics/{topic['slug']}/index.html",
              env.get_template("topic.html").render(topic=topic, books=topic["books"], page="topics"))
    write(out, "about/index.html", env.get_template("about.html").render(page="about"))
    write(out, "404.html", env.get_template("404.html").render())
    for book in books:
        cached = editions[book.slug]
        work_dir = out / "works" / book.slug
        work_dir.mkdir(parents=True)
        shutil.copy(cached / "book.pdf", work_dir / f"{book.slug}.pdf")
        shutil.copy(cached / "book.epub", work_dir / f"{book.slug}.epub")
        source_zip(book, work_dir / f"{book.slug}-latex.zip")
        write(out, f"works/{book.slug}/index.html", env.get_template("work.html").render(
            book=book, body=(cached / "body.html").read_text("utf-8"),
            toc=json.loads((cached / "toc.json").read_text("utf-8")), page="work"))
    shutil.copytree(static, out / "static")
    if not (static / "fonts").is_dir():
        print("warning: site/static/fonts is missing; run site/build_webfonts.sh (the reader falls back to "
              "system fonts)", file=sys.stderr)


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--out", type=Path, default=ROOT / "public")
    parser.add_argument("--cache", type=Path, default=ROOT / ".cache" / "books")
    parser.add_argument("--jobs", type=int, default=2, help="books typeset in parallel")
    args = parser.parse_args()
    try:
        books = find_books()
    except (BookError, yaml.YAMLError) as exc:
        sys.exit(f"error: {exc}")
    if not books:
        sys.exit("error: no books found (a book is a directory with a main.tex that starts with frontmatter)")
    args.cache.mkdir(parents=True, exist_ok=True)
    failed = []

    def build(book):
        try:
            return book.slug, edition(book, args.cache)
        except StepFailed as exc:
            failed.append(f"{book.path.name}: {exc}")
            return book.slug, None

    with ThreadPoolExecutor(max_workers=max(1, args.jobs)) as pool:
        editions = dict(pool.map(build, books))
    if failed:
        sys.exit("error: typesetting failed\n\n" + "\n\n".join(failed))
    for book in books:
        info = json.loads((editions[book.slug] / "info.json").read_text())
        book.pages, book.font, book.built_at = info["pages"], info["font"], info["built_at"][:10]
        for warning in info["warnings"]:
            print(f"{book.slug}: {warning.splitlines()[0]}", file=sys.stderr)
    # Written next to the target and swapped in, so a web server never serves a half-built site.
    staging = args.out.with_name(args.out.name + ".tmp")
    shutil.rmtree(staging, ignore_errors=True)
    staging.mkdir(parents=True)
    render_site(books, editions, staging)
    old = args.out.with_name(args.out.name + ".old")
    shutil.rmtree(old, ignore_errors=True)
    if args.out.exists():
        args.out.rename(old)
    staging.rename(args.out)
    shutil.rmtree(old, ignore_errors=True)
    print(f"built {len(books)} book{'s' if len(books) != 1 else ''} into {args.out}")


if __name__ == "__main__":
    main()
