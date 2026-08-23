# Glossary

Every term used in this curriculum, defined once. Parts link here rather than re-defining, except
where the definition is one line and repeating it is kinder than a link (Principle 8).

Populated as terms are introduced. A term enters this file on the day it is first used, with a link
to the part that introduced it.

## Day 0 — The Foundry

| Term | Definition | First taught |
|---|---|---|
| repository | A folder of files plus the `.git` directory beside them holding their entire history | [1.1](../days/day-00-foundry/parts/01-install/1.1-what-git-actually-is.md) |
| working tree | The visible, editable files — as opposed to what is committed | [1.1](../days/day-00-foundry/parts/01-install/1.1-what-git-actually-is.md) |
| commit | One complete snapshot of every tracked file, plus author, timestamps and message | [1.1](../days/day-00-foundry/parts/01-install/1.1-what-git-actually-is.md) |
| blob | The stored contents of a file, addressed by a hash of those contents | [1.1](../days/day-00-foundry/parts/01-install/1.1-what-git-actually-is.md) |
| content addressing | Storing an object under a name computed from its own bytes, so identical content has one address everywhere | [1.1](../days/day-00-foundry/parts/01-install/1.1-what-git-actually-is.md) |
| PATH | The ordered list of directories a shell searches to find a program by name | [1.2](../days/day-00-foundry/parts/01-install/1.2-installing-git.md) |
| plumbing / porcelain | Git's low-level commands, and the friendly ones built on top of them | [1.1](../days/day-00-foundry/parts/01-install/1.1-what-git-actually-is.md) |
| pathspec | Git's own name for a path or path pattern argument | [1.3](../days/day-00-foundry/parts/01-install/1.3-version-and-help.md) · in full [2.3](../days/day-01-terminal-contract/parts/02-quoting/2.3-globs-and-pathspecs.md) |
| configuration scope | One of the four files Git reads — system, global, local, worktree — later ones winning | [2.1](../days/day-00-foundry/parts/02-identity/2.1-config-and-scopes.md) |
| author / committer | The person who wrote a change, and the person who created the commit object | [2.2](../days/day-00-foundry/parts/02-identity/2.2-identity-in-every-commit.md) |
| rewriting history | Producing new commit objects to replace existing ones; not editing, because commits are immutable | [2.2](../days/day-00-foundry/parts/02-identity/2.2-identity-in-every-commit.md) |
| fast-forward | Bringing a branch up to date by moving its pointer, because it had no commits of its own | [2.3](../days/day-00-foundry/parts/02-identity/2.3-defaults-worth-changing.md) |
| upstream | The remote branch a local branch is paired with, so push and pull need no arguments | [2.3](../days/day-00-foundry/parts/02-identity/2.3-defaults-worth-changing.md) · Day 36 |
| machine account | A free GitHub account for automated tasks only, permitted alongside your one personal account | [3.1](../days/day-00-foundry/parts/03-accounts/3.1-why-two-accounts.md) |
| organization | An account that owns repositories on behalf of a group, and holds the policy settings | [3.1](../days/day-00-foundry/parts/03-accounts/3.1-why-two-accounts.md) |
| two-factor authentication | Proving identity with something you know and something you have | [3.2](../days/day-00-foundry/parts/03-accounts/3.2-creating-the-accounts.md) |
| noreply address | `ID+USERNAME@users.noreply.github.com` — attributes commits to you without exposing a mailbox | [3.3](../days/day-00-foundry/parts/03-accounts/3.3-noreply-and-email-privacy.md) |
| key pair | A private key that never leaves your machine and a public key you hand out freely | [4.2](../days/day-00-foundry/parts/04-auth/4.2-generating-an-ssh-key.md) |
| known_hosts | The record of which host key each server presented, so an impostor is detected | [4.3](../days/day-00-foundry/parts/04-auth/4.3-registering-and-testing-the-key.md) |
| credential helper | An external program Git calls to store and retrieve the secret used over HTTPS | [4.4](../days/day-00-foundry/parts/04-auth/4.4-credential-helpers.md) |
| personal access token | A password with a list of permissions and an expiry date attached | [4.5](../days/day-00-foundry/parts/04-auth/4.5-personal-access-tokens.md) |
| scope | One capability a token is permitted to exercise; a checklist, not a level of trust | [4.5](../days/day-00-foundry/parts/04-auth/4.5-personal-access-tokens.md) |
| rate limit | How many API requests an identity may make per hour — 5000 authenticated, 60 not | [4.5](../days/day-00-foundry/parts/04-auth/4.5-personal-access-tokens.md) |
| active account | The one identity `gh` acts as, of the several it may hold | [5.1](../days/day-00-foundry/parts/05-cli-tools/5.1-gh-auth-login.md) |
| sandbox | A repository built to be destroyed, rebuilt by `./k sandbox` | [6.2](../days/day-00-foundry/parts/06-sandbox/6.2-the-sandbox.md) |
| signed commit | A commit carrying a cryptographic signature inside the object, over its own bytes | [6.3](../days/day-00-foundry/parts/06-sandbox/6.3-end-to-end-proof.md) |
| allowed signers | The local file naming which identity may sign with which key, used for verification | [6.3](../days/day-00-foundry/parts/06-sandbox/6.3-end-to-end-proof.md) |

