---
name: kling-3-director
description: Build production-grade Kling 3.0 video prompts in the correct directing format for Kling AI. Use this skill whenever the user mentions Kling, Kling 3.0, Kling AI, KlingAI video, image-to-video, text-to-video, start/end frame video, multi-shot video, Elements/reference-based video, native audio or dialogue video prompts, or asks for help turning a scene idea, product shot, or character into a shootable Kling prompt — even if they don't name Kling explicitly. Also trigger when the user shares a reference image, product photo, storyboard, or character they want animated and mentions Kling, or when they ask why a Kling generation drifted, warped, morphed, or lost a logo/face/label and want a prompt fix. Also trigger when the user wants a character that TALKS (dialogue, speaking, lip-sync, a presenter) or MOVES fast (running, dancing, fighting, action, sports). Also trigger when the user wants multiple shots or camera cuts, asks how to move or angle the camera, uses vague camera language ("make it cinematic/dynamic/epic"), or needs a transition. Also trigger when the user asks where to paste a prompt, how to set up the Kling UI, which field to use, or asks about Elements, duration, credits, or character limits.
---

# Kling 3.0 Director

Treat Kling 3.0 as a **mini directing system**, not a prompt-to-random-video tool. The strongest prompts define a subject, what moves, the camera logic, lighting/style, motion over time, what stays consistent, and what must not happen.

Kling 3.0 supports text-to-video, image-to-video, start/end frames, native audio, multi-shot generation, start-frame + element reference, multi-character coreference, multilingual speech with dialect/accent control, and flexible 3–15 second output.

## How this skill operates

**Every prompt this skill outputs must conform to the principles below.** This skill is interactive by default: it leads with a direction question, then drafts a prompt in the *format* that fits the request. Take the user's answers and deliver exactly what they're asking for, written as a controlled director's shot in the right format for the use case.

Five non-negotiable habits (full detail in `references/prompt-craft.md`):
1. **Hierarchy** — most important instruction first.
2. **Constraints over adjectives** — "locked-off camera, logo stays centered" matters more than "cinematic, premium."
3. **One major motion layer per shot** — of subject / camera / environment / light, drive one strongly.
4. **Prompt stillness** — state what must NOT move.
5. **Relevant "No..." terms only** — target the artifact category at hand.

## Entering prompts on kling.ai

All templates in this skill are written as labeled shot blocks. On kling.ai:

**Negative prompts go inline.** There is no separate negative prompt field. Write "No..." phrasing at the end of the prompt or at the end of each shot field.

**Two paths for multi-shot prompts — the skill picks automatically:**
- **Single shot** → paste into the single prompt field.
- **Multi-shot** → use Custom Multi-Shot (click the button, get per-shot fields with duration controls). Split each shot into its own field.

The skill states which path to use at the top of every prompt output.

**Elements** are uploaded through the Element Library UI, not described in the prompt. The @tag (@Tom, @Jane) references the uploaded element. Up to 7 elements/reference images (or up to 4 if a video reference is included), each @tag costs 37 characters. Prompt budget: 2,500 characters total. Elements can also be created from a 3–8s video clip of a character, which extracts both appearance and voice — binding a consistent voice to the Element for dialogue shots.

Elements aren't exclusive to Elements mode — they can also drive Image-to-video generation directly (upload reference images as Elements, then animate them). And voice-bound characters or native multi-shot storyboarding aren't just a tag-formatting choice: those capabilities come from the Video 3.0 Omni model specifically, which extends the base Elements feature with voice extraction from a reference video and built-in storyboard controls.

## Step 1 — Open with a direction question

Before drafting any prompt, lead with ONE question about creative direction.

**Default opening question:**

> "Before I draft the prompt — what's the creative direction? Tone, reference films or directors, mood, and what the video is for (ad, social, mood piece, personal)?"

**Skip the opening question only when:**
- The user has already provided a full brief (subject + style + intent + references all named).
- The user explicitly asks for a quick draft.
- The request is a small variant on a prompt already drafted in the same conversation.

**After the direction answer, decide on 0–2 follow-ups.** Pick from the question bank below only if a genuine fork would change the whole prompt. **Never ask more than 3 questions total before drafting.**

### Question bank (pick 0–2 as follow-ups)

- **Inputs:** "Is the image a start frame, a style reference, or a locked Element?"
- **Identity locks:** "What must stay identical — face, outfit, logo, scene? Anything that can change?"
- **Sequence:** "Single shot, or a multi-shot sequence? Total duration target?"
- **Dialogue:** "Solo speaker, two-person dialogue, or voiceover? Tone for each?"
- **Camera technique:** "Is the camera move the hero of the shot, or supporting?"
- **Format preference:** "Prose, compact one-sentence, labeled shot blocks, or Omni @tag?"
- **Output use:** "Where is this going — social, ad, mood piece, portfolio?"

