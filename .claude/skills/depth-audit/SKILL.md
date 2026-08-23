---
name: depth-audit
description: Audit an already-written day of the Kosha curriculum against the plan's Part 11 depth contract, and report every violation with the fix. Use this whenever the user asks to check, audit, review, grade, deepen or "is this good enough" about a day, a lesson or a part of Project Kosha, and whenever ./k depth reports a failure the user wants explained. Also use it before closing a day.
argument-hint: <day-number>
---

# Audit Day $ARGUMENTS against the depth contract

`./k depth` catches the mechanical half — missing sections, numbering gaps, clock words, a hub that
teaches. **This skill catches the half a script cannot see.** Read `docs/00_MASTER_PLAN_GITHUB.md`
Part 11 first, then read every file in `days/day-NN-*/`.

Report as a table: file · severity (`blocker` · `fix` · `note`) · what is wrong · the concrete fix.
**Do not rewrite anything until the user has seen the table.**

## 1 — Mechanical (run `./k depth NN` first, then confirm by eye)

- [ ] `parts/` exists; every part is inside a section folder; the folder's leading number matches
      the number before the dot in the filename
- [ ] Every section folder is `NN-<section-slug>` — never a bare `parts/01/` — and the slug is one or
      two words naming the section's *subject*, not its position
- [ ] Each section folder's slug agrees with the section heading in the hub's §2; a slug that has
      drifted from its heading is a `fix`, not a `note`
- [ ] Numbering starts at 1 with no gaps in any section
- [ ] Every part has all twelve sections of Part 11.4, in order
- [ ] Every part frontmatter has `level`, `danger`, `sandbox`, `prerequisites`, `prev`, `next`,
      `verified` — and **no duration field**
- [ ] Every `caution` / `destructive` part has a **How to undo it** section
- [ ] Every relative link resolves
- [ ] The hub has all ten sections and **no `Line by line:`**
- [ ] `CHECKLIST.md` has one box per part
- [ ] No clock words anywhere: minutes, hours, "should take", "quick", "in about", pace, duration

## 2 — The five tests (Part 11.5), applied per part

- **One-idea** — does the part need "also" to introduce its second half? Split it.
- **Standalone** — could someone arriving from a search engine read it cold? Name and link the
  prerequisite.
- **No-shortcut** — any "for now, just accept that" without a forward link? Give the deferral an
  address.
- **Undo** — does it teach something destructive without a tested recovery? Blocker.
- **Currency** — does it describe a web interface, a limit or a price without a `verified:` date and a
  live URL in the hub's §8? Blocker.

## 3 — The eight failures (Part 11.8) — the ones only a reader catches

For each, quote the offending line and name the fix.

1. **Split without deepening** — four short pages that together say what one short page said. Look for
   parts with no story, or a story that is one sentence of scene-setting.
2. **Summary in place of explanation** — "rebase replays commits onto a new base" with no SHAs shown
   before and after, no `.git` inspection, no diagram.
3. **Stopping at the toy example** — three commits and two branches, and the part ends. Does §11 say
   what happens at a hundred thousand commits, or with four hundred contributors, or under a merge
   queue?
4. **Assuming the previous day** — an undefined term. Check each piece of jargon is either defined here
   or linked to the part that defined it.
5. **A command without its failure** — is there real, verbatim error text in §9? Paraphrased error
   messages are a blocker, because the reader searches for the string.
6. **Trimmed to fit** — an explanation that stops mid-mechanism, or a "we'll cover this later" with no
   day number.
7. **Solved reps** — a `TODO(me)` that has an answer next to it.
8. **Teaching the button instead of the operation** — "click Settings → Branches" without first saying
   what the setting *does*. Menu paths age in weeks.

## 4 — Kosha-specific

- [ ] **§8 The same thing, three ways** is present in every part and genuinely three-way. A table with
      "N/A" in two cells and no explanation is a fix, not a pass.
- [ ] **Invented output.** Scan every pasted terminal block: do the SHAs look plausible and
      *consistent across the day*? Does a `git log` output match the commits the day actually created?
      Fabricated output is the worst failure in this repository — flag anything you cannot verify by
      re-running it in `sandbox/`, and re-run what you can.
- [ ] **Level spread.** Does the day climb from `foundation` to at least `working`? All-`foundation`
      is a tutorial; opening at `production` skipped the reader.
- [ ] **Blast radius.** Does the hub's §6 list every `destructive` part by number?
- [ ] **Language drift.** Is the day teaching Python, YAML or shell scripting where it should be
      teaching Git or GitHub? Quote the drift.
- [ ] **Diagrams.** Every commit-graph, three-trees, refspec-flow, merge-topology or event-flow idea
      has a Mermaid diagram, not a paragraph pretending to be one.

## 5 — Report and repair

Print the table. Then ask which severity level to fix. Fix `blocker` items first, re-run
`./k depth NN`, and re-run every command you changed in `sandbox/` before pasting new output.
