---
day: 0
phase: 0
phase_name: The Foundry
title: "The foundry: Git, identity, GitHub, gh, and a sandbox that proves it"
ids: [G-SET-01, G-SET-02, G-SET-03, G-SET-04, G-SET-05]
principles: [1, 5, 10, 11, 12, 13, 15]
kind: setup
plan_version: "v1.2.0"
parts: 19
sandbox: required
generated: 2026-08-23
verified: 2026-08-23
status: written
commit: null
---

> **Yesterday** — nothing. This is the first day.
> **Today** — build the machine: Git installed and configured, two GitHub accounts that are really
> yours, authentication that works without typing a password, `gh` signed in to both, and a sandbox
> repository you are allowed to destroy.
> **Tomorrow** — Day 1 closes the terminal gap that every later day assumes: paths, quoting,
> `$EDITOR`, pagers, exit codes.

---

## §1 The story

A carpenter's first day in a new workshop is not spent making furniture. It is spent finding out
whether the bench is level, whether the saw is sharp, and where the electricity comes in. Nothing is
produced. Everything afterwards depends on it.

The equivalent failure in software is quiet and expensive. Somebody starts learning version control
on a machine where the tool is installed but has never been told who they are, so every record it
writes is signed with a name that belongs to nobody. Three weeks later they have four hundred entries
in a history that cannot answer *who did this*, on a website that will not accept them as the author
because the address does not match any account. Nothing broke. Nothing announced itself. The work is
simply less useful than it looked, and fixing it means rewriting three weeks.

Today is the level bench. Every command you run today is a claim you will verify before you sleep —
that the tool is here, that it knows who you are, that the website believes you, that you can send
work to it and get it back, and that you have a place to break things without consequence.

The last item on that list matters more than it sounds. This subject is one of the few where the
professionals are distinguished from the amateurs by *calmness*, and calmness comes from having
already destroyed something and got it back. So the last thing today builds is a repository whose
entire purpose is to be ruined.

---

## §2 The map

Nineteen parts, in six sections. Each section is one claim you must be able to make truthfully by the
end of the day.

### Section 01-install — The machine
*The claim: the tool is here, and I know what it is.*

| # | Part | Answers | level | danger |
|---|---|---|---|---|
| 1.1 | [What Git actually is, and what GitHub is not](parts/01-install/1.1-what-git-actually-is.md) | Why is a commit stored under a hash of its own contents, and what does GitHub add? | foundation | safe |
| 1.2 | [Installing Git on Windows, macOS and Linux](parts/01-install/1.2-installing-git.md) | What am I actually installing, and which install do I get on each system? | foundation | safe |
| 1.3 | [`git --version`, `git help`, and the manual you will actually use](parts/01-install/1.3-version-and-help.md) | How do I answer a Git question without a search engine? | foundation | safe |

### Section 02-identity — Identity
*The claim: every record this tool writes is correctly attributed to me, permanently.*

| # | Part | Answers | level | danger |
|---|---|---|---|---|
| 2.1 | [`git config` and the four scopes](parts/02-identity/2.1-config-and-scopes.md) | When two settings disagree, which one wins? | working | safe |
| 2.2 | [`user.name`, `user.email`, and the address baked into every commit forever](parts/02-identity/2.2-identity-in-every-commit.md) | Why is this the one setting that is expensive to get wrong? | working | caution |
| 2.3 | [The defaults you will regret leaving alone](parts/02-identity/2.3-defaults-worth-changing.md) | Which six settings should be changed on the first day and never thought about again? | working | safe |

### Section 03-accounts — The identities
*The claim: I hold every identity this curriculum uses, I know which one is allowed to do what, and
all of them are secured.*

| # | Part | Answers | level | danger |
|---|---|---|---|---|
| 3.1 | [One account, one machine account, one organization — and why not two of you](parts/03-accounts/3.1-why-two-accounts.md) | What cannot be learned alone, and what do the Terms of Service permit me to do about it? | foundation | safe |
| 3.2 | [Creating them: verified email, two-factor, recovery codes](parts/03-accounts/3.2-creating-the-accounts.md) | What does GitHub actually require, and what happens if I lose the second factor? | working | caution |
| 3.3 | [The noreply address, and the privacy setting that blocks a push](parts/03-accounts/3.3-noreply-and-email-privacy.md) | How do I keep my real address out of a public history without breaking attribution? | working | safe |

