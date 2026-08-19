# Containerimage met alles wat nodig is om het voorstel, het rapport en de
# poster te compileren. Zo hoef je zelf geen LaTeX te installeren.
#
# Debian 13 (trixie) brengt TeX Live 2025 mee. De vorige versie van dit
# sjabloon gebruikte Debian 11 met TeX Live 2020; die ging in augustus 2026
# uit ondersteuning.

FROM debian:trixie-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-lang-european \
    texlive-bibtex-extra \
    texlive-xetex \
    texlive-fonts-recommended \
    biber \
    latexmk \
    python3-pygments \
    fontconfig \
    ghostscript \
    zip \
    git \
    && rm -rf /var/lib/apt/lists/*

# De lettertypes van de HOGENT-huisstijl beschikbaar maken binnen de container
COPY fonts/ /usr/share/fonts/opentype/
RUN fc-cache -f

WORKDIR /project
