---
name: modernizing-lutheran-editions
description: "Creates modernized, print-ready editions of historical Lutheran books while preserving theology and meaning. Use for republication with GPT-6 Luna editorial workers and a main agent that orchestrates, independently reviews, integrates, and validates. Not for historical transcription alone."
---

# Modernizing Lutheran editions

Produce a separately identified modernized edition without replacing the historical text. The main agent orchestrates, independently reviews, integrates, and validates. **GPT-6 Luna workers perform the actual source collation, lectoring, and modernization.**

## Language and editorial limits

- **Preserve theology and contextual meaning in every case.** Keep every assertion, petition, qualification, negation, causal relationship, image, and distinction between God's action and human action. Preserve the means and basis of salvation, forgiveness, and other doctrinal statements. Neither add doctrine nor soften historical claims to match contemporary preferences.
- Write idiomatic German suitable for contemporary conservative confessional Lutheran prayer, retaining its biblical and ecclesial register and theological continuity with conservative American confessional Lutheran prayer. Do not import English syntax or turn German into translated devotional prose. Preserve the source's genre: prayer remains prayer, exposition remains exposition.
- Keep older words and senses that a present-day German Bible reader can understand. Formality, rarity in conversation, and unfamiliarity to the model do not establish obsolescence. Words such as *Buße*, *Anfechtung*, *selig*, *Barmherzigkeit*, *Rechtfertigung*, and *Gnadenmittel* need no replacement merely because they sound old.
- Replace only genuinely obsolete words or senses that obstruct understanding, using the smallest demonstrably equivalent expression. If equivalence is doubtful, retain the wording and flag it for review; a clearly separate glossary may explain it. Avoid blanket word substitutions across different contexts.
- Update prose spelling and punctuation only where meaning is unchanged. Retain understandable older grammar and word order. Adjust syntax only as much as comprehension requires, without routine sentence splitting, stylistic smoothing, shortening, or paraphrasing.
- Preserve *du/dein*, invocations, biblical allusions, parallelism, repetition, emotional intensity, and *Amen*. Keep doctrinal terms precise, including Baptism, Word and Sacraments, justification, and Christ's mediation where present. Set capitalization and divine-name typography consistently for the edition.
- Keep inherited biblical quotations and recognizable formulas rather than substituting another translation. Allow only meaning-neutral prose orthography. Preserve historical situations, polemics, and authored notes; distinguish any new editorial explanation visibly from the source.
- **Do not modernize hymns.** Preserve their words, spelling, punctuation, titles, stanza and line divisions, refrains, embedded quotations, sung underlay, and music. Source corrections require separate scan evidence and review. Reflow, navigation, or faithful engraving does not authorize changing sung text or music.

## 1. Freeze the source and scope

Follow applicable repository guidance for historical transcription, structural markup, and builds. Identify the exact printing, requested scope, source files and scans, rights, prior restorations, and existing verification coverage. Keep the historical edition unchanged. Source correction and modernization are separate stages: Luna workers collate unverified text against every assigned scan before it becomes a modernization baseline. OCR agreement or a previous sample review does not certify the source.

Inventory every in-scope prayer or section, heading, paragraph, note, quotation, appendix, register, hymn, and musical asset. Assign stable IDs and source-page spans; distinguish scan numbers from printed folios. Preserve order and hierarchy. Account explicitly for intentional omissions, including historical contents lists replaced by generated contents; models must not discard unfamiliar or apparently secondary material.

Freeze each verified unit and its neighboring context with hashes and provenance. Mark editable prose and protected content before dispatch. Block units with unresolved source gaps instead of guessing; continue independent units. Record source corrections separately from language changes.

## 2. Assign bounded Luna work

Select **`openai/gpt-6-luna`** explicitly through a supported model-selectable agent interface, keeping the main agent's model unchanged. A generic subagent or unsupported model argument does not establish Luna execution. If the interface requires bounded worker threads, use them only where permitted. Workers must have the exact baseline and actual scans in their environment; transfer files and verify hashes when checkouts differ. Report unavailable model selection or evidence rather than silently substituting another model or doing bulk lectoring as the lead.

Assign nonoverlapping semantic units, keeping whole prayers together where practical and supplying read-only neighboring context. Divide long units at paragraph boundaries rather than arbitrary character counts or scan pages. Give each worker the language rules, exact scope and paths, source uncertainties, protected spans, edition style decisions, owned output directory, and one completion route. Workers edit only their assigned outputs, do the work themselves without nested delegation, and leave shared sources, integration, builds, and approval to the lead.

