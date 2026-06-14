---
name: cinematic-retro-tv-director
description: Build production-grade AI image prompts that authentically mimic 1960s–1990s practical-effect TV broadcasts and cult B-movie cinema. Use this skill whenever the user wants a retro, vintage-TV, old-broadcast, kinescope, campy cult-film, or low-budget-horror look — even if they don't name the era explicitly. Trigger when the user asks for "old TV show" aesthetics, practical-effects/no-CGI looks, Technicolor camp, foam-latex creature features, or complains that their retro images still look modern or have fake scanline/film-strip overlays. This skill produces STILL images only; it also triggers on retro VIDEO/motion requests in order to hand the user off to seedance-2-director with the era look preserved. Targets Nano Banana and other image generators. Outputs the still prompt inside a code block.
---

# Cinematic Retro-Campy Cult TV & Cinema Director

Turn a subject — bare or detailed — into a production-ready image prompt that looks like a genuine frame from a 1960s–1990s practical-effect TV broadcast or B-movie, not a modern image wearing a vintage filter.

---

## THE ONE OUTPUT RULE (read first, overrides everything)

The model's entire visible response is: **a single wrapped code block containing only the prompt**, optionally with brief plain-language commentary OUTSIDE the block.

NEVER show, anywhere in the response:
- the Step 0 intent reasoning,
- labels like "Beat:", "Intent:", "Reasoning:", "Thinking:",
- any explanation of *why* choices were made inside the prompt.

The reasoning happens silently. Only its results — expressed as concrete visual detail — reach the prompt. If unsure whether something belongs in the output, it does not.

**Single exception:** when video intent is detected (see "Video Intent — Detect and Hand Off"), the response is a handoff, not a still prompt, and this rule does not apply to it.

---

## Step 0 — Intent & Logic (internal, mandatory, silent)

FIRST, check for video intent (see "Video Intent — Detect and Hand Off"). If the request is for video/motion, branch to the handoff and skip the rest of Step 0. Otherwise, for a still image, reason silently through the questions below. Governed by THE ONE OUTPUT RULE — it never appears in the response. Purpose: ensure every choice in the final prompt is motivated, so the image reads as a real beat from an episode, not a person randomly placed in a set. Specificity must FLOW FROM this reasoning.

Answer internally:
- **Story beat:** What single moment is this? (triumph, dread, betrayal, reveal, escape, confrontation.) The whole frame serves one beat.
- **Before & after:** What just happened, what's about to happen? Pose and expression sit inside that flow.
- **Camera motivation:** Why is the camera HERE? (Low angle to make a threat loom; wide to show isolation; close-up for an emotional peak.) The angle must have a reason.
- **Blocking logic (ONLY if more than one subject):** Why is each person positioned where they are? Who faces whom, who dominates, who reacts. For a single subject, skip blocking — do not invent extra figures.
- **Emotional center:** The ONE thing the eye should land on. Everything else supports it.

Build the prompt so every specified detail (pose, position, angle, expression, lighting) is the visible consequence of these answers.

**When the user gives only a bare subject** (e.g. "space warrior," "swamp monster") with no story: invent the most genre-typical beat for that subject and the chosen Mode, then proceed. Do NOT ask clarifying questions — default to producing a finished prompt.

---

## Mode vs. Intent — precedence (resolves conflicts)

The era **Mode governs the LOOK** (lighting, color, costume idiom, degradation). The **Intent governs the STAGING** (beat, pose, blocking, camera) *within* that look. When they conflict, Mode wins on appearance and Intent bends to fit.

Example: a "quiet dread" beat in Mode A (bright 1960s TV) is staged as *campy melodramatic dread* — wide eyes, frozen pose, bright flat light — NOT modern horror darkness. Dread is staged; it never darkens or modernizes the Mode's signature look.

---

## The Core Failure to Avoid (Modern Look)

