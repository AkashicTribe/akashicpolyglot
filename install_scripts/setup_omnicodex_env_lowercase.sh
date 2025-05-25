#!/bin/bash

echo "🔧 Initializing Omnicodex Directory Structure (lowercase mode)..."

# Create lowercase directory structure
mkdir -p ~/github/akashicpolyglot/omnicodex/{glyphs,audio,scripts,texts,documents,web,bundle}

# Move files into respective folders (assumes you're in the base github/akashicpolyglot/omnicodex folder)
cd ~/github/akashicpolyglot/omnicodex || exit

mv *Invocation_Sigil* glyphs/ 2>/dev/null
mv *.svg glyphs/ 2>/dev/null
mv *.tiff glyphs/ 2>/dev/null

mv *.flac audio/ 2>/dev/null

mv *.sh scripts/ 2>/dev/null

mv *.md texts/ 2>/dev/null
mv *.csv texts/ 2>/dev/null
mv *Layout.pdf texts/ 2>/dev/null

mv *.xlsx documents/ 2>/dev/null
mv *Output.pdf documents/ 2>/dev/null

mv *.html web/ 2>/dev/null

mv *.zip bundle/ 2>/dev/null

# Create manifest
cat <<EOF > README.md
# omnicodex

This lowercase edition houses the complete Omnicodex Totality Bundle, including glyphs, audio sigils, scripts, and ritual documentation.

Invoked with lowercase reverence.
φe | AkashicTribe
EOF

echo "✅ omnicodex (lowercase) environment sorted at ~/github/akashicpolyglot/omnicodex/"
