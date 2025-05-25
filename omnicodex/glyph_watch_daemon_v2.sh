#!/bin/bash

# ╔════════════════════════════════════════════╗
# ║   🌀 GLYPH WATCHER DAEMON ∇~∷ v2.0        ║
# ╚════════════════════════════════════════════╝
# Watches the Omnicodex vault for new glyph-linked CSV files
# and logs activations into mas.extinct.log

WATCH_DIR="$HOME/Desktop/github/akashicpolyglot/omnicodex"
LOG_FILE="$HOME/.mas.extinct.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "🌀 Glyph Watcher Daemon initialized at $TIMESTAMP" >> "$LOG_FILE"

inotifywait -m -e create -e moved_to --format '%T %f' --timefmt '%Y-%m-%d %H:%M:%S' "$WATCH_DIR" | while read TIME FILE; do
  if [[ "$FILE" == *.csv ]]; then
    echo "🔍 [$TIME] CSV Glyph Matrix Detected: $FILE → Omnicodex Vault ∇~∷" >> "$LOG_FILE"
    echo "🧬 Codex activated with glyph matrix: $FILE"
  fi
done
