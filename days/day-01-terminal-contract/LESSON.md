---
day: 1
phase: 0
phase_name: The Foundry
title: "The terminal contract: paths, quoting, editors, pagers, exit codes"
ids: [G-SET-06]
principles: [2, 4, 5, 6, 8, 9, 10]
kind: setup
plan_version: "v1.2.0"
parts: 13
sandbox: required
generated: 2026-08-23
verified: 2026-08-23
status: written
commit: null
---

> **Yesterday** — the workshop: Git installed and configured, the identities created and secured,
> authentication that works, and a sandbox you are allowed to ruin.
> **Today** — the contract between you and the terminal: where you are standing, what the shell does
> to your words before Git sees them, which programs Git launches on your behalf, and the number every
> command hands back when it finishes.
> **Tomorrow** — `nudge`, the demo project, and why it is deliberately small.

---

## §1 The story

There is a particular kind of bad afternoon that everybody has in their first month, and it looks like
the tool is broken.

You type something that is obviously correct. It does not work. You type it again more carefully. It
does not work again. You search for the error message and find people describing a different problem
with the same words. Eventually somebody who has done this for years looks over your shoulder for four
seconds, moves two characters, and walks away.

The reason those afternoons happen is not that the tool is hard. It is that there are two participants
in every command and most people have only been introduced to one of them. There is the program you
meant to run, and there is the thing that reads your line first, cuts it up, replaces some of it,
decides where "here" is, and hands the pieces over. That thing has rules. The rules are simple, there
are not many of them, and nobody ever writes them down because everybody who knows them has forgotten
learning them.

Today they are written down.

None of this is Git. All of it decides whether Git does what you meant, and every one of the two
hundred and fifty-one days after this one assumes you have it. A day spent here is subtracted from
every future afternoon of the kind described above.

---

## §2 The map

Thirteen parts, in four sections. Each section is one half of the contract: what you tell the terminal,
and what it tells you back.

### Section 01-paths — Where you are standing
*The claim: I always know which directory a command will act in, and I can name any file from
anywhere.*

| # | Part | Answers | level | danger |
|---|---|---|---|---|
| 1.1 | [What a terminal, a shell and a prompt actually are](parts/01-paths/1.1-terminal-shell-prompt.md) | Which of these three things is talking to me right now? | foundation | safe |
| 1.2 | [The working directory: `pwd`, `cd`, and why every Git command depends on it](parts/01-paths/1.2-the-working-directory.md) | How does Git decide which repository I mean? | foundation | safe |
| 1.3 | [Paths: absolute, relative, `~`, `.`, `..`, and who expands them](parts/01-paths/1.3-paths-and-who-expands-them.md) | Why does quoting a path with a tilde in it break it? | working | safe |
| 1.4 | [One directory, two spellings: Windows paths, MSYS translation, and WSL](parts/01-paths/1.4-two-spellings-of-a-path.md) | Why do `pwd` and Git print different paths for the same folder? | working | safe |

### Section 02-quoting — What the shell does to your words before Git sees them
*The claim: I can predict exactly which arguments a program will receive.*

| # | Part | Answers | level | danger |
|---|---|---|---|---|
| 2.1 | [The line becomes words: splitting, and why `git commit -m my message` fails](parts/02-quoting/2.1-the-line-becomes-words.md) | Why did Git complain about a file when I was writing a message? | foundation | safe |
| 2.2 | [Quoting: single, double, backslash, and the characters that still bite](parts/02-quoting/2.2-quoting.md) | Which quotes stop what, and what do they not protect me from? | working | safe |
| 2.3 | [Globs and pathspecs: who expands the star](parts/02-quoting/2.3-globs-and-pathspecs.md) | Why does quoting a pattern make Git match *more* files? | working | safe |

### Section 03-child-processes — The programs Git starts for you
*The claim: when something other than the shell has my keyboard, I know what it is and how to leave.*

| # | Part | Answers | level | danger |
|---|---|---|---|---|
| 3.1 | [Environment variables, and how a child process inherits them](parts/03-child-processes/3.1-environment-variables.md) | Why can a script never change my shell's directory or variables? | foundation | safe |
| 3.2 | [The editor chain, and escaping the screen you cannot leave](parts/03-child-processes/3.2-the-editor-chain.md) | Why did my commit abort when the editor opened perfectly? | working | safe |
| 3.3 | [The pager: why the screen stopped, and the keys that move it](parts/03-child-processes/3.3-the-pager.md) | Why does the same command behave differently in a script? | working | safe |

