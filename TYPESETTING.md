# Typesetting guidelines

Every book in the OpenLutheranLibrary is set with one document class,
[`oll-book`](site/tex/oll-book.cls), and follows the conventions below. The
class owns the page design (A5, Libertinus Serif, centred headings, running
heads, footnotes); a book's sources only say *what* the text is. That keeps
all books alike in print, in the online reader and in the EPUB, and lets the
design change in one place.

The aim is a faithful, readable edition of the printed original: its words,
spelling and structure are kept; its layout is not imitated.

## 1. Files

```
<book>/
  main.tex   frontmatter (see README.md), \documentclass, \input{body}
  body.tex   the text (long books may split it: body/01-vorwort.tex, …)
```

`main.tex` contains nothing but the frontmatter block and:

```latex
% Wilhelm Löhe: Der evangelische Geistliche, Erstes Bändchen (4. Aufl., Gütersloh 1872)
\documentclass{oll-book}
\begin{document}
\input{body}
\end{document}
```

No `\usepackage`, no `\newcommand`, no geometry or font settings in a book.
If a book needs something the class lacks, add it to the class (with a
`.4ht`-safe implementation, see §8) so every book can use it.

Class options: `english` or `latin` (default `ngerman`), `pagella` (default
Libertinus), `fnsymbole` (footnote marks `*`, `**` counted per page instead
of numbers per chapter), `quellseiten` (print source page numbers in the PDF
margin). Example: `\documentclass[english]{oll-book}`.

Compile by hand from the book directory:

```sh
TEXINPUTS=../site/tex//: lualatex main.tex
```

## 2. Structure

```latex
\frontmatter                 % roman page numbers
\begin{titelseite} … \end{titelseite}   % each printed title page
\chapter{Vorwort}
\chapter{Inhaltsübersicht}  % the original's contents, see §5
\mainmatter                  % arabic page numbers from 1
\part{Der evangelische Geistliche}      % a division title page of the original
\chapter{A. Einleitendes}
\section{I. Die Candidatenjahre}
\subsection{Examen}
\subsubsection{Anmerkung}    % run-in heading, rarely needed
…
\part{Anhang}
```

- Use the **unstarred** commands. The class suppresses LaTeX's numbering;
  the original's numbering (`A.`, `I.`, `§. 12`, `36.`) is written into the
  title. Unstarred headings reach the PDF bookmarks and the reader's contents.
- Map the original's hierarchy onto the levels from the top: a division with
  its own title page → `\part`; the largest regular division → `\chapter`;
  then `\section`, `\subsection`. Equal levels of the original get equal
  commands throughout the book.
- No `\clearpage`, `\newpage`, `\vspace`, `\bigskip` or `center` around
  headings: `\part` and `\chapter` start a new page themselves.
- Heading text: as printed, but **without the final full stop** (`?` and `!`
  stay). Do not change capitalisation or spelling.
- A heading longer than about 40 characters gets a short form for the running
  head: `\section[VI. Gesellschaftliches Leben]{VI. Stelle dich auch im
  gesellschaftlichen Leben gleich anfangs richtig …}`. The short form uses the
  original's words, abridged; the original's own contents often has one.
- A heading that carries a footnote always gets the short form, without the
  note, so the note stays out of the running head and the bookmarks:
  `\section[IV. Schone deinen Vorfahr und deinen Nachfolger]{IV. Schone
  deinen Vorfahr und deinen Nachfolger\footnote{…}}`.

## 3. Text

- **Spelling and wording are the original's.** No modernisation (`mitgetheilt`,
  `Ueberzeugung`, `Accidentien` stay). Obvious printer's errors may be
  corrected silently; doubtful readings are marked `\unsicher{…}`.
- Paragraphs are separated by one blank line; one paragraph per source line
  is preferred (long lines are fine).
- Numbered paragraphs of the original (`1.`, `§. 12.`) stay plain text at the
  start of the paragraph.
- Characters: write UTF-8 directly — `„…“` and `‚…‘` for German quotes,
  `“…”` for English, `’` for the apostrophe, `—` and `–` as printed, `½`,
  `†`, Greek and Hebrew as Unicode. Never `"` or ``` `` ```. Number ranges
  take an en dash: `S. 1–23` (not `1--23` and not `1-23`).
- Abbreviations that consist of several letters get a thin space inside:
  `z.\,B.`, `d.\,h.`, `d.\,i.`, `u.\,s.\,w.`, `u.\,a.`, `s.\,o.`, `a.\,a.\,O.`,
  `J.\,V.\,A.`. Bible references and other number–word pairs keep a normal
  space: `1. Tim. 3, 10`.
