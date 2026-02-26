# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a bachelor thesis repository for SPbPU (Saint Petersburg Polytechnic University) using a LaTeX template. The thesis is written in Russian and follows SPbPU formatting standards.

**Main thesis file**: `thesis.tex` - This is the root document that includes all packages, settings, and chapter content.

**Current topic**: "Система автоматической бесшовной ротации криптографических ключей авторизации в высоконагруженной микросервисной платформе (на примере ООО «Майндбокс»)" (A system for automatic seamless rotation of authorization cryptographic keys in a high-load microservice platform, a case study of Mindbox LLC)

## Build Commands

### Build PDF
```bash
make pdf
```
This runs a complete build cycle:
1. First pdflatex pass
2. biber for bibliography processing
3. Second pdflatex pass (includes citations)
4. Third pdflatex pass (resolves all references)

Output: `build/thesis.pdf`

### Note on Build Process
The LaTeX compilation requires **3 passes** to properly resolve all cross-references, citations, and table of contents. The Makefile handles this automatically with the `-interaction=nonstopmode` flag to continue on warnings.

## Project Structure

### Core Files
- **thesis.tex** - Main document that orchestrates the entire thesis
- **application.tex** - Standalone application form for thesis topic/advisor approval
- **Makefile** - Build automation

### Content Organization
All thesis content is in `chapters/` directory with numbered files following the document order:
- `001_title.tex` - Title page
- `002_task.tex` - Assignment/task description (currently commented out in thesis.tex)
- `003_summary.tex` - Abstract/summary (currently commented out)
- `004_contents.tex` - Table of contents
- `005_introduction.tex` - Introduction
- `006_chapter1.tex` through `009_chapter4.tex` - Main chapters (currently commented out)
- `010_conclusion.tex` - Conclusion (currently commented out)
- `011_acronyms.tex` - List of abbreviations (optional, commented out)
- `012_dictionary.tex` - Terminology dictionary (optional, commented out)
- `013_references.bib` - Bibliography database in BibLaTeX format
- `013_references.tex` - Bibliography formatting
- `014_appendix1.tex`, `015_appendix2.tex` - Appendices (commented out)

### Configuration Files
- **chapters/common_settings.tex** - Author-defined packages, commands, and custom environments
- **template_settings/common/renames.tex** - **CRITICAL**: Contains all personal information, dates, thesis title, keywords, and abstracts. Edit this file to update author info, supervisor, thesis title, defense dates, etc.

### Template Architecture
The `template_settings/` directory contains the SPbPU thesis template infrastructure:
- `ch_preamble.tex` - Loads all template components in specific order
- `common/` - Shared packages, styles, and setup across document types
- `Dissertation/` - SPbPU-specific thesis packages and styling
- `biblio/` - Bibliography configuration for BibLaTeX

**Important**: The template uses the memoir document class with 14pt font and follows SPbPU GOST formatting standards.

## Working with Content

### Activating Chapters
Chapters are included in `thesis.tex` by uncommenting their `\input{}` lines. Currently only title, contents, and introduction are active. Main chapters use the `\ContinueChapterBegin` and `\ContinueChapterEnd` wrapper for proper formatting.

### Bibliography
- Add references to `chapters/013_references.bib` in BibLaTeX format
- Bibliography is loaded in `common_settings.tex` via `\addbibresource{chapters/013_references.bib}`
- Use standard BibLaTeX citation commands: `\cite{}`, `\textcite{}`, `\parencite{}`, etc.

### Custom Commands
- Reference figures: `\firef{label}` produces "рис.X"
- Reference tables: `\taref{label}` produces "табл.X"
- Custom math/theorem environments are defined in `common_settings.tex`

## GitHub Actions

The repository has automated PDF building via `.github/workflows/build-latex.yml`:
- **On PR**: Builds PDF and posts download link as PR comment
- **On master merge**: Creates a release with PDF artifact (version: YYYY.MM.DD-HHMMSS)

## Development Tools

### Spell Checking
- Configured for bilingual (Russian/English) in `cspell.json`
- Custom words for LaTeX commands and domain terminology in the `words` array

### Linting
- `.lintignore` - Lists files excluded from ChkTeX/TeXtidote checks
- `.chktexrc` - ChkTeX configuration (LaTeX linter)
- Template files and settings are typically ignored; main chapters are linted

## Important Notes

1. **Personal Information**: All author/supervisor data, thesis title, dates, keywords, and abstracts are in `template_settings/common/renames.tex` - not scattered across files

2. **Commented Sections**: Most content chapters are currently commented out in `thesis.tex`. This appears to be work-in-progress with active development on the introduction.

3. **Build Directory**: The `build/` directory contains all compilation artifacts. Git-ignored, created automatically by the build process.

4. **Branch Strategy**:
   - Main branch: `master`
   - Current working branch: `nrw-final-assignment`
   - PRs should target `master`

5. **Supporting Materials**:
   - `guides/` - Instructions from template and НИР (research work)
   - `nrw/` - НИР (research work) artifacts
   - `refs/` - PDF source materials

6. **Document Type**: Set by `\setcounter{docType}{1}` in thesis.tex (1 = thesis, other values for practice reports)
