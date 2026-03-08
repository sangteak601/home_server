#!/bin/bash

set -e

MUSIC_DIR="/music"
QUERY="$1"

if [ -z "$QUERY" ]; then
  echo "❌ Error: No filename query provided"
  exit 0
fi

echo "Searching for files containing: $QUERY"

# Find matches (case-insensitive)
mapfile -t matches < <(find "$MUSIC_DIR" -type f -iname "*$QUERY*")

COUNT=${#matches[@]}

if [ "$COUNT" -eq 0 ]; then
  echo "❌ Error: No files found matching: $QUERY"
  exit 0
fi

if [ "$COUNT" -gt 1 ]; then
  echo "❌ Error: Multiple files match '$QUERY'. Refusing to delete."
  printf '%s\n' "${matches[@]}"
  exit 0
fi

TARGET="${matches[0]}"

echo "Deleting file: $TARGET"

rm "$TARGET"

echo "✅ File deleted successfully"