"""Tests for the static build: python3 -m unittest discover site"""
import json
import posixpath
import shutil
import tempfile
import unittest
import zipfile
from pathlib import Path

import lxml.html

import build
from reader import reader_html
from typeset import set_opf_metadata, typeset

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

ISSUE_FRONTMATTER = """% ---
% title: Der Lutheraner
% kind: issue
% magazine: Der Lutheraner
% magazine_slug: der-lutheraner
% issue_date: 1904-01-05
% volume: 60
% number: 1
% rights: Gemeinfrei
% source: Folio, nach Scan geprüft.
% ---
\\documentclass{oll-book}
\\begin{document}
\\input{articles/01-vorwort/body}
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

    def test_bare_footnote_markers_keep_note_text_and_boundaries(self):
        for wrapped, long in ((False, False), (False, True), (True, False), (True, True)):
            with self.subTest(wrapped=wrapped, long=long):
                text = "Second note. " * (80 if long else 1)
                raw = f"""<html><body><p>Text<span class='footnote-mark'>
                    <a href='#fn1' id='fn1-bk'>1</a></span> More<span class='footnote-mark'>
                    <a href='#fn2' id='fn2-bk'>2</a></span></p>
                    <div class='footnotes'><p><span class='footnote-mark'>
                    <a href='#fn1-bk' id='fn1'>1</a></span>First note.</p>
                    <span class='footnote-mark'><a href='#fn2-bk' id='fn2'>2</a></span>{text}
                    <span>Following commentary.</span></div></body></html>"""
                if wrapped:
                    raw = raw.replace("<div class='footnotes'>", "<div class='footnotes'><aside class='footnotetext'>")
                    raw = raw.replace("</div>", "</aside></div>")
                rendered, _ = reader_html(raw)
                doc = lxml.html.fromstring(rendered)
                first = doc.cssselect('.sidenote[data-note="1"]')[0]
                second = doc.cssselect('#nb-fn2' if long else '.sidenote[data-note="2"]')[0]
                self.assertEqual(first.text_content().strip(), "First note.")
                self.assertIn(text.strip(), second.text_content())
                self.assertIn("Following commentary.", second.text_content())
                self.assertFalse(second.cssselect('.footnote-mark'))
                self.assertEqual(len(doc.cssselect('.footnotes #fn2')), 1)

    def test_heading_footnotes_stay_in_body_but_not_contents_labels(self):
        raw = """<html><body>
            <h2 class='chapterHead' id='melodien'>Zugabe<span class='footnote-mark'>
            <a href='#fn1' id='fn1-bk'><sup>16</sup></a></span> einiger
            <em>Melodien</em><br />Anhang</h2>
            <div class='footnotes'><aside class='footnotetext' role='doc-footnote'>
            <p><span class='footnote-mark'><a href='#fn1-bk' id='fn1'><sup>16</sup></a></span>
            Nur die fehlenden Melodien werden mitgetheilt.</p></aside></div>
            </body></html>"""
        for wrapped in (True, False):
            with self.subTest(wrapped=wrapped):
                source = raw if wrapped else raw.replace(
                    "<aside class='footnotetext' role='doc-footnote'>", "").replace("</aside>", "")
                html, toc = reader_html(source)
                self.assertEqual(toc, [{"level": 0, "id": "melodien",
                                        "title": "Zugabe einiger Melodien · Anhang"}])
                self.assertIn('href="#fn1" id="fn1-bk"><sup>16</sup>', html)
                self.assertIn('class="sidenote" role="note" data-note="16"', html)
                self.assertIn('Nur die fehlenden Melodien werden mitgetheilt.', html)

    def test_links_into_the_output_page_become_anchors(self):
        html, _ = reader_html("<html><body><p><a href='main.html#x1-2000'>S. 3</a></p></body></html>")
        self.assertIn('href="#x1-2000"', html)

    def test_music_images_keep_local_sources_and_accessible_descriptions(self):
        html, _ = reader_html("""<html><body><div class='notensatz'>
            <img src='music/096-01.svg' alt='Danket dem HErrn' onerror='steal()'>
            <img src='https://tracker.example/pixel.png'>
            <img src='../private.png'><img src='javascript:alert(1)'>
            </div></body></html>""")
        self.assertIn('src="music/096-01.svg"', html)
        self.assertIn('alt="Danket dem HErrn"', html)
        self.assertEqual(html.count("src="), 1)
        self.assertNotIn("onerror", html)

    def test_footnote_copies_keep_scores_and_following_commentary(self):
        for wrapped in (True, False):
            for long in (True, False):
                with self.subTest(wrapped=wrapped, long=long):
                    commentary = "Following commentary. " * (80 if long else 1)
                    raw = f"""<html><body><p>Text<span class='footnote-mark'>
                        <a href='#fn1' id='fn1-bk'>1</a></span></p>
                        <p>More<span class='footnote-mark'><a href='#fn2' id='fn2-bk'>2</a></span></p>
                        <div class='footnotes'><aside class='footnotetext'>
                        <p><span class='footnote-mark'><a href='#fn1-bk' id='fn1'>1</a></span>Introduction.</p>
                        <div class='notensatz'><img src='music/160-03.svg' alt='Five underlays'></div>
                        <span>{commentary}</span></aside><aside class='footnotetext'>
                        <p><span class='footnote-mark'><a href='#fn2-bk' id='fn2'>2</a></span>Other note.</p>
                        </aside></div></body></html>"""
                    if not wrapped:
                        raw = raw.replace("<aside class='footnotetext'>", "").replace("</aside>", "")
                    else:
                        second = "<span class='footnote-mark'><a href='#fn2-bk' id='fn2'>2</a></span>Other note."
                        raw = raw.replace(f"<p>{second}</p>", second)
                    rendered, _ = reader_html(raw)
                    doc = lxml.html.fromstring(rendered)
                    note = doc.cssselect(".note-block" if long else ".sidenote")[0]
                    self.assertEqual(note.xpath(".//img/@src"), ["music/160-03.svg"])
                    self.assertIn("Introduction.", note.text_content())
                    self.assertIn(commentary.strip(), note.text_content())
                    self.assertNotIn("Other note.", note.text_content())
                    self.assertEqual(doc.cssselect('.sidenote[data-note="2"]')[0].text_content().strip(), "Other note.")

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

    def test_score_assets_reach_the_reader_and_compilable_source_download(self):
        source = self.book("music")
        (source / "facsimiles").mkdir()
        (source / "facsimiles/552.png").write_bytes(b"original score scan")
        cached = self.root / "cache"
        build.engrave_music(source, cached / "assets")
        (source / "music").mkdir()
        (source / "music/096-01.ly").write_text("\\score { g'1 }")
        book = build.load_book(source)
        (cached / "assets/music").mkdir(parents=True)
        for name, data in {"book.pdf": b"%PDF", "book.epub": b"PK",
                           "body.html": b'<div class="notensatz"><img src="music/096-01.svg"></div>',
                           "toc.json": b"[]", "assets/music/096-01.pdf": b"%PDF score",
                           "assets/music/096-01.svg": b'<svg xmlns="http://www.w3.org/2000/svg"/>'}.items():
            (cached / name).write_bytes(data)
        out = self.root / "public"
        out.mkdir()
        build.render_site([book], {book.slug: cached}, out)
        published = out / "works/music"
        self.assertEqual((published / "music/096-01.svg").read_bytes(),
                         (cached / "assets/music/096-01.svg").read_bytes())
        self.assertEqual((published / "facsimiles/552.png").read_bytes(), b"original score scan")
        self.assertIn('src="music/096-01.svg"', (published / "index.html").read_text())
        with zipfile.ZipFile(published / "music-latex.zip") as archive:
            self.assertIn("music/music/096-01.ly", archive.namelist())
            self.assertEqual(archive.read("music/music/096-01.pdf"), b"%PDF score")
            self.assertEqual(archive.read("music/facsimiles/552.png"), b"original score scan")
            self.assertEqual(archive.namelist().count("music/facsimiles/552.png"), 1)
            self.assertIn("music/oll-book.cls", archive.namelist())

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

    def test_magazine_issue_and_tagged_articles_publish_as_linked_works(self):
        issue_path = self.book("lutheraner-1904", ISSUE_FRONTMATTER)
        article_path = issue_path / "articles/01-vorwort"
        article_path.mkdir(parents=True)
        (article_path / "main.tex").write_text(
            "% ---\n% title: Vorwort\n% topics: [Bibelstudium, Kirchenpresse]\n% source_pages: 1–2\n% ---\n"
            "\\documentclass{oll-book}\n\\begin{document}\n\\input{body}\n\\end{document}\n")
        (article_path / "body.tex").write_text("\\chapter{Vorwort}\nGeprüfter Artikel.")
        # An older volume must not sort above the new one; its sibling article is not published.
        old_path = self.book("lutheraner-1903", ISSUE_FRONTMATTER.replace("1904-01-05", "1903-12-22")
                             .replace("volume: 60", "volume: 59").replace("number: 1", "number: 26"))
        draft_path = old_path / "articles/draft"
        draft_path.mkdir(parents=True)
        (draft_path / "main.tex").write_text("% ---\n% title: Draft\n% draft: true\n% ---\n")
        self.book("lochner")
        books = build.find_books(self.root)
        issue = next(b for b in books if b.slug == "lutheraner-1904")
        [article] = issue.articles
        self.assertEqual(len(books), 4)
        self.assertEqual((article.kind, article.year, article.rights, article.source),
                         ("article", 1904, "Gemeinfrei", "Folio, nach Scan geprüft."))
        self.assertEqual(article.topics, ["Bibelstudium", "Kirchenpresse"])
        self.assertEqual(article.issue, issue)
        self.assertEqual(article.slug, "lutheraner-1904-01-vorwort")
        before = build.book_hash(article)
        (issue_path / "main.tex").write_text(ISSUE_FRONTMATTER.replace("% volume:", "% language: en\n% volume:"))
        self.assertNotEqual(build.book_hash(article), before)
        cached = self.root / "cache"
        cached.mkdir()
        (cached / "book.pdf").write_bytes(b"%PDF")
        (cached / "book.epub").write_bytes(b"PK")
        (cached / "body.html").write_text("<p>Geprüfter Artikel.</p>")
        (cached / "toc.json").write_text("[]")
        out = self.root / "public"
        out.mkdir()
        build.render_site(books, {b.slug: cached for b in books}, out)
        magazine = (out / "magazines/der-lutheraner/index.html").read_text()
        self.assertLess(magazine.index("1904"), magazine.index("1903"))
        self.assertIn('href="/works/lutheraner-1904/"', magazine)
        issue_page = (out / "works/lutheraner-1904/index.html").read_text()
        self.assertIn(f'href="{article.url}"', issue_page)
        article_page = (out / f"works/{article.slug}/index.html").read_text()
        self.assertIn('href="/works/lutheraner-1904/"', article_page)
        self.assertIn('href="/topics/bibelstudium/"', article_page)
        self.assertIn("Source pp. 1–2", article_page)
        self.assertIn("Geprüfter Artikel.", article_page)
        self.assertIn(f'href="{article.url}"', (out / "topics/kirchenpresse/index.html").read_text())
        catalog = build.html.fromstring((out / "index.html").read_text())
        self.assertCountEqual(catalog.xpath('//*[@class="work-row"]//h3/a/@href'),
                              ["/works/lochner/", "/works/lutheraner-1904/", "/works/lutheraner-1903/"])
        self.assertEqual(catalog.xpath('//select[@id="kind"]/option/@value'), ["", "book", "issue"])
        for route, active in [("index.html", "/"), ("books/index.html", "/books/"),
                              ("magazines/index.html", "/magazines/"), ("topics/index.html", "/topics/")]:
            page = build.html.fromstring((out / route).read_text())
            links = page.xpath('//nav[@aria-label="Library"]/div/a')
            self.assertEqual([(link.text, link.get("href")) for link in links],
                             [("Collection", "/"), ("Books", "/books/"),
                              ("Magazines", "/magazines/"), ("Topical Index", "/topics/"),
                              ("About the library", "/about/")])
            self.assertEqual([link.get("href") for link in links if link.get("aria-current") == "page"],
                             [active])
        books_page = build.html.fromstring((out / "books/index.html").read_text())
        self.assertEqual(books_page.xpath('//h1/text()'), ["Books"])
        self.assertEqual(books_page.xpath('//*[@class="work-row"]/@data-kind'), ["book"])
        self.assertEqual(books_page.xpath('//*[@id="clear-filters"]/@href'), ["/books/"])
        self.assertTrue((out / f"works/{article.slug}/{article.slug}.epub").exists())
        with zipfile.ZipFile(out / f"works/{article.slug}/{article.slug}-latex.zip") as archive:
            self.assertIn(f"{article.slug}/body.tex", archive.namelist())

    def test_magazine_identity_and_article_inheritance_are_validated(self):
        cases = {
            "date": ISSUE_FRONTMATTER.replace("1904-01-05", "1904-02-30"),
            "volume": ISSUE_FRONTMATTER.replace("volume: 60", "volume: -1"),
            "missing": ISSUE_FRONTMATTER.replace("% number: 1\n", ""),
            "kind": ISSUE_FRONTMATTER.replace("kind: issue", "kind: article"),
        }
        for name, main in cases.items():
            with self.subTest(name):
                with self.assertRaises(build.BookError):
                    build.load_book(self.book(name, main))
        issue = build.load_book(self.book("valid", ISSUE_FRONTMATTER))
        with self.assertRaisesRegex(build.BookError, "inherits `rights`"):
            build.load_book(self.book("article", FRONTMATTER), issue=issue)
        # Different URLs must not disguise a duplicate issue.
        self.book("duplicate", ISSUE_FRONTMATTER)
        for name in cases:
            __import__("shutil").rmtree(self.root / name)
        __import__("shutil").rmtree(self.root / "article")
        with self.assertRaisesRegex(build.BookError, "duplicate magazine"):
            build.find_books(self.root)

    def serialized_article(self):
        # Directory order differs from the editorial installment order, across a year/volume boundary.
        for name, date, volume, number in (("z-older", "1903-12-22", 59, 26),
                                           ("a-newer", "1904-01-05", 60, 1)):
            issue = self.book(name, ISSUE_FRONTMATTER.replace("1904-01-05", date)
                              .replace("volume: 60", f"volume: {volume}")
                              .replace("number: 1", f"number: {number}")
                              .replace(r"\input{articles/01-vorwort/body}",
                                       r"\subimport{articles/01-vorwort/}{body.tex}"))
            part = issue / "articles/01-vorwort"
            part.mkdir(parents=True)
            (part / "main.tex").write_text(
                "% ---\n% title: Fortsetzung\n% source_pages: 7–8\n% ---\n"
                "\\documentclass{oll-book}\n\\begin{document}\n\\input{body}\n\\end{document}\n")
            (part / "body.tex").write_text("\\chapter{Fortsetzung}\n\\input{detail}\n")
            (part / "detail.tex").write_text(f"Text aus {name} mit Anmerkung\\footnote{{Eine Note aus {name}.}}")
        serial = self.book("serial", "% ---\n% kind: article\n% title: Ein fortlaufender Artikel\n"
                           "% topics: [Kirchengeschichte]\n% rights: Gemeinfrei\n"
                           "% installments: [z-older-01-vorwort, a-newer-01-vorwort]\n% ---\n")
        return serial

    def test_serialized_article_reads_in_order_with_scoped_notes_and_issue_links(self):
        self.serialized_article()
        books = build.find_books(self.root)
        serial = next(b for b in books if b.slug == "serial")
        self.assertEqual([p.issue_date for p in serial.installments], ["1903-12-22", "1904-01-05"])
        self.assertEqual((serial.magazine, serial.year), ("Der Lutheraner", 1903))
        editions = {}
        for book in books:
            cached = self.root / "cache" / book.slug
            cached.mkdir(parents=True)
            (cached / "book.pdf").write_bytes(b"%PDF")
            (cached / "book.epub").write_bytes(b"PK")
            (cached / "body.html").write_text(
                f'<p>{book.slug}</p><a id="anchor"></a><a id="anchor"></a>'
                '<a href="#note">Note</a><aside id="note">Text</aside>')
            (cached / "toc.json").write_text("[]")
            editions[book.slug] = cached
        out = self.root / "public"
        out.mkdir()
        build.render_site(books, editions, out)
        from lxml import html
        page = html.fromstring((out / "works/serial/index.html").read_text())
        sections = page.xpath('//article[@class="book-page"]/section')
        self.assertEqual([s.get("id") for s in sections],
                         ["installment-z-older-01-vorwort", "installment-a-newer-01-vorwort"])
        ids = page.xpath('//@id')
        self.assertEqual(len(ids), len(set(ids)))
        for part in serial.installments:
            self.assertIn(f"{part.slug}-note", ids)
            self.assertIn(f"#{part.slug}-note", page.xpath('//@href'))
            self.assertIn(part.issue.url, page.xpath('//@href'))
            self.assertIn(f"{part.url}{part.slug}.epub", page.xpath('//@href'))
            part_page = html.fromstring((out / f"works/{part.slug}/index.html").read_text())
            self.assertIn(serial.url, part_page.xpath('//@href'))
            self.assertIn(serial.installments[1].url, part_page.xpath('//@href'))
            self.assertEqual(part_page.xpath('//nav[@aria-label="Article installments"]//a[@aria-current]/@href'),
                             [part.url])
        self.assertIn(serial.url, html.fromstring((out / "topics/kirchengeschichte/index.html").read_text()).xpath('//@href'))
        self.assertIn("serial.pdf", page.xpath('//@href'))
        self.assertIn("serial.epub", page.xpath('//@href'))
        self.assertEqual((out / "works/serial/serial.pdf").read_bytes(), b"%PDF")
        self.assertEqual((out / "works/serial/serial.epub").read_bytes(), b"PK")
        with zipfile.ZipFile(out / "works/serial/serial-latex.zip") as archive:
            self.assertIn("serial/oll-book.cls", archive.namelist())
            for part in serial.installments:
                self.assertEqual(archive.read(f"serial/installments/{part.slug}/body.tex"),
                                 (part.path / "body.tex").read_bytes())
                self.assertEqual(archive.read(f"serial/installments/{part.slug}/detail.tex"),
                                 (part.path / "detail.tex").read_bytes())
        catalog = html.fromstring((out / "index.html").read_text())
        self.assertNotIn(serial.url, catalog.xpath('//@href'))
        self.assertEqual(catalog.xpath('//*[@class="work-row"]/@data-kind'), ["issue", "issue"])
        manifest = serial.path / "main.tex"
        manifest.write_text(manifest.read_text().replace(
            "[z-older-01-vorwort, a-newer-01-vorwort]", "[a-newer-01-vorwort]"))
        partial = next(b for b in build.find_books(self.root) if b.slug == "serial")
        self.assertEqual([p.slug for p in partial.installments], ["a-newer-01-vorwort"])

    def test_serialized_edition_cache_follows_all_parts_and_their_order(self):
        self.serialized_article()
        serial = next(b for b in build.find_books(self.root) if b.slug == "serial")
        before = build.book_hash(serial)
        second_body = serial.installments[1].path / "body.tex"
        original = second_body.read_text()
        second_body.write_text(original + "\nEine Berichtigung.")
        self.assertNotEqual(build.book_hash(serial), before)
        second_body.write_text(original)
        self.assertEqual(build.book_hash(serial), before)
        serial.installments.reverse()
        self.assertNotEqual(build.book_hash(serial), before)
        serial.installments.reverse()
        issue = serial.installments[1].issue.path / "main.tex"
        issue.write_text(issue.read_text().replace("% source:", "% language: de\n% source:"))
        self.assertNotEqual(build.book_hash(serial), before)

    def test_serialized_article_rejects_invalid_or_unpublished_installments(self):
        serial = self.serialized_article()
        main = (serial / "main.tex").read_text()
        for replacement in ("[]", "not-a-list", "[missing]", "[serial]", "[z-older]",
                            "[z-older-01-vorwort, z-older-01-vorwort]"):
            with self.subTest(replacement=replacement):
                (serial / "main.tex").write_text(main.replace(
                    "[z-older-01-vorwort, a-newer-01-vorwort]", replacement))
                with self.assertRaises(build.BookError):
                    build.find_books(self.root)
        (serial / "main.tex").write_text(main)
        issue_main = self.root / "a-newer/main.tex"
        original = issue_main.read_text()
        for invalid in (original.replace("% kind:", "% language: en\n% kind:"),
                        original.replace("der-lutheraner", "another-magazine")):
            issue_main.write_text(invalid)
            with self.assertRaises(build.BookError):
                build.find_books(self.root)
        issue_main.write_text(original)
        part_main = self.root / "a-newer/articles/01-vorwort/main.tex"
        part_main.write_text(part_main.read_text().replace("% title:", "% draft: true\n% title:"))
        with self.assertRaises(build.BookError):
            build.find_books(self.root)

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
        self.assertNotIn("The collection</a>", page)
        self.assertNotIn("Book /", page)
        self.assertNotIn("Typeset with LuaLaTeX", page)
        self.assertTrue((out / "works/lochner/lochner.epub").exists())
        with zipfile.ZipFile(out / "works/lochner/lochner-latex.zip") as archive:
            self.assertEqual(sorted(archive.namelist()), ["lochner/body.tex", "lochner/main.tex", "lochner/oll-book.cls"])
        catalog = (out / "index.html").read_text("utf-8")
        from lxml import html
        for route, active in [("index.html", "/"), ("books/index.html", "/books/"),
                              ("about/index.html", "/about/"), ("works/lochner/index.html", None)]:
            document = html.fromstring((out / route).read_text())
            self.assertFalse(document.xpath('//aside[@class="sidebar"]'))
            self.assertFalse(document.xpath('//details[@class="mobile-menu"]/@open'))
            for layout in ("desktop-links", "mobile-links"):
                navigation = document.xpath(f'//nav[@aria-label="Library"]//div[@class="{layout}"]/a')
                self.assertEqual([(link.text, link.get("href")) for link in navigation],
                                 [("Collection", "/"), ("Books", "/books/"),
                                  ("Magazines", "/magazines/"), ("Topical Index", "/topics/"),
                                  ("About the library", "/about/")])
                self.assertEqual([link.get("href") for link in navigation if link.get("aria-current") == "page"],
                                 [active] if active else [])
        books_page = html.fromstring((out / "books/index.html").read_text())
        self.assertEqual(books_page.xpath('//h1/text()'), ["Books"])
        self.assertEqual(books_page.xpath('//*[@class="work-row"]//h3/a/@href'), [book.url])
        self.assertEqual(books_page.xpath('//*[@id="clear-filters"]/@href'), ["/books/"])
        self.assertIn('data-topics="liturgik gottesdienst-predigt "', catalog)
        self.assertIn("Gottesdienst &amp; Predigt", (out / "topics/gottesdienst-predigt/index.html").read_text())
        self.assertTrue((out / "404.html").exists())
        self.assertRegex(catalog, r'/static/library\.css\?v=[0-9a-f]{10}')


class TypesetTests(unittest.TestCase):
    @unittest.skipUnless(all(shutil.which(cmd) for cmd in ("lualatex", "make4ht", "tex4ebook")),
                         "TeX build tools are not installed")
    def test_sideways_registers_stay_upright_and_complete_in_digital_editions(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            book = root / "book"
            book.mkdir()
            (book / "main.tex").write_text(r"""\documentclass{oll-book}
