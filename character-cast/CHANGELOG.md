# Changelog

## [2.0.0] — 2026-06-15
### Changed — simplified to a single editable file
- The system prompt is now ONE self-contained file at the repo root: `character-cast.md` (instructions + every angle prompt). Edit it directly on GitHub; no build step.
- `SKILL.md` is now self-contained (manifest + full instructions inline) — no template or assembly needed.
- Removed the `src/`, `scripts/`, `build/`, and `.github/` machinery (source split, build/test scripts, CI, skill template, packaged zip). Reproducibility traded for dead-simple browser editing.


## [1.4.0] — 2026-06-15
### Added
- Forge sheet examples (A Mode A, B Mode B) and corrected full-body images (H/I/J at a consistent 5'9") added to the gallery; all 16 slots A–P filled in both the README and HTML galleries.
- Height-accuracy checks in the test suite: body-scales-to-height, line-spans-figure, crown/soles end-caps, and [height] containment.
### Fixed
- **Height-line accuracy (visual bug).** In generated full-body images the measurement line stopped short of the head and feet, so it under-measured the figure. Reworded all three full-body prompts to require end-cap tick marks at the crown of the head and the soles of the feet, with the line matching the figure's full height — a true head-to-toe measurement.
- Reconciled a contradiction between "feet on the ground" and the "no floor line" background rule.


## [1.2.0] — 2026-06-15
### Fixed
- **Height line is now a real constraint.** Full-body prompts (5A/5B/5C) reworded so the figure is drawn at realistic proportions for the stated height and the measurement line spans exactly the rendered body (feet to top of head) — instead of a decorative label the body ignored.
- **Solid grey background enforced on every prompt.** Hardened the background line across all 15 prompts to "plain, solid light grey, no gradient/scenery/props/floor line, fully filling the frame," and changed 5A from "character reference sheet" to "a single full-body photograph" to stop multi-panel/white layouts.
### Added
- Test check confirming the solid grey background appears on all 15 prompts.


## [1.1.0] — 2026-06-15
### Added
- **Installable Claude skill.** `SKILL.md` manifest (name + trigger description) assembled from `src/` at build time; packaged as `build/character-cast.skill.zip`.
- **Gallery.** `gallery/index.html` styled page with placeholder slots, plus a README gallery section, ready for example images dropped into `gallery/images/`.
### Changed
- `scripts/build.sh` now emits three artifacts: merged prompt, `SKILL.md`, and the skill zip — all from the single `src/` source of truth.


## [1.0.0] — 2026-06-15
First repo release.

### Architecture
- Two independent halves: **Character Forge** (build → reference sheet) and **Angle shots** (upload → all angle prompts).
- Entry routing by action: opening upload → Angle shots; description / `START FORGE` → Forge; unclear → one question.
- Optional bridge: download the Forge sheet and re-upload it into Angle shots.

### Angle shots
- Flattened: on upload, list all 14 angle prompts at once, labeled. No character brief, no confirmation, no menu, no frame-type gate.
- Prompts instruct the model to use the upload and isolate the face, so a full sheet works as the upload (no cropping).

### Full body
- Thin vertical **height line** with a text label on 5A, 5B, 5C only — never elsewhere.
- Height **fixed in Forge** at build time; on direct upload, requested only if a full-body prompt is chosen.
- New `[build]` placeholder carries body shape identically across 5A/5B/5C so the body is consistent across angles. `[person]` reduced to the grammatical noun.

### Removed (from the legacy system)
- Route A intake sheet (Q1–Q16) and Master Prompt.
- Phase 3 wardrobe intake (W1–W8) and dressing prompt.
- The System Integrity Checks table and other Build-mode scaffolding.
