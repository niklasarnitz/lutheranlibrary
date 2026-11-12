"""Exercise contents destinations through the real digital typesetting pipeline."""
import posixpath
import shutil
import tempfile
import unittest
import zipfile
from pathlib import Path

import lxml.html

from reader import reader_html
from typeset import typeset


class ContentsTests(unittest.TestCase):
    @unittest.skipUnless(all(shutil.which(cmd) for cmd in ("lualatex", "make4ht", "tex4ebook")),
                         "TeX build tools are not installed")
    def test_numbered_chapter_divisions_restart_and_keep_distinct_destinations(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            book = root / "book"
            book.mkdir()
            (book / "main.tex").write_text(
                r"\documentclass{oll-book}\begin{document}\tableofcontents"
                r"\begin{numberedchapters}\chapter{Prayers}Prayer text."
                r"\chapter{Thanksgiving}Thanksgiving text.\end{numberedchapters}"
                r"\chapter{Index}Index text."
                r"\begin{numberedchapters}\chapter{Hymns}Hymn text."
                r"\end{numberedchapters}\end{document}")
            result = typeset(book, root / "build", {"title": "Numbered chapter divisions"})
            self.assertEqual(result["warnings"], [])

            print_contents = (root / "build/pdf/main.toc").read_text()
            self.assertIn(r"\numberline {I.}Prayers", print_contents)
            self.assertIn(r"\numberline {II.}Thanksgiving", print_contents)
            self.assertIn(r"\contentsline {chapter}{Index}", print_contents)
            self.assertIn(r"\numberline {I.}Hymns", print_contents)
            self.assertIn("{chapter.1.1}", print_contents)
            self.assertIn("{chapter.2.1}", print_contents)

            markup, _ = reader_html(result["html"].read_text())
            document = lxml.html.fromstring(markup)
            entries = document.cssselect(".chapterToc")
            self.assertEqual([" ".join(entry.text_content().split()) for entry in entries],
                             ["I. Prayers", "II. Thanksgiving", "Index", "I. Hymns"])
            links = [entry.cssselect("a")[0].get("href") for entry in entries]
            self.assertEqual(len(set(links)), 4)
            for link in links:
                self.assertEqual(len(document.xpath('//*[@id=$id]', id=link[1:])), 1)

    @unittest.skipUnless(all(shutil.which(cmd) for cmd in ("lualatex", "make4ht", "tex4ebook")),
                         "TeX build tools are not installed")
    def test_unnumbered_chapter_and_later_sections_have_distinct_destinations(self):
        # The second heading's address plus an inert chapter counter (2000 + 0)
        # used to collide with the twentieth heading's address (20000).
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            book = root / "book"
            book.mkdir()
            (book / "main.tex").write_text(
                r"\documentclass{oll-book}\begin{document}\tableofcontents"
                r"\chapter{Opening}Opening text."
                r"\setcounter{page}{1000}"
                + "".join(rf"\section{{Topic {n}}}Section text." for n in range(1, 22))
                + r"\section{11.}First.\section{1}Second.\section{1}Third.\end{document}")
            result = typeset(book, root / "build", {"title": "Contents destinations"})
            self.assertEqual(result["warnings"], [])
            # Four-digit contents page numbers must fit their PDF boxes too.
            self.assertNotIn("Overfull \\hbox", (root / "build/pdf/main.log").read_text())
            self.check_destinations(result["html"].read_bytes())
            markup, _ = reader_html(result["html"].read_text())
            self.check_destinations(markup)
            with zipfile.ZipFile(result["epub"]) as archive:
                documents = {name: lxml.html.fromstring(archive.read(name))
                             for name in archive.namelist() if name.endswith(".xhtml")}
                links = [(name, link) for name, doc in documents.items()
                         for link in doc.cssselect("nav a")]
                self.assertEqual(len(links), 25)
                self.assertEqual(len({(name, link.get("href")) for name, link in links}), 25)
                for name, link in links:
                    file, anchor = link.get("href").split("#")
                    target = posixpath.normpath(posixpath.join(posixpath.dirname(name), file))
                    matches = documents[target].xpath('//*[@id=$id]', id=anchor)
                    self.assertEqual(len(matches), 1, link.text_content())
                    self.assertEqual(self.destination_title(matches[0]),
                                     " ".join(link.text_content().split()))

    def destination_title(self, destination):
        heading = destination.getparent() if destination.tag == "a" else destination
        return " ".join(heading.text_content().split())

    def check_destinations(self, markup):
        document = lxml.html.fromstring(markup)
        self.assertLessEqual(len(document.xpath('//*[@id="x11"]')), 1)
        links = document.cssselect(".chapterToc a, .sectionToc a")
        self.assertEqual(len(links), 25)
        self.assertEqual(len({link.get("href") for link in links}), 25)
        for link in links:
            target = link.get("href").split("#")[-1]
            matches = document.xpath('//*[@id=$id]', id=target)
            self.assertEqual(len(matches), 1, link.text_content())
            self.assertEqual(self.destination_title(matches[0]), link.text_content().strip())
