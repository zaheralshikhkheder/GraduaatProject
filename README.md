# Graduaatsproject Programmeren — LaTeX-sjablonen

Academiejaar 2026-2027 · Graduaat in het Programmeren · HOGENT

Deze repository bevat de drie documenten die je voor je graduaatsproject
oplevert, elk als LaTeX-sjabloon:

| Map | Wat | Wanneer | Bouwen met |
|---|---|---|---|
| [`voorstel/`](./voorstel/) | Je **projectvoorstel** | begin van het semester | `make_voorstel` |
| [`gradproject/`](./gradproject/) | Je **rapport** | einde van het semester | `make_report` |
| [`poster/`](./poster/) | Je **poster** | einde van het semester | `make_poster` |

**Je levert altijd een PDF in.** De PDF's worden gebouwd uit deze sjablonen en
komen in de map `output/` terecht.

## Waarover dit gaat — en waarover niet

Je graduaatsproject is een **project**, geen onderzoek. Je vertrekt niet van een
onderzoeksvraag en je schrijft geen literatuurstudie. Je analyseert een concreet
probleem bij je stagebedrijf, je ontwerpt een oplossing, je bouwt ze, je toont
dat ze werkt, en je verantwoordt je keuzes.

Het project gebeurt **bij je stagebedrijf, in afspraak met je mentor daar, en
wordt goedgekeurd door de lesgever van het opleidingsonderdeel
Graduaatsproject**. Wie wat doet:

- **jij** — je kiest, ontwerpt, bouwt en verdedigt, zo zelfstandig mogelijk;
- **je mentor** (bij het bedrijf) — stemt het onderwerp mee af, bevestigt de
  afbakening, en zit in de jury;
- **je begeleider** (de lesgever van het opleidingsonderdeel) — keurt je
  voorstel goed en bewaakt het niveau.

Je stage en je graduaatsproject lopen bij hetzelfde bedrijf, maar het zijn twee
verschillende dingen. Je stage is het lopende werk in het team; je
graduaatsproject is het afgebakende geheel van ongeveer **tien werkdagen (±100
uren)** dat je zelfstandig oplevert. **Die afbakening is het belangrijkste dat
je in je voorstel en in je rapport duidelijk maakt** — de jury beoordeelt je
project, niet je stage.

## Aan de slag

### 1. Haal de sjablonen binnen

De sjablonen staan in de Forgejo van de opleiding. Je begeleider bezorgt je de
juiste kloonlink en je toegang.

```console
$ git clone <kloonlink-van-het-sjabloon> mijn-graduaatsproject
$ cd mijn-graduaatsproject
```

**Maak er daarna je eigen repository van.** Je wil de wijzigingshistoriek van
het sjabloon niet meeslepen in je eigen werk:

```console
$ rm -rf .git
$ git init
$ git add .
$ git commit -m "Startpunt: sjablonen graduaatsproject"
```

Maak vervolgens een eigen repository aan (in de Forgejo van de opleiding of
elders) en koppel ze:

```console
$ git remote add origin <link-naar-jouw-eigen-repository>
$ git push -u origin main
```

De link naar die repository hoort **zichtbaar in je rapport en op je poster**:
ze is een beoordeeld onderdeel van je oplevering. Zorg dus voor een verzorgde
README, een duidelijke mappenstructuur en werkende startinstructies.

Gebruik je repository ook voor de rest van je project: broncode, nota's,
schermafbeeldingen, scripts. Verkies tekstbestanden boven binaire: Markdown in
plaats van Word, CSV in plaats van Excel. Dat maakt je historiek leesbaar — en
je historiek is mee het bewijs dat je regelmatig gewerkt hebt.

### 2. Vul je gegevens in — één keer

Open **[`projectgegevens.tex`](./projectgegevens.tex)** en vul je naam, je
titel, je bedrijf, je mentor en je repository-link in.

Het voorstel, het rapport en de poster halen hun gegevens uit dat ene bestand.
Je hoeft je naam dus nergens anders in te typen, en de drie documenten kunnen
niet uit elkaar lopen.

### 3. Bouw een PDF

Je hebt **Docker** nodig, en verder niets — geen LaTeX-installatie.