### Conditional logic — how many follow-ups

- **Short brief** → direction question only, then draft.
- **Medium brief** (one Element OR an image) → direction + ONE follow-up.
- **Heavy brief** (multi-shot, commercial, multiple Elements, dialogue) → direction + TWO follow-ups.

## Step 2 — Pick the mode

| Mode | Job | Best for |
|------|-----|----------|
| Text-to-video | Direct the whole scene from scratch | cinematic concepts, ads, fantasy/sci-fi |
| Image-to-video | Animate what already exists | product/ecommerce, preserving a real face/logo |
| Elements (reference) | Lock identity/consistency | recurring characters, mascots, products — can layer onto Image-to-video |
| Custom Multi-Shot | Control story, timing, edits | 10–15s ads, short films, dialogue scenes |
| Start + End frame | Planned transitions | product reveals, before/after, loops |

Rule of thumb: **text-to-video invents, image-to-video preserves, Elements lock.**

### Talking or moving characters — read the reference first

If the character **talks** or **moves fast**, read `references/talking-and-motion.md` before building the prompt.

### Exotic cameras — read the reference first

If the camera itself is the unusual element, read `references/camera-and-multishot.md`.

### Products, packaging, logos — read the reference first

If a real product, logo, or label must survive intact, read `references/product-element-guide.md`.

## Step 3 — Pick the format and path

Mode decides *what tools* the prompt uses. Format decides *how the prompt reads*. Path decides *how it enters the UI*.

| Format | Use when | Path |
|--------|----------|------|
| **1. Prose** — one continuous paragraph | Single shot, mood/scene focus | Single field |
| **2. Compact formula** — one structured sentence | Image-to-video, single shot with one Element | Single field |
| **3. Labeled shot blocks** | Multi-shot, commercial, identity-critical | Custom Multi-Shot |
| **4. Omni @tag system** | Multiple Elements, dialogue, voice-bound characters | Custom Multi-Shot |

Omni @tag format assumes the Video 3.0 Omni model — its voice-binding and storyboard controls aren't available on plain Video 3.0.

**State the path at the top of every prompt output:**
- Single shot → *"Paste into the single prompt field."*
- Multi-shot → *"Use Custom Multi-Shot — one shot per field."*

## Step 4 — Use the right formula for the mode

Write prompts as **scene directions**, not keyword lists.

### Text-to-video

```
Subject:
Action:
Environment:
Camera:
Lighting:
Style:
Motion details:
Audio:
No [relevant artifacts].
```

**Example — brand ad (single field):**
```
Subject: A premium matte-black smart watch with a glowing edge display.
Action: The watch slowly rises from a pool of dark reflective liquid as droplets roll off the metal frame.
Environment: Minimal black studio, glossy reflective floor, faint mist.
Camera: Extreme close-up at first, then a slow macro push-in toward the watch face, ending on a hero shot.
Lighting: Soft top light, thin blue rim light, controlled reflections.
Style: High-end technology commercial, realistic, elegant, dramatic slow motion.
Motion details: Droplets move naturally, the watch remains perfectly stable.
No distorted watch face, no extra buttons, no unreadable text, no flickering reflections, no shaky camera, no melted metal.
```

### Image-to-video

The image already defines the scene — prompt mainly **what moves and how**.

```
The [main subject] [specific movement].
The [background] [specific movement].
The camera [specific camera movement].
Preserve the original [face / product / logo / composition / lighting].
No [identity drift, warping, unwanted changes].
```

#### Stronger continuity phrasings

- **Start frame role** — "Use the provided image as the exact opening visual reference."
- **Colorimetry lock** — "Preserve the color grading and atmosphere of the first frame."
- **Identity lock** (people) — "Preserve @CharacterA's exact face, hairstyle, expression, and outfit."
- **Identity lock** (product) — "Preserve the exact product shape, logo, label, color, material."

### Elements (reference-based)

```
Use [Element Name] as the locked subject.
Preserve [identity / face / outfit / product shape / logo].
Scene: [new environment].
Action: [specific motion].
Camera: [specific camera move].
Do not alter [critical traits].
```

### Custom Multi-Shot

Use Custom Multi-Shot — one shot per field.

**Shot 1 field:**
```
Master scene: [overall concept, style, subject, environment].
[Framing] of [subject/action]. Camera [movement].
```

**Shot 2 field:**
```
[Framing] of [subject/action]. Camera [movement].
```

**Shot 3 field (last):**
```
[Framing] of [subject/action]. Camera [movement].
Continuity: Preserve [identity / product / lighting / style] across all shots.
Audio: [dialogue / music / ambient if needed].
No [relevant artifacts].
```

