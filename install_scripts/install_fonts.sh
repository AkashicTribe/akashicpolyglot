#!/bin/bash
echo "🔠 Installing ALL Fonts from fonts-main..."
FONT_DIR=~/Desktop/github/akashicpolyglot/fonts/schmoogle/fonts-main
find "$FONT_DIR" -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp -v "{}" ~/Library/Fonts/ \;
echo "✅ Fonts installed to ~/Library/Fonts"
