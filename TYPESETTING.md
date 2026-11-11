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
\frontmatter
\tableofcontents
\mainmatter
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
\tableofcontents            % the edition's authoritative contents
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
- Include `\tableofcontents` once, near the beginning of every edition. It
  generates linked entries and the edition's actual page numbers from the
  structural headings, down to `\subsection`; compile repeatedly until those
  numbers settle. This is the sole authoritative contents list. Omit the
  historical printing's contents and obsolete page numbers (see §5).
- Map the original's hierarchy onto the levels from the top: a division with
  its own title page → `\part`; the largest regular division → `\chapter`;
  then `\section`, `\subsection`. Equal levels of the original get equal
  commands throughout the book.
- In a combined multi-volume edition, reserve `\part` for each volume, then
  use `\chapter` for its divisions, `\section` for their topics, and
  `\subsection` for the next level. Preserve each printed title page, preface,
  and the original text apart from historical contents lists. The enclosing
  `main.tex` owns `\frontmatter`,
  `\tableofcontents`, and a single `\mainmatter`; volume fragments keep
  continuous edition pagination while their source-page markers retain the
  original volume-local scan numbers.
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
  If a long note crowds the print page, use `\protect\footnotemark` in the
  heading and `\footnotetext{…}` in the first paragraph below it, where the
  note can split across pages. Check the note link and pagination in the
  built editions.

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
- In mixed-script entries, wrap each Hebrew word or phrase in
  `\hebraeisch{…}` to set its direction and vowel points. Enter Unicode in
  logical reading order, with Latin references outside the command.

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
  `titelseite` environment. Use `\werktitel{…}` for the main title and
  `\werkuntertitel{…}` for the subtitle or volume designation. The same
  title command sets the journal name in a masthead. Keep the source lines
  and use paragraph breaks or `\\` between them:

  ```latex
  \begin{titelseite}
  \werktitel{Der evangelische Geistliche.}\\[1.5em]
  Dem nun folgenden Geschlechte evangelischer Geistlichen dargebracht\\[1.5em]
  von Wilhelm Löhe,\\
  …
  \end{titelseite}
  ```

  Title-page lines keep their final full stops (they are a transcription).
- Omit the original's contents list and its historical page numbers; the
  generated `\tableofcontents` replaces it in PDF, reader, and EPUB. Record the
  omitted scan-page ranges in the edition's `source` metadata. Source markers
  describe retained text: do not insert empty markers for omitted contents
  pages or renumber the remaining scan pages to close those intentional gaps.
- Datelines and signatures under a preface or letter: `unterschrift`
  environment, lines separated by `\\`.

## 6. Quotations and verse

- Block quotations: `quote` (one paragraph or several). The source line
  printed under a quotation or motto: `\quelle{1. Cor. 9, 27.}` after
  `\end{quote}`.
- In a verse-by-verse exposition, use `schriftzitat` for the passages of
  Scripture set apart as the text under discussion. Use `quote` for other
  block quotations, including incidental Scripture quotations.
- Poetry: `verse`; `\\` at the end of every line except the last line of a
  stanza; stanzas are separated by a blank line. Indented lines:
  `\hspace*{1em}` at the start of the line.

## 7. Tables

- `tabular` inside a `center` environment; columns with `l`, `c`, `r` or
  `p{…}`; rules with `\hline`. Several lines in one cell: `\zl{a\\b}`.
- Wrap a wide register table in `quertabelle`, with its source marker and
  any accompanying captions inside the environment. The class handles the
  rotated print page. The reader and EPUB display the table upright.
- For a comparison across four equal-width text columns and a narrow item
  number column, use `vergleichstabelle`. It supplies a compact
  `longtable` that can continue across pages. Size commands
  (`\small`, `\footnotesize`) are allowed inside tables.

### Musical notation

Keep editable LilyPond sources in `music/`, one single-page score per `.ly`
file. Insert them at their original place with
`\notensatz{music/096-01}{Versikel: Danket dem HErrn …}`. The second argument
describes the notation and its sung text for readers who cannot see it.
Do not repeat lyrics as running text when they are already underlaid in the
score; additional verses without notes remain ordinary text or `verse`.

To retain notation as an original scan instead of re-engraving it, keep a PNG
in `facsimiles/` and use `\notensatz{facsimiles/552}{Description of the score}`.
The PNG is included in the PDF, reader, EPUB and source download; describe this
editorial choice in the book's source metadata and review record.

The site build engraves each source to PDF for print and SVG for the reader
and EPUB, before running TeX. It needs LilyPond 2.24.3 or newer; LaTeX shell
escape stays disabled. Preserve the original voices, pitches, note values,
clefs, accidentals and underlay; mark unresolved readings in the book's review
record rather than silently replacing them with a plausible tune.

The downloadable LaTeX archive includes both editable `.ly` files and their
engraved PDF/SVG assets, so it compiles without LilyPond. To compile a checkout
by hand, first engrave its `.ly` files with LilyPond (for example,
`lilypond -o music/096-01 music/096-01.ly` from the book directory).

## 8. What not to do

- No `\section*`, `\chapter*` and no headings made from `center` + `\Large`.
- Let the class manage page breaks for headings, title pages, and wide tables.
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
4. The generated contents contains the expected divisions and topics, with
   working links and correct edition page numbers; no historical contents list
   remains alongside it, and omitted source pages are documented.
5. `python3 site/build.py` builds the book; check the PDF, reader, and EPUB.