- Emphasis: letter-spaced print of the original (Sperrsatz) → `\gesperrt{…}`;
  italic or Antiqua emphasis → `\emph{…}`. Never `\textbf`, `\textit`,
  `\large` etc. in running text.
- Foreign-language passages need no markup. Long Latin quotations may be
  wrapped in `\foreignlanguage{latin}{…}` for hyphenation.

## 4. Notes, page markers, glosses

- `\footnote{…}` directly after the word or punctuation it belongs to, no
  space before it. The class numbers them; never write `*)` by hand.
- **Source pages.** Where a page of the scanned original begins, write
  `\quellseite{n}` (n = scan page) **on a line of its own**, exactly where
  the page break falls, also in the middle of a paragraph, a footnote or a
  verse. It never adds space, so the text before and after keeps its normal
  word space. A page break inside a word: join the word and put the marker
  on its own line after the whole word. The old comment form `% p. n` is
  replaced by `\quellseite{n}`.
- Marginal glosses of the original: `\randnotiz{…}` at the point they refer to.
- A section break inside a chapter (a centred `*`, a short rule): `\trenner`.
- Short centred lines that are text, not headings (e.g. „(Einer jungen
  Pfarrerin im Jahre 1837 geschrieben.)“ under a title): `center`.

## 5. Front matter

- Each printed title page (half-title, title page, a dedication page) is one
  `titelseite` environment. Inside it, and only there, size commands and
  vertical space are allowed:

  ```latex
  \begin{titelseite}
  {\LARGE Der evangelische Geistliche.}\\[1.5em]
  Dem nun folgenden Geschlechte evangelischer Geistlichen dargebracht\\[1.5em]
  von Wilhelm Löhe,\\
  …
  \end{titelseite}
  ```

  Title-page lines keep their final full stops (they are a transcription).
- The original's table of contents is kept, with its page numbers, as:

  ```latex
  \chapter{Inhaltsübersicht}
  \begin{originalinhalt}
  \inhaltsgruppe{A. Einleitendes.}
  \inhaltsseite                      % the "Seite" column label, if printed
  \inhaltseintrag{I. Einige Bemerkungen über die Vorbereitung zum geistlichen Amte}{27}
  \inhaltsgruppe{Anhang.}
  \inhaltseintrag{Erinnerungen an Pfarrersfrauen}{277}
  \end{originalinhalt}
  ```

  Group lines without a page number are `\inhaltsgruppe`; entries with a page
  number are `\inhaltseintrag{text}{page}`. An entry without a page number
  that is not a group heading: `\inhaltseintrag{text}{}`.
- Datelines and signatures under a preface or letter: `unterschrift`
  environment, lines separated by `\\`.

## 6. Quotations and verse

- Block quotations: `quote` (one paragraph or several). The source line
  printed under a quotation or motto: `\quelle{1. Cor. 9, 27.}` after
  `\end{quote}`.
- Poetry: `verse`; `\\` at the end of every line except the last line of a
  stanza; stanzas are separated by a blank line. Indented lines:
  `\hspace*{1em}` at the start of the line.

## 7. Tables

- `tabular` inside a `center` environment; columns with `l`, `c`, `r` or
  `p{…}`; rules with `\hline`. Several lines in one cell: `\zl{a\\b}`.
- A table wider than the page: `\begin{sideways}…\end{sideways}` around the
  `tabular`, on a page of its own. Size commands (`\small`, `\footnotesize`)
  are allowed inside tables.

## 8. What not to do

- No `\section*`, `\chapter*` and no headings made from `center` + `\Large`.
- No `\clearpage` / `\newpage` except to end a `sideways` table page.
- No `\\` to end paragraphs, no `\noindent`, `\medskip`, `\hfill`,
  `\dotfill` in running text.
- No colours, fonts, sizes, `\usepackage` or macro definitions in a book.
- No comments that duplicate structure (`% Kapitel 3`); comments are for
  editorial remarks only, e.g. `% Druckfehler im Original: „Gemüth“`.

Anything a book needs beyond this goes into `oll-book.cls`, with an HTML
version in `site/tex/oll.cfg` when TeX4ht cannot render it as is (wrap
PDF-only code in `\ifoll@pdf`).

## 9. Checklist before committing

1. `lualatex` runs without errors; no `Overfull \hbox` wider than 2pt in the
   log (fix with a better line break of the source, not with `\\`).
2. Every `% p. n` has become `\quellseite{n}`, in ascending order.
3. Headings: unstarred, no final full stop, short form where long.
4. `python3 site/build.py` builds the book; check the PDF and the reader.
