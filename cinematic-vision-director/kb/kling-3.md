# Kling 3.0 / Kling 3 Omni — Render Rules

Translate the chosen Universal direction into Kling's native structure. Kling 3.0 is the cinematic flagship; **Omni** is its full-director mode — Element Library for character/voice consistency, multi-shot storyboard (up to 6 shots), Omni reference tags, and unified audio across cuts, all inside one generation.

> Built from Kling's official user guide and current working knowledge. Treat model-specific quirks as working defaults the user may override from their own testing.

**Pillars travel here as logic, not labels.** INTENT shapes how the action and move are written. AESTHETIC becomes the brief continuity anchor (the grade, the world already in the frame). EXECUTION becomes Action + Camera + Audio. Don't print the pillar labels; don't lose the reasoning.

---

## Generation Modes

| Mode | Input | When to use |
|------|-------|-------------|
| **Text-to-Video (T2V)** | Text only | No image. Full world description required in prompt. |
| **Image-to-Video (I2V)** | Still image (first frame) | Animate a single uploaded frame. Default mode for this skill. |
| **Start + End Frame** | Start image + end image | Model interpolates the transition. Prompt describes the path only. |
| **Element Reference** | Element Library assets (images/video/voice) | Character and object consistency across shots. Binds via `<<<element_1>>>` tags. |
| **Multi-Shot Storyboard** | Text + optional elements | Up to 6 shots in one generation (max 15 sec). Intelligence or Customization mode. Main prompt field must be empty. |
| **Motion Control** | Character image + reference video (3–30 sec) | Extracts real motion from a reference video and applies it to a generated character. Physics-accurate. Prompt describes scene only — not motion. |

---

## The Five-Layer Order

Write in this exact sequence:

**Scene → Characters → Action → Camera → Audio & Style**

1. **Scene** — ground the model in the environment first. On an uploaded frame, this is a brief continuity anchor: name the setting and the grade to hold. In T2V, describe the world fully.
2. **Characters** — who is in frame. The start frame handles appearance — keep this light, do not re-describe what the image already locks. When using Element Reference, call the element here: *"<<<element_1>>>, still and contemplative."*
3. **Action** — one clear action. Present tense, specific, motivated.
4. **Camera** — the single motivated move + framing. Name it plainly: push-in, slow dolly, lateral track, static hold.
5. **Audio & Style** — sound design and the look to preserve. Dialogue goes here (quoted, lip-synced). Grade continuity anchor goes here.

---

## Core Behaviors

- **One thing well.** Kling's biggest failure mode is a prompt doing too much. One subject, one clear action, one camera move. Restraint enforced hard.
- **Image-to-video = direction.** The uploaded frame sets appearance and style. The prompt focuses on motion and camera — cut what the frame already shows.
- **The motion-budget quirk.** Kling spends its motion budget on **character motion and camera work before environmental events**. If you ask for both a head-turn and a lightning flash, the character beat wins and the environmental event drops. Design around this: put emotional weight on the subject and camera, not background spectacle. Let the grade do the atmospheric work.
- **Refine one layer at a time.** When iterating, change either style or motion — never both in one pass.
- **Duration: 3–15 seconds.** Longer clips need a clear hold-then-move rhythm or they wander. Budget beats accordingly.

---

## Element Library — Consistency System

Elements are Kling's consistency engine. Once an element is built and called in the prompt, the model treats it as the **single source of truth** for that subject — appearance is no longer described in the prompt, only action and camera. This is the principle shift: elements free the prompt to focus entirely on motion and cinematography.

### Three Element Types

| Type | What it locks | Use for |
|------|--------------|---------|
| **Character** | Face, body, outfit, silhouette, voice | Humans, animals, stylized characters — anything with an identity that must not drift across shots |
| **Environment** | Location, architecture, lighting, mood | A specific room, setting, or location that must look identical across multiple generations |
| **Prop / Product** | Object shape, label, texture, color | Devices, food, packaging, branded items — anything that must look the same shot to shot |

### What Elements Lock vs. What Stays Flexible

**Locked by the element:**
- Visual identity — appearance, proportions, clothing, hair
- Voice (if bound) — matches and lip-syncs automatically wherever the character speaks

**Remains flexible — driven by the prompt:**
- Action and behavior
- Camera movement and cinematography
- Pose and positioning

This means: once an element is active, **do not re-describe the character's appearance** in the prompt. Spend those words on what the character *does* and how the *camera moves*.

### Building an Element

The quality of the element determines the quality of the consistency. A weak element = `<<<element_1>>>` holds a drifting, blurry identity, not the character.

**Four-angle workflow (recommended):**
- Front view — face or product label clearly visible
- Three-quarter left — depth and contour
- Three-quarter right — symmetry, opposite-side details
- Back/over-shoulder — hair, clothing back, rear packaging

Four angles give Kling a 3D sense of identity rather than a flat picture. The model can generate additional angles automatically from a single main image if needed.

