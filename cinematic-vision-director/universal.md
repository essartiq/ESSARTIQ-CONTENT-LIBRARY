# Universal Render — The Three-Pillar Source of Truth

This is the model-agnostic format and the system's reasoning backbone. Every model render is a translation *from* this. When the user keeps Universal, deliver clean three-pillar prose.

---

## The Three Pillars

A hierarchy. Each adds a layer of control. **Never repeat information across them.**

### INTENT — The Why
The story goal, the emotion, the beat. What this moment *means* and where it is going. This is the inference from Layer 2.
- Holds: the emotional truth, the narrative purpose, the before/after arc.
- Never holds: lighting, color, camera, staging.

### AESTHETIC — The World
Complete control of the audio-visual world. **On an uploaded image this collapses to a brief continuity anchor** — the grade and look already present that must hold across the clip — because the frame already carries the world. Do not re-describe what the image shows; name only what must be *preserved* and any world-state that governs the clip.
- Holds: the existing color grade (named), the light logic to preserve, any wardrobe/environment continuity that must not drift.
- Never holds: the story beat (that is INTENT), the shot-by-shot action (that is EXECUTION).

### EXECUTION — The Play-by-Play
How the clip unfolds, second by second. Staging, action, the one motivated camera move, timed beats, and sound where supported.
- Holds: subject action and direction, the camera move + its motivation, pacing in seconds, sound design (model permitting).
- Never holds: restated mood or restated grade.
- **Timing cues belong here.** When duration or speed matters, write it into the prompt text: "over 5 seconds," "slow-motion," "hold 2 seconds then push in." These are not just internal notes — they go in the final prompt.

Order: **Intent → Aesthetic → Execution.** Natural, readable language. A human should visualize the clip before generation.

---

## The Two Auteur Styles

### Classic Auteur
Longer, screenplay-style, natural readable prose, detailed like a technical script. Best for complex or emotionally layered scenes.

> **INTENT.** A woman at the threshold of a decision she has already made but not yet spoken. The calm before leaving.
>
> **AESTHETIC.** Preserve the cool, low-contrast grade — lifted blacks, blue cast at the window. The loneliness is in the color; keep it.
>
> **EXECUTION.** Hold two seconds on her stillness. She exhales, her shoulders drop — and *because* that breath releases, the camera begins a slow push-in, telephoto, compressing her against the rain-blurred glass. By the fifth second she turns her face a few degrees toward the door behind her, the eyeline answered. The push settles. Ambient: rain on glass, one distant car.

### Brief Auteur
Shorter, compact, slightly technical. Uses reasoning logic so the model fills small gaps while staying under control.

> **INTENT** — the held breath before departure; quiet resolve.
> **AESTHETIC** — keep cool low-contrast grade, lifted blacks, window-blue.
> **EXECUTION** — 2s hold on stillness; on her exhale, slow telephoto push-in compressing her to the glass; at 5s a few-degree head-turn toward the door. Rain-on-glass ambience. One move, settling.

Recommend one with a one-line reason; default to producing it. Style is format — the direction is the value.

**Output:** deliver the final prompt in a wrapped code block. The pillars may stay labeled (as above, for readability and control) or be flowed into continuous natural-language prose — user's preference. Like the model renders, Universal supports a single paragraph or a multi-shot sequence; choose from the direction, not by default.

---

## Image-to-Video Skeletons

Reusable structural patterns. The **reveal pattern** is the engine of before/after inference — it lets the camera *become* the temporal logic.

**Standard I2V:**
`[camera motion / shot type], [subject + action + motion/direction], [environment beat], [grade to preserve]`

**The Reveal (before/after engine):**
`[shot] of [subject + action], the camera [motivated move] to reveal [the after / the offscreen the frame implied]`
> e.g. *Medium shot of her lowering the letter; the camera pulls back to reveal the empty chair across the table.*

**Detailed:**
`[camera motion/speed] [shot type] of [subject + action + direction] in [setting], [environment motion], [light logic to hold], [grade to hold]`

**Static-subject (motion in world/camera only):**
`[shot type / camera move], [subject holding still], [what moves around them], [grade]`

**Loopable clip:**
`[shot type / camera move], [subject + cyclical action], [environment], [grade], loop seamlessly over [X] seconds`
> e.g. *Static close-up of a rose blooming open and returning — sunlight gleaming on petals, warm grade, loop seamlessly over 5 seconds.*

Use these to structure EXECUTION; they are scaffolding, not a substitute for the four-layer read.

---

## Positive Framing Rule

Across all models, describe what you **want** — never what you don't. Most models ignore "no X" or "don't X" phrasing entirely.

- "Steady camera" — not "no camera shake"
- "Clear sky" — not "no clouds"
- "Maintain face consistency" — not "don't distort the face"

When a model has a dedicated negative prompt field (Kling), use it for continuity guards. When it doesn't (Veo 3.1), positive framing is the only guard — write what must hold, not what must be absent. Veo 3.1 uses a trailing exclusion sentence at the end of the prompt.

---

## Translating to a Model

When the user picks a model, the pillars map as follows (detail in each model's KB):

- **Kling 3.0 / Omni** → Scene · Characters · Action · Camera · Audio & Style (five layers). INTENT informs Scene+Action framing; AESTHETIC → Scene/Style + held grade; EXECUTION → Action+Camera+Audio. Element Library (`<<<element_1>>>` tags) for character/voice consistency. Multi-shot storyboard up to 6 shots. Negative prompt carries Restraint and continuity guards.
- **Seedance 2.0** → Subject · Motion · Scene · Camera · Aesthetics/Style · Constraints (six steps, 60–100 words, present tense). EXECUTION compresses into Motion+Camera; AESTHETIC into Subject/Scene/Style; Constraints tail guards continuity.
- **Google Veo 3.1** → Cinematography · Subject · Action · Context · Style & Ambiance + Audio block (Dialogue / SFX / Ambient). AESTHETIC describes the world fully in text; optional Ingredients to Video reference images for character/style consistency. Positive framing + trailing exclusion sentence.
