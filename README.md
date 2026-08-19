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

De sjablonen staan in de Forgejo van de opleiding, op
<https://les.lucvervoort.org>. Lezen kan zonder account; om te kunnen pushen
krijg je een aanmelding van je begeleider.

**De eenvoudigste weg is de knop "Use this template"** bovenaan de
sjabloonrepository. Je krijgt dan meteen je eigen repository, met een schone
historiek — zonder de wijzigingen aan het sjabloon zelf, die voor jouw werk
niets betekenen. Daarna:

```console
$ git clone <link-naar-jouw-eigen-repository> mijn-graduaatsproject
$ cd mijn-graduaatsproject
```

Lukt die knop niet, dan werkt de omweg ook:

```console
$ git clone https://les.lucvervoort.org/graduaatsproject/latex-sjabloon mijn-graduaatsproject
$ cd mijn-graduaatsproject
$ rm -rf .git
$ git init
$ git add .
$ git commit -m "Startpunt: sjablonen graduaatsproject"
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

Alle scripts op een rij — elk bestaat in een `.bat`-versie (Windows) en een
`.sh`-versie (macOS, Linux, Git Bash):

| Script | Wat het doet |
|---|---|
| `make_report` | bouwt `output/rapport.pdf` |
| `make_voorstel` | bouwt `output/voorstel.pdf` |
| `make_poster` | bouwt `output/poster.pdf` |
| `check` | **kijkt je documenten na voor je ze indient** |
| `make_overleaf` | maakt `output/overleaf.zip` om in Overleaf verder te werken |

De eerste keer duurt dit een paar minuten: er wordt een containerimage gebouwd
met alle LaTeX-pakketten en de lettertypes van de huisstijl. Daarna gaat het
snel.

Zodra je `\bestandsnaam` in `projectgegevens.tex` ingevuld hebt, krijgen je
PDF's er een kopie bij met je naam erin — `Janssens-Sara-rapport.pdf` — zodat je
inzending herkenbaar is. Dat is het bestand dat je indient.

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
5. **Analyse en ontwerp** — vereisten, architectuur, privacy en veiligheid,
   ontwerpkeuzes
6. **Realisatie** — wat je gebouwd hebt, met codefragmenten
7. **Resultaat en validatie** — werkt het, en hoe weet je dat
8. **Conclusie en reflectie** — wat je geleerd hebt, wat je anders zou doen
9. **Bijlagen** — je projectvoorstel, je repository-link, en je **verantwoording
   van het gebruik van AI**
10. **Bronnenlijst**

Je projectvoorstel wordt automatisch als bijlage in je rapport opgenomen: het
staat in `voorstel/voorstel-inhoud.tex` en wordt van daaruit ingevoegd. Je hoeft
dus niets te kopiëren.

### 5. Kijk je werk na voor je indient

```console
> check.bat          (Windows)
$ ./check.sh         (macOS, Linux, Git Bash)
```

Dat script beoordeelt je inhoud niet — het zoekt naar de dingen die elk jaar
opnieuw vergeten worden: gegevens die nog op de standaardwaarde staan,
sjabloontekst die blijven staan is, een ontbrekende Engelse samenvatting, een
niet-ingevulde AI-verantwoording, een wachtwoord dat per ongeluk in je tekst
staat, en een rapport dat veel te lang of te kort is.

Draai het minstens één keer een week vóór de deadline, niet de avond ervoor.

## Wat er nog in deze repository staat

| Bestand | Waarvoor |
|---|---|
| [`RUBRIC.md`](./RUBRIC.md) | **Waarop je beoordeeld wordt.** Kort samengevat: 60 % bepaalt de lesgever — mee op grond van hoe je gewerkt hebt — en 40 % de jury op je verdediging. **Het proces telt dus voor meer dan de helft mee.** Lees dit in week 1, niet in week 13. |
| [`WERKLOG.md`](./WERKLOG.md) | Je weeklog. Kost een halve minuut per week en is later de grondstof van je rapport. |
| [`voorbeelden/`](./voorbeelden/) | Werk van vorige jaren, met commentaar erbij. |
| [`.devcontainer/`](./.devcontainer/) | Opent deze map in VS Code met LaTeX al klaar (zie hieronder). |

## Geen literatuurstudie, wél bronvermelding

Je hoeft **geen literatuurstudie** te schrijven en geen overzicht van de stand
van zaken in het vakgebied. Je hoeft ook geen wetenschappelijke bronnen te
verzamelen om je lijst te vullen.

Wat wél moet: **vermeld de bronnen die je echt gebruikt hebt.** Voor een project
zijn dat meestal officiële documentatie, handleidingen, blogberichten van de
makers van een tool, normen, of een boek. Verwijs ernaar op de plaats waar je je
erop baseert, met `\autocite{sleutel}`, en zet de gegevens in
`gradproject/bronnen.bib`. Bij een webbron hoort altijd de datum waarop je ze
geraadpleegd hebt: documentatie verandert.

Een gesprek met een AI-hulpmiddel is **geen bron** — niemand kan het nagaan.
Dat hoort in de bijlage hieronder.

## AI: gebruik ze, en zeg wat je gedaan hebt

De opleiding verwacht dat je AI doelgericht inzet om iets nieuws te maken. Het
is dus een competentie die je toont, geen bekentenis die je aflegt. Daarom is de
bijlage **Verantwoording van het gebruik van AI**
([`gradproject/ai-verantwoording.tex`](./gradproject/ai-verantwoording.tex))
verplicht — ook als je geen AI gebruikt hebt; dan schrijf je dat in één zin.

Je vult er een tabel in: waarvoor je AI gebruikt hebt, met welk hulpmiddel, en
**wat je zelf gecontroleerd, aangepast of verworpen hebt**. Die laatste kolom is
de belangrijkste.

Twee regels die daarbij gelden:

- **Code die je niet kan uitleggen, hoort niet in je oplevering.** Je bent
  verantwoordelijk voor alles wat in je repository staat, ook voor wat een
  hulpmiddel geschreven heeft. Reken erop dat de jury doorvraagt.
- **De analyse, de keuzes en de afbakening zijn van jou.** AI mag je helpen
  formuleren; ze mag niet in jouw plaats denken.

## Privacy en regelgeving

Deontologisch werken met oog voor veiligheid en privacy is een leerresultaat van
dit opleidingsonderdeel. Waar het speelt, hoort het dus in je rapport — in de
sectie *Privacy, veiligheid en regelgeving* van je ontwerphoofdstuk:

- **Verwerkt je toepassing persoonsgegevens?** Namen, e-mailadressen,
  klantnummers, foto's, locaties, logbestanden met IP-adressen: dan geldt de
  **AVG** (in het Engels de GDPR). Beschrijf welke gegevens je verwerkt, waarom
  je die nodig hebt, hoe lang ze bewaard blijven en wie erbij kan. Ontwikkel bij
  voorkeur met verzonnen of geanonimiseerde testgegevens, niet met echte.
- **Zit er AI in wat je bouwt?** Dan speelt de Europese **AI Act**
  (verordening 2024/1689), waarvan de verplichtingen sinds augustus 2026
  grotendeels van toepassing zijn. Ga na in welke risicocategorie je toepassing
  valt en welke transparantieplichten gelden — een gebruiker moet bijvoorbeeld
  weten dat hij met een AI-systeem praat of dat inhoud gegenereerd is. Gebruik
  je AI enkel als hulpmiddel bij het programmeren, dan valt je project daar
  meestal niet onder; schrijf dat dan gewoon zo op.
- **Geheimen en gegevens van het bedrijf.** Wachtwoorden, sleutels en
  verbindingsgegevens horen niet in je repository en niet in je
  schermafbeeldingen. Broncode of klantgegevens in een publiek AI-hulpmiddel
  plakken is een doorgifte aan een derde partij: vraag je mentor wat bij jouw
  bedrijf mag, en noteer het antwoord.

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
klaar in [`.vscode/settings.json`](./.vscode/settings.json).

Wil je geen LaTeX installeren, installeer dan de extensie **Dev Containers** en
kies *Reopen in Container*. VS Code bouwt dan dezelfde omgeving als de
`make_`-scripts, met LaTeX Workshop en een Nederlandse spellingcontrole er al
in. Zie [`.devcontainer/`](./.devcontainer/). Wie liever zelf installeert,
gebruikt [MiKTeX](https://miktex.org/download) of TeX Live.

### Geen Docker op je stagelaptop?

Dat komt vaker voor dan je denkt: bedrijfslaptops liggen soms vast. Werk dan in
**Overleaf**:

1. Draai `make_overleaf.bat` of `./make_overleaf.sh` op een machine waar het wél
   kan — of maak zelf een zip van deze map, zonder `.git` en `output`.
2. In Overleaf: *New Project > Upload Project*.
3. Zet *Menu > Compiler* op **XeLaTeX** (niet pdfLaTeX).
4. Kies bij *Menu > Main document* welk document je bouwt:
   `gradproject/rapport.tex`, `voorstel/voorstel.tex` of `poster/poster.tex`.

Overleaf ondersteunt `minted` voor je codefragmenten. Vergeet niet je werk
regelmatig terug in je eigen git-repository te zetten: je historiek telt mee.

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