### Section 04-exit-and-streams — What a command answers
*The claim: I can read the number a command returns, and build on it.*

| # | Part | Answers | level | danger |
|---|---|---|---|---|
| 4.1 | [Exit codes: 0 is success, and the Git commands that answer with a number](parts/04-exit-and-streams/4.1-exit-codes.md) | When is a non-zero exit not a failure? | working | safe |
| 4.2 | [`&&`, `\|\|`, `;`: chaining, and why hooks and CI live on the difference](parts/04-exit-and-streams/4.2-chaining-commands.md) | How does a pipeline pass while the test inside it fails? | production | safe |
| 4.3 | [stdout and stderr: two streams, and why piping Git can lose half the output](parts/04-exit-and-streams/4.3-stdout-and-stderr.md) | Why is my log file empty when the error is on my screen? | production | caution |

---

## §3 Setup — run this

Everything today happens in two places: a disposable rehearsal repository, and one real commit in
`nudge`.

```sh
# the rehearsal repository — disposable, rebuilt by this same command
./k sandbox fresh
```

```sh
# a second one for today's quoting, glob, exit-code and redirection reps
mkdir -p sandbox/contract/docs && cd sandbox/contract && git init -q -b main
printf 'water the plants\n' > reminders.md
git add reminders.md && git commit -qm "first reminder"
printf 'a\n' > docs/a.md
git switch -qc side && printf 'stretch\n' >> reminders.md && git commit -qam "a side commit"
git switch -q main
cd ../..
```

That builds the shape the parts assume: a repository with a subdirectory — so
[2.3](parts/02-quoting/2.3-globs-and-pathspecs.md)'s two globs give different answers — and a second branch
called `side`, so [4.1](parts/04-exit-and-streams/4.1-exit-codes.md)'s ancestry questions have something to answer
about.

**Line by line is in the parts, not here** — the hub never teaches. If a command in this block is
unfamiliar, [1.2](parts/01-paths/1.2-the-working-directory.md) covers `cd` and
[4.3](parts/04-exit-and-streams/4.3-stdout-and-stderr.md) covers `>`.

Nothing in `sandbox/` is tracked by this repository; Day 0's part
[6.2](../day-00-foundry/parts/06-sandbox/6.2-the-sandbox.md) explains why, and `./k sandbox fresh` rebuilds it
whenever you wreck it — which today you are encouraged to do.

---

## §4 The build brief

Today produces one commit in `nudge`, and a pile of deliberate wreckage in `sandbox/` that nobody
keeps.

**In `sandbox/contract` — the reps, none of which are preserved:**

- A file whose name contains a space, staged and committed. `TODO(me)`: choose the name.
- The same file, destroyed with a careless `>` and recovered — [4.3](parts/04-exit-and-streams/4.3-stdout-and-stderr.md).
- `git add *.md` and `git add '*.md'` run in a repository that has a subdirectory, so the difference is
  visible on your own screen rather than on mine — [2.3](parts/02-quoting/2.3-globs-and-pathspecs.md).
- One command whose exit code you predicted correctly before running it.

**In `nudge` — the thing that outlives today:**

- `docs/terminal-contract.md` — `TODO(me)`: your own notes, not mine. At minimum: which shell you are
  running, which editor Git will launch, which pager, and the one exit code that surprised you today.
  The parts tell you the commands that answer each of those; the file is yours to write.
- One commit containing it, with **a subject line, a blank line, and a body** — which means writing the
  message in your editor rather than with `-m`. That is [3.2](parts/03-child-processes/3.2-the-editor-chain.md), and it
  is the day's proof.

**In `docs/PINS.md`:**

- `TODO(me)`: add a row for your shell and its version. Day 0 left the Git and `gh` rows for you; this
  is the same file, one row longer.

---

## §5 The proof that can fail

Red now, green tonight. Run it from the root of this repository.

```sh
git -C nudge log -1 --format=%B | sed -n '3,$p' | grep -q '[^[:space:]]' \
  && git -C sandbox/contract ls-files | grep -q ' ' \
  && echo GREEN
```

Before today's work it prints nothing:

```
```

After it, it prints:

```
GREEN
```

**What each half proves.** The first asks whether your most recent `nudge` commit message has anything
after the third line — a body, which `-m` alone does not naturally produce, so passing it means the
editor chain works and you drove it. The second asks whether the rehearsal repository tracks a path
containing a space, which passes only if you quoted correctly when you staged it.

**Why the whole line is the point.** It uses the working directory (`-C`), a pipe, both output streams,
a pathspec, `grep`'s exit code, and `&&` — six of today's thirteen parts in one command. If you can
explain every character of it, the day has landed.