\begin{document}
Before register.

\begin{quertabelle}
\quellseite{302}
\noindent Appendix.
\begin{center}
Family register.\footnote{An explanatory note.}\\
\begin{tabular}{|l|l|}
\hline Name & Date \\ \hline
Maria & 1847\rule{0pt}{11cm} \\ \hline
\end{tabular}
\end{center}
\end{quertabelle}

After register.
\end{document}
""")
            result = typeset(book, root / "build", {"title": "Sideways register"})
            self.assertEqual(result["warnings"], [])
            self.assertNotIn("Overfull \\hbox", (root / "build/pdf/main.log").read_text())
            documents = [lxml.html.fromstring(result["html"].read_bytes())]
            with zipfile.ZipFile(result["epub"]) as archive:
                documents.extend(lxml.html.fromstring(archive.read(name))
                                 for name in archive.namelist() if name.endswith(".xhtml"))
            registers = [doc for doc in documents if doc.xpath('//table[contains(., "Maria")]')]
            self.assertEqual(len(registers), 2)  # reader and EPUB
            for doc in registers:
                text = " ".join(doc.text_content().split())
                for expected in ("Before register.", "Appendix.", "Family register.",
                                 "An explanatory note.", "Maria", "1847", "After register."):
                    self.assertIn(expected, text)
                self.assertTrue(doc.cssselect('.quellseite[data-page="302"]'))
                for node in doc.xpath('//*[@style]'):
                    self.assertNotIn("rotate(", node.get("style"))

    @unittest.skipUnless(all(shutil.which(cmd) for cmd in ("lualatex", "make4ht", "tex4ebook")),
                         "TeX build tools are not installed")
    def test_digital_registers_cite_print_pages_and_link_to_local_targets(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            book = root / "book"
            book.mkdir()
            (book / "main.tex").write_text(r"""\documentclass{oll-book}
