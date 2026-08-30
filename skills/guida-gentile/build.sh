#!/usr/bin/env bash
# Impacchetta la skill nello zip pronto per l'upload su claude.ai.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist/guida-gentile.zip
mkdir -p dist
zip -r dist/guida-gentile.zip guida-gentile \
  -x '*/dist/*' '*.zip' '*/.DS_Store' '*/__pycache__/*' >/dev/null
echo "Pronto: $(pwd)/dist/guida-gentile.zip"
unzip -l dist/guida-gentile.zip | tail -n +4 | head -n -2
