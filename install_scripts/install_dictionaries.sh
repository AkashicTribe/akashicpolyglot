#!/bin/bash
echo "📚 Installing Offline Universal Dictionaries..."
mkdir -p ~/akashicpolyglot/dictionaries
cd ~/akashicpolyglot/dictionaries
curl -O ftp://ftp.dict.org/pub/dict/pre/dictd-www.dict.org.dictd.tar.gz
tar -xvzf dictd-www.dict.org.dictd.tar.gz
echo "✅ Dictionaries unpacked and ready in ~/akashicpolyglot/dictionaries"
