#!/usr/bin/env bash
# Bouwt de poster tot een PDF in output/, met LaTeX uit een containerimage.
# Je hebt hiervoor enkel Docker (of Podman) nodig, geen LaTeX-installatie.
#
# Gebruik:  ./make_poster.sh
# Resultaat: output/poster.pdf

set -o nounset
set -o errexit

readonly image_naam="gradproject-tex"
readonly bron_map="poster"

if command -v podman > /dev/null 2>&1; then
  echo "Podman gevonden"
  container_cmd="$(command -v podman)"
  # Zonder deze mount-optie ziet de container het gedeelde volume niet
  mount_opts=":Z"
elif command -v docker > /dev/null 2>&1; then
  echo "Docker wordt gebruikt"
  container_cmd="$(command -v docker)"
  mount_opts=""
else
  echo "Fout: noch Docker noch Podman gevonden. Installeer Docker Desktop." >&2
  exit 1
fi

# Git Bash en MSYS op Windows zetten /project om naar een Windows-pad, waardoor
# de container het script niet terugvindt. Deze twee regels voorkomen dat.
export MSYS_NO_PATHCONV=1
if command -v cygpath > /dev/null 2>&1; then
  project_dir="$(cygpath -m "$PWD")"
else
  project_dir="$PWD"
fi

# Bouw het image met alle LaTeX-pakketten en lettertypes.
# Enkel de eerste keer duurt dit lang; daarna komt het uit de cache.
"${container_cmd}" build --tag "${image_naam}" --file docker/Dockerfile .

# Compileer
"${container_cmd}" run --rm \
  --volume "${project_dir}":/project"${mount_opts}" \
  "${image_naam}" sh /project/docker/render.sh "${bron_map}"
