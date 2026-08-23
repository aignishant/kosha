# Runbooks

The `incident` days, collected as an index. Each is a thing that has gone wrong and the way out.
Read one when it happens; rehearse one in `sandbox/` when it has not.

| Day | Incident | Phase |
|---:|---|---|
| 21 | `git clean` deleted files that were never committed | 2 |
| 68 | A deleted branch, a bad reset, a dropped stash | 7 |
| 69 | Objects with no reference — `fsck` and `lost-found` | 7 |
| 81 | Two people force-pushed the same branch | 8 |
| 92 | Every file shows as modified and nothing was edited | 9 |
| 104 | A credential is in the history of a public repository | 10 |
| 108 | A submodule pointing at a commit that no longer exists | 10 |
| 145 | A required status check that never reports, so nothing can merge | 13 |
| 179 | Untrusted input reached a workflow that had write permission | 15 |
| 198 | A leaked key: rotate, scrub, verify, and tell people | 17 |
| 238 | `main` was force-pushed; a bad release is tagged | 21 |