**Rules:**
- 2–4 images per element — more than 4 introduces conflicting signals
- Same lighting, same clothing, same expression across all images
- Neutral background — a busy background tells the model it's intentional
- Tight crop — model latches onto the subject, not the frame

**Video character reference (3–8 seconds):**
- A single-person clip, clear and well-lit
- Extracts appearance AND voice automatically — the most complete element type
- Recommended over image references when a video is available

**Voice binding (image-based elements):**
- Upload a 5–30 second single-person speech audio clip
- Vocal DNA extracted and bound to the element
- Once bound: voice matches and lip-syncs automatically across all shots

### Omni Reference Tags — What Goes in the Prompt

Reference all assets using **triple angle brackets** in the prompt:

| Tag | What it references |
|-----|--------------------|
| `<<<element_1>>>` | Character element from the library |
| `<<<element_2>>>` | Second character or object element |
| `<<<image_1>>>` | A directly uploaded image (no library needed) |
| `<<<video_1>>>` | A directly uploaded video reference |
| `<<<voice_1>>>` | A voice element bound to a character |

Up to **3 elements** can be bound in a single generation. Place the tag in the Characters layer and describe the role immediately after:

```
<<<element_1>>>, still and contemplative at the window. She exhales and her shoulders drop...
```

Kling reads the tag and the surrounding description together — state what the asset locks (face, clothing, motion style, voice) so the model knows how to use it.

### First Frame + Element Together

This is the most powerful consistency setup in Kling 3.0 Omni — and directly relevant to this skill's workflow where the user uploads a still image.

**What each does:**
- **First frame** — locks the *opening composition*: the exact position, framing, and starting state
- **Element** — locks *identity throughout*: face, clothing, and voice survive camera moves, angle changes, and long clips

**Why you want both:**
A first frame alone can drift when the camera moves significantly or the shot runs long — the character's face shifts, clothing changes subtly. The element acts as a continuous anchor that suppresses that randomness throughout the entire generation, not just the first frame.

**Technical limits when combining:**
- Up to **3 elements** supported alongside start frame (or start + end frame)
- When using multi-image elements only (no video reference): total reference images + element images must not exceed **7**

**How the prompt changes:**
With first frame + element active, the prompt is almost entirely action and camera. The first frame carries the opening composition; the element carries the identity. There is nothing left to describe about appearance.

```
<<<element_1>>> exhales, her shoulders dropping, then slowly turns toward the door. Slow telephoto push-in. Rain on glass, one distant car. Cool low-contrast grade, blue cast held.

Negative: face distortion, identity drift, clothing change, morphing features, subtitles.
```

Compare to first frame only (no element):
```
A woman in a grey sweater stands at a rain-streaked window. She exhales and her shoulders drop, then slowly turns toward the door. Slow telephoto push-in. Rain on glass. Cool low-contrast grade, blue cast held.

Negative: face distortion, warping, subtitles.
```

The difference: with the element, appearance description is removed entirely. The element IS the character. With first frame only, a brief appearance anchor is still needed to guard against drift.

**When elements make first frames optional:**
Once strong elements exist, Kling can reconstruct motion and camera from elements + prompt alone — no first frame needed for every shot. This is the element-first workflow: build elements once, generate multiple shots freely without frame-perfect start images.

### Element Limitations — Know These Before Prompting

These affect how you write the prompt and what you guard against in the negative field:

- **Incomplete angles → drift** — if the reference only shows the front, the model invents the back when the character turns. Add a back/side angle or constrain the camera to avoid full turns.
- **Extreme wide shots → loss of detail** — facial identity and product logos degrade at distance. Reserve close/medium shots for identity-critical moments; use wide shots for mood only.
- **Crowded scenes with similar subjects** → the model may blur distinctions between characters. Keep character designs visually distinct; one primary element per shot is safest.
- **1–2 elements per shot** — while up to 3 are supported, 1–2 produces the most stable output. Add the third only when the direction genuinely requires it.

---

## Multi-Shot Storyboard (Omni)

Multi-Shot Storyboard generates up to **6 shots in a single generation** (max 15 seconds total). Each shot has its own prompt, camera, and duration. Elements hold the character across all cuts automatically.

### Two modes

**Intelligence mode** — give one overall prompt; Kling auto-designs the shot breakdown, camera coverage, and pacing. Use when you want Kling to direct.

**Customization mode** — you define each shot individually via the `multi_prompt` parameter (API) or per-shot fields in the UI. Use when you need exact control over the storyboard.

### Rules per shot

- **Main prompt field must be empty** in multi-shot mode. All content goes into individual shot fields — not the main prompt box.
- **Each shot minimum 3 seconds.** Total = sum of all shots ≤ 15 seconds.
- **One camera move per shot** — Restraint holds inside each shot.
- **Elements carry across all shots** — no need to re-describe the character in each shot; the `<<<element_1>>>` tag holds identity throughout.
- **Grade and style stated once** — in the first shot or as a global style note. Kling carries it forward.

### Prompt structure — Customization mode

