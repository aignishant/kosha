---
name: day-kosha
description: Write a full day of the Kosha Git/GitHub curriculum — the parts/ sub-documents, the hub, the lab scaffold and the checklist — for a given day number. Use this whenever the user asks to generate, write, draft, produce or continue a day, a lesson, or a part of Project Kosha, including phrasings like "do day 12", "write the next day", "continue the curriculum", or "day 47 please". Also use it when the user asks to rewrite or deepen an existing day.
argument-hint: <day-number>
---

# Write Day $ARGUMENTS of the Kosha plan

> **Read `docs/00_MASTER_PLAN_GITHUB.md` Part 11 before writing a single line.** It is the depth
> contract this skill implements. This skill is the procedure; Part 11 is the standard.
> Then read `CLAUDE.md`. Both bind everything below.

## The four commitments (Part 11.1)

1. **One idea per document.** If it needs "also" to introduce its second half, it is two documents.
2. **No clocks.** Never write a time estimate, a duration, a "should take ~2 hours", or a pace — not
   in frontmatter, not in prose, not in the checklist, not in the map table. **Never trim an
   explanation because the day is getting long; split it into another part instead.**
3. **Zero to production, in one document.** Open where a reader who has never heard of the idea can
   stand. End where a professional stands: the real-system version, what breaks at scale, what a
   senior reviewer says, what an interviewer probes.
4. **Every dangerous idea carries its undo.** A part rated `caution` or `destructive` without a
   tested §10 is not written.

---

## Step 1 — gather

1. Read the plan: **Part 1** (principles), **Part 5** (phase map), **Part 6** (the day map — find the
   row for Day $ARGUMENTS), **Part 7** (the `kind` for this day, which decides how it splits), and
   **Part 11** (the depth contract). Collect the day's title, every ID, its phase, its `kind`, and the
   gate its phase feeds.
2. Read `docs/TRACKER.md` for what is already written.
3. Read the two or three days on either side in `days/`. You need them for continuity of voice, and
   to know which ideas have already been introduced and can be **linked rather than re-explained**.
4. If the previous day's `CHECKLIST.md` has unticked boxes, warn the user and ask before proceeding.
5. **Fetch live documentation for anything platform-facing.** Any GitHub web interface path, API
   shape, platform limit, quota, pricing statement or `gh` flag must come from a fetch today, not
   from memory (Principle 11). Record the URLs; they go in the hub's §8 and the parts' `verified:`
   field. If a fetch fails, say so and mark the affected line `TODO(verify)` — do not guess.
6. **Check reality against the plan.** If GitHub has renamed the feature, moved the setting, or
   changed the limit since the plan was written, **STOP** (Principle 17) and use `/plan-amend`
   instead of quietly adapting.

## Step 2 — plan the split, before writing any prose

7. List the day's subtopics. Group them into **sections** that share one mental model — usually one
   section per ID, per stage of a pipeline, or per phase of a mechanism. State the grouping out loud;
   unexplained numbering is a bug. **Name each section now, twice**: the heading that goes in the
   hub's §2, and the one- or two-word `<section-slug>` that goes in the folder name (step 13). If you
   cannot name a section in two words, it is probably two sections.
8. Split by **idea boundaries, never by length or pace.** There is no target part count. Five parts if
   the subject needs five, nineteen if it needs nineteen. Use the `kind` from Part 7:
   - `setup` → one part per tool or configuration file, each ending in a command that proves it
   - `concept` → one claim per part, diagram-heavy
   - `lab` → mechanism → behaviour → edge case → failure mode → production use
   - `drill` → one part per scenario class, ending in reps the learner does
   - `incident` → what you see · what actually happened · triage · the fix · the prevention · the note
   - `gate` → one part per acceptance criterion, no new teaching, every part links back
9. Assign each part a **`level`** (`foundation` · `working` · `production`). The day should climb. A
   day that is all `foundation` is a tutorial; a day that opens at `production` has skipped the reader.