### Start + End frame

```
Start from the uploaded first frame.
Transition naturally into the uploaded end frame.
Connect them with: [subject motion] [camera motion] [environment change].
Preserve: [identity / product / scene details].
No [relevant artifacts].
```

## Step 5 — Direct motion and camera explicitly

**Separate the four motion layers:**
```
Subject motion: The model walks slowly forward and turns her head toward the camera.
Object motion: Her coat moves naturally in the wind.
Environment motion: Light rain falls, neon reflections shimmer on the road.
Camera motion: The camera tracks backward at walking speed, keeping her centered.
```

**Use exact camera verbs**, not "epic/dynamic/cinematic camera." Give camera movement a purpose and use **one main camera move per shot.**

For precise camera work — the full glossary, lenses, rigs, and templates — read `references/camera-and-multishot.md`.

## Step 6 — Audio and dialogue (when needed)

Label each speaker with a visual anchor and a tone tag:

```
[Character A, young woman in a green sweater, soft Kenyan English accent, calm but emotional]: "I think it's time we start again."
[Character B, young man in a dark jacket, low voice, gentle tone]: "Then we do it properly this time."
```

Don't set a tone if the speaker is a voice-bound Element.

## Step 7 — Write failure-targeted "No..." terms

Always include "No..." terms at the end of the prompt. Target the **specific artifact category** — don't use a generic block.

Start with the relevant category from `references/prompt-craft.md` (Product / Character / Motion / Scene / Image-to-video). Add specific items as defects appear in generations.

**Iterate by diagnosis:**
- Logo changed → add "no altered logo, no changed text"
- Face changed → add "no face morphing, no identity drift"
- Motion jittery → add "no jitter, no unstable camera"
- Bad hands → add "no complex finger gestures, no extra fingers"

## Core rules (apply to every prompt)

1. One main action per shot.
2. Camera movement must have a purpose; one main move per shot.
3. For image-to-video, describe movement, not the whole scene.
4. Repeat the exact subject label — don't alternate woman/girl/model/lady.
5. Put preservation instructions next to the action.
6. Use Elements for anything that must stay identical across shots.
7. Update "No..." terms based on the actual defect from the last generation.
8. Hierarchy: lead with the most important instruction.
9. Drive one major motion layer per shot; keep the rest subtle.
10. State what must NOT move.
11. Adapt vague requests into this structure with sensible defaults.

## Format templates

### Format 1 — Prose (single field)

> A skater carves down a wet downtown street at dusk, neon reflections streaking across the pavement; the camera tracks alongside in a smooth low-angle gimbal pass; warm sodium streetlights against a cool blue ambient sky. No jitter, no warped body, no unstable background.

### Format 2 — Compact formula (single field)

> @CharacterA walks slowly forward and turns her head toward the camera, hair drifting in a light breeze; camera slow push-in from medium to close-up; golden hour rim light, shallow depth of field; preserve face, hairstyle, and outfit. No face morphing, no identity drift, no changing outfit.

### Format 3 — Labeled shot blocks (Custom Multi-Shot)

Use the per-mode templates above. Each shot goes in its own field.

### Format 4 — Omni @tag system (Custom Multi-Shot)

**Shot 1 field:**
```
@CharacterA sits across from @CharacterB at a small café table, late afternoon light. @CharacterA leans forward slightly. Camera: locked-off medium two-shot.
@CharacterA, calm and low: "I've been thinking about it."
```

**Shot 2 field:**
```
Reverse medium close-up of @CharacterB.
@CharacterB, surprised: "About what?"
Ambient: faint café chatter, espresso machine hiss.
No mismatched lip sync, no wrong speaker, no face morphing, no identity drift.
```

## Professional workflow

1. Design or generate a strong still image first.
2. Use image-to-video for controlled animation — prompt motion only.
3. Create Elements for recurring people/products/mascots.
4. Use Custom Multi-Shot for ads; split into 3–5 shots.
5. Test in stages: subject motion first, then camera, then audio.
6. Iterate with failure-specific "No..." terms, not a fixed generic block.

## File structure

```
kling-3-director/
├── SKILL.md                              # Entry point — always loaded
└── references/
    ├── prompt-craft.md                   # 20 craft rules, master template, negative-term catalogs
    ├── camera-and-multishot.md           # Camera glossary, rigs, impossible moves, multi-shot templates
    ├── talking-and-motion.md             # Talking-mouth stabilization + fast-motion fixes
    └── product-element-guide.md          # Logo preservation, packshots, orbits, multi-shot product ads
```

Reference files load **on demand** — Claude reads them only when the request type warrants it.
