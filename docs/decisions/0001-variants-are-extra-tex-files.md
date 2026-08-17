---
type: decision
---

# 0001. We will add targeted resume variants as extra .tex files, not branches

Status: accepted
Date: 2026-08-17
Deciders: Thatikonda Mukesh
Supersedes: —
Superseded-by: —

## Context

The repo starts with one custom article-class resume. Different jobs may later need different cuts (for example support vs software). Branch-per-variant is a common first idea and usually drifts.

## Options

1. One branch per variant
2. One `.tex` file only; copy later if needed
3. Extra `resume-*.tex` files sharing `resume.sty`

## Decision

Keep one canonical `resume.tex` on `main`. Extract shared preamble into `resume.sty`. When a real job needs a different cut, add another root file (`resume-support.tex`, etc.) that uses the same style. Git branches stay for work (fixes, layout), not for audience variants.

## Assumptions

- [A1] Variants will stay few (revisit if we need many generated cuts from one data file)
- [A2] Style stays shared (revisit if a variant needs a different layout class)

## Consequences

CI can compile `resume*.tex` with one glob. Content can still diverge between files; that is acceptable for a handful of targeted PDFs.

## Revisit if

A third variant appears and most bullets are being copied by hand, or a YAML/JSON content layer starts to look cheaper.
