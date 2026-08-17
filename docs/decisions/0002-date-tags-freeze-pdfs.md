---
type: decision
---

# 0002. We will freeze sent PDFs with immutable YYYY.MM.DD tags

Status: accepted
Date: 2026-08-17
Deciders: Thatikonda Mukesh
Supersedes: —
Superseded-by: —

## Context

A resume is not a library. Semver does not describe “what I sent.” We still need to rebuild the exact PDF that was frozen.

## Options

1. Semver tags (`v1.2.0`)
2. Commit PDFs on `main` as the only history
3. Date tags plus GitHub Releases; working-copy PDFs stay as CI artifacts

## Decision

Every push/PR builds **latest** for that branch and uploads `resume*.pdf` as a workflow artifact. A GitHub Release exists only when a tag matching `YYYY.MM.DD` or `YYYY.MM.DD.N` is pushed. The release asset is the dated file (`resume-2026.08.17.pdf`). Published tags are never moved. A second freeze on the same day is a new tag (`2026.08.17.2`). PDFs are not committed.

The repo is public, including contact details already in the source.

## Assumptions

- [A1] GitHub Releases are a durable enough store for sent PDFs (revisit if we need a private application log)
- [A2] Workflow artifacts are enough for untagged drafts (they expire)

## Consequences

README points at Latest release. Re-running CI on the same tag may replace the asset for that tag; it must not point the tag at a different commit.

## Revisit if

We need a private record of where a given tag was sent, or artifacts expire before a draft is frozen.
