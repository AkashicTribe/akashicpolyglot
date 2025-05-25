#!/bin/bash

echo "🌀 DonnieDarko PathMap Protocol v1.0"
echo "🔮 Mapping symlinks and metaphysical folder wormholes..."

TARGET_DIR="${1:-$HOME/Desktop/github/akashicpolyglot}"

echo "📦 Target Directory: $TARGET_DIR"
echo ""

echo "📍 Locating all symbolic links..."
find "$TARGET_DIR" -type l -exec ls -lh {} \; | awk '{print $9 " -> " $10}' > $TARGET_DIR/pathmap_links.txt

echo "🌌 Mapping complete symbolic wormholes into pathmap_links.txt"
echo "🗺️ Contents of wormhole map:"
cat $TARGET_DIR/pathmap_links.txt
echo ""
echo "✅ DonnieDarko PathMap Complete. For deeper chronolocution, rerun with: ./donnie_darko_pathmap.sh /path/to/folder"
