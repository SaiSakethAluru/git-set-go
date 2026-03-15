# git-set-go

✨ Tiny repo, big Git comfort.

`git-set-go` is a portable home for the Git setup I actually like using:

- crisp shortcuts for everyday commands
- smarter workflow aliases for stashing and syncing branches
- a one-time setup script for fresh machines

Clone it once, run setup, and your Git muscle memory is ready to go. 🚀

## Why this repo exists

New machines are annoying.
Re-adding favorite aliases is annoying.
Forgetting whether this laptop has your Git name/email/aliases configured is also annoying.

This repo fixes that with a small, reusable setup that keeps the alias definitions in version control and easy to evolve over time.

## Quick Start

Run:

```bash
./scripts/setup.sh
```

What it does:

- sets `user.name` globally if it is not already configured
- sets `user.email` globally if it is not already configured
- adds this repo's `aliases` file to your global Git config using `include.path`

Because the aliases are included by path, this repo stays the source of truth. If you update the [aliases](/Users/saketh/Projects/git-set-go/aliases#L1) file later, Git will automatically use the latest version. Re-running setup is safe and does not remove unrelated aliases. ✅

Want to remove it later?

```bash
./scripts/uninstall.sh
```

## What You Get

### Everyday shortcuts

- `git br` -> `git branch`
- `git cm` -> `git commit`
- `git co` -> `git checkout`
- `git cp` -> `git cherry-pick`
- `git d` -> `git diff`
- `git l` -> `git log`
- `git last` -> `git show HEAD`
- `git poh` -> `git push origin HEAD`
- `git st` -> `git status`

### Smarter helpers

- `git alias [name]` -> list all effective aliases in the current context, or show one alias by name
- `git undo` -> undo the last commit while keeping all changes staged
- `git ss [message]` -> stash changes, optionally with a custom message
- `git sp [index]` -> pop the latest stash or a specific stash like `git sp 2`
- `git sd [index]` -> clear all stashes after confirmation, or drop one specific stash like `git sd 2`
- `git up` -> detect the current branch's upstream remote and its default branch, pull it, return to your branch, then merge with the default merge message

## A Few Nice Touches

- `git up` is not hardcoded to `origin/master`
- fork-style setups are handled cleanly by preferring the current branch's upstream remote
- if the default branch cannot be derived from the upstream remote, it falls back to local `main`, then local `master`
- `git alias` helps you inspect what aliases are actually active in the current repo context

## Philosophy

This repo is intentionally simple:

- the alias file is readable and commented
- setup is one command
- the repo itself is the config source of truth
- updates are easy because the aliases are not copied and forgotten

Small repo. Sharp tools. Happy Git-ing. 🌿
