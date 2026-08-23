# Day 0 — The Foundry — checklist

Tick a part's box only when all three are true: you have read it, run its **Check yourself** command,
and answered its out-loud question without looking.

`./k done 0` refuses to close the day while any box is unticked.

## Setup

- [ ] `git --version` prints a version, and I have recorded it in `docs/PINS.md`
- [ ] `gh --version` prints a version, and I have recorded it in `docs/PINS.md`
- [ ] `./k status` runs and shows Day 0
- [ ] `./k sandbox fresh` builds a repository and prints its log

## Section 01-install — The machine

- [ ] 1.1 What Git actually is, and what GitHub is not
- [ ] 1.2 Installing Git on Windows, macOS and Linux
- [ ] 1.3 `git --version`, `git help`, and the manual you will actually use

## Section 02-identity — Identity

- [ ] 2.1 `git config` and the four scopes
- [ ] 2.2 `user.name`, `user.email`, and the address baked into every commit forever
- [ ] 2.3 The defaults you will regret leaving alone

## Section 03-accounts — The identities

- [ ] 3.1 One account, one machine account, one organization — and why not two of you
- [ ] 3.2 Creating them: verified email, two-factor, recovery codes
- [ ] 3.3 The noreply address, and the privacy setting that blocks a push

## Section 04-auth — Proving you are you

- [ ] 4.1 HTTPS or SSH: two ways to authenticate, and what each actually sends
- [ ] 4.2 Generating an SSH key, and what the four files are
- [ ] 4.3 Registering the key with GitHub, and testing it
- [ ] 4.4 Credential helpers: where your token is really stored
- [ ] 4.5 Personal access tokens: classic, fine-grained, and choosing scopes

## Section 05-cli-tools — The tools around Git

- [ ] 5.1 `gh auth login`, and two identities in one CLI
- [ ] 5.2 The editor, the pager, and a diff you can actually read

## Section 06-sandbox — The sandbox and the first proof

- [ ] 6.1 The four repositories this curriculum builds
- [ ] 6.2 `./k sandbox fresh`: a repository you are allowed to ruin
- [ ] 6.3 End to end: a signed commit from the terminal, visible on both accounts

## The build brief

- [ ] `~/.gitconfig` has `user.name`, `user.email`, `init.defaultBranch` and the settings from 2.3
- [ ] `git config --global --list --show-origin` shows every one of them coming from the file I expect
- [ ] Two SSH keys exist, one per identity, and neither private key has left this machine
- [ ] `ssh -T git@github.com` greets me by the correct username
- [ ] `gh auth status` shows both identities, and I can say which one is active
- [ ] `nudge` exists on GitHub and is cloned locally
- [ ] `nudge/reminders.md` contains **my own** first reminder, not the example — `TODO(me)`
- [ ] `docs/PINS.md` records both tool versions and today's date — `TODO(me)`

## The proof

- [ ] `git -C nudge log --show-signature -1` reports a good signature
- [ ] The same commit shows as verified on github.com
- [ ] **Break it, watch it fail, fix it:** unset the signing key
      (`git config --global --unset user.signingkey`), commit again, watch `--show-signature` report
      nothing, then restore it and confirm the next commit is signed. I can now recognise both states.

## Blast radius rehearsed

- [ ] I have read the **How to undo it** section of every part rated above `safe` today: 2.2, 3.2,
      4.2, 4.4, 4.5, 5.1
- [ ] My two-factor recovery codes are saved somewhere that is **not** this laptop
- [ ] No token, key or password exists anywhere inside the `kosha` working tree

## Close the day

- [ ] `./k depth 0` is green
- [ ] `./k tracker` has been run
- [ ] The commit exists, and I can say out loud what its hash is a hash *of*
