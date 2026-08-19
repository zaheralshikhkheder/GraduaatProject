# Het projectvoorstel

Hier schrijf je je **projectvoorstel**: het document waarmee je begeleider
beslist of dit een geschikt graduaatsproject is.

- Je gegevens staan in [`../projectgegevens.tex`](../projectgegevens.tex) —
  daar hoef je hier niets van te herhalen.
- De inhoud schrijf je in [`voorstel-inhoud.tex`](./voorstel-inhoud.tex).
  Dat bestand wordt later **automatisch als bijlage in je rapport opgenomen**,
  dus je hoeft achteraf niets te kopiëren.
- Bouwen doe je vanuit de hoofdmap met `make_voorstel.bat` (Windows) of
  `./make_voorstel.sh`. Het resultaat is `output/voorstel.pdf`.

## Zeven rubrieken, hoogstens twee bladzijden

1. Context en probleemstelling
2. Doelstelling
3. Technologieën
4. **Afbakening** — wat is stage, wat is graduaatsproject
5. Verwachte meerwaarde
6. Planning en werkbelasting (±10 werkdagen, ±100 uren)
7. Risico's

Houd het kort: één tot drie zinnen per rubriek volstaat. Een voorstel moet in
vijf minuten te beoordelen zijn.

## Twee dingen die vaak misgaan

- **Geen afbakening.** Wie niet kan uitleggen wat zijn eigen project is naast
  zijn dagelijkse stagewerk, krijgt zijn voorstel terug. Rubriek 4 is de
  belangrijkste van de zeven.
- **Niet afgestemd met de mentor.** Stem je voorstel af met je mentor
  *voordat* je het indient. Hij bevestigt dat dit is wat het bedrijf bedoelt en
  dat de tien werkdagen haalbaar zijn.

Het sjabloon gebruikt de documentclass `hogent-article`
([`hogent-article.cls`](./hogent-article.cls)); die hoef je niet aan te passen.
