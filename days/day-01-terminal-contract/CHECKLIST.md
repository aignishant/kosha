# Day 1 — The terminal contract — checklist

Tick a part's box only when all three are true: you have read it, run its **Check yourself** command,
and answered its out-loud question without looking.

`./k done 1` refuses to close the day while any box is unticked.

## Setup

- [ ] `./k sandbox fresh` builds and prints `eb64f62 first reminder`
- [ ] `sandbox/contract` exists, is a repository, and has one commit
- [ ] `nudge` is cloned and I can reach it with `git -C nudge status`

## Section 01-paths — Where you are standing

- [ ] 1.1 What a terminal, a shell and a prompt actually are
- [ ] 1.2 The working directory: `pwd`, `cd`, and why every Git command depends on it
- [ ] 1.3 Paths: absolute, relative, `~`, `.`, `..`, and who expands them
- [ ] 1.4 One directory, two spellings: Windows paths, MSYS translation, and WSL

## Section 02-quoting — What the shell does to your words before Git sees them

- [ ] 2.1 The line becomes words: splitting, and why `git commit -m my message` fails
- [ ] 2.2 Quoting: single, double, backslash, and the characters that still bite
- [ ] 2.3 Globs and pathspecs: who expands the star

## Section 03-child-processes — The programs Git starts for you

- [ ] 3.1 Environment variables, and how a child process inherits them
- [ ] 3.2 The editor chain, and escaping the screen you cannot leave
- [ ] 3.3 The pager: why the screen stopped, and the keys that move it

## Section 04-exit-and-streams — What a command answers

- [ ] 4.1 Exit codes: 0 is success, and the Git commands that answer with a number
- [ ] 4.2 `&&`, `||`, `;`: chaining, and why hooks and CI live on the difference
- [ ] 4.3 stdout and stderr: two streams, and why piping Git can lose half the output

## The reps

- [ ] I created a file whose name contains a space, staged it, and committed it — **my own name for
      it**, not the example — `TODO(me)`
- [ ] I ran `git add *.md` and `git add '*.md'` in a repository with a subdirectory and can state,
      from my own screen, which one staged more
- [ ] I predicted the exit code of one command correctly before running it
- [ ] I can say which of `pwd` and `git rev-parse --show-toplevel` prints which spelling on my machine
- [ ] `git var GIT_EDITOR` and `git var GIT_PAGER` both print something I can drive

## The build brief

- [ ] `nudge/docs/terminal-contract.md` exists and contains **my** notes: my shell, my editor, my
      pager, and the exit code that surprised me — `TODO(me)`
- [ ] That file is committed, with a subject line, a blank line, and a body
- [ ] The message was written in my editor, not passed with `-m`
- [ ] `docs/PINS.md` has a row for my shell and its version — `TODO(me)`

## The proof

- [ ] The §5 command prints `GREEN`
- [ ] **Break it, watch it fail, fix it:** set `GIT_EDITOR=true`, run `git commit` in the sandbox,
      watch `Aborting commit due to empty commit message.`, then set a real editor and commit
      successfully. I can now recognise both states from the message alone
- [ ] **Break it, watch it fail, fix it:** run `git log --oneline > reminders.md` in
      `sandbox/contract`, confirm the file is destroyed, recover it with `git restore reminders.md`,
      then turn on `set -o noclobber` and watch the same redirect be refused

## Blast radius rehearsed

- [ ] I have read the **How to undo it** section of the one part rated above `safe` today: 4.3
- [ ] I have destroyed an **untracked** file with `>` in the sandbox and confirmed for myself that
      nothing brings it back
- [ ] Nothing I ran today touched a remote, and I can say why that is true of this whole day

## Close the day

- [ ] `./k depth 1` is green
- [ ] `./k tracker` has been run
- [ ] The commit exists in `nudge`, and I can explain every character of the §5 proof command
