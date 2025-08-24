#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/config.conf"

ts=$(date +%Y%m%d-%H%M%S)
archive="$DEST/$ts.tar.gz"
mkdir -p "$DEST"

# Build exclude args safely
args=()
for pat in $EXCLUDES; do args+=( --exclude="$pat" ); done

# Make the archive (warnings OK; fail on non-zero exit)
tar -czf "$archive" "${args[@]}" $SOURCES
echo "Wrote $archive"

GPG_PASS=$(<~/.gpg.pass)
gpg --batch --yes --passphrase "$GPG_PASS" --symmetric --cipher-algo AES256 "$archive"
rm "$archive"  # Delete the unencrypted file
echo "Encrypted $archive.gpg ✅"
