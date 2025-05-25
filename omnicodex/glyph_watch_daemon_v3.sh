#!/bin/bash

# ╔══════════════════════════════════════════════╗
# ║   🌀 GLYPH WATCHER DAEMON ∇~∷ v3.0 (AUTOMATED) ║
# ╚══════════════════════════════════════════════╝
# - Background daemon for glyph CSV detection
# - Log rotation, auto-restart, user notification
# - Symbolic metadata + .sigil file generation

WATCH_DIR="$HOME/Desktop/github/akashicpolyglot/omnicodex"
LOG_FILE="$HOME/.mas.extinct.log"
MAX_LOG_SIZE=1000000  # 1MB
DAEMON_NAME="glyph_watch_daemon"

echo "Daemon started silently at $(date)" >> "$LOG_FILE"

# Background-safe run
nohup bash -c '
  while true; do
    inotifywait -e create -e moved_to --format "%w%f" "$WATCH_DIR" | while read FILE; do
      if [[ "$FILE" == *.csv ]]; then
        # Timestamp and metadata
        NOW=$(date "+%Y-%m-%d %H:%M:%S")
        FILENAME=$(basename "$FILE")
        GLYPH_COUNT=$(grep -o '[𐤁-𐌔]' "$FILE" | wc -l)
        FILE_HASH=$(shasum -a 256 "$FILE" | awk "{print \$1}")
        SIGIL_PATH="${FILE%.csv}.sigil"

        # Log rotation
        if [ -f "$LOG_FILE" ] && [ $(stat -f%z "$LOG_FILE") -ge $MAX_LOG_SIZE ]; then
          mv "$LOG_FILE" "$LOG_FILE.bak"
          echo "🔄 Log rotated at $NOW" > "$LOG_FILE"
        fi

        # Append symbolic metadata to log
        echo "📜 [$NOW] CSV Detected: $FILENAME | Glyphs: $GLYPH_COUNT | Hash: $FILE_HASH ∇~∷" >> "$LOG_FILE"

        # Generate .sigil file
        echo "sigil_meta:" > "$SIGIL_PATH"
        echo "  file: $FILENAME" >> "$SIGIL_PATH"
        echo "  detected: $NOW" >> "$SIGIL_PATH"
        echo "  glyph_count: $GLYPH_COUNT" >> "$SIGIL_PATH"
        echo "  hash: $FILE_HASH" >> "$SIGIL_PATH"

        # Send local notification (macOS)
        osascript -e "display notification \"CSV glyph file detected: $FILENAME\" with title \"Glyph Daemon\""

      fi
    done
  done
' >/dev/null 2>&1 &