Modern generators default to high resolution, edge-to-edge sharpness, shallow cinematic depth of field, clean color, rich dynamic range. Every one reads as "modern." Old TV is the opposite. **The era signal lives in the medium, not the props.** A foam-latex monster shot on a clean modern camera still looks modern. Degrade aggressively.

## The Second Failure to Avoid (Overlay Look)

Do NOT ask for artifacts as visible objects — generators draw them as decorative graphics on top of a clean modern photo, which is worse than no effect.

**Never use these terms** (they trigger drawn overlays):
`scanlines / scan lines / interlacing lines / film grain / film strip / film roll / sprocket holes / VHS lines / tracking lines / static lines / CRT / TV screen`

**Instead, describe the RESULT of the old medium** — the image is inherently soft, faded, imperfect:
- scanlines -> "soft, slightly blurry, low-resolution image"
- film grain -> "low resolution, not sharp, softly textured"
- VHS/tracking -> "faded color, slightly washed out, soft focus"
- color bleed -> "colors slightly soft and oversaturated, gently blooming"

**Framing trick:** Tell the generator what the image *is*, not what effects to add — e.g. *"an authentic frame from a low-budget 1980s television show."* Produces the look holistically instead of compositing effects onto a clean base.

Softness, fade, bloom, and flatness do almost all the "old" work.

---

## Specificity Mandate (mandatory)

Never write vague subjects. "A boy" is forbidden. Every detail must be concrete AND serve the Step 0 intent. Specify:
- **Subject identity & wardrobe:** age, build, hair, exact clothing items AND colors, costume materials, practical-effect details (seams, prosthetics, makeup).
- **Expression & pose:** exact theatrical expression and body position — motivated by the beat.
- **Position in frame:** where each person is relative to others and the set — motivated by blocking (multi-subject only).
- **Composition & framing:** wide / medium / close-up, what's included, how arranged.
- **Camera angle:** eye-level, low, high, frontal, three-quarter — motivated by camera reasoning.
- **Set & backdrop:** exact materials (painted plywood, polystyrene, hand-painted backdrop) and what they depict.
- **Lighting:** flat frontal studio light plus any rim/colored light, named.

BAD:  a boy in a costume in a spooky room
GOOD: a thin 12-year-old boy with messy brown hair, in a bright yellow raincoat and red rubber boots, frozen at frame-left, eyes wide in exaggerated fear, medium shot at a slight low angle; behind him a painted-plywood haunted-house hallway backdrop

---

## Core Aesthetic Pillars

- **Capture Medium (result, never overlay):** soft, low-resolution, slightly blurry — looks captured by an old low-quality camera.
- **Color Science:** faded, slightly-off, gently oversaturated color that blooms softly; faint magenta or green cast; never clean.
- **Dynamic Range:** flat and limited; highlights blow to soft white; shadows muddy, not crisp black.
- **Materials:** practical effects only — foam latex, vinyl, polystyrene, stage makeup, visible seams. No CGI.
- **Lighting:** flat, frontal, theatrical studio lighting; deep focus — everything roughly in focus.
- **Staging:** obvious studio sets, hand-painted backdrops, flat frontal framing, static staged composition.

---

## Prompt Construction Rules

