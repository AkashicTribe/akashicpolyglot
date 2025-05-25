#!/bin/bash

echo "🔮 Initializing Omnicodex Directory Structure..."

# Create directory structure
mkdir -p ~/Omnicodex/{glyphs,audio,scripts,texts,documents,web,bundle}

# Move files into respective folders
mv Omnicodex_Invocation_Sigil.png ~/Omnicodex/glyphs/
mv Omnicodex_Transcendental_GlyphGrid.svg ~/Omnicodex/glyphs/
mv Omnicodex_AudioSigil_Waveform.tiff ~/Omnicodex/glyphs/

mv Omnicodex_AudioSigil.flac ~/Omnicodex/audio/

mv omni_convergence_divergence_phi_e.sh ~/Omnicodex/scripts/

mv Omnicodex_Transcendental_Output.md ~/Omnicodex/texts/
mv Omnicodex_Transcendental_Output.csv ~/Omnicodex/texts/
mv Omnicodex_Print_Layout.pdf ~/Omnicodex/texts/

mv Omnicodex_Transcendental_Output.xlsx ~/Omnicodex/documents/
mv Omnicodex_Transcendental_Output.pdf ~/Omnicodex/documents/

mv Omnicodex_Glyphboard.html ~/Omnicodex/web/

mv Omnicodex_Totality_Bundle.zip ~/Omnicodex/bundle/

# Create manifest
cat <<EOF > ~/Omnicodex/README.md
# Omnicodex

This directory houses the complete Omnicodex Totality Bundle, including glyphs, audio sigils, scripts, and ritual documentation.

Invoke with clarity. Dream with code. Speak only in symbols.

φe | AkashicTribe
EOF

echo "✅ Omnicodex environment ready at ~/Omnicodex/"