### Section 04-auth — Proving you are you
*The claim: I can talk to GitHub without typing a password, and I know where my credential lives.*

| # | Part | Answers | level | danger |
|---|---|---|---|---|
| 4.1 | [HTTPS or SSH: two ways to authenticate, and what each actually sends](parts/04-auth/4.1-https-or-ssh.md) | Which should I choose, and on what grounds? | working | safe |
| 4.2 | [Generating an SSH key, and what the four files are](parts/04-auth/4.2-generating-an-ssh-key.md) | What did `ssh-keygen` just put on my disk, and which half must never leave it? | working | caution |
| 4.3 | [Registering the key with GitHub, and testing it](parts/04-auth/4.3-registering-and-testing-the-key.md) | How do I prove the key works before I need it? | working | safe |
| 4.4 | [Credential helpers: where your token is really stored](parts/04-auth/4.4-credential-helpers.md) | When Git stops asking for a password, what is it reading instead — and in plain text? | production | caution |
| 4.5 | [Personal access tokens: classic, fine-grained, and choosing scopes](parts/04-auth/4.5-personal-access-tokens.md) | Which token type, which scopes, which expiry, and what to do the day one leaks? | production | caution |

### Section 05-cli-tools — The tools around Git
*The claim: the command line reaches the platform, and my editor and pager are usable.*

| # | Part | Answers | level | danger |
|---|---|---|---|---|
| 5.1 | [`gh auth login`, and two identities in one CLI](parts/05-cli-tools/5.1-gh-auth-login.md) | How do I hold two identities and switch between them without logging out? | working | caution |
| 5.2 | [The editor, the pager, and a diff you can actually read](parts/05-cli-tools/5.2-editor-and-pager.md) | Why did Git open a screen I cannot escape, and how do I make it mine? | working | safe |

### Section 06-sandbox — The sandbox and the first proof
*The claim: I have a place to break things, and I have proved the whole chain end to end.*

| # | Part | Answers | level | danger |
|---|---|---|---|---|
| 6.1 | [The four repositories this curriculum builds](parts/06-sandbox/6.1-the-four-repositories.md) | Which repository am I allowed to destroy, and which must I not? | foundation | safe |
| 6.2 | [`./k sandbox fresh`: a repository you are allowed to ruin](parts/06-sandbox/6.2-the-sandbox.md) | How do I get a known-shaped repository back after wrecking it? | working | safe |
| 6.3 | [End to end: a signed commit from the terminal, visible on both accounts](parts/06-sandbox/6.3-end-to-end-proof.md) | Does the entire chain — commit, sign, push, verify, view as someone else — actually work? | production | safe |

---

## §3 Setup — run this

Nothing here assumes Git is installed; part 1.2 does that. Run this section after 1.2.

```sh
# where this curriculum lives
git clone <your fork of kosha> kosha && cd kosha
chmod +x k
./k status
```

```sh
# the disposable repository — everything under sandbox/ is gitignored and rebuildable
./k sandbox fresh
```

**What you will need before Section 03:** a second email address, for the **machine account**. Any
provider — but a genuinely separate mailbox, because an address can belong to only one GitHub account
at a time. GitHub's Terms of Service permit you one free personal account and one free machine account
for automated tasks; part [3.1](parts/03-accounts/3.1-why-two-accounts.md) quotes the clause and explains what
each identity is allowed to do. A second personal account for yourself is not one of the options.

---

## §4 The build brief

Today builds no application code. It builds the workshop, and it produces exactly one commit.

- `~/.gitconfig` — your global configuration, written by part 2.1 and 2.3.
- `~/.ssh/` — a key pair for the primary account and a second for the collaborator account (4.2).
- `nudge/` — the demo repository, created on GitHub and cloned (6.3).
- `nudge/reminders.md` — one line. `TODO(me)`: write your own first reminder, not the example one.
- `sandbox/fresh/` — rebuilt on demand, never committed.
- `docs/PINS.md` — `TODO(me)`: record your Git version, your `gh` version, and today's date. Part 1.3
  shows you the commands; the file is yours to write.

---

## §5 The proof that can fail

