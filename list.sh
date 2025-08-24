#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/config.conf"

ls -1t "$DEST"/*.tar.gz 2>/dev/null || { echo "No snapshots yet."; exit 0; }
