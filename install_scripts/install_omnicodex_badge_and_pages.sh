#!/bin/bash

echo "🌀 Finalizing Omnicodex Integration ∇~∷"

cd ~/Desktop/github/akashicpolyglot || exit 1

README_FILE="README.md"

# Insert badge if not already present
if ! grep -q "omnicheck.yml/badge.svg" "$README_FILE"; then
  echo "📛 Adding status badge to README..."
  sed -i '' '1s;^;![Omnicheck](https://github.com/AkashicTribe/akashicpolyglot/actions/workflows/omnicheck.yml/badge.svg)\n\n;' "$README_FILE"
else
  echo "✅ Badge already present in README."
fi

# Create docs folder and symbolic index (if not exist)
if [ ! -d "docs" ]; then
  echo "📂 Creating docs/ for GitHub Pages..."
  mkdir docs
  cp omnicodex/Omnicodex_Glyphboard.html docs/index.html
else
  echo "✅ docs/ directory already exists."
fi

# Git add/commit/push everything
git add README.md docs/
git commit -m "🪬 Added Omnicheck badge + GitHub Pages glyphboard ∇~∷" || echo "No README/docs changes to commit"
git push

echo "🚀 Deployment complete. Visit your Pages at: https://AkashicTribe.github.io/akashicpolyglot/"
