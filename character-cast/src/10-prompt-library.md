# CHARACTER CAST — ANGLE SHOTS PROMPT LIBRARY

*This document holds the exact phase prompt text used by Angle shots.*
*Output these prompts verbatim — never reword them.*
*Attire and height come from the character brief or the Character Forge build.*

---

## HOW ANGLE SHOTS USES THIS LIBRARY

The user uploads any character image — a photo, a Character Forge sheet, or any existing character art. Angle shots then lists every prompt below, labeled, for the user to copy. Each prompt instructs the model to use the uploaded image, isolate and keep the face identical, and change only the requested angle, framing, or expression — so the upload can be a clean portrait or a full reference sheet; the model extracts what it needs.

Every prompt uploads the **same single image**. Prompts are never chained off one another's output.

```
UPLOADED IMAGE → HEADSHOTS → MEDIUM SHOTS → FULL BODY → EXPRESSIONS
(any character)   (3 angles)   (2 angles)     (3 angles)   (6 emotions)
```

| Prompt | What it produces |
|---|---|
| **Phase 2A** | Front headshot |
| **Phase 2B** | Three-quarter headshot |
| **Phase 2C** | Side profile headshot |
| **Phase 4A** | Front medium shot — upper body |
| **Phase 4B** | Three-quarter medium shot |
| **Phase 5A** | Front full body — full attire + height line |
| **Phase 5B** | Back full body — full attire + height line |
| **Phase 5C** | Three-quarter full body — full attire + height line |
| **Phase 6A–6F** | Expression set — 6 emotions |

> **Single-image rule:** Every prompt uploads the original character image — never the output of a previous prompt.

---

## THE HEIGHT LINE — FULL BODY ONLY

A thin vertical line runs down the character's side with a short text label stating the height.

- It appears on **every full-body prompt — 5A, 5B, and 5C.**
- It appears on **no other prompt.** Phase 2 headshots, Phase 4 medium shots, and Phase 6 expressions never include a height line.
- The line is thin and unobtrusive, positioned just beside the figure, with the height text reading clearly (e.g. `5'9" / 175cm`). No other measurement marks, no extra annotations, no other text in the image.
- **Height is fixed when the character is built in Character Forge** and travels with the character into the full-body prompts. If the character was uploaded directly with no height set, ask the user for the height only when they choose a full-body prompt, then use it on all three. Do not omit the line and do not guess.

---

## PERSON REFERENCE — the grammatical noun for [person]

`[person]` supplies only the noun the full-body prompts use to name the character. The body shape itself comes from `[build]` (set in Character Forge, or read from the image on a direct upload), not from this table.

| Route | [person] |
|---|---|
| Baby / Toddler (0–4) | "this baby" / "this toddler" |
| Child (boy 5–12) | "this boy" |
| Child (girl 5–12) | "this girl" |
| Teen Male | "this young man" |
| Teen Female | "this young woman" |
| Adult Male | "this man" |
| Adult Female | "this woman" |
| Elderly Male | "this elderly man" |
| Elderly Female | "this elderly woman" |

> `[build]` is a short body-shape phrase carried identically across 5A, 5B, and 5C so the body reads consistently from every angle — e.g. "a lean, average-height adult build" or "a stocky, broad-shouldered build." It is established once in Character Forge and reused; on a direct upload it comes from what is visible in the image.

---

## RECOMMENDED ASPECT RATIOS

*Set in your generation tool settings — not inside the text prompt.*

| Phase | Aspect Ratio | Why |
|---|---|---|
| Phase 2 — Headshots | 4:5 | Standard portrait crop |
| Phase 4 — Medium shots | 4:5 | Portrait — waist-up |
| Phase 5 — Full body | 9:16 | Vertical — full height visible |
| Phase 6 — Expressions | 4:5 | Standard portrait crop |

---

## CLOSING LINE — identical on every prompt, word for word

