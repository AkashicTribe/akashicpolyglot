#!/bin/bash

echo "🔍 Omnicodex Manifest Integrity Check ∇~∷"

BASE_DIR=~/github/akashicpolyglot/omnicodex

declare -a folders=("glyphs" "audio" "scripts" "texts" "documents" "web" "bundle")
declare -a required_files=(
    "omni_convergence_divergence_phi_e.sh"
    "Omnicodex_AudioSigil.flac"
    "Omnicodex_Invocation_Sigil.png"
    "Omnicodex_Transcendental_Output.xlsx"
    ".omni.yml"
)

echo "📂 Checking directories..."
for dir in "${folders[@]}"; do
    if [ -d "$BASE_DIR/$dir" ]; then
        echo "✅ $dir/ exists"
    else
        echo "❌ MISSING: $dir/"
    fi
done

echo ""
echo "📄 Checking core files..."
for file in "${required_files[@]}"; do
    if [ -f "$BASE_DIR/$file" ] || [ -f "$BASE_DIR/scripts/$file" ]; then
        echo "✅ $file found"
    else
        echo "❌ MISSING: $file"
    fi
done

echo ""
echo "✨ Omnicodex status check complete."
