# OpenLutheranLibrary

Lutheran books as LaTeX, published as a static site: every book is typeset with
LuaLaTeX (PDF) and TeX4ht (online reader and EPUB) from the same source.

## Books

A book is a top-level directory with a `main.tex` that is a complete LaTeX
document (it may `\input` further files from its directory). The website reads
its catalog entry from a frontmatter block, YAML in `%` comments, at the very
top of `main.tex`:

```latex
% ---
% title: Der evangelische Geistliche
% subtitle: Erstes Bändchen
% author: Wilhelm Löhe
% year: 1872
% language: de
% topics: [Pastoraltheologie]
% description: >-
%   Löhes Pastoraltheologie, Erstes Bändchen: …
% source: Transkription nach Scan: Folio-OCR, bereinigt.
% rights: "Gemeinfrei (Public Domain): erschienen vor 1900."
% ---
\documentclass{oll-book}
…
```

| Field | |
| --- | --- |
| `title`, `rights` | required |
| `subtitle`, `author`, `year`, `description`, `source` | optional; `source` describes the transcription |
| `language` | BCP 47 code, default `de` |
| `topics` | list; each topic gets a page |
| `slug` | URL name (`/works/<slug>/`), default: the directory name |
| `draft: true` | leaves the book out of the site |

Every book uses the library's document class `oll-book`
(`site/tex/oll-book.cls`) and follows [TYPESETTING.md](TYPESETTING.md), so all
books share one design and one markup standard. Compile a book by hand with
`TEXINPUTS=../site/tex//: lualatex main.tex` from its directory.

Directories without frontmatter are ignored. Uncertain readings use
`\unsicher{…}`; source page markers `\quellseite{n}` appear in the reader's
margin. The reader uses a web copy of the main font (`\setmainfont`):
Libertinus, TeX Gyre Pagella or Latin Modern.

## Magazines and articles

Magazine issues use the same reader, PDF, EPUB and LaTeX pipeline as books.
`/magazines/` lists publications; `/magazines/<magazine_slug>/` groups their
issues by year and volume. Issues and individual articles also appear in the
collection (filterable by type) and topic index.

An issue is a top-level directory with this additional `main.tex` frontmatter:

```latex
% kind: issue
% magazine: Der Lutheraner
% magazine_slug: der-lutheraner
% issue_date: 1904-01-05
% volume: 60
% number: 1
% scan_url: https://archive.org/download/der-lutheraner_1904-01-05_60_1/der-lutheraner_1904-01-05_60_1.pdf
```

`title` and `rights` are still required. The year comes from `issue_date`.
Volume and issue number must be positive integers; each publication/volume/number
combination is unique. `scan_url` is an optional HTTPS link to the original.

Each article lives in `articles/<ordered-name>/` under its issue, with its own
`main.tex` and `body.tex`. Its frontmatter declares `title`, `author` when known,
`topics`, `description`, and `source_pages` (e.g. `1–2`). Kind defaults to
`article`. Publication, date, volume, number, language, year, source, scan link
and rights are inherited from the issue and must not be repeated. The default
article slug is `<issue-slug>-<ordered-name>`; an explicit `slug` keeps URLs
independent of editorial ordering. Draft articles are left out of the catalog.

An article's `main.tex` inputs its `body.tex`; the issue inputs those **same**
bodies in reading order, so corrections apply to both editions. The numbered
directory order determines the issue's article list. The issue editor must keep
the issue's `\input` list in that order too. Keep masthead and publication
notices in the complete edition; group short administrative notices by their
printed rubric rather than treating each donation as an article.
If a body inputs further files relative to its article directory, the issue
should use `\subimport{articles/<ordered-name>/}{body.tex}` instead of `\input`.

The first issue is **Der Lutheraner, 60. Jahrgang, Nr. 1, 5 January 1904**.
Its editorial review record is in `der-lutheraner-1904-01-05/REVIEW.md`.

### Articles spanning multiple issues

Keep each installment as an article inside its original issue, with its own
source pages and downloads. Add a separate top-level directory for the shared
article entry. Its `main.tex` is a **metadata-only manifest**, not a second
transcription or a LaTeX document:

```latex
% ---
% kind: article
% title: A serialized article
% author: Author when known
% topics: [Kirchengeschichte]
% rights: Gemeinfrei
% installments:
%   - publication-1903-12-22-article-slug
%   - publication-1904-01-05-continuation-slug
% ---
```

Use the installments' published slugs in **reading order**, including across
year and volume boundaries. They must be published issue articles from the same
magazine and share the manifest's language (default `de`). Missing or draft
references, duplicate installments and nested serials fail the build. An
installment belongs to only one shared article. A single available installment
is allowed; the page deliberately does not claim the serial is complete.

The shared entry appears in the collection and its topic pages. Its reader
assembles the existing installment editions without copying transcription text;
each installment links back to this entry and to the other available parts.
Notes and anchors are scoped per installment. PDF, EPUB and LaTeX downloads
are available both per installment and as a combined edition from the shared
article entry. The combined edition includes all available parts in manifest
order, with issue dates and source-page references, and is rebuilt when any
installment changes. Its LaTeX archive is self-contained; relative inputs in
each installment remain local to that installment. Publication is derived
from the parts; the catalog year defaults to their earliest year. Other descriptive metadata
and topic tags belong on the manifest as for an ordinary article.

## Build

```sh
python3 -m venv .venv && .venv/bin/pip install -r site/requirements.txt
.venv/bin/python site/build.py          # writes public/
.venv/bin/python -m unittest discover -s site
```

It needs `lualatex`, `make4ht` and `tex4ebook` (TeX Live), LilyPond 2.24.3 or
newer for books with musical notation, and the fonts the books use.
`site/build_webfonts.sh` subsets those fonts into
`site/static/fonts/` for the reader (needs `fonttools` and `brotli`).

Per book the build produces `public/works/<slug>/index.html` (reader),
`<slug>.pdf`, `<slug>.epub` and `<slug>-latex.zip` (the sources). Typesetting
results are cached in `.cache/` by a hash of the book's files and the pipeline
(`site/typeset.py`, `site/reader.py`, `site/tex/`), so only changed books are
typeset again. Bump `PIPELINE_VERSION` in `site/build.py` to force a rebuild
of everything. A book that fails to typeset fails the build; `public/` is only
replaced after a successful one.

`docker build -t lutheranlibrary .` runs the tests, typesets in Debian's TeX
Live (whose TeX4ht output differs from MacTeX's) and serves the result with
nginx on port 8080 (`/health/` for checks).

## Layout

- `site/build.py`: frontmatter, cache, pages
- `site/typeset.py`: LuaLaTeX, make4ht, tex4ebook
- `site/reader.py`: TeX4ht HTML to reader body (sidenotes, margin notes, contents)
- `site/tex/oll.cfg`: TeX4ht configuration; `site/tex/epub.css`: EPUB styles
- `site/templates/`, `site/static/`: website