```
Shot 1 ([X] sec): [Scene anchor + character + action + camera]. [Audio.]
Shot 2 ([X] sec): [New angle + action + camera]. [Audio.]
Shot 3 ([X] sec): [Resolution beat + camera]. [Audio.]

Style: [grade to hold across all shots].
Negative: [guards once, at the end].
```

**Example (3-shot, element-bound):**
```
Shot 1 (4 sec): <<<element_1>>> stands frame-left at a rain-streaked window at dusk, still. Medium shot, eye-level, slow telephoto push-in as she exhales. Rain on glass.
Shot 2 (4 sec): Close-up on her hand tightening at the sill, the camera holding still. A floorboard creaks once somewhere behind her.
Shot 3 (4 sec): Wide static pull-back to reveal the empty chair across the table. Rain swells faintly.

Style: cool low-contrast cinematic grade, lifted blacks, blue cast held throughout.
Negative: face distortion, identity drift, clothing change, subtitles, camera shake.
```

---

## Native Audio

Kling 3.0 generates synchronized audio — dialogue, sound effects, and ambient sound — natively in the same pass as the video. Audio belongs in the **Audio & Style** layer of the five-layer order.

**Three elements to direct:**

- **Dialogue** — quoted directly for lip-sync: *She says quietly, "I already knew."* For element-bound characters with voice binding, the bound voice is used automatically.
- **SFX** — specific sound events: *Rain hammers the glass. A door closes softly in the distance. A floorboard creaks.*
- **Ambient** — continuous background: *Quiet hum of an empty apartment. Distant city traffic.*

For multi-shot, state audio per shot (brief) — the model tracks continuity across cuts. A held silence is also a valid audio direction: *no music, room tone only.*

Kling 3.0 Omni supports multilingual dialogue (English, Japanese, Korean, Spanish). State the language if not English: *She says in Japanese, "..."*

---

## Motion Control

Motion Control extracts the movement pattern from a **reference video** (3–30 seconds) and applies it to a character image — physics-accurate, with real-world gravity, balance, deformation, and inertia preserved.

**How it works:**
- Upload a character image (the subject)
- Upload a reference video (the motion source — can be any person performing the movement)
- Write a prompt describing the scene, not the motion — the reference video controls how the character moves
- The model transfers the motion onto the character, adapting it to the new subject's proportions

**Supported motion types:**
Walking, running, dancing, martial arts, hand gestures, facial expressions, and complex choreography.

**Physics keywords in prompts:**
When physical accuracy matters, add these directly to the prompt:
- `"realistic gravity"` — weight and momentum of objects/bodies
- `"smooth motion"` — fluid, physically coherent movement
- `"natural inertia"` — continuation of motion after force is applied

These are active prompt keywords, not descriptions — they signal the model to prioritize physics simulation.

**Prompt structure for Motion Control:**
The prompt describes the scene and character only — the reference video carries the motion:
```
<<<element_1>>> in a rain-slicked alley at dusk, cool neon reflections on the ground. Natural inertia, smooth motion. Cinematic 35mm grain, high contrast, deep shadows.

Negative: sliding feet, floating limbs, distortion, subtitles.
```

---

## Negative Prompt

Kling supports a **true dedicated negative prompt field** — use it. Keep it focused on the real risks for the specific generation.

**Standard continuity guards (use always):**
`face distortion, identity drift, extra limbs, warping, subtitles`

**When using Element Reference (add):**
`clothing change, hair color shift, skin tone drift`

**When prompting motion (add for complex moves):**
`sliding feet, floating limbs, camera shake` *(unless handheld is intended)*

**When prompting environments (add):**
`text on screen, watermarks, logos`

Do not stuff the negative field — name only the risks specific to this generation. An overcrowded negative prompt confuses the model as much as an overcrowded positive one.

---

## Output: Natural Language, Wrapped

The five-layer order is how you *think*, not how you write. Kling reads flowing natural language. Deliver in a code block — single paragraph for one shot, shot-by-shot for multi-shot.

**Single paragraph (I2V, start frame):**
```
A woman stands at a rain-streaked apartment window at dusk, cool low-contrast light, lifted shadows. She exhales and her shoulders drop, then slowly turns her face a few degrees toward the door behind her. A slow telephoto push-in compresses her against the blurred glass, settling as she turns. Steady rain on the glass, one distant passing car, no music. Hold the cool, lonely blue cast throughout.

Negative: face distortion, identity drift, extra limbs, subtitles.
```

**Start + end frame (the reveal):**
The uploaded image is the start; the inferred "after" is the end composition. The prompt describes only the connecting path:
```
The camera pulls back steadily as she lowers the letter, revealing the empty chair across the table. Cool grade held, rain ambience, slow and deliberate.

Negative: face distortion, warping, subtitles.
```

**Element-bound single shot:**
```
<<<element_1>>> stands at a rain-streaked window at dusk, still. She exhales and her shoulders drop, then slowly turns toward the door. Slow telephoto push-in. Rain on glass, one distant car. Cool low-contrast grade, blue cast held.

Negative: face distortion, identity drift, clothing change, subtitles.
```