\begin{document}
\frontmatter\setcounter{page}{7}
\chapter{Front}\label{front}
Front matter.
\mainmatter\setcounter{page}{23}
\chapter{Prayer}\label{prayer}
Prayer text.
\subsection{Inline heading}\phantomsection\label{inline:first}
First inline target.

Second\phantomsection\label{inline:second} inline target.
\chapter{Register}
Print \pageref{prayer}; front \pageref{front}; inline \pageref{inline:first}, \pageref{inline:second}. Ordinary § remains.
\begin{originalinhalt}
\inhaltseintrag{Small type}{\pageref{prayer}}
\end{originalinhalt}
\end{document}
""")
            result = typeset(book, root / "build", {"title": "Page references"})
            self.assertEqual(result["warnings"], [])
            document = lxml.html.fromstring(result["html"].read_bytes())
            paragraph = document.xpath('//p[contains(., "Print")]')[0]
            self.assertEqual(" ".join(paragraph.text_content().split()),
                             "Print 23; front vii; inline 23, 23. Ordinary § remains.")
            links = paragraph.xpath('.//a')
            self.assertEqual([link.text for link in links], ["23", "vii", "23", "23"])
            self.assertNotEqual(links[2].get("href"), links[3].get("href"))
            self.assertEqual(document.xpath('//p[contains(., "Small type")]//a')[0].text_content(), "23")
            for link in links:
                self.assertTrue(document.xpath('//*[@id=$id]', id=link.get("href").split("#")[1]))
            with zipfile.ZipFile(result["epub"]) as archive:
                documents = {name: lxml.html.fromstring(archive.read(name))
                             for name in archive.namelist() if name.endswith(".xhtml")}
                name, document = next((name, doc) for name, doc in documents.items()
                                      if doc.xpath('//p[contains(., "Print")]'))
                paragraph = document.xpath('//p[contains(., "Print")]')[0]
                self.assertEqual(" ".join(paragraph.text_content().split()),
                                 "Print 23; front vii; inline 23, 23. Ordinary § remains.")
                self.assertEqual(document.xpath('//p[contains(., "Small type")]//a')[0].text_content(), "23")
                for link in paragraph.xpath('.//a'):
                    file, anchor = link.get("href").split("#")
                    target = posixpath.normpath(posixpath.join(posixpath.dirname(name), file)) if file else name
                    self.assertTrue(documents[target].xpath('//*[@id=$id]', id=anchor))


if __name__ == "__main__":
    unittest.main()
