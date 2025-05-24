#!/bin/bash

echo "🔠 Installing ALL Fonts from fonts-main..."

FONT_DIR=~/Desktop/github/akashicpolyglot/fonts/schmoogle/fonts-main
find "$FONT_DIR" -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp -v "{}" ~/Library/Fonts/ \;

echo "✅ Fonts installed to ~/Library/Fonts"

echo "🗂 Creating ~/akashicpolyglot/dictionaries directory..."
mkdir -p ~/akashicpolyglot/dictionaries
cd ~/akashicpolyglot/dictionaries

echo "📚 Downloading universal offline dictionaries..."
curl -O ftp://ftp.dict.org/pub/dict/pre/dictd-www.dict.org.dictd.tar.gz
tar -xvzf dictd-www.dict.org.dictd.tar.gz

echo "🎹 Reminder: Add all macOS multilingual keyboards via:"
echo "System Preferences → Keyboard → Input Sources → +"

echo "📖 To download full grammar books, visit:"
echo " - https://archive.org"
echo " - https://glossika.com"
echo " - https://openlibrary.org"
echo "Search terms: 'grammar PDF', 'language course', 'polyglot primer'"

echo "🌍 For even more keyboards:"
echo "Download and install Keyman: https://keyman.com/mac"

echo "✅ All done! Your Akashic Polyglot Powerstation is live."