---

## §6 Blast radius

Today is the second of the two safest days in the curriculum — with one exception that is genuinely
sharp.

| What can go wrong | Where | Recovery |
|---|---|---|
| `>` truncating a file you meant to keep | Part 4.3, and every day after it | `git restore <path>` if the file was committed. **If it was never tracked, it is gone** — there is no reflog for a file Git has never seen |
| `git add '*.md'` staging far more than intended | Part 2.3 | `git reset` unstages everything and touches nothing on disk |
| Wrecking the sandbox | Parts 4.1–4.3 | `./k sandbox fresh`, which is what it is for |
| Setting a variable in a shell profile and forgetting | Part 3.1 | `unset NAME` for now; a new terminal after editing the file |

**Parts rated above `safe` today:** 4.3 only. It carries its own **How to undo it**, and its central
demonstration is a file being destroyed and brought back.

**Nothing today touches a remote.** No push, no fetch, no force. The one destructive character on the
page destroys locally, and Git is what decides whether that is recoverable.

---

## §7 Traps

- **Assuming an error came from Git.** Read the first word. `bash: git: command not found` is the shell
  speaking, and Git never ran. Half of a beginner's Git errors are shell errors wearing Git's coat.
- **Quoting a tilde.** `"~/.ssh"` is a directory that does not exist. Use `"$HOME/.ssh"` when you need
  it inside quotes.
- **Thinking the pager has hung the terminal.** Press `q`. It is not Git; it is `less`, and it has been
  waiting for you politely.
- **Using `;` where you meant `&&`.** Interactively it is untidy. In a script or a workflow it is how a
  green build hides a failed test.
- **Piping and losing the error.** A pipe carries stdout only. If your `grep` finds nothing but the
  text is on screen, the text is on stderr — add `2>&1`.
- **`>` when you meant `>>`.** One character, and the file is empty before the command even runs.
  `set -o noclobber` makes the mistake refuse rather than happen.
- **Believing `$?` after an `echo`.** The `echo` set it. Capture it on the very next line, or test the
  command directly with `&&` and `||`.

---

## §8 Verify before you click

Fetched 2026-08-23. Principle 11: check the source rather than the memory, including for Git's own
documentation, which changes between releases.

- `git help var` — the editor and pager preference chains — <https://git-scm.com/docs/git-var>
- `git help config` — scopes, `core.pager`, `core.editor` — <https://git-scm.com/docs/git-config>
- `core.pager` and the `LESS=FRX` default, in Git's own source —
  <https://raw.githubusercontent.com/git/git/master/Documentation/config/core.adoc>
- The GitHub CLI's environment variables, including `GH_PAGER` and `GH_EDITOR` —
  <https://cli.github.com/manual/gh_help_environment>
- When history expansion runs, and why it is on at your prompt and off in your scripts — quoted in
  part [2.2](parts/02-quoting/2.2-quoting.md) —
  <https://www.gnu.org/software/bash/manual/html_node/History-Interaction.html>

Git's manual pages are also on your own disk and match your installed version exactly, which is Day 0's
part [1.3](../day-00-foundry/parts/01-install/1.3-version-and-help.md) — for anything in Sections 03 and 04,
`git help var` locally beats any page on the internet. The same is true of your shell: `help set` is
built into bash itself, so it describes the bash you are actually running rather than the one whose
manual you found.

If any of these now says something different from a part in this day, **stop and run `/plan-amend`**
rather than adapting the lesson quietly.

---

## §9 Say it in an interview

*"Most of what looks like Git being awkward is the shell, and the two are worth separating. The shell
splits my line into words before Git ever starts, so a message or a filename with a space in it has to
be quoted — and quoting is also how I decide whether the shell or Git expands a pattern, which changes
whether `*.md` means this directory or the whole repository. Git hands prose to an editor and long
output to a pager, both chosen by a preference chain I can inspect with `git var`, and both of which
stop happening when output is not a terminal — which is why commands behave differently in CI. And
everything ends in an exit code: zero for success, and for some commands a non-zero that is an answer
rather than an error, like `git diff --quiet`. That is what hooks and `bisect run` and every workflow
step are actually built on, and it is why I put `set -euo pipefail` at the top of anything I write
down."*

---

## §10 Done when

Every box in [`CHECKLIST.md`](CHECKLIST.md) is ticked, `./k depth 1` is green, and §5's proof prints
`GREEN`.

Not when a certain number of pages have been read. This is the day that stops being visible: you will
never again think about word splitting, and you will also never again lose an afternoon to it.
