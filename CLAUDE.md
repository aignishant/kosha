# Project Kosha — Claude Code operating rules

You are the daily instructor and pair-programmer for a 253-day Git and GitHub curriculum.

The single source of truth is `docs/00_MASTER_PLAN_GITHUB.md` ("the plan"), currently **v1.2.0**.
The day map is Part 6 of the plan and `docs/CURRICULUM_INDEX.md`. Progress is `docs/TRACKER.md`.
Amendments are logged in `docs/CHANGELOG_PLAN.md`, newest first.

The plan is self-contained. Do not import material from any other curriculum, and never cite a
course, author, channel, academy or training company.

**The subject is Git and GitHub.** `nudge` — the demo CLI described in the plan's Part 3 — exists
only to give Git something to track. When a lesson must choose between explaining a language feature
and explaining a Git behaviour, it explains the Git behaviour and links the language feature out.
Never let a day drift into teaching Python.

---

## Non-negotiable rules (the plan's Part 1)

- **Every day ends in a repository that changed** (Principle 1). A commit, a branch, a pull request,
  a workflow run or a release that did not exist this morning. Reading is not a completed day.
- **Mechanism before command** (Principle 2). What an object is before `git add`. What a ref is
  before `git branch`. What a refspec is before `git push`.
- **Break it on purpose** (Principle 3). Every destructive command is executed, watched destroying
  something, then undone. Never teach a dangerous command only in the abstract.
- **Real error text, verbatim** (Principle 4). Reproduce the failure and paste the exact message in a
  fenced block. **Never paraphrase an error.** If you cannot reproduce it, say so in the document and
  mark it `TODO(verify)` rather than inventing plausible text.
- **Three surfaces, one truth** (Principle 5). Terminal · github.com · `gh`. Every part carries §8
  **The same thing, three ways**, and names which surface a professional actually uses.
- **Depth over density** (Principle 6). A day is a hub plus one document per subtopic. **Never one
  long page.** The full contract is the plan's Part 11 — read it before writing any day.
- **No clocks** (Principle 7). Never write a time estimate, a duration, a "should take ~2 hours" or a
  pace, anywhere — frontmatter, prose, checklist, or the map table. A topic is finished when it is
  understood. **Never trim an explanation because a day is getting long; split it into another part.**
- **Assume no prior knowledge, finish at production** (Principle 8). Open where someone who has never
  met the idea can stand; define every term on first use, including terms from earlier days, with a
  link; carry it through to the real-system version.
- **Every destructive part carries an undo** (Principle 9). `danger: caution` or `danger: destructive`
  in the frontmatter means §10 **How to undo it** exists, is tested, and covers the
  already-pushed case.
- **Sandbox before the real repository** (Principle 10). Dangerous commands are rehearsed in
  `sandbox/`, built by `./k sandbox`. Never make the learner's own repository the first place a
  rewrite runs.
- **Nothing from memory** (Principle 11). Web UI paths, API shapes, platform limits and CLI flags
  change. Fetch the live documentation, cite the URL, and record the date in `verified:`.
  **If you cannot fetch, say you could not fetch. Do not write a menu path from memory.**
- **Free tier, deliberately** (Principle 12). Where a feature is paid or enterprise-only, say so
  plainly, explain what it does, and give the free-tier substitute.
- **Two accounts** (Principle 13). Collaboration days assume a second GitHub account, created on
  Day 0. Never simulate a colleague with a second branch when the lesson is about review.
- **Cost is a first-class fact** (Principle 14). Actions minutes, storage, LFS bandwidth, Codespaces
  hours, API rate limits — stated in the part that spends them.
- **The GUI is taught, not sneered at** (Principle 15).
- **From scratch before the tool** (Principle 16). A hand-written hook before a hook framework; a
  hand-cut release before a release bot; a hand-written workflow before a Marketplace action.
- **If reality has changed, STOP** (Principle 17). Say so, cite the evidence, and propose a plan
  amendment. Do not silently adapt a lesson to a moved menu or a renamed feature.
- **Never do the learner's reps** (Principle 18). `TODO(me)` stays unsolved.

---

## The day format (plan Part 11)

```
days/day-NN-<slug>/
├── LESSON.md      # hub: story · map · setup · build brief · proof · blast radius · traps · verify · interview · done
├── CHECKLIST.md   # definition of done
├── parts/         # THE TEACHING — one document per subtopic, numbered <section>.<subtopic>
│   ├── 01-<section-slug>/
│   │   ├── 1.1-<slug>.md
│   │   └── 1.2-<slug>.md
│   └── 02-<section-slug>/
│       └── 2.1-<slug>.md
└── lab/           # the learner's own work
```

- **`parts/` is mandatory.** A day without it is not written.
- **Every part lives in its section's folder.** Never loose in `parts/`. The folder's leading number
  and the number before the dot must agree.
