 set -euo pipefail
. "$(dirname "$0")/config.conf"

[ -d "$DEST" ] || { echo "No snapshots dir: $DEST"; exit 0; }
cd "$DEST"

# Newest first; anything after KEEP_LAST gets deleted (dry-run by default)
to_delete=$(ls -1t *.tar.gz.gpg 2>/dev/null | tail -n +$((KEEP_LAST+1)) || true)
[ -n "$to_delete" ] || { echo "Nothing to prune."; exit 0; }


echo "Pruning candidates:"
printf '  %s\n' $to_delete

if [[ "$1" =~ "--apply" ]]; then
  printf '%s\n' $to_delete | while read -r file; do
    rm -f -- "$file"
    echo "$(date '+%Y-%m-%d %H:%M:%S') | Pruned: $file" >> "$HOME/backup.log"
  done
  echo "✅ Prune complete."
else
  echo "(dry-run) add --apply to delete"
fi
