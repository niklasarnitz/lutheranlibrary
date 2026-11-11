# Review record — full Genesis-section OCR draft

## Status and source

This edition covers the entire requested Genesis-sermons section, not the
whole thousand-scan Walch volume. It remains `draft: true`: **the text has not
been visually collated against every scan, and is not a verified edition**.
The media viewer's monthly upload quota prevented source-image and rendered
page inspection. The PDFs are available locally; this is a viewing limitation,
not missing source material. Automated checks cannot establish fidelity.

Source: *Dr. Martin Luthers Sämmtliche Schriften*, Walch², volume 3,
*Auslegung des Alten Testaments (Fortsetzung)*, St. Louis, 1894. Folio filename:
`Walch03ErsteBuchMosisZuDenPsalmenExcl.1894.pdf`, 1,000 scans, SHA-256:
`12145f139b34c97e9f5b1ba290da0e9a4e6bd30a260dcdbac44b57bb556877ad`.
The original PDF checksum was verified. Latest saved OCR revisions and
structured `result_json.blocks` supply the draft; Folio remains unchanged.

## Coverage

All 333 scans 11–343 are represented in order, ending after paragraph 43's
“Amen.” before the Exodus heading on scan 343. Included:

- Opening address and complete inserted *Unterrichtung*, scans 11–19.
- Preface to the Genesis sermons, beginning on scan 20.
- Entire continuing Genesis exposition, through its closing doxology on 331.
- C. Sermon on Genesis 3:15, beginning on scan 332.
- D. Sermon on Genesis 22:18, beginning on scan 338, ending on 343.

Volume title/front matter outside this section, the historical contents list
(scan 9), blank scan 10, running heads/folios, and the Exodus opening and its
editorial footnote are omitted. The edition's sole contents list is generated.

The six files in `body/` follow source ranges 11–64, 65–119, 120–174,
175–229, 230–284 and 285–343. They are ordered storage units, not editorial
divisions; paragraph flow continues across their boundaries.

## Notes, boundaries and editorial decisions

- All 516 in-scope exported footnote blocks have text coverage in the range
  drafts. Continued blocks are not counted as additional authored notes.
  The fifteen former appendix notes now sit at their verified inline
  anchors on scans 23–25, 39, 43, 54, 279 and 309. The variant on scan 309
  reads “strecken”, corresponding to “streckt” in the text.
- The note beginning on scan 66 (“Randglosse: Zur Offenbarung”) continues on
  67. Its body is joined as one footnote with the source marker at the break.
- Explicit OCR page-end hyphenations are joined with the next page's first
  word fragment; the marker follows the completed word. Sentence continuations
  do not acquire an invented paragraph break. These joins still need scan review.
- Scan 106 prints “Kurzum”. The word split on scans 273–274 reads
  “Ja-” / “kob gen Lus”. “Jakob” is joined before the scan-274 marker.
- The source hierarchy uses a part for division I, chapters for B/C/D, sections
  for the instruction, preface and Genesis chapter divisions, and subordinate
  headings below them. Subtitles, “Fortsetzung” and the closing doxology are
  text, not invented divisions. Heading notes have note-free short forms.
- Historic spelling and substantive variant notes are retained; automatic note
  numbering replaces printed callout labels. TeX special characters are escaped.

## Outstanding review

The follow-up checked the explicit uncertainty passages and the fifteen
appendix-note callouts against the scans. Hebrew consonants are visible on
scans 190, 206 and 321, but their exact printed vowel points still need
adjudication. A continuous visual pass through scans 11–64 corrected “Hut”
to “Hui” on scan 23. Full scan collation of the remaining range is open, including
unmarked OCR wording, punctuation, names, paragraph and quotation boundaries,
headings, split words, and notes outside the focused checks.

## Validation and delivery

The lead's independent source-block audit checked substantive paragraph,
quotation and note coverage after normalizing TeX and note callouts. All six
ranges passed the coverage threshold; every source footnote body was also
checked for normalized full-text retention, including short notes. Source
marker order/uniqueness, groups and the Genesis endpoint were checked.

PDF, reader, EPUB and self-contained LaTeX ZIP are built with the existing
pipeline in private `.amp/in/genesis-sermons/full-draft/` output directories.
Final machine checks and their limitations are summarized in the thread's
“Folio edition work — scope and remaining review” artifact. A successful build
is not visual approval. No shared `public/` output, Folio record, commit,
push or deployment is part of this local draft work.
