#!/bin/bash
# Maakt output/overleaf.zip: alles wat je nodig hebt om in Overleaf verder te
# werken. Handig wanneer je op je stagelaptop geen Docker mag installeren.
#
# Wordt aangeroepen vanuit make_overleaf.sh of make_overleaf.bat.

set -o errexit
set -o nounset

readonly project_root="${PROJECT_ROOT:-/project}"
cd "${project_root}"

mkdir -p output
rm -f output/overleaf.zip

zip -r -q output/overleaf.zip \
  projectgegevens.tex \
  gradproject voorstel poster graphics fonts \
  -x '*.git*' '*/output/*' '*.pdf' '*.aux' '*.log' '*.bbl' '*.bcf' \
     '*.blg' '*.fls' '*.fdb_latexmk' '*.synctex.gz' '*.xdv' '*.run.xml'

echo
echo "output/overleaf.zip is klaar."
echo
echo "In Overleaf:"
echo "  1. New Project > Upload Project, en kies dit zipbestand."
echo "  2. Menu > Compiler: zet op XeLaTeX (niet pdfLaTeX)."
echo "  3. Menu > Main document: kies gradproject/rapport.tex,"
echo "     voorstel/voorstel.tex of poster/poster.tex naargelang wat je bouwt."
echo
echo "Let op: Overleaf schrijft niet naar de map output/. Wil je het rapport"
echo "daar compileren, verwijder dan in gradproject/rapport.tex de regel met"
echo "outputdir als die er nog staat - bij minted 3 hoort ze er sowieso niet."
