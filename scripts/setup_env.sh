#!/usr/bin/env bash
set -euo pipefail
# Create/activate polyglot env and install dependencies
conda init zsh
exec \$SHELL
mamba create -n polyglot python=3.11 -y
mamba activate polyglot
mamba install -c conda-forge tesseract pytesseract pillow pandas click chardet -y
