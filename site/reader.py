"""Turn TeX4ht's HTML into the reader body: book typography, sidenotes and a table of contents."""
import copy
import re

import bleach
import lxml.html
from bleach.css_sanitizer import CSSSanitizer

CSS_SANITIZER = CSSSanitizer(allowed_css_properties=[
    "color", "background-color", "width", "max-width", "margin-left", "margin-right",
    "vertical-align", "text-align", "font-size", "font-style", "font-weight", "font-variant",
    "letter-spacing", "text-indent", "white-space", "text-decoration",
    "border-top", "border-bottom", "border-left", "border-right",
])
ALLOWED_TAGS = {
    "p", "h1", "h2", "h3", "h4", "h5", "h6", "em", "strong", "b", "i", "u", "s", "small", "cite", "q",
    "blockquote", "ul", "ol", "li", "dl", "dt", "dd", "a", "sup", "sub", "br", "hr", "code", "pre",
    "span", "div", "section", "aside", "nav", "figure", "figcaption", "img",
    "table", "thead", "tbody", "tfoot", "tr", "th", "td", "caption", "col", "colgroup",
    "math", "semantics", "mrow", "mi", "mn", "mo", "ms", "msup", "msub", "msubsup", "mfrac", "msqrt",
    "mroot", "mtext", "annotation", "mspace", "mover", "munder", "munderover", "mstyle", "mtable",
    "mtr", "mtd", "merror", "mpadded", "mphantom",
}
ALLOWED_ATTRIBUTES = {
    "*": ["id", "class", "style", "title", "lang", "dir"],
    "a": ["href", "role"],
    "ol": ["start", "type"],
    "th": ["colspan", "rowspan", "scope"],
    "td": ["colspan", "rowspan"],
    "math": ["xmlns", "display"],
    "annotation": ["encoding"],
    "span": ["data-page", "data-note", "role"],
    "aside": ["role"],
    "img": lambda tag, name, value: name in {"alt", "width", "height"} or (
        name == "src" and re.fullmatch(r"(?:[A-Za-z0-9_-]+/)*[A-Za-z0-9_-]+\.(?:svg|png|jpg|jpeg)", value)),
}
FONT_DECLARATION = re.compile(r"^\s*(font-size|font-style|font-weight|font-variant|font-family)\s*:")
HEADINGS = {
    "partHead": 0, "likepartHead": 0, "chapterHead": 1, "likechapterHead": 1,
    "sectionHead": 2, "likesectionHead": 2, "subsectionHead": 3, "likesubsectionHead": 3,
}
LONG_NOTE = 450  # characters; longer footnotes become a block after their paragraph
BLOCK_TAGS = {"p", "div", "blockquote", "ul", "ol", "li", "dl", "dt", "dd", "table", "pre", "center",
              "h1", "h2", "h3", "h4", "h5", "h6", "section", "figure"}


def font_classes(css):
    """TeX4ht encodes font switches as classes (e.g. rm-lmri-9); keep their size and shape."""
    classes = {}
    for name, body in re.findall(r"(?m)^\s*\.([A-Za-z][\w-]*)\s*\{([^}]*)\}", css):
        declarations = [d.strip() for d in body.split(";") if d.strip()]
        if declarations and all(FONT_DECLARATION.match(d) for d in declarations):
            kept = [d for d in declarations if not d.startswith("font-family")]
            classes[name] = "; ".join(kept)
    return classes


def inline_font_classes(body, classes):
    for element in body.iter():
        names = (element.get("class") or "").split()
        styles = [classes[n] for n in names if n in classes and classes[n]]
        if any(n in classes for n in names):
            rest = [n for n in names if n not in classes]
            if rest:
                element.set("class", " ".join(rest))
            else:
                element.attrib.pop("class", None)
            if styles:
                element.set("style", "; ".join(filter(None, [element.get("style"), *styles])))


def flatten_to_inline(element):
    """Sidenotes sit inside paragraphs, so their content must be phrasing content."""
    for child in element.iter():
        if child is not element and child.tag in BLOCK_TAGS:
            child.set("class", f"{child.get('class', '')} {child.tag}".strip())
            child.tag = "span"


