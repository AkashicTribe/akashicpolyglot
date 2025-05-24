#!/usr/bin/env bash
set -euo pipefail

CONDA_BASE=\$(conda info --base)
source "\$CONDA_BASE/etc/profile.d/conda.sh"
conda activate polyglot

polyglot tests/fixtures/sample.png /tmp/test_utf8.csv --encoding utf-8

python - << 'PYCODE'
import pandas as pd
from polyglot_bin.mas import verify_mas_compliance
df = pd.read_csv('/tmp/test_utf8.csv', encoding='utf-8')
verify_mas_compliance(df, 'utf-8')
print('MAS check passed')
PYCODE
