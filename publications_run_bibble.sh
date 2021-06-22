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

# Copy everything up to and including "BEGIN BIBBLE"
sed '/BEGIN BIBBLE/q' docs/index.html > docs/index.html.tmp

# Generate new publications list and insert
bibble publications_database.bib publications_template.html >> docs/index.html.tmp

# Copy everything after and including "END BIBBLE"
sed -ne '/END BIBBLE/,$ p' docs/index.html  >> docs/index.html.tmp

# Clean up
cp docs/index.html.tmp docs/index.html
rm -f docs/index.html.tmp
