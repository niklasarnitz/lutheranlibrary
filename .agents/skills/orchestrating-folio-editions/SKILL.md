---
name: orchestrating-folio-editions
description: "Create finished Lutheran Library editions from Folio OCR. Use for imports, scan-based lectoring, and apparatus extraction with GPT-6 Luna workers."
---

# Orchestrating Folio editions

The goal of every run is a finished edition of the Folio OCR input that can be
published on Lutheran Library. Use the requested source scope, including when
the edition covers a section or selected apparatus. The lead owns scope,
assignments, integration and acceptance. GPT-6 Luna workers transcribe and
correct the pages. The lead checks their scan evidence and resolves discrepancies.

## 1. Establish scope and evidence

Read the checkout's `FOLIO.local.md`, `TYPESETTING.md`, and, for edition/build
work, `README.md`. Keep access details in the local runbook, not in this skill
or worker reports. Retrieval permission does not authorize Folio writes, paid
OCR retries, publication, commits or pushes.

Identify the exact work, edition and source range, including whether the user
wants the whole work, a section, or only non-biblical apparatus. Inventory all
scans, deleted/incomplete pages and intentional omissions. Verify the original
file's checksum and page count against the export. Use latest saved revisions,
not just the original AI text; preserve the unchanged export and original.

Keep evidence and worker outputs under an excluded `.amp/in/<job>/`. Check the
repository-local exclude rule before writing there. A worker must be able to
open the actual scans and source export in its execution environment.

## 2. Assign the actual work to Luna

Use **GPT-6 Luna**, model identifier `openai/gpt-6-luna`, for page-level work.
Select that model explicitly through an available model-selectable worker
interface. Do not assume a generic subagent inherits Luna. If only separate
threads support model selection, use bounded Luna worker threads with explicit
ownership and the correct executor; a cloud checkout cannot see local evidence
without transfer. If Luna is unavailable, report that before substituting a
different model.

Split work into nonoverlapping scan ranges sized to the text density and review
task. Give each worker neighboring scans for boundary context without assigning
ownership of those neighbors. Each worker writes only its own private range
directory. Shared edition sources, integration and final builds belong to the
lead. Workers do their assignments themselves, without nested delegation.

Each brief must name:

- The source/export paths, exact owned scans, neighbor context and output path.
- The requested inclusion/exclusion policy and applicable repository guidance.
- The specific corrections or questions, when this is a focused review.
- Required scan inspection, page fragments, manifest and review evidence.
- A single completion route: return a result, reply to the lead thread, or let
  the lead join with the thread tools. Do not mix reply requests with waiting.

For a range, require `page-NNNN.tex`, `manifest.json`, and `REVIEW.md`. The
manifest records source scan, output file, retained/omitted status, note counts,
uncertainties and reasons for omissions. For selective apparatus extraction,
also require `selection.json` accounting for **every** source block by index,
exact source text/type, decision and reason. Mixed blocks need exact retained
and excluded text, not a single whole-block classification.

## 3. Require scan-grounded work

Workers inspect every assigned scan for a scan-verified transcription, or every
target passage and its context for a focused correction. Preserve the original
wording and hierarchy according to `TYPESETTING.md`. Report corrections with
scan locations, source evidence, and any remaining ambiguity.

Render targeted page images or detail crops from the unchanged original as
needed. A rendered file, an OCR comparison, and a worker's assertion that it
"checked" something are not visual inspection evidence. If the viewer fails,
diagnose the actual failure: a file-size limit can be addressed with crops;
an exhausted account upload quota cannot. Do not repeatedly dispatch workers
into the same quota blocker or present another OCR pass as scan verification.
Keep unresolved readings marked `\unsicher{…}` and report the limitation.

### Notes and page boundaries

Account for every source note body, including short notes and continuations.
Map notes inline only where the source callout is identifiable. Preserve an
unanchored note in a labeled source-note appendix with scan/note locator;
record the appendix in the manifest. A continued note block is not necessarily
a second authored note. Join cross-page words and prose without inventing
missing text; preserve source markers at the proper boundaries.

