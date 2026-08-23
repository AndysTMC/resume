---
type: decision
---

# 0003. Published release assets should be immutable

Status: proposed
Date: 2026-08-24
Deciders: —
Supersedes: —
Superseded-by: —

## Context

Decision 0002 makes published date tags immutable but allows a rerun on the
same tag to replace its PDF assets with `gh release upload --clobber`. Because
the CI runner, TeX distribution, and dependencies can change, the replacement
may not be the same bytes or rendering that was originally sent.

## Options

1. Keep replacing assets when a tagged workflow is rerun
2. Skip upload when the release asset already exists
3. Fail when a release or dated asset already exists

## Proposed decision

After a dated release asset is published, CI must not replace it. A tagged run
must fail with a clear message if the release or any target asset already
exists. Correcting a bad freeze requires a new date tag (or the next `.N` tag),
which preserves the original record.

If accepted, this decision supplements 0002 by strengthening its release-asset
rule. Decision 0002 remains authoritative for date-tag naming and freezing.
The workflow's `--clobber` behavior should change only after human acceptance.

## Assumptions

- [A1] Preserving what was sent matters more than making tag reruns convenient
- [A2] A mistaken release can remain as historical evidence and be replaced by
  a new tag

## Consequences

Rerunning a successfully published tag will fail at the release step. Build
artifacts remain reproducible drafts, while a release asset becomes a durable
record rather than a mutable deployment target.

## Revisit if

GitHub adds enforceably immutable release assets or the repository adopts a
separate signed archive with stronger provenance guarantees.
