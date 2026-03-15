#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
alias_file="$repo_root/aliases"

git config --global --unset-all include.path "$alias_file" 2>/dev/null || true

echo "Removed git alias include path:"
echo "  $alias_file"