def build_sidenotes(body):
    """Copy each footnote next to its mark. The endnote list remains for narrow screens."""
    for container in body.find_class("footnotes"):
        notes = []
        # Newer TeX4ht wraps each note in <aside class="footnotetext">; older releases (Debian's)
        # emit bare paragraphs. Either way a note starts at the paragraph holding the back link.
        for paragraph in container.iter("p"):
            back = paragraph.cssselect("span.footnote-mark a[href]")
            if back:
                notes.append((back[0].get("id"), back[0].text_content().strip(), [paragraph]))
            elif notes:
                notes[-1][2].append(paragraph)
        for note_id, label, paragraphs in notes:
            if not note_id:
                continue
            marks = body.cssselect(f'span.footnote-mark a[href="#{note_id}"]')
            if not marks:
                continue
            mark_span = marks[0].getparent()
            length = sum(len(p.text_content()) for p in paragraphs)
            block = next((a for a in mark_span.iterancestors() if a.tag in {"p", "li", "dd"}), None)
            if length > LONG_NOTE and block is not None and block.getparent() is not None:
                # A margin column cannot hold a page-long note; it follows its paragraph in small print.
                aside = lxml.html.Element("aside", {"class": "note-block", "role": "note", "id": f"nb-{note_id}"})
                for i, paragraph in enumerate(paragraphs):
                    part = copy.deepcopy(paragraph)
                    for old in part.cssselect("span.footnote-mark"):
                        old.drop_tree()
                    if not i:
                        label_span = lxml.html.Element("span", {"class": "note-label"})
                        label_span.text = label
                        label_span.tail = part.text
                        part.text = None
                        part.insert(0, label_span)
                    aside.append(part)
                aside.tail = block.tail
                block.tail = None
                block.addnext(aside)
                marks[0].set("href", f"#nb-{note_id}")
                continue
            side = lxml.html.Element("span", {"class": "sidenote", "role": "note", "data-note": label})
            for i, paragraph in enumerate(paragraphs):
                part = copy.deepcopy(paragraph)
                for old in part.cssselect("span.footnote-mark"):
                    old.drop_tree()
                if i:
                    side.append(lxml.html.Element("br"))
                part.tag = "span"
                part.attrib.pop("class", None)
                side.append(part)
            flatten_to_inline(side)
            side.tail = mark_span.tail
            mark_span.tail = None
            mark_span.addnext(side)


def drop_unnumbered_titlemarks(body):
    """With secnumdepth below the level, LaTeX prints no "Part"/"Chapter" label but TeX4ht still does."""
    for mark in body.find_class("titlemark"):
        words = mark.text_content().split()
        if len(words) <= 1 and not any(re.search(r"\d", w) or re.fullmatch(r"[IVXLCDM]+", w) for w in words):
            mark.drop_tree()


def attach_page_markers(body):
    """A paragraph holding only \\quellseite markers would render as an empty line."""
    for paragraph in list(body.iter("p")):
        if paragraph.text_content().strip() or not paragraph.find_class("quellseite"):
            continue
        following = paragraph.getnext()
        if following is not None and following.tag == "p":
            markers = paragraph.find_class("quellseite")
            text, following.text = following.text, None
            for position, marker in enumerate(markers):
                marker.tail = None
                following.insert(position, marker)
            markers[-1].tail = text
            paragraph.drop_tree()
        else:
            paragraph.set("class", "page-markers")


def heading_title(heading):
    """Heading text without notes, with line breaks (\\\\) shown as separators."""
    heading = copy.deepcopy(heading)
    for note in heading.cssselect(".footnote-mark, .sidenote"):
        note.drop_tree()
    for br in heading.iter("br"):
        br.tail = " · " + (br.tail or "")
    return " ".join(heading.text_content().split()).strip(" ·")


def table_of_contents(body):
    entries = []
    for heading in body.iter("h1", "h2", "h3", "h4"):
        level = next((HEADINGS[c] for c in (heading.get("class") or "").split() if c in HEADINGS), None)
        if level is None:
            continue
        following = heading.getnext()
        if following is not None and "tableofcontents" in (following.get("class") or ""):
            continue  # the heading of \\tableofcontents itself
        if not heading.get("id"):
            heading.set("id", f"h{len(entries) + 1}")
        title = heading_title(heading)
        if title:
            entries.append({"level": level, "id": heading.get("id"), "title": title[:200]})
    # The two topmost heading levels the work uses (e.g. part and section) keep the sidebar readable.
    ranks = {level: rank for rank, level in enumerate(sorted({e["level"] for e in entries}))}
    return [dict(e, level=ranks[e["level"]]) for e in entries if ranks[e["level"]] <= 1]


def reader_html(raw, css=""):
    """Turn TeX4ht output into a sanitized reader body plus a table of contents."""
    document = lxml.html.document_fromstring(raw)
    body = document.body
    for node in body.xpath("//comment() | //script | //style"):
        node.drop_tree()
    for link in body.iter("a"):
        # Links into the single output page (main.html#x1-2000) become in-page anchors.
        link.set("href", re.sub(r"^[\w-]+\.html#", "#", link.get("href", "")))
    inline_font_classes(body, font_classes(css))
    drop_unnumbered_titlemarks(body)
    build_sidenotes(body)
    attach_page_markers(body)
    for paragraph in list(body.iter("p")):
        previous = paragraph.getprevious()
        if not paragraph.text_content().strip() and not len(paragraph) and paragraph.getparent() is not None:
            paragraph.drop_tree()
        elif paragraph.get("class") is None and previous is not None and "marginpar" in (previous.get("class") or ""):
            # TeX4ht splits a paragraph that opens with \marginpar and drops its indent class.
            paragraph.set("class", "indent")
    toc = table_of_contents(body)
    inner = (body.text or "") + "".join(lxml.html.tostring(child, encoding="unicode") for child in body)
    clean = bleach.clean(inner, tags=ALLOWED_TAGS, attributes=ALLOWED_ATTRIBUTES, css_sanitizer=CSS_SANITIZER,
                         protocols={"http", "https", "mailto"}, strip=True, strip_comments=True)
    return clean, toc
