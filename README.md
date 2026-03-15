# git-set-go
Handy git aliases, functions and other tools that can make my life easier.

## Install

Run the setup script from this repo:

```bash
./scripts/setup.sh
```

This does two things:

- sets `user.name` and `user.email` globally if they are not already configured
- adds the repo's `aliases` file to your global git config through `include.path`

Because the aliases are included by path, this repo stays the source of truth. Updating the `aliases` file updates what Git sees the next time you run an aliased command. Re-running setup is safe and does not remove unrelated aliases.

To remove it later:

```bash
./scripts/uninstall.sh
```

## Aliases

The repo currently includes:

- `git alias [name]` -> list all effective aliases in the current context, or show one alias by name
- `git st` -> `git status`
- `git poh` -> `git push origin HEAD`
- `git co` -> `git checkout`
- `git br` -> `git branch`
- `git d` -> `git diff`
- `git undo` -> undo the last commit while keeping the changes staged
- `git up` -> detect the current branch's upstream remote and its default branch, pull it, return to your branch, then merge with the default merge message
- `git ss [message]` -> stash changes, optionally with a custom message
- `git sp [index]` -> pop the latest stash or a specific stash index such as `git sp 2`
- `git sd [index]` -> clear all stashes after confirmation, or drop a specific stash index such as `git sd 2`
- `git l` -> `git log`
- `git last` -> `git show HEAD`
- `git cp` -> `git cherry-pick`

`git up` prefers the current branch's upstream remote and that remote's default branch. If that cannot be determined, it falls back to local `main` and then `master`.
