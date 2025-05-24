#!/usr/bin/env bash
set -euo pipefail

# Find where Conda is installed
CONDA_BASE=\$(conda info --base)
source "\$CONDA_BASE/etc/profile.d/conda.sh"
conda activate polyglot

python - << 'PYCODE'
from polyglot_bin.scrub import deep_scrub
dirty = open('tests/fixtures/dirty_sample.txt', encoding='utf8').read()
print(deep_scrub(dirty)['clean'])
PYCODE
