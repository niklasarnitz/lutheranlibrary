# Editing the library

- **Before any work in this checkout, read [FOLIO.local.md](FOLIO.local.md).**
  This read-first pointer is local-only: keep it uncommitted when staging other
  changes. The runbook covers Folio access, retrieval and scan-based Nacharbeit.
- For Folio imports, transcription, scan-based OCR correction, or apparatus
  extraction, load [orchestrating-folio-editions](.agents/skills/orchestrating-folio-editions/SKILL.md).
  Delegate page-level work to GPT-6 Luna workers; the lead orchestrates,
  independently reviews evidence, integrates results, and validates the edition.
- Before transcribing, correcting OCR, or changing a book's LaTeX, read
  [TYPESETTING.md](TYPESETTING.md). It is the source of truth for transcription
  fidelity, structural markup, notes, source-page markers, and typesetting.
- Before adding or combining catalog entries, read [README.md](README.md) for
  frontmatter, source layout, and the PDF/reader/EPUB build pipeline.
- Preserve the original wording, historical spelling, paragraphs, notes, and
  hierarchy. Check uncertain OCR against the scan; use `\unsicher{…}` when a
  reading remains unresolved. Keep `\quellseite{n}` at each source-page boundary
  and record substantive editorial decisions in the book's review record.
- Use `oll-book` and actual unstarred `\part`, `\chapter`, `\section`,
  `\subsection`, and `\subsubsection` commands for the original hierarchy.
  Use `\tableofcontents` as the edition's sole authoritative contents list,
  generated from those headings. Omit historical contents lists and their old
  page numbers; document the omitted source pages in the edition metadata.
  In a combined edition, make each volume a `\part` and nest its divisions
  consistently below it; keep the source fragments inside the book directory
  so the downloadable LaTeX archive is self-contained.
- After source changes, build the affected PDF, reader, and EPUB using the
  existing pipeline. Check contents links, heading hierarchy, source markers,
  and representative rendered pages. For pipeline changes, also run
  `.venv/bin/python -m unittest discover -s site`.
