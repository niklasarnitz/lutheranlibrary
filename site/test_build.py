"""Tests for the static build: python3 -m unittest discover site"""
import json
import tempfile
import unittest
import zipfile
from pathlib import Path

import build
from reader import reader_html
from typeset import set_opf_metadata

# Shaped like real make4ht output (html5, fn-in) for a German source with \quellseite markers.
TEX4HT_HTML = """<!DOCTYPE html><html lang='de'><head><title></title></head><body>
<h1 class='partHead' id='erster-theil'><span class='titlemark'>Teil <br /></span><a id='x1-1000'></a>Erster Theil<br class='newline' />Die Entstehung</h1>
<h3 class='likesectionHead' id='glaube'><a id='x1-2000'></a>Glaube</h3>
<!-- l. 10 --><p class='noindent'>Grüße aus der Bibliothek. <span class='rm-lmri-10'>Gnade</span> allein.<span class='footnote-mark'><a href='#fn1x0' id='fn1x0-bk'><sup class='textsuperscript'>*</sup></a></span><a id='x1-2001f1'></a>
</p><p class='indent'><span class='quellseite' data-page='12'></span>
</p><p class='indent'>Zweiter Absatz<span class='footnote-mark'><a href='#fn2x0' id='fn2x0-bk'><sup class='textsuperscript'>†</sup></a></span> <a href='javascript:alert(1)' onclick='steal()'>Link</a><script>alert(1)</script></p>
<div class='marginpar'><p class='noindent'><span class='rm-lmri-9'>Randglosse.</span></p></div><p>Nach der Glosse.</p>
<div class='footnotes'><aside class='footnotetext' role='doc-footnote'><p class='noindent'><span class='footnote-mark'><a href='#fn1x0-bk' id='fn1x0'><sup class='textsuperscript'>*</sup></a></span><span class='rm-lmr-9'>Eine Anmerkung.</span></p></aside>
<aside class='footnotetext' role='doc-footnote'><p class='noindent'><span class='footnote-mark'><a href='#fn2x0-bk' id='fn2x0'><sup class='textsuperscript'>†</sup></a></span>LONG</p></aside></div>
</body></html>""".replace("LONG", "Sehr lange Anmerkung. " * 40)
TEX4HT_CSS = ".rm-lmri-10{font-style: italic;}\n.rm-lmr-9{font-size:90%;}\n.rm-lmri-9{font-size:90%;font-style: italic;}\n.indent{text-indent:1.5em;}\n"


FRONTMATTER = """% ---
% title: Der Hauptgottesdienst
% subtitle: Zweite Auflage
% author: Friedrich Lochner
% year: 1895
% topics: [Liturgik, Gottesdienst & Predigt]
% description: >-
%   Zur Erhaltung des liturgischen Erbtheils
%   erläutert.
% rights: Gemeinfrei
% ---
% A comment of the source itself.
\\documentclass{article}
\\usepackage{fontspec}
\\setmainfont{TeX Gyre Pagella}
\\begin{document}
\\input{body}
\\end{document}
"""


class ReaderTests(unittest.TestCase):
    def test_reader_html_is_sanitized_and_book_shaped(self):
        html, toc = reader_html(TEX4HT_HTML, TEX4HT_CSS)
        self.assertNotIn("javascript:", html)
        self.assertNotIn("<script", html)
        self.assertNotIn("alert(1)", html)
        self.assertNotIn("onclick", html)
        self.assertNotIn("Teil", html)  # unnumbered part: LaTeX prints no label
        self.assertIn('<span class="sidenote" role="note" data-note="*">', html)
        self.assertIn('<aside class="note-block" role="note" id="nb-fn2x0">', html)
        self.assertIn('href="#nb-fn2x0"', html)
        self.assertIn('<p class="indent"><span class="quellseite" data-page="12"></span>Zweiter Absatz', html)
        self.assertIn('<p class="indent">Nach der Glosse.</p>', html)
        self.assertEqual(toc, [
            {"level": 0, "id": "erster-theil", "title": "Erster Theil · Die Entstehung"},
            {"level": 1, "id": "glaube", "title": "Glaube"},
        ])

    def test_older_tex4ht_footnote_markup_also_becomes_sidenotes(self):
        # Debian's TeX4ht has no <aside class="footnotetext"> wrappers.
        raw = (TEX4HT_HTML.replace("<aside class='footnotetext' role='doc-footnote'>", "").replace("</aside>", "")
               .replace("<p class='noindent'><span class='footnote-mark'><a href='#fn1x0-bk'",
                        "<p class='indent'><span class='footnote-mark'><a href='#fn1x0-bk'"))
        html, _ = reader_html(raw, TEX4HT_CSS)
        self.assertIn('data-note="*"><span><span style="font-size:90%;">Eine Anmerkung.</span></span>', html)
        self.assertIn('id="nb-fn2x0"', html)

    def test_links_into_the_output_page_become_anchors(self):
        html, _ = reader_html("<html><body><p><a href='main.html#x1-2000'>S. 3</a></p></body></html>")
        self.assertIn('href="#x1-2000"', html)

    def test_epub_metadata_replaces_tex4ht_defaults(self):
        opf = "<metadata><dc:title>main</dc:title><dc:language>en-US</dc:language></metadata>"
        result = set_opf_metadata(opf, {"title": "A & B", "author": "Löhe", "language": "de"})
        self.assertEqual(result, "<metadata><dc:title>A &amp; B</dc:title><dc:language>de</dc:language>"
                                 "<dc:creator>Löhe</dc:creator></metadata>")


