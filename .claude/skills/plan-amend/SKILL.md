---
name: plan-amend
description: Propose a versioned amendment to the Kosha master plan when reality has changed — GitHub renamed or moved a feature, a limit or price changed, a Git release changed a default, or a day turned out to need splitting. Use this whenever writing a day hits a conflict with the plan, whenever the user says a lesson is wrong or out of date, and whenever a live documentation fetch contradicts what the plan says. Never silently adapt a lesson instead.
argument-hint: <what changed>
---

# Amend the plan: $ARGUMENTS

Principle 17: **if reality has changed, stop.** A repository that quietly adapts one lesson to a moved
menu ends up disagreeing with itself across phases, which is worse than one that is briefly out of
date and says so.

## The procedure

1. **Stop writing the day.** Do not adapt the text first and log it afterwards.
2. **Establish the evidence.** Fetch the live documentation today. Quote the URL and the date. If two
   sources disagree, say so, and prefer the official documentation over any other page.
3. **State the delta precisely** — what the plan says, what is now true, and which of the two is the
   observable behaviour versus the naming.
4. **Assess the blast radius.** Which days in Part 6 are affected? Which IDs move, split, merge or
   die? Which already-written days now contain something false? Search `days/` for the old name.
5. **Classify the change:**

   | Class | Example | Version bump |
   |---|---|---|
   | Editorial | A menu path moved; the setting is the same | patch — `v1.0.x` |
   | Substantive | A feature was renamed, a limit changed, a flag deprecated | minor — `v1.x.0` |
   | Structural | A day splits, an ID moves phase, Part 11 changes | major — `vx.0.0` |

6. **Write the proposal** — do not apply it yet. Show the user: the class, the new version number, the
   exact edits to Parts 1/5/6/11, the list of written days that need revisiting, and the
   `docs/CHANGELOG_PLAN.md` entry.
7. **Wait for a human to accept it.** Structural changes are never applied unasked.
8. **On acceptance:** edit the plan, bump the version in the plan header *and* in `CLAUDE.md`, prepend
   the changelog entry, update `docs/CURRICULUM_INDEX.md`, then run `./k tracker`. Re-open every
   affected written day and mark it `status: needs-revision` in its hub frontmatter — **do not
   silently rewrite days the user has already worked through.**

## The changelog entry

```markdown
## v1.1.0 — 2026-08-23

**Substantive.** <what changed, in one sentence>

- **Evidence:** <live docs URL>, fetched 2026-08-23
- **Was:** <what the plan said>
- **Now:** <what is true>
- **Days affected:** 143, 144, 152 — Day 144's title changes; Day 143 gains a part on the
  interaction between the two systems
- **IDs affected:** H-PR-08 rescoped; no IDs added or removed
- **Written days marked `needs-revision`:** none
```

Newest first. Never edit a previous entry; supersede it with a new one.
