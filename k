#!/bin/sh
# k — the Kosha daily driver. POSIX shell, no dependencies beyond git and coreutils.
# Usage: ./k <command> [args]
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
DAYS="$ROOT/days"
DOCS="$ROOT/docs"
PLAN="$DOCS/00_MASTER_PLAN_GITHUB.md"
SANDBOX="$ROOT/sandbox"

die() { printf '%s\n' "$*" >&2; exit 1; }

day_dir() {
  n=$(printf '%02d' "$1" 2>/dev/null) || die "not a day number: $1"
  d=$(find "$DAYS" -maxdepth 1 -type d -name "day-$n-*" 2>/dev/null | head -n1)
  [ -n "$d" ] || die "day $1 is not written yet. Ask Claude Code:  /day-kosha $1"
  printf '%s' "$d"
}

# ---------------------------------------------------------------- status
cmd_status() {
  total=253
  written=$(find "$DAYS" -maxdepth 1 -type d -name 'day-*' 2>/dev/null | wc -l | tr -d ' ')
  printf '\nProject Kosha — Git & GitHub, 253 days\n'
  printf '  plan       %s\n' "$(grep -m1 '| Plan version |' "$PLAN" | sed 's/.*\*\*\(.*\)\*\*.*/\1/')"
  printf '  written    %s / %s days\n' "$written" "$total"
  printf '  next       day %s\n\n' "$written"
  find "$DAYS" -maxdepth 1 -type d -name 'day-*' 2>/dev/null | sort | while read -r d; do
    b=$(basename "$d")
    ticks=$(grep -c '^- \[x\]' "$d/CHECKLIST.md" 2>/dev/null | head -n1); ticks=${ticks:-0}
    boxes=$(grep -c '^- \[.\]' "$d/CHECKLIST.md" 2>/dev/null | head -n1); boxes=${boxes:-0}
    parts=$(find "$d/parts" -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
    printf '  %-26s %2s parts   %s/%s checked\n' "$b" "$parts" "$ticks" "$boxes"
  done
  printf '\n'
}

# ---------------------------------------------------------------- start
cmd_start() {
  d=$(day_dir "$1")
  printf '\n%s\n\n' "$d"
  sed -n '1,/^## §2/p' "$d/LESSON.md"
  printf '\nParts:\n'
  find "$d/parts" -name '*.md' 2>/dev/null | sort | sed "s|$d/|  |"
  printf '\n'
}

# ---------------------------------------------------------------- new
cmd_new() {
  n=$(printf '%02d' "$1")
  [ -n "${2:-}" ] || die "usage: ./k new <day-number> <slug>"
  d="$DAYS/day-$n-$2"
  [ -d "$d" ] && die "$d already exists"
  mkdir -p "$d/parts" "$d/lab"
  printf -- '---\nday: %s\nplan_version: "v1.2.0"\nstatus: draft\n---\n\n<!-- written by /day-kosha %s -->\n' "$1" "$1" > "$d/LESSON.md"
  printf -- '# Day %s — checklist\n\n' "$1" > "$d/CHECKLIST.md"
  printf 'scaffolded %s\nSections live in parts/NN-<section-slug>/ — two digits, a hyphen, one or two words.\nNow run:  /day-kosha %s\n' "$d" "$1"
}

# ---------------------------------------------------------------- depth
# The mechanical half of the plan's Part 11. The rest is /depth-audit.
cmd_depth() {
  d=$(day_dir "$1")
  F=$(mktemp); trap 'rm -f "$F"' EXIT
  say() { printf '  FAIL  %s\n' "$*" >> "$F"; }

  printf '\ndepth check — %s\n\n' "$(basename "$d")"

  [ -d "$d/parts" ] || say "parts/ is missing — a day without parts/ is not written"

  for f in $(find "$d/parts" -name '*.md' 2>/dev/null | sort); do
    rel=${f#"$d"/}
    inner=${f#"$d"/parts/}
    case "$inner" in
      */*) folder=${inner%%/*}; base=${inner##*/}; sec=${base%%.*}
           num=${folder%%-*}; slug=${folder#"$num"}
           [ "$num" = "$(printf '%02d' "$sec" 2>/dev/null)" ] || \
             say "$rel — folder $folder does not match section $sec"
           case "$slug" in
             -[a-z0-9]*) : ;;
             '') say "parts/$folder/ is a bare number — name it $folder-<section-slug>: one or two words saying what the section is about" ;;
             *)  say "parts/$folder/ — the section slug must be lowercase kebab-case after the number" ;;
           esac ;;
      *)   say "$rel is loose in parts/ — every part lives in its section folder" ;;
    esac

    # the twelve required sections of Part 11.4 (frontmatter checked separately)
    for s in 'One-line answer' 'The story' 'The idea in plain language' \
             'Why the build needs it' 'The mechanism' 'The same thing, three ways' \
             'When it breaks' 'In production' 'Check yourself'; do
      grep -qi "$s" "$f" || say "$rel — missing section: $s"
    done

    grep -q '```' "$f" && ! grep -q '^\*\*Line by line:\*\*' "$f" && \
      say "$rel — has command blocks but no \"**Line by line:**\" walkthrough"

    for key in 'level:' 'danger:' 'sandbox:' 'prev:' 'next:' 'verified:'; do
      grep -q "^$key" "$f" || say "$rel — frontmatter missing $key"
    done

    if grep -qE '^danger: *(caution|destructive)' "$f"; then
      grep -qi 'How to undo it' "$f" || \
        say "$rel — danger is above safe but there is no \"How to undo it\""
    fi
  done

  L="$d/LESSON.md"
  for s in '§1 The story' '§2 The map' '§3 Setup' '§4 The build brief' \
           '§5 The proof' '§6 Blast radius' '§7 Traps' '§8 Verify' \
           '§9 Say it in an interview' '§10 Done when'; do
    grep -q "$s" "$L" || say "LESSON.md — missing $s"
  done
  grep -q '^\*\*Line by line:\*\*' "$L" && \
    say "LESSON.md contains a Line-by-line walkthrough — the hub never teaches"

  # Principle 7: no clocks, anywhere in the day
  if grep -rniE '(should take|[0-9]+ *(min|minute|hour|hr)s? \b|time estimate|^duration:)' "$d" >/dev/null 2>&1; then
    say "clock words found (Principle 7 — a day is a unit of subject, not of time):"
    grep -rniE '(should take|[0-9]+ *(min|minute|hour|hr)s? \b|time estimate|^duration:)' "$d" | sed 's/^/          /' >> "$F"
  fi

  parts=$(find "$d/parts" -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
  boxes=$(grep -c '^- \[.\]' "$d/CHECKLIST.md" 2>/dev/null | head -n1); boxes=${boxes:-0}
  [ "$boxes" -ge "$parts" ] || \
    say "CHECKLIST.md has $boxes boxes for $parts parts — one box per part, minimum"

  if [ -s "$F" ]; then
    cat "$F"; printf '\n  depth: FAILED. Never hand-wave past a depth failure.\n\n'
    return 1
  fi
  printf '  depth: OK (mechanical).\n  Now run  /depth-audit %s  for the half a script cannot see.\n\n' "$1"
  return 0
}

