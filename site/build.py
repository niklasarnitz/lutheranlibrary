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
from lxml import html

from reader import reader_html
from typeset import CLASS_FILES, JOB, TEX, StepFailed, engrave_music, source_files, typeset

SITE = Path(__file__).resolve().parent
ROOT = SITE.parent
# Bump to retypeset every book after a change the pipeline hash below cannot see.
PIPELINE_VERSION = "1"
PIPELINE_FILES = [SITE / "typeset.py", SITE / "reader.py", *sorted((SITE / "tex").iterdir())]
FRONTMATTER = re.compile(r"\A% ---[ \t]*\n((?:%.*\n)*?)% ---[ \t]*\n")
SLUG = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")
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
    kind: str = "book"
    magazine: str = ""
    magazine_slug: str = ""
    issue_date: str = ""
    volume: int | None = None
    number: int | None = None
    source_pages: str = ""
    scan_url: str = ""
    issue: "Book | None" = None
    articles: list = field(default_factory=list)
    installments: list = field(default_factory=list)
    serial: "Book | None" = None
    # Filled in by the build.
    pages: int | None = None
    font: str = "libertinus"
    built_at: str = ""

    @property
    def kind_label(self):
        if self.installments:
            return "Serialized article"
        return {"book": "Book", "issue": "Magazine issue", "article": "Article"}[self.kind]

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


def load_book(path, issue=None):
    try:
        data = frontmatter((path / f"{JOB}.tex").read_text("utf-8"))
    except ValueError as exc:
        raise BookError(f"{path.name}: invalid frontmatter value: {exc}") from exc
    if data is None or data.get("draft"):
        return None
    known = {"title", "subtitle", "author", "year", "language", "description", "topics", "source", "rights", "slug",
             "draft", "kind", "magazine", "magazine_slug", "issue_date", "volume", "number", "source_pages", "scan_url",
             "installments"}
    unknown = set(data) - known
    if unknown:
        raise BookError(f"{path.name}: unknown frontmatter fields {', '.join(sorted(unknown))}")
    if issue:
        for name in ("rights", "language", "source", "year", "magazine", "magazine_slug", "issue_date", "volume", "number", "scan_url"):
            if name in data:
                raise BookError(f"{path.name}: article inherits `{name}` from its issue")
            data[name] = getattr(issue, name)
    kind = data.get("kind", "article" if issue else "book")
    installments = data.get("installments", [])
    if "installments" in data and (issue or kind != "article" or not isinstance(installments, list)
                                    or not installments or any(not isinstance(s, str) or not SLUG.fullmatch(s)
                                                               for s in installments)):
        raise BookError(f"{path.name}: installments needs a nonempty list of article slugs on a top-level article")
    if kind not in ({"article"} if issue or installments else {"book", "issue"}):
        raise BookError(f"{path.name}: invalid kind {kind!r}")
    if kind == "issue":
        for name in ("magazine", "magazine_slug", "issue_date", "volume", "number"):
            if not data.get(name):
                raise BookError(f"{path.name}: magazine issue needs `{name}`")
        if not SLUG.fullmatch(str(data["magazine_slug"])):
            raise BookError(f"{path.name}: invalid magazine_slug")
        try:
            published = date.fromisoformat(str(data["issue_date"]))
        except ValueError:
            raise BookError(f"{path.name}: issue_date must be YYYY-MM-DD")
        for name in ("volume", "number"):
            if type(data[name]) is not int or data[name] < 1:
                raise BookError(f"{path.name}: {name} must be a positive integer")
        if "year" in data and data["year"] != published.year:
            raise BookError(f"{path.name}: year must match issue_date")
        data["year"] = published.year
    if data.get("scan_url") and not str(data["scan_url"]).startswith("https://"):
        raise BookError(f"{path.name}: scan_url must use HTTPS")
    for required in ("title", "rights"):
        if not str(data.get(required) or "").strip():
            raise BookError(f"{path.name}: frontmatter needs `{required}`")
    slug = str(data.get("slug") or (f"{issue.slug}-{path.name}" if issue else path.name))
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
        kind=kind, magazine=str(data.get("magazine") or ""), magazine_slug=str(data.get("magazine_slug") or ""),
        issue_date=str(data.get("issue_date") or ""), volume=data.get("volume"), number=data.get("number"),
        source_pages=str(data.get("source_pages") or ""), scan_url=str(data.get("scan_url") or ""), issue=issue,
        installments=installments,
    )