10. Assign each part a **`danger`** (`safe` · `caution` · `destructive`) and a **`sandbox`**
    (`required` · `optional` · `none`). Anything above `safe` needs `sandbox: required` and a §10.
11. Apply the five tests of Part 11.5 to each planned part **before writing**: one-idea, standalone,
    no-shortcut, undo, currency.
12. **Print the planned part list to the user before writing**, as a table: number · title · level ·
    danger · the one question it answers — grouped under each section's `NN-<section-slug>` folder
    name, so the user can veto a bad slug before it is baked into a hundred links. If it looks thin, they will say so. Wait for the go-ahead
    on days of ten or more parts.

## Step 3 — write the parts

Path: `days/day-NN-<slug>/parts/<NN>-<section-slug>/<section>.<sub>-<kebab-slug>.md`

13. **One folder per section, named `NN-<section-slug>`** — two zero-padded digits, a hyphen, then a
    **one- or two-word** slug saying what that section is about: `parts/01-install/`,
    `parts/04-auth/`, `parts/02-quoting/`. **Never a bare `parts/01/`** — `./k depth` fails on it.
    The point is that `ls days/day-NN-*/parts/` reads as a table of contents: someone scanning the
    repository should see the shape of the day without opening the hub. Choose the slug when you
    choose the section in step 7, from the same words as the section heading you will give it in the
    hub's §2 — the section's subject in the fewest words that stay unambiguous inside that day, never
    its position (`03-refspecs`, not `03-section-three`). Every part lives inside its section's
    folder; none is ever loose in `parts/`; the folder's leading number must match the number before
    the dot in the filename.
14. One file per subtopic, `<section>.<subtopic>-<kebab-slug>.md`. The slug says what the part
    *teaches*, never where it sits. Numbering starts at 1, no gaps.
15. **Links are relative to the part's own folder**: sibling `1.2-<slug>.md`; another section
    `../01-<section-slug>/1.5-<slug>.md`; the hub `../../LESSON.md`. `prev` and `next` use the same
    form. A section folder's name is load-bearing: if you rename one, rewrite every reference to it
    in the same change — the hub's §2, cross-section links, `prerequisites:`, `docs/GLOSSARY.md`.
16. Every part carries all twelve sections of Part 11.4, in this order:

  - **frontmatter** — `day`, `part`, `title`, `ids`, `level`, `danger`, `sandbox`, `prerequisites`,
    `prev`, `next`, `verified`. **No duration field of any kind.**
  - **One-line answer** — the claim in one sentence, before anything else.
  - **The story** — a concrete scene: a person, a machine, a failure, a decision. **No jargon, no
    command names, no code.** "Imagine you are working on a project" is not a story; a named
    developer at 23:40 with a broken release is.
  - **The idea in plain language** — zero prior knowledge, every term defined on first use including
    terms from earlier days, each with a link to the part that introduced it. No code.
  - **Why the build needs it** — the concrete later day or `nudge` operation that breaks without this.
  - **The mechanism** — how it actually works. Runnable commands with **real pasted output**, the
    `.git` files inspected where relevant, the derivation shown. Nothing skipped as obvious. A Mermaid
    diagram is required where the concept is spatial, sequential, or a state machine.
  - **Line by line** — a `**Line by line:**` list **immediately after each command block**: every
    non-obvious token and flag, and *why that one and not the alternative*.
  - **The same thing, three ways** — a table with a row each for the terminal, github.com and `gh`,
    plus one sentence naming which a professional reaches for and why. Where a surface cannot do it,
    say so and explain the reason. This section is what makes this a GitHub course.
  - **When it breaks** — the **real** error text verbatim in a fenced block, what it means, the
    smallest fix. At least one failure; usually three.
  - **How to undo it** — required when `danger` is `caution` or `destructive`. The exact recovery,
    tested, **including the case where the reader has already pushed.**
  - **In production** — what a professional writes instead of the teaching version; what degrades at
    a hundred thousand commits or four hundred contributors; the review comment a senior engineer
    leaves; the minute, storage or rate-limit cost if there is one; the interview question that finds
    out whether the reader has actually done it. **Not optional.**
  - **Check yourself** — one command whose output the reader can predict before running it, and one
    question to answer out loud.

