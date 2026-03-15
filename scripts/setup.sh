#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
alias_file="$repo_root/aliases"

if [[ ! -f "$alias_file" ]]; then
  echo "Alias file not found: $alias_file" >&2
  exit 1
fi

current_name="$(git config --global --get user.name || true)"
current_email="$(git config --global --get user.email || true)"

if [[ -z "$current_name" ]]; then
  read -r -p "Enter the git user.name to use globally: " current_name
  if [[ -z "$current_name" ]]; then
    echo "user.name cannot be empty." >&2
    exit 1
  fi
  git config --global user.name "$current_name"
fi

if [[ -z "$current_email" ]]; then
  read -r -p "Enter the git user.email to use globally: " current_email
  if [[ -z "$current_email" ]]; then
    echo "user.email cannot be empty." >&2
    exit 1
  fi
  git config --global user.email "$current_email"
fi

if ! git config --global --get-all include.path | grep -Fqx "$alias_file"; then
  git config --global --add include.path "$alias_file"
fi

echo "Git setup complete."
echo "Aliases file:"
echo "  $alias_file"
echo "Global user.name:"
echo "  $(git config --global --get user.name)"
echo "Global user.email:"
echo "  $(git config --global --get user.email)"
