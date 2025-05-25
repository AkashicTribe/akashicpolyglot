#!/bin/bash

echo "🌐 AkashicPolyglot • SchmoogleMaster.sh"
echo "🛠️  Recrafting from Fox Scratch..."

BASE=~/Desktop/github/akashicpolyglot

echo "📁 Building structure..."
mkdir -p $BASE/{dictionaries/{dictd,stardict,pdf,csv},grammars/{pdf,epub,txt,markdown},etymologies/{indoeuropean,afroasiatic,pdf,csv,ai-ready}}

echo "📚 Downloading dictionaries..."
cd $BASE/dictionaries/pdf
curl -LO https://archive.org/download/AnEnglishHindiDictionary/AnEnglishHindiDictionary.pdf
curl -LO https://archive.org/download/langenscheidtskon00flue/langenscheidtskon00flue.pdf

echo "📘 Downloading grammar books..."
cd $BASE/grammars/pdf
curl -LO https://archive.org/download/AGrammarOfTheSanskritLanguage/AGrammarOfTheSanskritLanguage.pdf
curl -LO https://archive.org/download/arabicgrammar00wrigrich/arabicgrammar00wrigrich.pdf

echo "🔤 Downloading etymology references..."
cd $BASE/etymologies/pdf
curl -LO https://archive.org/download/IndoEuropeanLexicon/IndoEuropeanLexicon.pdf

echo "📊 Creating CSV lexicon starter pack..."
cat <<EOF > $BASE/dictionaries/csv/sample_lexicon.csv
word,language,meaning,part_of_speech,origin
fire,English,combustion,noun,Old English 'fyr'
agni,Sanskrit,fire,noun,Proto-Indo-European *h₁n̥gʷnís
EOF

echo "🤖 Creating JSON rootmap for AI processing..."
cat <<EOF > $BASE/etymologies/ai-ready/rootmap.json
{
  "agni": {
    "language": "Sanskrit",
    "origin": "Proto-Indo-European *h₁n̥gʷnís",
    "cognates": ["ignis (Latin)", "aṅgār (Persian)"],
    "meaning": "fire"
  },
  "lumen": {
    "language": "Latin",
    "origin": "Proto-Indo-European *lewk-",
    "cognates": ["light (English)", "lux (Latin)", "λύχνος (Greek)"],
    "meaning": "light"
  }
}
EOF

echo "✅ SchmoogleMaster installation complete. Structure ready at:"
echo "$BASE"
echo "💠 All files are now GitHub-committable and HUD-indexable."