def find_books(root=ROOT):
    books = []
    for path in sorted(p for p in root.iterdir() if p.is_dir() and not p.name.startswith(".")):
        if (path / f"{JOB}.tex").is_file():
            book = load_book(path)
            if book:
                books.append(book)
                if book.kind == "issue":
                    for main in sorted((path / "articles").glob("*/main.tex")):
                        article = load_book(main.parent, issue=book)
                        if article:
                            book.articles.append(article)
                            books.append(article)
    seen = {}
    magazines = {}
    issues = set()
    for book in books:
        if book.slug in seen:
            raise BookError(f"{book.path.name} and {seen[book.slug]} share the slug {book.slug}")
        seen[book.slug] = book.path.name
        if book.kind == "issue":
            if magazines.setdefault(book.magazine_slug, book.magazine) != book.magazine:
                raise BookError(f"{book.path.name}: magazine_slug has conflicting magazine names")
            identity = (book.magazine_slug, book.volume, book.number)
            if identity in issues:
                raise BookError(f"{book.path.name}: duplicate magazine volume and issue number")
            issues.add(identity)
    by_slug = {book.slug: book for book in books}
    for book in books:
        if not book.installments:
            continue
        parts = []
        for slug in book.installments:
            part = by_slug.get(slug)
            if not part or not part.issue:
                raise BookError(f"{book.path.name}: installment {slug!r} must reference a published issue article")
            if part.serial:
                raise BookError(f"{book.path.name}: installment {slug!r} is listed more than once")
            if parts and part.magazine_slug != parts[0].magazine_slug:
                raise BookError(f"{book.path.name}: installments must belong to the same magazine")
            if part.language != book.language:
                raise BookError(f"{book.path.name}: installments must share the article's language")
            part.serial = book
            parts.append(part)
        book.installments = parts
        book.magazine, book.magazine_slug = parts[0].magazine, parts[0].magazine_slug
        if book.year is None:
            book.year = min(part.year for part in parts)
    return books


def main_font(source):
    """The reader uses a web copy of the font the document itself is set in."""
    doc_class = re.search(r"\\documentclass(?:\[([^\]]*)\])?\{([^}]*)\}", source)
    if doc_class and doc_class.group(2).strip() == "oll-book":
        options = {o.strip() for o in (doc_class.group(1) or "").split(",")}
        return "pagella" if "pagella" in options else "libertinus"
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
        if file.name == "REVIEW.md":
            continue  # Editorial notes are included in the source ZIP, not typeset.
        digest.update(file.relative_to(book.path).as_posix().encode() + b"\0" + file.read_bytes() + b"\0")
    if book.installments:
        # Include the assembler and ordered dependencies, not just the serial manifest.
        digest.update(Path(__file__).read_bytes())
        for part in book.installments:
            digest.update(part.slug.encode() + b"\0" + book_hash(part).encode())
    if book.issue:
        # Inherited metadata (notably EPUB language) is part of an article's edition.
        digest.update((book.issue.path / f"{JOB}.tex").read_bytes())
    return digest.hexdigest()


def tex_text(text):
    escapes = {"\\": r"\textbackslash{}", "{": r"\{", "}": r"\}", "&": r"\&", "%": r"\%",
               "$": r"\$", "#": r"\#", "_": r"\_", "~": r"\textasciitilde{}", "^": r"\textasciicircum{}"}
    return "".join(escapes.get(c, c) for c in str(text))