17. **Never invent terminal output, SHAs, timings or error text.** Run it in `sandbox/`, paste what it
    printed, elide with `…` and say what you elided. If you cannot run it, mark `TODO(verify)`.
18. Each part must pass the **standalone test**: readable cold, with its prerequisite named and linked.

## Step 4 — write the hub (`days/day-NN-<slug>/LESSON.md`)

19. The hub orients and assembles; **it never teaches**. No `Line by line:` in the hub. Required
    sections in order (Part 11.3):
  - YAML frontmatter (`day`, `phase`, `phase_name`, `title`, `ids`, `principles`, `kind`,
    `plan_version: "v1.2.0"`, `parts`, `sandbox`, `generated`, `verified`, `status`, `commit`)
  - a yesterday / today / tomorrow blockquote — **no time estimate**
  - `## §1 The story` — a scene and an analogy. Plain language, no code, no command names, no jargon.
  - `## §2 The map` — a table of every part: number, linked title
    (`parts/01-<section-slug>/1.1-<slug>.md`), what it answers, `level`, `danger` — grouped by
    section under a `### Section NN-<section-slug> — <heading>` line, with one line saying what each
    *section* means. The heading and the folder slug must agree; if they have drifted, one of them
    is wrong.
    **No minutes column, ever.**
  - `## §3 Setup — run this` — every `./k sandbox`, `mkdir`, `git init`, `gh repo create` the day needs.
  - `## §4 The build brief` — what changes in `nudge` or the sandbox today, with `TODO(me)` markers.
  - `## §5 The proof that can fail` — the command, check or workflow run that is RED before today's
    work and GREEN after. Every day has one.
  - `## §6 Blast radius` — what today's commands can destroy, which repository they may touch, the
    one-line recovery, and an explicit list of the `destructive` parts.
  - `## §7 Traps` — the mistakes that eat an evening.
  - `## §8 Verify before you click` — live documentation URLs, actually fetched today, with the date.
  - `## §9 Say it in an interview` — one paragraph, spoken voice.
  - `## §10 Done when` — pointer to `CHECKLIST.md`; defined by understanding and green proofs, never
    by elapsed time.

## Step 5 — the checklist (`CHECKLIST.md`)

20. Setup boxes · **one box per part document** (read it, run its check-yourself command, answer its
    out-loud question) · build-brief boxes · a proof box **including at least one "break it, watch it
    fail, fix it"** · a blast-radius box for every `destructive` part (rehearsed in the sandbox,
    recovered from) · the commit box. **No time estimates.**

## Step 6 — verify

21. Run `./k depth $ARGUMENTS`. Fix every failure; never hand-wave past one.
22. Run every command in the day, in `sandbox/`, and confirm the pasted output matches.
23. Run `./k tracker`.
24. Finish by printing: the day's IDs, the part count, the level spread, every `destructive` part, the
    sandbox recipe the day needs, and the documentation URLs verified today.

## Always

- Honour `CLAUDE.md`.
- **Do not solve the `TODO(me)` sections.** Teach; don't do the reps.
- Never run a destructive command outside `sandbox/` without saying what it will do and getting a yes.
- Never name a person, instructor, author, channel, academy or training company. Tool and product
  names are fine.
- The failures this format exists to prevent (Part 11.8): splitting without deepening · summary in
  place of explanation · **stopping at the toy example** · assuming the previous day · a command
  without its failure · trimming to fit · solved reps · **teaching the button instead of the
  operation.** A part with no story, no real error text, no undo and no production section is not
  done, however long it is.
