#!/bin/bash

set -e

# --- CONFIG ---
DEST_DIR="/music"           # Change this to your preferred directory
TMP_DIR="/tmp/downloads"    # Temporary directory for downloads

# --- CHECK DEPENDENCIES ---
if ! command -v yt-dlp &>/dev/null; then
  echo "Error: yt-dlp not found. Please install it first." >&2
  exit 1
fi

# --- VALIDATE INPUT ---
if [ $# -lt 1 ]; then
  echo "Usage: $0 <url>" >&2
  exit 1
fi

# --- VALIDATE DEST DIR EXISTS ---
if [ ! -d "$DEST_DIR" ]; then
  echo "Error: destination directory '$DEST_DIR' does not exist." >&2
  exit 1
fi


URL="$1"

# --- CREATE DIRECTORIES ---
mkdir -p "$TMP_DIR" "$DEST_DIR"

# --- DOWNLOAD FILE ---
echo "Downloading from: $URL"
yt-dlp -x --audio-format mp3 -o "$TMP_DIR/%(title)s.%(ext)s" "$URL" 2>&1 || {
  echo "Error: yt-dlp failed." >&2
  exit 1
}

# --- MOVE FILE ---
echo "Moving files to $DEST_DIR ..."
mv "$TMP_DIR"/*.mp3 "$DEST_DIR"/ 2>/dev/null || {
  echo "No MP3 files found to move." >&2
  exit 1
}

echo "✅ Download complete!"
