#!/bin/bash

echo "📦 Setting up Akashic Polyglot Master Pack structure..."

ROOT=~/Desktop/github/akashicpolyglot

mkdir -p $ROOT/dictionaries/dictd
mkdir -p $ROOT/dictionaries/stardict
mkdir -p $ROOT/dictionaries/pdf
mkdir -p $ROOT/dictionaries/csv

mkdir -p $ROOT/grammars/pdf
mkdir -p $ROOT/grammars/epub
mkdir -p $ROOT/grammars/txt
mkdir -p $ROOT/grammars/markdown

mkdir -p $ROOT/etymologies/indoeuropean
mkdir -p $ROOT/etymologies/afroasiatic
mkdir -p $ROOT/etymologies/pdf
mkdir -p $ROOT/etymologies/csv
mkdir -p $ROOT/etymologies/ai-ready

echo "📖 Downloading public domain dictionaries..."
cd $ROOT/dictionaries/pdf
curl -LO https://archive.org/download/AnEnglishHindiDictionary/AnEnglishHindiDictionary.pdf
curl -LO https://archive.org/download/langenscheidtskon00flue/langenscheidtskon00flue.pdf

echo "📖 Downloading grammar books..."
cd $ROOT/grammars/pdf
curl -LO https://archive.org/download/AGrammarOfTheSanskritLanguage/AGrammarOfTheSanskritLanguage.pdf
curl -LO https://archive.org/download/arabicgrammar00wrigrich/arabicgrammar00wrigrich.pdf

echo "🔤 Downloading etymology resources..."
cd $ROOT/etymologies/pdf
curl -LO https://archive.org/download/IndoEuropeanLexicon/IndoEuropeanLexicon.pdf

echo "🧠 Creating CSV template lexicons..."
echo "word,language,meaning,part_of_speech,origin" > $ROOT/dictionaries/csv/sample_lexicon.csv
echo "fire,English,combustion,noun,Old English 'fyr'" >> $ROOT/dictionaries/csv/sample_lexicon.csv
echo "agni,Sanskrit,fire,noun,Proto-Indo-European *h₁n̥gʷnís" >> $ROOT/dictionaries/csv/sample_lexicon.csv

echo "🧬 Creating AI-ready etymology JSON file..."
cat <<EOF > $ROOT/etymologies/ai-ready/rootmap.json
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

echo "✅ Master Pack installed. Explore your knowledge domains at $ROOT"