This is the day's single acceptance test. It is red now and green tonight.

```sh
git -C nudge log --show-signature -1
```

It must print your commit and a line confirming the signature was made by a key your machine trusts.
Then open that same commit on github.com and confirm the **Verified** badge is there.

**Why both.** The local check proves the key made the signature and that your `allowed_signers` file
vouches for the key. The remote check proves something different: that GitHub holds the public half
registered to your account *as a signing key*, and that the commit's email address matches a verified
address on that account. Those are independent claims that fail independently — which is exactly the
failure part 6.3 walks you into on purpose.

---

## §6 Blast radius

Today is one of the two safest days in the curriculum. Nothing here rewrites history and nothing
touches a repository you care about, because there is not one yet.

| What can go wrong | Where it can happen | Recovery |
|---|---|---|
| Overwriting an existing SSH key | Part 4.2, if you accept the default filename and a key already exists | `ssh-keygen` prompts before overwriting. **Read that prompt.** If you overwrote one, any service using the old key must be re-registered; the private half is gone. |
| Losing the second factor | Part 3.2 | Recovery codes, saved somewhere that is not the laptop holding the account. Save them before you finish 3.2. |
| A token pasted into a file | Parts 4.4, 4.5 | Nothing in `kosha/` should ever contain a token. If one lands in a commit, stop and read Day 104 — do not simply delete it in a later commit. |

**Parts rated above `safe` today:** 2.2, 3.2, 4.2, 4.4, 4.5, 5.1. Each carries its own **How to undo
it**.

---

## §7 Traps

- **Configuring the identity locally and thinking it is global.** `git config user.email x` inside a
  repository writes to that repository only. Every repository you clone afterwards will use whatever
  is global, or nothing. Part 2.1 shows `--show-origin`, which tells you exactly which file a setting
  came from. Use it today and the mystery never recurs.
- **Two identities, one SSH key.** GitHub refuses to register the same public key on two accounts,
  and the error does not say why in the way you expect. Part 4.2 generates two keys deliberately, one
  per identity.
- **Assuming the push failed because authentication failed.** A rejected push on Day 0 is far more
  often a repository that does not exist, a typo'd remote URL, or a default branch name mismatch.
  Read the message rather than regenerating keys.
- **Signing configured, but no key registered on GitHub.** The commit signs locally and shows
  "Unverified" on the website. Two systems, two registrations. Part 6.3 makes you see both states.
- **Skipping the sandbox because nothing has gone wrong yet.** The sandbox is not a beginner's crutch;
  it is where every rewrite in Phases 6 and 10 is rehearsed. Build it today.

---

## §8 Verify before you click

Fetched 2026-08-23. Principle 11: platform interfaces move, so check the source rather than the
screenshot.

- Installing Git — <https://git-scm.com/downloads>
- The `git config` documentation — <https://git-scm.com/docs/git-config>
- Setting your commit email address — <https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address>
- Connecting to GitHub with SSH — <https://docs.github.com/en/authentication/connecting-to-github-with-ssh>
- Managing personal access tokens — <https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens>
- Signing commits — <https://docs.github.com/en/authentication/managing-commit-signature-verification>
- The GitHub CLI manual — <https://cli.github.com/manual/>

If any of these pages now says something different from a part in this day, **stop and run
`/plan-amend`** rather than adapting the lesson quietly.

---

## §9 Say it in an interview

*"Before I write a line on a new machine, I set the identity globally and check `--show-origin` so I
know which file it came from, because the author on a commit is baked into the object's hash and
fixing it later means rewriting history. I use SSH keys per machine rather than one key everywhere,
so revoking a lost laptop is one deletion rather than a rotation. Tokens are fine-grained and
short-lived, and I know where the credential helper is putting them, because on some platforms the
default is a plain-text file in my home directory. And I keep a throwaway repository around —
anything destructive gets rehearsed there first, which is why I'm relaxed about `rebase` and
`filter-repo` rather than superstitious about them."*

---

## §10 Done when

Every box in [`CHECKLIST.md`](CHECKLIST.md) is ticked, `./k depth 0` is green, and §5's proof passes
from both accounts.

Not when a certain number of hours have passed. A day is a unit of subject, not of time — and this
one is a foundation the other two hundred and fifty-two stand on.
