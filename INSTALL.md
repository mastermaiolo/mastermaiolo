# MAIOLO Profile V2

This pack is a drop-in redesign for `mastermaiolo/mastermaiolo`.

## Theme
- 60% minimal/editorial
- 40% organic/ink
- black / warm white / vermilion
- Chinese symbolism reserved for HEISHI: `黑食·执政官`, `食`

## Replace / merge
The asset filenames intentionally overlap the current profile structure so you can replace files in-place. The `projects/` and `panels/` subfolders are the canonical V2 locations; top-level compatibility copies are included for easier migration.

## Animated hero
`assets/hero.svg` contains a very subtle SVG animation. Its first frame is fully usable as a static fallback.

## Telemetry
The included workflow regenerates `assets/panels/panel-telemetry.svg` with the GitHub token. The visual is self-hosted; no third-party stats service is required.

## Lore handling
The README uses Chinese glyphs and HEISHI-specific terminology, but avoids presenting `黑食` as a traditional Chinese word. The profile shell stays editorial rather than becoming a generic "Asian" aesthetic.