class BookTests(unittest.TestCase):
    def setUp(self):
        self.root = Path(tempfile.mkdtemp())
        self.addCleanup(lambda: __import__("shutil").rmtree(self.root))

    def book(self, name, main=FRONTMATTER, body="Text."):
        path = self.root / name
        path.mkdir()
        (path / "main.tex").write_text(main, "utf-8")
        (path / "body.tex").write_text(body, "utf-8")
        return path

    def test_frontmatter_describes_the_book(self):
        self.book("lochner")
        [book] = build.find_books(self.root)
        self.assertEqual(book.slug, "lochner")
        self.assertEqual(book.full_title, "Der Hauptgottesdienst. Zweite Auflage")
        self.assertEqual(book.year, 1895)
        self.assertEqual(book.topics, ["Liturgik", "Gottesdienst & Predigt"])
        self.assertEqual(book.description, "Zur Erhaltung des liturgischen Erbtheils erläutert.")
        self.assertEqual(build.slugify(book.topics[1]), "gottesdienst-predigt")

    def test_directories_without_frontmatter_and_drafts_are_not_published(self):
        self.book("notes", main="\\documentclass{article}\n")
        self.book("draft", main=FRONTMATTER.replace("% rights:", "% draft: true\n% rights:"))
        (self.root / "site").mkdir()
        self.assertEqual(build.find_books(self.root), [])

    def test_invalid_frontmatter_is_an_error(self):
        cases = {
            "rights": FRONTMATTER.replace("% rights: Gemeinfrei\n", ""),
            "unknown": FRONTMATTER.replace("% year:", "% yaer:"),
            "slug": FRONTMATTER.replace("% year:", "% slug: Not A Slug\n% year:"),
        }
        for name, main in cases.items():
            with self.subTest(name):
                path = self.book(name, main)
                with self.assertRaisesRegex(build.BookError, name):
                    build.load_book(path)

    def test_two_books_cannot_share_a_slug(self):
        self.book("a", FRONTMATTER.replace("% year:", "% slug: same\n% year:"))
        self.book("b", FRONTMATTER.replace("% year:", "% slug: same\n% year:"))
        with self.assertRaisesRegex(build.BookError, "share the slug"):
            build.find_books(self.root)

    def test_hash_follows_sources_but_not_build_output(self):
        path = self.book("lochner")
        [book] = build.find_books(self.root)
        before = build.book_hash(book)
        (path / "main.pdf").write_bytes(b"%PDF")
        (path / "main.aux").write_text("x")
        self.assertEqual(build.book_hash(book), before)
        (path / "body.tex").write_text("Changed.", "utf-8")
        self.assertNotEqual(build.book_hash(book), before)

    def test_reader_font_follows_the_library_class_options(self):
        self.assertEqual(build.main_font("\\documentclass{oll-book}"), "libertinus")
        self.assertEqual(build.main_font("\\documentclass[english,pagella]{oll-book}"), "pagella")
        self.assertEqual(build.main_font("\\documentclass{article}"), "lmodern")

    def test_site_is_rendered_from_cached_editions(self):
        path = self.book("lochner")
        [book] = build.find_books(self.root)
        cached = self.root / "cache" / book.slug
        cached.mkdir(parents=True)
        (cached / "book.pdf").write_bytes(b"%PDF")
        (cached / "book.epub").write_bytes(b"PK")
        html, toc = reader_html(TEX4HT_HTML, TEX4HT_CSS)
        (cached / "body.html").write_text(html, "utf-8")
        (cached / "toc.json").write_text(json.dumps(toc), "utf-8")
        book.pages, book.font, book.built_at = 12, build.main_font(FRONTMATTER), "2026-11-03"
        out = self.root / "public"
        out.mkdir()
        build.render_site([book], {book.slug: cached}, out)

        page = (out / "works/lochner/index.html").read_text("utf-8")
        self.assertIn("<h1>Der Hauptgottesdienst</h1>", page)
        self.assertIn('class="sidenote"', page)
        self.assertIn('href="lochner.pdf" download', page)
        self.assertIn("font-pagella", page)
        self.assertIn("(12 pages)", page)
        self.assertTrue((out / "works/lochner/lochner.epub").exists())
        with zipfile.ZipFile(out / "works/lochner/lochner-latex.zip") as archive:
            self.assertEqual(sorted(archive.namelist()), ["lochner/body.tex", "lochner/main.tex", "lochner/oll-book.cls"])
        catalog = (out / "index.html").read_text("utf-8")
        self.assertIn('data-topics="liturgik gottesdienst-predigt "', catalog)
        self.assertIn("Gottesdienst &amp; Predigt", (out / "topics/gottesdienst-predigt/index.html").read_text())
        self.assertTrue((out / "404.html").exists())
        self.assertRegex(catalog, r'/static/library\.css\?v=[0-9a-f]{10}')


if __name__ == "__main__":
    unittest.main()