## Day 1 — The terminal contract

| Term | Definition | First taught |
|---|---|---|
| terminal / shell / prompt | The window, the program reading your line, and the characters printed while it waits | [1.1](../days/day-01-terminal-contract/parts/01-paths/1.1-terminal-shell-prompt.md) |
| working directory | The single directory a running program treats as "here" | [1.2](../days/day-01-terminal-contract/parts/01-paths/1.2-the-working-directory.md) |
| absolute / relative path | A path counted from the filesystem root, or from where you are standing | [1.3](../days/day-01-terminal-contract/parts/01-paths/1.3-paths-and-who-expands-them.md) |
| tilde expansion | The shell replacing a leading `~` with your home directory, before the program runs | [1.3](../days/day-01-terminal-contract/parts/01-paths/1.3-paths-and-who-expands-them.md) |
| word splitting | The shell cutting a line into separate arguments at whitespace | [2.1](../days/day-01-terminal-contract/parts/02-quoting/2.1-the-line-becomes-words.md) |
| quoting | Telling the shell which characters are content rather than instructions | [2.2](../days/day-01-terminal-contract/parts/02-quoting/2.2-quoting.md) |
| glob | A filename pattern — and there are two engines, the shell's and Git's | [2.3](../days/day-01-terminal-contract/parts/02-quoting/2.3-globs-and-pathspecs.md) |
| environment variable | A named value copied into every program a shell starts | [3.1](../days/day-01-terminal-contract/parts/03-child-processes/3.1-environment-variables.md) |
| editor chain | `GIT_EDITOR` → `core.editor` → `VISUAL` → `EDITOR` → compiled-in default | [3.2](../days/day-01-terminal-contract/parts/03-child-processes/3.2-the-editor-chain.md) |
| pager | The program that shows long output one screen at a time; `q` leaves it | [3.3](../days/day-01-terminal-contract/parts/03-child-processes/3.3-the-pager.md) |
| exit code | The number a program returns: 0 for success, and for some commands an answer rather than an error | [4.1](../days/day-01-terminal-contract/parts/04-exit-and-streams/4.1-exit-codes.md) |
| short-circuit operators | `&&` runs on success, `\|\|` on failure, `;` regardless | [4.2](../days/day-01-terminal-contract/parts/04-exit-and-streams/4.2-chaining-commands.md) |
| stdout / stderr | The result stream and the diagnostics stream, redirected independently | [4.3](../days/day-01-terminal-contract/parts/04-exit-and-streams/4.3-stdout-and-stderr.md) |
| remote | A name for another copy of the repository that Git knows how to talk to | Day 75 |