- Windows, macOS: [Docker Desktop](https://docs.docker.com/desktop/)
- Debian, Ubuntu: de Docker engine uit de repositories van je distributie
- Fedora: Podman uit de officiële repositories (de scripts herkennen Podman)

Op Windows (in een CMD- of PowerShell-venster, in de map met de scripts):

```console
> make_report.bat
```

Op macOS, Linux of in Git Bash:

```console
$ ./make_report.sh
```

Voor het voorstel en de poster gebruik je `make_voorstel` en `make_poster`.
De PDF's komen in `output/`.

De eerste keer duurt dit een paar minuten: er wordt een containerimage gebouwd
met alle LaTeX-pakketten en de lettertypes van de huisstijl. Daarna gaat het
snel.

### 4. Schrijf

Elk hoofdstukbestand begint met commentaar dat uitlegt wat er in dat hoofdstuk
hoort, met een richtlengte. Volg die richtlengtes: het rapport is bedoeld als
**10 tot 15 bladzijden kerntekst**. Dat is weinig, en dat is met opzet. Schrap
liever dan te vullen.

## Wat er in je rapport hoort

De opbouw ligt vast in het sjabloon:

1. **Samenvatting in het Nederlands** (±200 woorden, bladzijde 1) — verplicht
2. **Summary in het Engels** (dezelfde tekst, bladzijde 2) — verplicht
3. **Inleiding** — context, probleem, doelstelling en **afbakening**
4. **Technologie en verantwoording** — welke alternatieven, en waarom deze keuze
5. **Analyse en ontwerp** — vereisten, architectuur, ontwerpkeuzes
6. **Realisatie** — wat je gebouwd hebt, met codefragmenten
7. **Resultaat en validatie** — werkt het, en hoe weet je dat
8. **Conclusie en reflectie** — wat je geleerd hebt, wat je anders zou doen
9. **Bijlagen** — je projectvoorstel, je repository-link, je verantwoording van
   het gebruik van AI
10. **Bronnenlijst**

Je projectvoorstel wordt automatisch als bijlage in je rapport opgenomen: het
staat in `voorstel/voorstel-inhoud.tex` en wordt van daaruit ingevoegd. Je hoeft
dus niets te kopiëren.

## Schrijven in het Engels

Kan enkel **na uitdrukkelijke toestemming van je begeleider**. Pas dan in
`gradproject/rapport.tex` de eerste regel aan:

```latex
\documentclass[english,dit,report]{hogentreport}
```

Aandachtspunten:

- het voorblad blijft in het Nederlands (behalve je titel), en dat is de bedoeling;
- de Nederlandse samenvatting blijft hoe dan ook verplicht;
- pas in `projectgegevens.tex` eventueel `\opleidingnaam` aan.

## Lettertypes

De huisstijl gebruikt drie lettertypes; ze zitten [in deze
repository](./fonts/) en worden automatisch in de container geïnstalleerd. Wil
je ook lokaal in een editor compileren, installeer ze dan zelf:

- **Montserrat** — het hoofdlettertype van de HOGENT-huisstijl
- **Fira Code** — voor code en andere monogespatieerde tekst
- **Fira Math** — voor formules

Installeren kan door te dubbelklikken op het `.otf`-bestand, of door de
bestanden te kopiëren naar `C:\Windows\Fonts` (Windows), `~/Library/Fonts`
(macOS) of `~/.local/share/fonts` (Linux).

## Een editor kiezen

**Visual Studio Code** met de extensie *LaTeX Workshop* is de eenvoudigste weg,
zeker omdat je die editor waarschijnlijk al gebruikt. De instellingen staan al
klaar in [`.vscode/settings.json`](./.vscode/settings.json). Je hebt dan wel een
lokale LaTeX-installatie nodig ([MiKTeX](https://miktex.org/download) of TeX
Live); wie dat wil vermijden, compileert gewoon met de `make_`-scripts.

**TeXstudio** kan ook. Kies dan bij Options > Configure TeXstudio:

- Build > Default compiler: `xelatex`
- Build > Default Bibliography Tool: `Biber`
- Commands > Latexmk: `xelatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error %`
- Editor > Indentation mode: *Indent and Unindent Automatically*
- Editor > Replace Indentation Tab by Spaces: aanvinken

Tip: **F5** compileert en toont het resultaat. Ontbreekt je bibliografie, druk
dan eerst **F8** en daarna opnieuw **F5**.

Voor je bronnen kan je **[JabRef](https://www.jabref.org/)** gebruiken. Zet in
Options > Preferences de *Default encoding* op UTF-8 en de *Default library
mode* op `biblatex`.

## Automatisch bouwen bij elke push

Duw je je werk naar de Forgejo van de opleiding, dan bouwt de server je PDF's
automatisch bij elke push. Dat is ingesteld in
[`.forgejo/workflows/pdf.yml`](./.forgejo/workflows/pdf.yml). Je vindt de
resulterende PDF's terug bij de uitvoering van de workflow.

Dat is meteen een goede controle: bouwt het bij jou wel en op de server niet,
dan mist er iets in je repository — meestal een afbeelding die je vergeten toe
te voegen bent.

## Als er iets misloopt

- **De compilatie stopt met een fout.** Lees het logbestand in `output/`. De
  eerste fout is bijna altijd de echte; de rest volgt eruit.
- **Je bibliografie blijft leeg.** Je hebt nog nergens `\autocite{}` gebruikt,
  of de sleutel bestaat niet in `bronnen.bib`.
- **Een afbeelding wordt niet gevonden.** Ze hoort in `graphics/`, en je
  verwijst ernaar zonder mapnaam: `\includegraphics{mijnfiguur}`.
- **Codefragmenten geven een fout.** `minted` heeft de optie `-shell-escape`
  nodig; de `make_`-scripts doen dat al. Compileer je zelf, voeg die vlag dan toe.
- **Je zit vast.** Vraag het aan je begeleider. Doe dat op tijd, niet in de week
  van de deadline.

## Vragen en verbeteringen

Fouten in de sjablonen, onduidelijke uitleg of voorstellen tot verbetering zijn
welkom via de issues in de Forgejo van de opleiding.

## Herkomst

De vormgeving gaat terug op het werk van Pieter van der Kloet, later
onderhouden door Bert Van Vreckem, en werd voor de bacheloropleiding Toegepaste
Informatica gebruikt. Deze versie is aangepast aan het graduaatsproject
(niveau 5 van de Vlaamse kwalificatiestructuur): een project met een oplevering,
in plaats van een onderzoek met een onderzoeksvraag.

Bijdragen aan de oorspronkelijke sjablonen: Bert Van Vreckem, Chantal Teerlinck,
Jan Willem, Jens Buysse, Jeroen Maelbrancke, Jonas Verhofsté, Matts Devriendt,
Niels Corneille, Patrick Van Brussel, Simon Rondelez, Luc Vervoort.