Require candidate text, a unit manifest, and a review record. For each substantive change, record original wording, proposed wording, source locator, contextual meaning, specific comprehension obstacle, and why the replacement preserves meaning. Record source inspection, coverage, notes and boundary continuations, protected-content checks, unresolved issues, model, input/output hashes, policy version, and actual reported usage. Unchanged wording is a valid result; unknown costs remain unknown.

Calibrate on a bounded batch containing an understandable older expression, an obsolete prose expression, a source gap that must block, a protected hymn passage, and a doctrinally sensitive passage. Establish concurrency and budget before substantial generation. Expand to the requested scope after review; a pilot is not completion of a whole-book assignment.

## 3. Review and integrate

The main agent compares every complete candidate unit with its frozen source, reviews every substantive change for necessity and equivalence, and checks omissions or additions even in apparently unchanged passages. Independently inspect source evidence for doubtful readings, meaning-changing source corrections, notes, names, dates, numbers, citations, and assignment boundaries. A worker's assertion that it checked the source is not sufficient evidence.

Verify coverage, order, paragraph and heading structure, note contents and associations, source markers, citations, and exact preservation of protected hymn text and music assets. Counts alone cannot establish fidelity. Return concrete discrepancies to the owning Luna worker and review its corrected candidate. Reject unnecessary edits in favor of the original. Resolve shared vocabulary decisions consistently while recording contextual exceptions.

Keep candidate history and a durable review ledger outside publishable book directories. Bind acceptance to source, context, candidate, policy, and model-configuration hashes; changes invalidate affected reviews. Neither file existence nor an old passed status authorizes reuse. Model agreement does not resolve a theological dispute or count as human approval.

Integrate accepted units into a distinct, self-contained derivative book with clear modernization labeling, provenance, an editorial preface, and a public review record. Retain draft status while approvals are pending. Use the existing `oll-book` and PDF/reader/EPUB/LaTeX ZIP pipeline, supported metadata, unstarred structural headings, and one generated `\tableofcontents`. In combined editions, use volumes as `\part`. Preserve `\quellseite{n}` at retained source boundaries, labels, notes, and numbering; regenerate edition-page references and indexes.

Use `numberedchapters` for sequential Roman chapter numbering. Give each `\chapter` only its title and verify the generated sequence against the source.

Keep final fragments and assets inside the derivative book directory so the source archive builds independently. Keep private evidence, model responses, usage logs, and draft ledgers outside it; non-hidden book files enter downloadable archives. Generation belongs outside publication builds and deployment: approved sources must build without model calls or credentials.

## 4. Validate and finish

- Build PDF, reader, EPUB, and the source ZIP. Check errors, glyphs, fonts, overflow, references, bookmarks, and settled contents/page numbers. Inspect every PDF page's rendered layout, with detail checks for title/imprint, contents, dense notes, long headings, tables, music, and boundaries. Capturing images without inspecting them is not verification.
- Open representative desktop/mobile reader states and EPUB sections. Exercise contents, note links/backlinks, source anchors, internal references, and downloads. Check EPUB ZIP/XML integrity. Extract the source ZIP into an isolated directory and rebuild without the original checkout. Confirm complete assets and no private editorial data. Run applicable tests when changing shared build or reader code.
- Arrange an actual human or available audio-workflow read-aloud check of representative prayers, recording method and findings. Preserve devotional cadence rather than optimizing for conversational speech. Report unavailable inspection honestly.
- Obtain human editorial approval of every modernized unit against its source and change ledger, recording approver, date, and accepted version/hash. Keep unresolved theological or semantic questions and source gaps as blockers; do not invent resolutions to finish. Lead acceptance and human approval are separate.
- Before declaring files printer-ready, establish the printer's current requirements for trim, binding, paper, gutter/safety, bleed, page count, page boxes, fonts, colors, and image resolution. Preflight the actual final interior and required cover. Calculate spine geometry from final pagination and the selected paper/binding; later page-count changes invalidate it. Settle imprint, rights/permissions, attribution, and ISBN/distribution decisions. Do not assume a universal PDF standard or that all components share the historical text's rights.
- Record final filenames, hashes, page count, preflight results, approval status, and outstanding decisions. Complete the applicable electronic/physical proof process and human sign-off before release. A compiled reading proof is not automatically printer-ready, and printer-ready files are not automatically an approved release.

Continue through integration and validation rather than stopping at worker fragments. If source access, inspection, printer requirements, or approvals block completion, deliver the validated draft with the precise remaining work. Report actual delivery state; commit, push, deploy, submit files, or order proofs only with the applicable authorization. Creating or editing this skill does not start book production.
