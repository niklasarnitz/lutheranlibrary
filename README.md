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

## Build

```sh
python3 -m venv .venv && .venv/bin/pip install -r site/requirements.txt
.venv/bin/python site/build.py          # writes public/
.venv/bin/python -m unittest discover -s site
```

It needs `lualatex`, `make4ht` and `tex4ebook` (TeX Live) and the fonts the
books use. `site/build_webfonts.sh` subsets those fonts into
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
