#!/bin/sh
entry="$1"
if [ -d "$entry" ]; then
  eza --tree --level=2 --color=always "$entry"
elif file --mime-type "$entry" 2>/dev/null | grep -q "image/"; then
  kitten icat --clear --transfer-mode=memory --unicode-placeholder --stdin=no \
    --place="${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@${FZF_PREVIEW_LEFT}x${FZF_PREVIEW_TOP}" \
    "$entry"
elif echo "$entry" | grep -qiE "\.(md|markdown)$"; then
  sed 's/!\[.*\]([^)]*)/[image]/g; s/<img[^>]*>//g' "$entry" | mdcat --columns "${FZF_PREVIEW_COLUMNS:-80}" -
else
  bat --color=always --style=numbers --line-range=:500 "$entry" 2>/dev/null || file "$entry"
fi
