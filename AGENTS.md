# Agent protocol

## Commands

- Build: `make` (or `latexmk -pdf resume.tex`)
- Clean: `make clean`
- Test: `make test` (lint, then compile every `resume*.tex`)
- Lint: `python3 scripts/lint_knowledge.py --strict`
- Linter version / pin: `python3 scripts/lint_knowledge.py --version --format json`

There is no install step beyond a TeX Live + `latexmk` environment. Do not add a package manager for this repo.

## Hard rules

- Do not add a dependency, a second resume class/template, or a new tool-specific rulebook without an explicit ask.
- Do not commit secrets, credentials, or `.env` values.
- Minimal diffs. Touch only what the task requires.
- For work that will edit more than two files, write `PLAN.md` first (gitignored).
- Run `make lint` before calling docs/protocol work done. Run `make test` before calling a resume or style change done (skip the PDF step only if `latexmk` is unavailable, and say so).
- Do not silently flip a draft decision to accepted.
- Do not rewrite a published git tag. Same-day second freeze is `YYYY.MM.DD.N`.
- Generated PDFs are Level 3. Do not hand-edit them; do not commit `*.pdf`.

## Authority

- Level 0 (not facts): `PLAN.md`, chat
- Level 2 (constraints): accepted files in `docs/decisions/`
- Level 3 (prefer over prose): CI-built PDFs and GitHub Release assets
- Level 4 (do not edit unless asked): this file, `LICENSE` if it exists

## Write permissions

- `PLAN.md`: write.
- Proposed decisions: create; leave `proposed`.
- Accepted decisions, `docs/now.md`, this file: propose a patch. Do not apply silently.
- Generated PDFs: never hand-edit.
- `Status: proposed` → `accepted`: a named human only. On a PR, add the `human-accepted` label.
- Do not delete an accepted or superseded decision; supersede it. On a PR, add the `human-removed` label.

## Where to read

| Need | File |
|---|---|
| What this is | README.md |
| How to operate | AGENTS.md |
| Why a choice was made | docs/decisions/ |
| Canonical resume content | resume.tex |
| Shared style | resume.sty |
| Local / CI build | Makefile, .github/workflows/build.yml |

## After you finish

Propose, do not silently apply: a decision draft if you chose something, a one-line history note if git will not explain it.