1. **Intent first:** Run Step 0 silently. Every choice traces back to it.
2. **Resolve Mode vs. Intent:** Mode sets the look; Intent sets the staging.
3. **Subject:** Fully specified per the Specificity Mandate.
4. **Environment:** Studio sets or hand-painted backdrops, named materials, shallow flat space.
5. **Composition:** Shot size, framing, camera angle — each motivated.
6. **Medium (result-based):** Append the Mode's capture block as softness/fade/bloom, never drawn lines.
7. **Sharpness:** Always soft focus, low resolution, not sharp. Never "crisp," "sharp," "4K," "highly detailed."
8. **Depth:** Deep focus / flat staging. Avoid bokeh and shallow DOF.
9.  **Frame fill (aspect-agnostic):** Never specify an aspect ratio — the generator chooses its own. Require the image to fill whatever frame it picks with the positive phrase `image fills the entire frame edge to edge`. (The matching negatives live in the Negative Block — don't duplicate them here.)
10. **No Text:** No subtitles or watermarks unless the user asks for "vintage title cards."
11. **Negative Block:** End every prompt with the standing grouped Negative Block. Obey the Anti-Overload Rules — observed artifacts only, positive fix first.
12. **Output:** Obey THE ONE OUTPUT RULE — wrapped code block, prompt only, no reasoning.

---

## Style Variant Settings (rotate these)

**Mode A — 1960s Broadcast TV**
Flat frontal lighting, bright spandex and primary-color costumes, painted cardboard sets. Result block:
`an authentic frame from a 1960s television show, soft slightly blurry low-resolution image, faded washed-out color with a faint magenta cast, blown-out highlights, flat and hazy, not sharp, not modern, no shallow depth of field`

**Mode B — 1980s Dark Fantasy**
Heavy fog, foam-latex prosthetics with visible seams, velvet capes, moody rim lighting over flat fill. Result block:
`an authentic frame from a low-budget 1980s television fantasy show, soft slightly blurry low-resolution image, faded gently oversaturated colors that bloom slightly, muddy shadows, flat and hazy, not sharp, not modern, no shallow depth of field, no CGI`

**Mode C — 1990s Low-Budget Horror**
Slimy rubber-suit textures, harsh on-camera flash. Result block:
`an authentic frame from a 1990s low-budget horror video, soft blurry low-resolution image, faded slightly oversaturated color washed out by harsh flash, flat and a little unstable-looking, not sharp, not modern, no shallow depth of field`

---

## Negative Block (standing default — every prompt carries it)

Testing shows this generator responds well to explicit negatives, so they are a STANDING default, not a fallback. Every prompt ends with the grouped block below. Keep it disciplined — the rules under it prevent overload.

**Default block (append to every prompt, grouped):**
`no scan lines, no film grain, no overlay lines; no TV frame, no television set, no curved screen edge, no rounded bezel, no glowing border, no vignette, no border; no modern faces, no modern hairstyles, no contemporary objects, no crisp 4K sharpness, no shallow depth of field; no text, no watermark`

The four groups: **(1) overlays · (2) TV-object/bezel · (3) modern leakage · (4) standard.**

### Anti-Overload Rules (how to keep it lean)
1. **Observed only.** A negative earns its place only after you've SEEN that artifact appear. Do not carry terms for problems you don't have (e.g. the giant "bad anatomy, extra fingers" lists are noise unless you actually hit them).
2. **One term per artifact, not synonyms.** Pick the one or two words that moved the needle in testing; drop the rest. Synonym-stacking is most of how these lists bloat.
3. **Cap per group.** Roughly a handful per bucket. If a bucket outgrows that, something's wrong — reach for a positive fix instead.
4. **Positive fix first.** A negative is a patch. If a positive phrase solves it (e.g. "soft low-resolution image" kills sharpness), do NOT also add the negative. Only use a negative when the model won't comply positively. This is the biggest de-bloater.
5. **Demote, don't delete.** Terms that helped once but aren't always needed go in Situational Add-Ons below — documented and available, but not in every prompt.
6. **Find the tipping point by testing.** "Too many" is per-model, not a fixed number. The signal: when adding a negative stops changing the image, or starts removing things you wanted, you've passed the limit. Back off.

### Situational Add-Ons (opt in only when the artifact appears)
- `no lens flare, no bokeh` — if the generator adds modern glamour optics.
- `no smartphone, no plastic, no chrome` — for pre-1980 scenes leaking modern props.
- `no clean studio backdrop` — if the painted-set look turns into a seamless modern photo backdrop.

---

---

## Example — the ONLY thing the model outputs

User asks for "Space Warrior" (Mode A). The complete, correct response is exactly this code block and nothing else — no reasoning, no labels, no parenthetical explanation:

```
A square-jawed hero, mid-30s, broad build, in a bright red spandex jumpsuit with a silver lightning-bolt chest emblem and a clear bubble helmet, standing at frame-center with one fist raised in an exaggerated triumphant pose, mouth open mid-shout. A woman in a shiny silver mini-dress and tall white boots stands at frame-right gripping his arm, eyes wide in theatrical relief, turned toward him. Medium-wide shot, slight low camera angle looking up at the hero so he looms large. Setting: a spaceship bridge built from obvious painted plywood panels with oversized cardboard control dials, a hand-painted starfield backdrop behind. Flat frontal studio lighting, everything roughly in focus, staged. An authentic frame from a 1960s television science-fiction show, soft slightly blurry low-resolution image, faded washed-out color with a faint magenta cast, blown-out highlights, flat and hazy, not sharp, not modern, no shallow depth of field. Image fills the entire frame edge to edge. Negative: no scan lines, no film grain, no overlay lines; no TV frame, no television set, no curved screen edge, no rounded bezel, no glowing border, no vignette, no border; no modern faces, no modern hairstyles, no contemporary objects, no crisp 4K sharpness; no text, no watermark.
```

> **DESIGN NOTE (documentation only — NOT part of any model response):** The triumphant low-angle framing, the hero at center, and the woman turned toward him are the silent product of Step 0 (beat = rescue/triumph). This note exists to teach skill authors how Step 0 shapes the output; the model never writes anything like it.

---

## Video Intent — Detect and Hand Off

This skill produces STILL images only. It does not generate video prompts.

**Detect video intent when EITHER:**
- The user uses the word "Video" (explicit trigger), OR
- The request implies motion over time — a chase, a fight, someone running/walking/turning, a camera move, a sequence of actions, dialogue being spoken, "scene" in the cinematic sense rather than a single frame.

**When video intent is detected, do NOT build a still prompt. Instead:**
1. Tell the user this skill is still-image only and that `seedance-2-director` handles video.
2. Hand them a ready-to-paste retro look-block in Seedance's STYLE format so they keep the exact era aesthetic when they switch. Run Step 0 and pick the Mode first, then emit:

```
STYLE: [Mode look] — an authentic frame from a [era] television/film production, soft slightly blurry low-resolution image, faded [color behavior], flat and hazy, not sharp, not modern, deep focus / no shallow depth of field. Practical effects only, no CGI.

NEGATIVE PROMPT: scan lines, film grain, overlay lines, visible texture lines, modern faces, modern hairstyles, contemporary objects, crisp 4K sharpness, shallow depth of field
```

3. Stop there. Do not attempt shot math, audio layers, or Seedance's master template — that is the video skill's job. The handoff carries the LOOK; Seedance handles the MOTION.

The still-image rules below (THE ONE OUTPUT RULE, code-block output) do NOT apply to this handoff block — the STYLE/NEGATIVE lines are a fragment for the user to carry into another skill, not a finished still prompt.

---

## A Note on Frame Shape (honest limitation)

The retro-TV look is *historically* 4:3 (boxy). This skill does NOT specify aspect ratio — the generator decides. But be aware: when the chosen frame is wide (e.g. 16:9), you are asking for something that never existed — a widescreen broadcast from an era that had none. The generator may resist, reintroducing black bars or leaving dead space at the sides, because its learned sense of "old TV" is boxy.

If that happens, the frame-fill line (Rule 9) is your lever — weight it harder on wide canvases. Do NOT add a rounded TV-tube / screen-edge effect by default: it reads correctly only on a boxy frame and looks wrong stretched across a wide one. Treat any screen-edge styling as a per-project choice, never an automatic default.

---

## Note on Generator Behavior

How faithfully a generator honors these terms varies by model. If technical wording underperforms, lean harder on plain-language framing — *"looks exactly like a faded 1970s TV show"* — which some generators obey more reliably. Test per generator and keep what wins.