### Table of contents

Use the printed Inhaltsverzeichnis to check the order and nesting of headings
in the retained text. Preserve that structure with unstarred LaTeX headings
and use a single `\tableofcontents` as the edition's contents list. Omit the
printed list and its old page numbers from the transcription. Record omitted
scan ranges in the edition's `source` metadata and account for them in the
worker manifest. On mixed pages, retain the surrounding text and its source
markers.

### Selective Bible apparatus

Carry selection state across pages. Retain prefaces, descriptive synopses,
summaries, prayers and substantive glosses, including their embedded scripture
quotations. Exclude Bible narrative, its unnumbered continuations, bare
cross-reference lists and running furniture. Numbered explanatory synopsis
items can be commentary: classify from context, not a number-only rule.
Reference lists may have alternate markers, abbreviated books and tight OCR
spacing. Glosses whose Bible anchors are omitted need an explicit presentation
decision, not invented footnote anchors. Repeated printed leaves need visual
adjudication; differing OCR or image hashes alone do not settle duplication.

## 4. Review, then integrate

Read each worker's files and evidence. Independently check complete scan/block
accounting, retained text, notes, headings, boundary joins and exclusions.
Compare note bodies as well as counts: equal counts can conceal omissions or
duplication. Check the latest-revision source against the ledger; a ledger
matching OCR does not prove that either matches the scan.

Probe likely mistakes with asymmetric controls: a known Bible verse must be
absent while its neighboring gloss remains; a reference-only note must be
absent while explanatory prose containing citations remains. Audit running
heads mistakenly emitted as chapters, missing true chapter openings, and
headings whose spelling differs from common OCR patterns.

Send concrete discrepancies back to the owning Luna worker for correction.
Review the corrected deliverable before integration. Accept only work assigned
for this task; unsolicited outputs from other threads need user approval.
Integrate approved fragments into self-contained edition sources and record
substantive decisions and unresolved items in the edition's `REVIEW.md`.

Set every new edition with the shared [`oll-book` class](../../../site/tex/oll-book.cls)
and follow [`TYPESETTING.md`](../../../TYPESETTING.md) for its LaTeX markup.
Use the class's commands for title pages, headings, quotations, notes, and
tables. Keep typography and page layout in the shared class.

## 5. Finish and validate the edition

Build the affected PDF, reader, EPUB and LaTeX ZIP with the existing pipeline,
using private output/cache directories when concurrent work is possible.
Inspect the current build APIs and validate each format before marking the
edition ready:

- **PDF.** Check TeX logs against the `TYPESETTING.md` checklist. Visually
  inspect the title page, contents, and representative pages with notes,
  tables, or illustrations. Check contents links and edition page numbers.
- **Reader.** Open the rendered edition and check heading hierarchy, contents
  links, source-page anchors, notes, and representative layout.
- **EPUB.** Check ZIP/XML integrity, open the EPUB in a reader or previewer,
  and inspect representative chapters, notes, and any tables or illustrations.
  Verify that the contents links reach the intended headings.
- **LaTeX ZIP.** Check that the archive includes the shared class, source
  fragments, and assets needed to build the edition.

Across the rendered formats, check the generated contents against the retained
headings and confirm it is the edition's only contents list. Verify source-marker
order and note coverage. For pipeline edits, run the site's required tests.

An edition is finished when every scan in scope is accounted for, retained text
has been visually collated, the catalog and self-contained `oll-book` sources
follow the repository's typesetting rules, and each output passes the checks
above. Record the checks performed for each format in `REVIEW.md`.
Continue from worker fragments through integration and validation. If the user
requests an intermediate checkpoint or a blocker prevents completion, record
the draft status and the work still required.

Keep coverage ledgers, review evidence and validation reports. Remove disposable
iteration helpers and record the edition's delivery state. Publish, commit or
push only when authorized.
