#!/bin/bash
echo "🔮 Summoning esoteric overlays, sacred symbols, and glyphic HUD..."
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip"
SYMBOLA_URL="https://dn-works.com/wp-content/uploads/2020/UFAS-Fonts/Symbola.zip"
mkdir -p ~/akashicpolyglot/esoteric_fonts
cd ~/akashicpolyglot/esoteric_fonts

echo "📥 Downloading Nerd Font (Hack)..."
curl -LO $NERD_FONT_URL && unzip Hack.zip -d nerdfont

echo "📥 Downloading Symbola Unicode Font..."
curl -LO $SYMBOLA_URL && unzip Symbola.zip -d symbola

cp nerdfont/*.ttf ~/Library/Fonts/
cp symbola/*.ttf ~/Library/Fonts/

echo "🧿 Fonts installed. Restart terminal for glyphic magic."