def edition_sources(book, target):
    """A serial's compilable source tree references unchanged installment bodies."""
    if not book.installments:
        return book.path
    target.mkdir(parents=True)
    language = {"en": "english", "la": "latin"}.get(book.language.split("-")[0], "ngerman")
    main = [FRONTMATTER.match((book.path / "main.tex").read_text("utf-8")).group(0),
            f"\\documentclass[{language}]{{oll-book}}", r"\begin{document}",
            r"\begin{titelseite}", r"{\LARGE " + tex_text(book.full_title) + r"}\par",
            tex_text(book.author) + r"\par" if book.author else "",
            tex_text(book.magazine) + r"\par", tex_text(book.rights) + r"\par",
            "Available installments; not necessarily complete.",
            r"\end{titelseite}"]
    for number, part in enumerate(book.installments, 1):
        directory = target / "installments" / part.slug
        for file in source_files(part.path):
            dest = directory / file.relative_to(part.path)
            dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy(file, dest)
        if not (directory / "body.tex").is_file():
            raise StepFailed(f"{part.slug}: serialized installment needs body.tex")
        heading = f"Installment {number} — {part.issue_date}, Vol. {part.volume}, No. {part.number}"
        if part.source_pages:
            heading += f", source pp. {part.source_pages}"
        main.extend([f"\\part{{{tex_text(heading)}}}",
                     f"\\subimport{{installments/{part.slug}/}}{{body.tex}}"])
    main.append(r"\end{document}")
    (target / "main.tex").write_text("\n".join(main) + "\n", "utf-8")
    return target


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
        sources = edition_sources(book, Path(build) / "sources")
        result = typeset(sources, Path(build), meta, music_cache=cache / ".music")
        css = result["css"].read_text("utf-8", "replace") if result["css"].exists() else ""
        html, toc = reader_html(result["html"].read_text("utf-8", "replace"), css)
        fresh = cache / f"{book.slug}.tmp"
        shutil.rmtree(fresh, ignore_errors=True)
        fresh.mkdir(parents=True)
        shutil.copy(result["pdf"], fresh / "book.pdf")
        shutil.copy(result["epub"], fresh / "book.epub")
        shutil.copytree(result["assets"], fresh / "assets")
        (fresh / "body.html").write_text(html, "utf-8")
        (fresh / "toc.json").write_text(json.dumps(toc, ensure_ascii=False), "utf-8")
        (fresh / "info.json").write_text(json.dumps({
            "hash": digest, "pages": result["pages"], "warnings": result["warnings"],
            "font": main_font((sources / f"{JOB}.tex").read_text("utf-8")),
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


def source_zip(book, target, assets=None):
    with tempfile.TemporaryDirectory(prefix="oll-sources-") as temporary, \
            zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED) as archive:
        sources = edition_sources(book, Path(temporary) / "sources")
        for file in source_files(sources):
            archive.write(file, f"{book.slug}/{file.relative_to(sources).as_posix()}")
        if assets is None:
            assets = engrave_music(sources, Path(temporary) / "engraved")
        if assets.exists():
            for file in sorted(assets.rglob("*")):
                if file.is_file():
                    name = f"{book.slug}/{file.relative_to(assets).as_posix()}"
                    if name not in archive.namelist():
                        archive.write(file, name)
        # The library class travels with the sources, so the download compiles on its own.
        for name in CLASS_FILES:
            if not (sources / name).exists():
                archive.write(TEX / name, f"{book.slug}/{name}")


def write(out, path, text):
    target = out / path
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(text, "utf-8")


def render_site(books, editions, out):
    static = SITE / "static"
    env = jinja2.Environment(loader=jinja2.FileSystemLoader(SITE / "templates"), autoescape=True,
                             trim_blocks=True, lstrip_blocks=True)
    topics = {}
    magazines = {}
    for book in books:
        for name in book.topics:
            topics.setdefault(slugify(name), {"name": name, "slug": slugify(name), "books": []})["books"].append(book)
        if book.kind == "issue":
            magazines.setdefault(book.magazine_slug, {"name": book.magazine, "slug": book.magazine_slug,
                                                       "issues": []})["issues"].append(book)
    for magazine in magazines.values():
        magazine["issues"].sort(key=lambda b: b.issue_date, reverse=True)
    env.globals.update(
        static=lambda name: asset_url(static, name), topic_slug=slugify, languages=LANGUAGES,
        topics=sorted(topics.values(), key=lambda t: t["name"].lower()), today=date.today(),
    )
    books = sorted(books, key=lambda b: (b.author.split()[-1].lower() if b.author else "", b.title.lower(),
                                         b.subtitle.lower()))
    write(out, "index.html", env.get_template("catalog.html").render(
        books=[book for book in books if book.kind != "article"], page="catalog"))
    write(out, "books/index.html", env.get_template("catalog.html").render(
        books=[book for book in books if book.kind == "book"], page="books"))
    write(out, "magazines/index.html", env.get_template("magazines.html").render(
        magazines=sorted(magazines.values(), key=lambda m: m["name"]), page="magazines"))
    for magazine in magazines.values():
        write(out, f"magazines/{magazine['slug']}/index.html", env.get_template("magazine.html").render(
            magazine=magazine, page="magazines"))
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
        if (cached / "assets").exists():
            shutil.copytree(cached / "assets", work_dir, dirs_exist_ok=True)
        source_zip(book, work_dir / f"{book.slug}-latex.zip", cached / "assets")
        if book.installments:
            parts = []
            for part in book.installments:
                # Each TeX job reuses IDs such as fn1x0; scope them to the installment.
                body = html.fragment_fromstring((editions[part.slug] / "body.html").read_text("utf-8"),
                                               create_parent="div")
                ids = set()
                for element in body.iter():
                    if element.get("id"):
                        identifier = element.get("id")
                        if identifier in ids:
                            # TeX4ht can emit a redundant anchor inside a footnote.
                            del element.attrib["id"]
                        else:
                            ids.add(identifier)
                            element.set("id", f"{part.slug}-{identifier}")
                    if element.get("href", "").startswith("#"):
                        element.set("href", f"#{part.slug}-{element.get('href')[1:]}")
                parts.append({"book": part, "body": html.tostring(body, encoding="unicode")})
            write(out, f"works/{book.slug}/index.html", env.get_template("work.html").render(
                book=book, parts=parts, toc=[], page="work"))
            continue
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
    print(f"built {len(books)} works into {args.out}")


if __name__ == "__main__":
    main()
