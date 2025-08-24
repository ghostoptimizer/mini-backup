#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/config.conf"

snap="${1:-latest}"
target="${2:-$HOME/restore-test}"

if [ "$snap" = "latest" ]; then
  snap=$(ls -1t "$DEST"/*.tar.gz 2>/dev/null | head -n1 || true)
fi

[ -f "$snap" ] || { echo "Snapshot not found: $snap"; exit 1; }

mkdir -p "$target"
if [ "${DRY_RUN:-0}" = "1" ]; then
  echo "(dry-run) first 50 entries in $snap:"
  tar -tzf "$snap" | head -n 50
else
  tar -xzf "$snap" -C "$target"
  echo "Restored to $target"
fi
