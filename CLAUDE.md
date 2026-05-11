# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Bachelor thesis repository for SPbPU (Saint Petersburg Polytechnic University), written in Russian on the SPbPU LaTeX template (memoir class, 14pt, GOST formatting).

**Topic**: «Система автоматической бесшовной ротации криптографических ключей авторизации в высоконагруженной микросервисной платформе (на примере ООО „Майндбокс"»).

## Build Commands

```bash
make pdf          # Full thesis: 3× pdflatex + biber, output to build/thesis.pdf, then copied to ./thesis.pdf
make application  # application.tex (topic/advisor approval form)
make task         # task.tex
make diagrams     # Compile diagrams/mmd/*.mmd (mermaid → PNG) and diagrams/puml/*.puml (plantuml → PNG into diagrams/img)
make refs         # Extract text from refs/pdf/*.pdf via pdftotext into refs/text/
```

LaTeX needs 3 pdflatex passes to resolve TOC, cross-refs, and citations. `make pdf` runs them with `-interaction=nonstopmode` and biber in between. The final PDF is copied to the project root for convenience; `/thesis.pdf` is gitignored.

## Architecture

### Document entry point
`thesis.tex` is the root. It loads `template_settings/ch_preamble` → sets `docType=1` (thesis) → loads `chapters/common_settings` → `template_settings/common/renames` → then `\input{...}`s each chapter file in `chapters/` in numbered order.

To activate/deactivate sections, comment/uncomment `\input{...}` lines in `thesis.tex`. Some long chapters are wrapped with `\ContinueChapterBegin` / `\ContinueChapterEnd` for proper section continuation.

### Where to edit what
- **Personal data, title, supervisor, dates, keywords, abstracts** — `template_settings/common/renames.tex` (single source of truth, not scattered across files).
- **Author-level packages, macros, custom environments** — `chapters/common_settings.tex`. Bibliography resource is registered here via `\addbibresource{chapters/013_references.bib}`.
- **Template internals** — `template_settings/` (avoid editing): `ch_preamble.tex` orchestrates loading; `common/` is shared; `Dissertation/` is SPbPU-specific styling; `biblio/` is BibLaTeX config.
- **Chapter content** — `chapters/NNN_*.tex`, numbered to match document order.
- **Bibliography** — add entries to `chapters/013_references.bib` (BibLaTeX). Use `\cite{}`, `\textcite{}`, `\parencite{}`.

### Custom commands
- `\firef{label}` → "рис.X"
- `\taref{label}` → "табл.X"
- Additional math/theorem environments defined in `chapters/common_settings.tex`.

### Diagrams
Sources live in `diagrams/mmd/` (Mermaid) and `diagrams/puml/` (PlantUML); generated PNGs go to `diagrams/img/` and are what the .tex files include. Regenerate with `make diagrams` (requires `mmdc` and `plantuml` installed).

## CI

`.github/workflows/build-latex.yml`:
- **On PR**: builds PDF, uploads as draft-release asset, posts/updates a comment with download link.
- **On push to master**: builds PDF and creates a versioned GitHub Release (`vYYYY.MM.DD-HHMMSS`).

No linting or spell-check workflows — they were removed as no longer useful.

## Notes

- **Build directory**: `build/` holds all LaTeX intermediates; gitignored, created on demand.
- **Document type**: `\setcounter{docType}{1}` in `thesis.tex` selects thesis mode; other values switch to practice-report layouts in the template.
- **Supporting material** (not part of the compiled doc): `guides/` (template/НИР instructions), `refs/` (PDF source materials and extracted text), `conference/`, `workspace/`.
- **Branches**: PRs target `master`.
