<!--
  IMAGE PLACEHOLDERS — replace the files in /assets with your own.
  GitHub renders these inline once the image files exist at the given paths.
  Recommended: PNG or JPG, banner ~1200px wide, examples ~800px wide.
-->

<p align="center">
  <img src="assets/banner.png" alt="Cinematic Retro-Campy Cult TV & Cinema Director" width="100%">
</p>

<h1 align="center">Cinematic Retro-Campy Cult TV &amp; Cinema Director</h1>

<p align="center">
  An AI image-prompt skill that makes generations look like genuine frames from
  1960s–1990s practical-effect TV broadcasts and cult B-movies —
  not modern images wearing a vintage filter.
</p>

---

## What it does

Feed it a subject — bare ("space warrior") or detailed — and it returns a single,
production-ready image prompt engineered so the result reads as an authentic period
broadcast. It works by attacking the two things that make retro prompts fail:

- **The modern look** — it strips sharpness, clean color, and shallow depth of field, because the era signal lives in the *medium*, not the props.
- **The overlay look** — it never asks for "scanlines" or "film grain" as drawn objects (which generators paste on as graphics); it describes the *result* of the old medium instead.

Every prompt is built from a silent **intent pass** (what story beat is this?) so the
framing, blocking, and expression are motivated rather than random.

## Before / After

<table>
  <tr>
    <td align="center"><b>Generic retro prompt</b><br><img src="assets/before.jpg" alt="Before — looks modern or has fake overlays" width="400"></td>
    <td align="center"><b>This skill</b><br><img src="assets/after.png" alt="After — authentic period broadcast look" width="400"></td>
  </tr>
</table>

## Gallery — see what it makes

Each image below was produced by the exact prompt beneath it. Copy any prompt and
paste it into your generator to reproduce the look.

### Mode A — 1960s broadcast TV

<p align="center">
  <img src="assets/example-1960s.png" alt="Mode A — 1960s broadcast TV space warrior" width="80%">
</p>

```
A square-jawed hero, mid-30s, broad build, in a bright red spandex jumpsuit with a silver lightning-bolt chest emblem and a clear bubble helmet, standing at frame-center with one fist raised in an exaggerated triumphant pose, mouth open mid-shout. A woman in a shiny silver mini-dress and tall white boots stands at frame-right gripping his arm, eyes wide in theatrical relief, turned toward him. Medium-wide shot, slight low camera angle looking up at the hero so he looms large. Setting: a spaceship bridge built from obvious painted plywood panels with oversized cardboard control dials, a hand-painted starfield backdrop behind. Flat frontal studio lighting, everything roughly in focus, staged. An authentic frame from a 1960s television science-fiction show, soft slightly blurry low-resolution image, faded washed-out color with a faint magenta cast, blown-out highlights, flat and hazy, not sharp, not modern, no shallow depth of field. Image fills the entire frame edge to edge. Negative: no scan lines, no film grain, no overlay lines; no TV frame, no television set, no curved screen edge, no rounded bezel, no glowing border, no vignette, no border; no modern faces, no modern hairstyles, no contemporary objects, no crisp 4K sharpness; no text, no watermark.
```

### Mode B — 1980s dark fantasy

<p align="center">
  <img src="assets/example-1980s.png" alt="Mode B — 1980s dark fantasy knight and sorceress" width="80%">
</p>

```
A grizzled knight, late 40s, heavy-set, with a graying beard and a foam-latex scar splitting his left eyebrow, wearing dented silver-painted plastic armor over a deep maroon tunic, planted at frame-left in a wide protective stance, sword raised across his body, teeth bared in an exaggerated battle snarl. At frame-right, a young sorceress, early 20s, slender, with long jet-black hair, in a flowing emerald-green velvet gown with trailing sleeves, both arms thrown overhead in a dramatic spellcasting gesture, eyes wide and mouth open in theatrical effort, her body angled toward the knight as if shielding him. Medium-wide two-shot, slight low camera angle so both figures loom. Setting: a throne-room set built from obvious polystyrene stone pillars and a hand-painted castle-interior backdrop, thick dry-ice fog rolling low across the floor. Flat frontal studio lighting with a vivid green rim light catching the fog, everything roughly in focus, staged. An authentic frame from a low-budget 1980s television fantasy show, soft slightly blurry low-resolution image, faded gently oversaturated colors that bloom slightly, muddy shadows, flat and hazy, not sharp, not modern, no shallow depth of field, no CGI. Image fills the entire frame edge to edge. Negative: no scan lines, no film grain, no overlay lines; no TV frame, no television set, no curved screen edge, no rounded bezel, no glowing border, no vignette, no border; no modern faces, no modern hairstyles, no contemporary objects, no crisp 4K sharpness; no text, no watermark.
```

### Mode C — 1990s low-budget horror

<p align="center">
  <img src="assets/example-1990s.png" alt="Mode C — 1990s low-budget horror" width="80%">
</p>

```
A gaunt woman in her 30s with stringy wet dark hair, wearing a torn mud-streaked white nightgown, crouched low at frame-center and recoiling backward, one arm flung up across her face, mouth stretched in a wide exaggerated scream. Close-up, slightly high camera angle looking down at her so she reads small and cornered. Setting: a cramped basement set with damp-looking painted concrete-block walls, a single bare bulb on a cord, fake cobwebs strung in the corner. Harsh flat on-camera flash lighting blasting her from the front, everything roughly in focus. An authentic frame from a 1990s low-budget horror video, soft blurry low-resolution image, faded slightly oversaturated color washed out by harsh flash, flat and a little unstable-looking, not sharp, not modern, no shallow depth of field. Image fills the entire frame edge to edge. Negative: no scan lines, no film grain, no overlay lines; no TV frame, no television set, no curved screen edge, no rounded bezel, no glowing border, no vignette, no border; no modern faces, no modern hairstyles, no contemporary objects, no crisp 4K sharpness; no text, no watermark.
```

## The three modes

| Mode | Era | Look |
|------|-----|------|
| **A** | 1960s broadcast TV | Flat frontal light, bright primary-color costumes, painted cardboard sets |
| **B** | 1980s dark fantasy | Fog, foam-latex prosthetics, velvet, moody rim light |
| **C** | 1990s low-budget horror | Slimy rubber-suit textures, harsh on-camera flash |

## Install

This is a Claude Skill. Pick whichever fits your setup:

**Clone the repo**
```bash
git clone https://github.com/USERNAME/cinematic-retro-tv-director.git
```

**Copy the single file** — the entire skill is `SKILL.md`. Drop it into your skills
directory (e.g. wherever your other skills live) and your loader will pick it up.

**Download** — grab `SKILL.md` from the file list above and place it in your skills folder.

> The skill is intentionally a single self-contained `SKILL.md` — no dependencies,
> no extra files needed to run it.

## How to use it

Once installed, just describe what you want:

> *"A couple having a date, Mode A"*
> *"Swamp monster attacking a scientist — make it look like an old TV show"*

The skill returns one prompt in a code block, ready to paste into Nano Banana,
Midjourney, or another generator. For **video**, it points you to the companion
`seedance-2-director` skill so the motion logic stays in one place.

## Notes &amp; limitations

- **Aspect ratio is left to the generator.** The skill enforces *frame-fill* instead of a fixed ratio, so you won't get black bars regardless of the canvas you pick.
- **The retro look is natively 4:3.** On a wide canvas you're asking for something that historically never existed; the generator may resist. The frame-fill rule is your lever.
- **Negative prompts are a standing default**, grouped and capped to avoid overload. Tune them per generator — what one model honors, another ignores.

## License

MIT — see [LICENSE](LICENSE).