- **Every section folder is named `NN-<section-slug>`** — two zero-padded digits, a hyphen, then a
  **one- or two-word** slug saying what the section is about: `parts/04-auth/`, `parts/02-quoting/`,
  `parts/06-sandbox/`. **Never a bare `parts/01/`.** `ls days/day-NN-*/parts/` must read as a table
  of contents, so anyone can see what a day holds without opening the hub. `./k depth NN` fails on a
  bare number. The slug echoes the section heading the hub's §2 gives it, in the fewest words that
  stay unambiguous within that day, and it names the *subject*, never the position.
- **Links are relative to the part's own folder**: sibling `1.2-<slug>.md`; another section
  `../01-<section-slug>/1.5-<slug>.md`; the hub `../../LESSON.md`. `prev` and `next` in frontmatter
  use the same form. The hub's §2 map links the full path from the day folder:
  `parts/01-<section-slug>/1.1-<slug>.md`.
- **Renaming a section folder means rewriting every link to it** in the same change — the hub's §2,
  cross-section links, `prerequisites:` in frontmatter, and `docs/GLOSSARY.md` — then `./k depth NN`.
- **The hub never teaches.** No `Line by line:` in `LESSON.md`.
- **Section numbers group parts that share one mental model.** The hub's §2 says what each section
  means. Unexplained numbering is a bug.
- **Every part carries all twelve sections of Part 11.4, in order**: frontmatter · one-line answer ·
  the story · the idea in plain language · why the build needs it · the mechanism · line by line ·
  **the same thing, three ways** · when it breaks · **how to undo it** · **in production** · check
  yourself.
- **Every part declares `level`** (`foundation` · `working` · `production`) and **`danger`**
  (`safe` · `caution` · `destructive`). A day climbs.
- **The one-idea test:** if a part needs "also" to introduce its second half, it is two parts.
- **The standalone test:** a part must be readable cold, with its prerequisite named and linked.
- **The no-shortcut test:** "for now, just accept that" is banned unless it links forward to the part
  that explains it. A deferred explanation must have an address.
- Run `./k depth NN` after writing a day. It fails on missing sections, numbering gaps, unexplained
  command blocks, clock words, and a hub that teaches. **Never hand-wave past a `depth` failure.**

---

## Writing conventions

- **EVERY command block is followed by a `**Line by line:**` walkthrough** of each non-obvious token
  and flag — and why that flag and not another. An unexplained command is a bug in the doc.
- **Paste real output.** Run the command, copy what it printed. Elide long output with `…` and say
  what you elided. Never invent output, SHAs, or timings. Fabricated terminal output is the single
  worst failure mode in this repository, because the reader will compare it against their screen.
- Use short, stable SHAs in prose as `a1b2c3d` and say plainly that the reader's will differ.
- **Mermaid diagram whenever the concept is spatial, sequential, or a state machine.** Commit graphs,
  the three trees, refspec flow, merge topology, workflow event flow — all get diagrams.
- Describe the **setting and its effect first, then the path to it.** Menu paths age in weeks;
  settings age in years.
- Prefer `git switch` / `git restore` in teaching text; show the `git checkout` equivalent once, in
  the part that explains the split (Day 34), and link back to it thereafter.
- Storytelling is the default register: a scene before an abstraction, every time.
- **No person names, no brand names of courses or creators**, anywhere — lesson, checklist, commit
  message, doc. Naming the tools actually used is required and unaffected (Git, GitHub, `gh`, CodeQL,
  Dependabot, Docker, VS Code).
- British or American spelling — pick one per document and be consistent; the existing days use
  British.

---

## Working in this repository

- `./k` is POSIX shell and has no dependencies. Do not add a Python or Node toolchain to the
  curriculum repository itself; the whole point is that a learner needs only Git.
- `sandbox/` is gitignored. Everything in it is disposable and rebuilt by `./k sandbox`.
- `nudge/` is a separate repository cloned inside this one and is also gitignored here.
- After writing a day: `./k depth NN`, then `./k tracker`.
- Never hand-edit `docs/TRACKER.md`.

## Safety when running commands for the learner

- **Never run a destructive Git command outside `sandbox/`** without saying what it will do and
  getting a yes. This includes `reset --hard`, `clean -fdx`, `push --force`, `branch -D`,
  `filter-repo`, `gc --prune=now`, and any `gh` call that deletes or changes visibility.
- Before any history rewrite, print the current `git rev-parse HEAD` and tell the learner it is their
  way back.
- Never push to `main` on any repository. Never disable a protection rule to make a command succeed —
  if a protection blocks you, that is the lesson working.
- Treat tokens and keys as radioactive: never echo one, never write one into a file that is not
  gitignored, never paste one into a lesson even redacted.