```
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

---

# PHASE 2 — HEADSHOTS

*2A — close-up headshot, front-facing, zero angle.*
*2B and 2C — tightly framed, head and shoulders crop, angle only changes.*
*Neutral expression — fixed, never varies in this phase.*
*No height line.*
*Set aspect ratio to 4:5 in your generation tool.*

---

**2A — Front**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair. Do not add or invent any attire.
Do not stylize. Do not cartoonize.
Close-up headshot, minimal space above the head.
Straight front-facing, eyes level with the camera, zero angle.
Neutral expression.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

**2B — Three-quarter**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair or attire.
Do not stylize. Do not cartoonize.
Change only the angle — three-quarter turn to the right.
Tightly framed, head and shoulders crop.
Neutral expression, gaze toward the camera.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

**2C — Side profile**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair or attire.
Do not stylize. Do not cartoonize.
Change only the angle — left side profile.
Tightly framed, head and shoulders crop. Neutral expression.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

---

# PHASE 4 — MEDIUM SHOTS

*Upload: anchor image for both prompts.*
*Upper body attire revealed here — sourced from the character brief or Character Forge build.*
*Neutral expression — fixed, never varies in this phase.*
*Frame stops at the waist — no lower body visible.*
*No height line.*
*Set aspect ratio to 4:5 in your generation tool.*

---

**4A — Front, waist-up**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair.
Do not stylize. Do not cartoonize.
Change only the framing — waist-up, front-facing.
Frame stops at the waist. No lower body visible.
Wearing [upper body attire including all accessories
— shirt, jacket, jewelry, glasses, etc.].
Neutral expression, looking directly at the camera.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

**4B — Three-quarter, waist-up**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair.
Do not stylize. Do not cartoonize.
Change only the framing — waist-up, three-quarter turn
to the right. Frame stops at the waist. No lower body visible.
Wearing [same upper body attire including all accessories].
Neutral expression, gaze toward the camera.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

---

# PHASE 5 — FULL BODY SHOTS

*Upload: anchor image for all three prompts.*
*Full attire sourced from the character brief or Character Forge build — the AI cannot see clothing from a headshot anchor.*
*Body shape carried identically across all three via [build], so front, back, and three-quarter read as the same body.*
*A thin vertical height line with a text label sits beside the figure on all three — 5A, 5B, and 5C.*
*Set aspect ratio to 9:16 in your generation tool.*

---

**5A — Front**
*↑ UPLOAD: the character image*
*[person] = see Person Reference table above*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair.
Do not stylize. Do not cartoonize.
A single full-body photograph of [person], [build].
Front-facing, standing straight, neutral expression,
looking directly at the camera. One figure only, no panels,
no collage.
Wearing [full attire — top to bottom including footwear
and all accessories].
The figure is drawn at full height with realistic body
proportions for someone [height] tall, with both feet level and flat and the full body — from the soles of the feet to
the crown of the head — visible inside the frame.
Beside the figure, draw a thin vertical measurement line with a
short horizontal end-cap (a tick mark) at each end. The TOP
end-cap must sit exactly level with the highest point of the
head (the top of the hair), and the BOTTOM end-cap must sit
exactly level with the soles of the feet. The line
must be the same height as the figure — no shorter, not floating
— so it reads as a true head-to-toe measurement. Label it once
with the small text "[height]" beside the middle of the line.
No other text, no other marks, no ruler ticks in between.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

**5B — Back**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair.
Do not stylize. Do not cartoonize.
Change only the angle — full body, back view,
standing straight, back to the camera.
Same build as the front view — [build].
Wearing [same full attire as front view — top to bottom
including footwear and all accessories].
The figure is drawn at full height with realistic body
proportions for someone [height] tall, with both feet level and flat and the full body — from the soles of the feet to
the crown of the head — visible inside the frame.
Beside the figure, draw a thin vertical measurement line with a
short horizontal end-cap (a tick mark) at each end. The TOP
end-cap must sit exactly level with the highest point of the
head (the top of the hair), and the BOTTOM end-cap must sit
exactly level with the soles of the feet. The line
must be the same height as the figure — no shorter, not floating
— so it reads as a true head-to-toe measurement. Label it once
with the small text "[height]" beside the middle of the line.
No other text, no other marks, no ruler ticks in between.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

**5C — Three-quarter**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair.
Do not stylize. Do not cartoonize.
Change only the angle — full body, three-quarter view,
turned slightly to the right, standing straight,
neutral expression, gaze toward the camera.
Same build as the front view — [build].
Wearing [same full attire as front view — top to bottom
including footwear and all accessories].
The figure is drawn at full height with realistic body
proportions for someone [height] tall, with both feet level and flat and the full body — from the soles of the feet to
the crown of the head — visible inside the frame.
Beside the figure, draw a thin vertical measurement line with a
short horizontal end-cap (a tick mark) at each end. The TOP
end-cap must sit exactly level with the highest point of the
head (the top of the hair), and the BOTTOM end-cap must sit
exactly level with the soles of the feet. The line
must be the same height as the figure — no shorter, not floating
— so it reads as a true head-to-toe measurement. Label it once
with the small text "[height]" beside the middle of the line.
No other text, no other marks, no ruler ticks in between.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

---

# PHASE 6 — EXPRESSION SET

*Upload: anchor image for all six prompts.*
*Tightly framed, head and shoulders crop on all six.*
*This is the only phase where expression changes.*
*Emotion directed through eyes and brows.*
*Mouth closed or minimally open — preserves facial anchor points for video.*
*No height line.*
*Set aspect ratio to 4:5 in your generation tool.*

> **Note on 6A — Neutral:** This mirrors Phase 2A and will produce a
> near-identical image. It exists as the baseline anchor for the
> expression set — keeping the full set of 6 uniform and self-contained.

---

**6A — Neutral**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair or attire.
Do not stylize. Do not cartoonize.
Change only the expression. Framing: tightly framed,
head and shoulders crop.
Completely neutral expression, relaxed face, mouth closed,
looking directly at the camera.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

**6B — Warmth**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair or attire.
Do not stylize. Do not cartoonize.
Change only the expression. Framing: tightly framed,
head and shoulders crop.
Soft closed-mouth smile, eyes warm and engaged,
looking directly at the camera.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

**6C — Concern**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair or attire.
Do not stylize. Do not cartoonize.
Change only the expression. Framing: tightly framed,
head and shoulders crop.
Brow slightly furrowed, eyes attentive, mouth neutral
and closed, looking directly at the camera.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

**6D — Intensity**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair or attire.
Do not stylize. Do not cartoonize.
Change only the expression. Framing: tightly framed,
head and shoulders crop.
Hard direct gaze, jaw set, mouth closed,
looking directly at the camera.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

**6E — Sadness**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair or attire.
Do not stylize. Do not cartoonize.
Change only the expression. Framing: tightly framed,
head and shoulders crop.
Subtle downcast quality, brow soft and slightly dropped,
mouth neutral and closed, eyes carry the emotion,
looking directly at the camera.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```

---

**6F — Surprise**
*↑ UPLOAD: the character image*

```
Use the uploaded image as the primary reference.
Keep facial features identical — same eye shape, nose shape,
lip shape, brow shape, jaw, face shape, and proportions.
Do not alter hair or attire.
Do not stylize. Do not cartoonize.
Change only the expression. Framing: tightly framed,
head and shoulders crop.
Brows raised, eyes wide, mouth closed or barely parted —
jaw stays anchored, looking directly at the camera.
Soft, even studio lighting — no directional shadows, consistent
skin tone across the face.
Plain, solid light grey background (neutral grey, no gradient,
no scenery, no props, no floor line) — fully filling the frame.
Sharp focus, natural skin texture.
```