# ---------------------------------------------------------------- sandbox
cmd_sandbox() {
  recipe=${1:-fresh}
  target="$SANDBOX/$recipe"
  rm -rf "$target"; mkdir -p "$target"; cd "$target"
  GIT_AUTHOR_NAME="Sandbox"; GIT_AUTHOR_EMAIL="sandbox@example.invalid"
  GIT_COMMITTER_NAME="Sandbox"; GIT_COMMITTER_EMAIL="sandbox@example.invalid"
  GIT_AUTHOR_DATE="2026-01-01T09:00:00+00:00"; GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"
  export GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL \
         GIT_AUTHOR_DATE GIT_COMMITTER_DATE
  git init -q -b main
  case "$recipe" in
    fresh)
      printf 'water the plants\n' > reminders.md
      git add -A && git commit -qm "first reminder"
      ;;
    conflict)
      printf 'water the plants\ncall the dentist\n' > reminders.md
      git add -A && git commit -qm "two reminders"
      git switch -qc morning
      printf 'water the plants\nstretch\ncall the dentist\n' > reminders.md
      git commit -qam "add a morning reminder"
      git switch -q main && git switch -qc evening
      printf 'water the plants\nread\ncall the dentist\n' > reminders.md
      git commit -qam "add an evening reminder"
      git switch -q main
      ;;
    *)
      printf 'recipe "%s" has no built-in script yet.\nAsk Claude Code:  /sandbox %s\n' "$recipe" "$recipe" >&2
      ;;
  esac
  printf '\nsandbox: %s\n\n' "$target"
  git log --oneline --graph --all 2>/dev/null || true
  printf '\nreset with:  ./k sandbox %s\n\n' "$recipe"
}

# ---------------------------------------------------------------- tracker
cmd_tracker() {
  out="$DOCS/TRACKER.md"
  {
    printf '# Tracker\n\n'
    printf '_Generated by `./k tracker`. Never hand-edit._\n\n'
    printf '| Day | Folder | Parts | Checklist | Status |\n|---:|---|---:|---|---|\n'
    find "$DAYS" -maxdepth 1 -type d -name 'day-*' 2>/dev/null | sort | while read -r d; do
      b=$(basename "$d"); n=$(printf '%s' "$b" | cut -d- -f2)
      parts=$(find "$d/parts" -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
      ticks=$(grep -c '^- \[x\]' "$d/CHECKLIST.md" 2>/dev/null | head -n1); ticks=${ticks:-0}
      boxes=$(grep -c '^- \[.\]' "$d/CHECKLIST.md" 2>/dev/null | head -n1); boxes=${boxes:-0}
      st=$(grep -m1 '^status:' "$d/LESSON.md" 2>/dev/null | sed 's/status: *//' || echo '?')
      printf '| %s | [%s](../days/%s/LESSON.md) | %s | %s/%s | %s |\n' \
        "${n#0}" "$b" "$b" "$parts" "$ticks" "$boxes" "$st"
    done
    printf '\n_Days not listed are not written yet._\n'
  } > "$out"
  printf 'wrote %s\n' "$out"
}

# ---------------------------------------------------------------- done
cmd_done() {
  d=$(day_dir "$1")
  unticked=$(grep -c '^- \[ \]' "$d/CHECKLIST.md" 2>/dev/null || echo 0)
  [ "$unticked" -eq 0 ] || die "day $1 has $unticked unticked checklist boxes — not done."
  cmd_depth "$1"
  cmd_tracker
  printf 'Day %s closed. Commit it.\n' "$1"
}

case "${1:-status}" in
  status)  cmd_status ;;
  start)   shift; cmd_start "$@" ;;
  new)     shift; cmd_new "$@" ;;
  depth)   shift; cmd_depth "$@" ;;
  sandbox) shift; cmd_sandbox "$@" ;;
  tracker) cmd_tracker ;;
  done)    shift; cmd_done "$@" ;;
  *) die "usage: ./k [status|start N|new N slug|depth N|sandbox RECIPE|tracker|done N]" ;;
esac
