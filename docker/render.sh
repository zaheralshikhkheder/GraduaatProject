#!/bin/bash
# Compileert elk hoofddocument (een .tex met \documentclass) in de opgegeven map
# en geeft de PDF daarna een naam waaraan te zien is van wie ze is.
#
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
  latexmk \
    -file-line-error \
    -interaction=nonstopmode \
    -output-directory="${output_dir}" \
    -shell-escape \
    -synctex=1 \
    -xelatex \
    "${latex_file}"
done

# De naam uit projectgegevens.tex ophalen en de PDF's hernoemen. Zo is aan de
# bestandsnaam te zien van wie een inzending is, zonder dat je die naam ergens
# apart moet bijhouden.
gegevens="${project_root}/projectgegevens.tex"
if [ -f "${gegevens}" ]; then
  naam=$(sed -n 's/^.*newcommand{.bestandsnaam}{\([^}]*\)}.*$/\1/p' "${gegevens}" | head -1)
  if [ -n "${naam}" ] && [ "${naam}" != "Familienaam-Voornaam" ]; then
    for pdf in "${output_dir}"/*.pdf; do
      [ -e "${pdf}" ] || continue
      basis=$(basename "${pdf}" .pdf)
      case "${basis}" in
        "${naam}"-*) ;;                                   # al hernoemd
        *) cp "${pdf}" "${output_dir}/${naam}-${basis}.pdf" ;;
      esac
    done
  fi
fi

echo
echo "Klaar. De PDF's staan in output/"
ls -1 "${output_dir}"/*.pdf 2>/dev/null || echo "Geen PDF gevonden - bekijk de foutmeldingen hierboven."
