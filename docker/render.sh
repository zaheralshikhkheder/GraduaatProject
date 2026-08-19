#!/bin/bash
# Compileert elk hoofddocument (een .tex met \documentclass) in de opgegeven map.
# Wordt aangeroepen vanuit make_report.sh, make_voorstel.sh en make_poster.sh.

set -o errexit
set -o nounset

readonly source_dir="${1}"
readonly output_dir="../output"

# Standaard draait dit in de container, waar het project op /project staat.
# De Forgejo-workflow zet PROJECT_ROOT op de werkmap van de repository.
readonly project_root="${PROJECT_ROOT:-/project}"

cd "${project_root}/${source_dir}"

source_files=$(grep --files-with-match '\\documentclass' ./*.tex)

for latex_file in ${source_files}; do
  echo "========== ${latex_file} wordt gecompileerd =========="
  latexmk     -file-line-error     -interaction=nonstopmode     -output-directory="${output_dir}"     -shell-escape     -synctex=1     -xelatex     "${latex_file}"
done

echo
echo "Klaar. De PDF's staan in output/"
ls -1 "${output_dir}"/*.pdf 2>/dev/null || echo "Geen PDF gevonden - bekijk de foutmeldingen hierboven."
