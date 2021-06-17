#!/bin/bash
set -Eeuo pipefail

# Sanity checks
if ! grep -q "BEGIN BIBBLE" docs/index.html; then
  echo "Error: can't find 'BEGIN BIBBLE' in docs/index.html"
  exit 1
fi
if ! grep -q "END BIBBLE" docs/index.html; then
  echo "Error: can't find 'END BIBBLE' in docs/index.html"
  exit 1
fi

# Back up
cp docs/index.html docs/index.html.bak

# Copy everything up to and including "BEGIN BIBBLE"
sed '/BEGIN BIBBLE/q' docs/index.html.bak > docs/index.html

# Generate new publications list and insert
bibble awdeorio.bib bibble_template.html >> docs/index.html

# Copy everything after and including "END BIBBLE"
sed -ne '/END BIBBLE/,$ p' docs/index.html.bak  >> docs/index.html

# Clean up
rm -f docs/index.html.bak
