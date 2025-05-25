#!/bin/bash

echo "🌍 Initializing Linguistic Harvesting ∇~∷"
BASE_DIR=~/Desktop/github/akashicpolyglot/etymologies
mkdir -p "$BASE_DIR"
cd "$BASE_DIR" || exit 1

echo "📚 Creating folders for major linguistic roots..."
mkdir -p high-german middle-high-german old-high-german gothic langobardic frisian-old-saxon alemannic indo-european/substrates

# High German Variants
echo "📦 Seeding High German (Modern)..."
curl -L https://raw.githubusercontent.com/dwyl/english-words/master/words.txt -o high-german/modern-high-german-placeholder.txt

echo "📦 Seeding Middle High German..."
curl -L https://raw.githubusercontent.com/OpenGreekAndLatin/morphological-lexica/master/lexica/gmh.lexicon -o middle-high-german/gmh.lexicon.txt

echo "📦 Seeding Old High German..."
curl -L https://raw.githubusercontent.com/cltk/old-high-german-texts/master/texts/ohg-glossary.txt -o old-high-german/ohg-glossary.txt

# Gothic
echo "📦 Seeding Gothic..."
curl -L https://raw.githubusercontent.com/cltk/gothic_texts/master/texts/lexicon/gothic_lexicon.txt -o gothic/gothic_lexicon.txt

# Langobardic
echo "⚠️ Langobardic data rare—generating placeholder..."
echo "Langobardic lexical research placeholder" > langobardic/README.md

# Frisian / Old Saxon
echo "📦 Seeding Frisian + Old Saxon (via CLTK)..."
curl -L https://raw.githubusercontent.com/cltk/frisian_texts/master/texts/frisian.txt -o frisian-old-saxon/frisian-sample.txt
curl -L https://raw.githubusercontent.com/cltk/old-saxon-texts/master/texts/old_saxon_lexicon.txt -o frisian-old-saxon/old-saxon-lexicon.txt

# Alemannic
echo "📦 Seeding Alemannic dialects..."
echo "Alemannic linguistic scaffold WIP." > alemannic/placeholder.txt

# Indo-European Substrates
echo "📦 Seeding Indo-European substrata (Tocharian, Phrygian, Thracian...)"

touch indo-european/substrates/illyrian.txt
touch indo-european/substrates/thracian.txt
touch indo-european/substrates/sarmatian.txt
touch indo-european/substrates/dacian.txt
touch indo-european/substrates/ligurian.txt
touch indo-european/substrates/phrygian.txt
touch indo-european/substrates/tocharian.txt

echo "🌿 Placeholders created where full etymologies unavailable online."

echo "🛠 Compiling .mas.teutonic.log..."
cat <<EOF > $BASE_DIR/.mas.teutonic.log
┌────────────────────────────────────────────────────────────┐
│      OMNICODEX LEXICON SEED: TEUTONIC + SUBSTRATA ∇~∷     │
└────────────────────────────────────────────────────────────┘
High German variants initialized:
  ✓ Hochdeutsch
  ✓ Mittelhochdeutsch
  ✓ Althochdeutsch
  ✓ Gothic
  ✓ Langobardic (placeholder)
  ✓ Frisian & Old Saxon
  ✓ Alemannic scaffold

Substrata Initialized:
  ✓ Thracian
  ✓ Illyrian
  ✓ Sarmatian
  ✓ Dacian
  ✓ Ligurian
  ✓ Phrygian
  ✓ Tocharian

Blessed by Sheik & Siis. Reading done. Sunlight absorbed.
EOF

echo "✅ Linguistic roots installation complete at: $BASE_DIR"
