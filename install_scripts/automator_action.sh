#!/usr/bin/env bash
set -euo pipefail
# Capture screenshot & export both UTF-8/UTF-16 CSVs
source "\$HOME/mambaforge/etc/profile.d/conda.sh"
conda activate polyglot
TARGET_DIR="\$HOME/Desktop/GitHub/akashicpolyglot/exports"
mkdir -p "\$TARGET_DIR"
TS=\$(date +%Y%m%dT%H%M%S)
screencapture -ci
sleep 0.3
polyglot "\$TARGET_DIR/\${TS}_utf8.csv" --encoding utf-8
polyglot "\$TARGET_DIR/\${TS}_utf16.csv" --encoding utf-16-le
osascript -e "display notification \"Exports saved to exports/\" with title \"\$TS\" subtitle \"akashicpolyglot\""
