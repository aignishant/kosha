# Plan changelog

Newest first. Never edit a previous entry; supersede it with a new one.
Amendments are proposed with `/plan-amend` and applied only after a human accepts them.

## v1.2.0 — 2026-08-23

**Format.** Section folders are named `NN-<section-slug>`, not `NN`. Depth contract v1.0.0 → v1.1.0.

- **Reason:** a bare `parts/01/` tells a reader nothing. `ls days/day-00-foundry/parts/` printed six
  numbers and no subject, so the shape of a day was invisible from the file tree and could only be
  recovered by opening the hub. Nineteen parts across six anonymous folders is a filing cabinet with
  no labels. Not a currency change under Principle 17 — nothing outside this repository moved; this
  is a doc-architecture amendment requested by the repository owner.
- **Was:** `parts/01/1.1-<slug>.md`. Section folders were two zero-padded digits and nothing else.
  Cross-section links read `../01/1.5-<slug>.md`. `./k depth` checked only that the folder number
  matched the number before the dot.
- **Now:** `parts/01-<section-slug>/1.1-<slug>.md`. Two zero-padded digits, a hyphen, then a **one-
  or two-word** slug naming the section's *subject* — never its position. Cross-section links read
  `../01-<section-slug>/1.5-<slug>.md`. The part filenames are unchanged; they already carried a
  slug. `./k depth NN` now fails on a bare number and on a slug that is not lowercase kebab-case,
  and the hub's §2 and `CHECKLIST.md` carry the folder name in their `### Section NN-<slug> — …`
  headings, so the map and the file tree cannot drift apart silently.
- **Days affected:** Day 0 and Day 1 — the only days written. Renamed in place, with every reference
  rewritten in the same change:
  - Day 0 — `01-install`, `02-identity`, `03-accounts`, `04-auth`, `05-cli-tools`, `06-sandbox`
  - Day 1 — `01-paths`, `02-quoting`, `03-child-processes`, `04-exit-and-streams`
- **IDs affected:** none. No ID added, removed, split or moved.
- **Written days marked `needs-revision`:** none. Both days were migrated rather than flagged; every
  relative Markdown link in `days/` and `docs/` was re-resolved afterwards and all resolve.
- **Parts of the plan edited:** Part 10 (repository layout tree), Part 11.2 (the day shape, the
  folder rule, the link forms, and a new rule that a section folder is renamed only together with
  every link to it), Part 11.4 (the `prerequisites:` example). Part 11's heading now reads
  *doc architecture v1.1.0*.
- **Also edited outside the plan:** `k` (`cmd_depth` folder check; `cmd_new` no longer scaffolds a
  section folder it cannot name, and prints the naming rule instead), `CLAUDE.md`,
  `.claude/skills/day-kosha/SKILL.md` (steps 7, 12, 13, 15 and the hub's §2),
  `.claude/skills/depth-audit/SKILL.md` (mechanical checklist), `README.md`, `docs/GLOSSARY.md`
  (every part link).

## v1.1.0 — 2026-08-23

**Substantive.** Principle 13 rewritten: one personal account, one machine account, one free
organization — because GitHub's Terms of Service forbid a second free personal account.

- **Evidence:** <https://docs.github.com/en/site-policy/github-terms/github-terms-of-service>, §B.3
  Account Requirements, fetched 2026-08-23 — *"One person or legal entity may maintain no more than
  one free Account (if you choose to control a machine account as well, that's fine, but it can only
  be used for running a machine)."* A machine account *"is used exclusively for performing automated
  tasks."* Second source, fetched the same day:
  <https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/approving-a-pull-request-with-required-reviews>
  — *"Pull request authors cannot approve their own pull requests."*
- **Was:** "Two accounts, because collaboration needs two people. Day 0 creates a second GitHub
  account." Part 3 gave the fork to a "second account"; Day 3's gate was "visible in two accounts";
  Part 9 required "Two GitHub accounts — both free".
- **Now:** one primary account; one machine account, used only for automation (bots, deploy keys,
  tokens, workflow-authored pull requests); one free organization, which is where rulesets,
  CODEOWNERS and required reviews are taught. Review days teach the constraint rather than
  circumventing it — the author cannot approve their own pull request, and the ruleset refusing the
  merge *is* the lesson. A real second person remains the richer path where one is available.
- **Days affected:** Day 0 (Section 03 retitled "The identities"; 3.1 and 3.2 rewritten; the hub's
  §3, §5, §7 and §9 and the checklist updated), Day 3 (gate wording), Day 249 (title). Phases 13 and
  20 are not yet written and will be written against the amended principle.
- **IDs affected:** none. No ID added, removed, split or moved between phases.
- **Written days marked `needs-revision`:** none. Day 0 was mid-write with an untouched checklist
  (0 of 40 boxes ticked), so it was amended in place rather than flagged.
- **Parts of the plan edited:** Part 1 (Principle 13), Part 2 (reader profiles), Part 3 (the four
  repositories), Part 6 (Days 3 and 249), Part 9 (required tooling).

## v1.0.0 — 2026-08-23

**Initial.** Project Kosha, 253 days, 23 phases, 276 IDs.

- Depth contract v1.0.0 established as Part 11: twelve required sections per part document, ten per
  hub.
- Three sections added to the contract that a general-purpose curriculum would not need, and that
  this subject does:
  - **§8 The same thing, three ways** — every operation shown at the terminal, on github.com and in
    `gh`, with a verdict on which a professional reaches for. Without it this would be a Git course
    with GitHub bolted on.
  - **§10 How to undo it** — mandatory for every part rated `caution` or `destructive`. Git's power
    is that it rarely loses data; a lesson that teaches the destruction without the recovery has
    taught fear rather than skill.
  - **`danger:` and `sandbox:` frontmatter fields** — so the hub's §6 Blast radius can be assembled
    mechanically and `./k depth` can refuse a dangerous part with no recovery path.
- Principle 11 (nothing from memory) and the `verified:` field added because platform interfaces move
  faster than curricula. Every part describing a web interface, a limit or a price carries a
  fetched-today documentation link.
- Principle 13 (two accounts) added: review, forks, protected-branch rejection and maintainer
  workflows cannot be learned alone, and a second branch is not a colleague.
