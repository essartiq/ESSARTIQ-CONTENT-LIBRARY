---
name: kling-3-director
description: Build production-grade Kling 3.0 video prompts in the correct directing format for Kling AI. Use this skill whenever the user mentions Kling, Kling 3.0, Kling AI, KlingAI video, image-to-video, text-to-video, start/end frame video, multi-shot video, Elements/reference-based video, native audio or dialogue video prompts, or asks for help turning a scene idea, product shot, or character into a shootable Kling prompt — even if they don't name Kling explicitly. Also trigger when the user shares a reference image, product photo, storyboard, or character they want animated and mentions Kling, or when they ask why a Kling generation drifted, warped, morphed, or lost a logo/face/label and want a prompt fix. Critically, also use this skill whenever the user wants a character that TALKS (dialogue, speaking, lip-sync, a presenter, a voiceover character) or MOVES fast (running, dancing, fighting, action, sports) — these need special stabilization, covered in references/talking-and-motion.md. And use it whenever the user wants multiple shots or camera cuts, asks how to move or angle the camera, uses vague camera language ("make it cinematic/dynamic/epic"), or needs a transition (match cut, cross-cut, insert, shot-reverse-shot) — camera and multi-shot direction is covered in references/camera-and-multishot.md. The overarching craft rules that every Kling prompt must follow — prompt hierarchy, constraints over adjectives, motion layers, stillness, continuity, physical realism, and the master template — live in references/prompt-craft.md.
---

# Kling 3.0 Director

Treat Kling 3.0 as a **mini directing system**, not a prompt-to-random-video tool. The strongest prompts define a subject, what moves, the camera logic, lighting/style, motion over time, what stays consistent, and what must not happen. The decisive shift in 3.0 is to **prompt for sequence, continuity, and controlled motion** — not just image aesthetics.

Kling 3.0 supports text-to-video, image-to-video, start/end frames, native audio, multi-shot generation, start-frame + element reference, multi-character coreference, multilingual speech with dialect/accent control, and flexible 3–15 second output.

## How this skill operates

**Every prompt this skill outputs must conform to the principles below — not just the ones the user happened to ask about.** This skill is interactive by default: it leads with a direction question (and 0–2 follow-ups when the brief is complex), then drafts a prompt in the *format* that fits the request — not always the heaviest one. Take the user's answers and deliver exactly what they're asking for, written as a controlled director's shot in the right format for the use case. Only skip the opening question if the user's brief is already complete (subject + style + intent + references all named) or they explicitly ask for a quick draft.

Five non-negotiable habits, applied to every prompt (full detail and the master template in `references/prompt-craft.md`):
1. **Hierarchy** — most important instruction first; for brand/product work the opening line is a preservation command.
2. **Constraints over adjectives** — "locked-off camera, logo stays centered, product does not change shape" matters more than "cinematic, premium."
3. **One major motion layer per shot** — of subject / camera / environment / light, drive one strongly and keep the rest subtle.
4. **Prompt stillness** — state what must NOT move, and add a continuity block to any multi-shot prompt.
5. **Relevant negative prompt only** — target the artifact category at hand, not a generic block.

When the user wants higher fidelity, asks why results drift, or hands over a vague brief, read `references/prompt-craft.md` for the full 20-point craft guide (motion layers, physical realism, start/end pose, composition anchors, text/logo handling, one-impossible-thing, version-one-variable-at-a-time, edit-in-mind workflow).

## Step 1 — Open with a direction question

Before drafting any prompt, lead with ONE question about creative direction. This is the highest-value elicitation — it unlocks tone, references, intent, and the visual language the prompt should use, all in one ask.

**Default opening question:**

> "Before I draft the prompt — what's the creative direction? Tone, reference films or directors, mood, and what the video is for (ad, social, mood piece, personal)?"

**Skip the opening question only when:**
- The user has already provided a full brief (subject + style + intent + references all named).
- The user explicitly asks for a quick draft ("just give me something," "no questions, just write it").
- The request is a small variant on a prompt already drafted in the same conversation.

**After the direction answer, decide on 0–2 follow-ups.** Pick from the question bank below only if a genuine fork would change the whole prompt. **Never ask more than 3 questions total before drafting.** If the user's first message already answers some of these (e.g. they uploaded a product image and said "Instagram ad"), don't re-ask — acknowledge what's known and ask only what's still missing.

### Question bank (pick 0–2 as follow-ups)

- **Inputs:** "Is the image a start frame, a style reference, or a locked Element?"
- **Identity locks:** "What must stay identical — face, outfit, logo, scene? Anything that can change?"
- **Sequence:** "Single shot, or a multi-shot sequence? Total duration target?"
- **Dialogue:** "Solo speaker, two-person dialogue, or voiceover? Tone for each?"
- **Camera technique:** "Is the camera move the hero of the shot, or supporting?"
- **Format preference:** "Prose, compact one-sentence, labeled shot blocks, or Omni @tag?" *(Only ask if the user has shown awareness of formats; otherwise pick for them in Step 3.)*
- **Output use:** "Where is this going — social, ad, mood piece, portfolio?"

### Conditional logic — how many follow-ups

- **Short brief** (one line, no Element, no commercial intent) → direction question only, then draft.
- **Medium brief** (one Element OR an image, single use case) → direction + ONE follow-up (usually identity locks or input role).
- **Heavy brief** (multi-shot, commercial, multiple Elements, dialogue) → direction + TWO follow-ups (inputs + sequence/locks).

## Step 2 — Pick the mode

Choose the mode from the user's intent before writing anything. Each mode has a different job:

| Mode | Job | Best for |
|------|-----|----------|
| Text-to-video | Direct the whole scene from scratch | cinematic concepts, ads, fashion, fantasy/sci-fi, stylized motion, storyboards |
| Image-to-video | Animate what already exists | product/ecommerce, preserving a real face/outfit/logo, controlled motion |
| Elements (reference) | Lock identity/consistency | recurring characters, mascots, products, brand assets across shots |
| Custom Multi-Shot | Control story, timing, edits | 10–15s ads, short films, reels, dialogue scenes |
| Start + End frame | Planned transitions | product reveals, before/after, social loops |

Rule of thumb: **text-to-video invents, image-to-video preserves, Elements lock.** Combine them for professional work: design a strong still → bind key Elements → use image-to-video or Custom Multi-Shot → specify exact motion + camera → preserve critical details → iterate with targeted negative prompts.

If the user's goal is logo/text-heavy or must match a real product/face exactly, do NOT use pure text-to-video — start from a designed image or an Element reference.

### Talking or moving characters — read the reference first

If the character **talks** (dialogue, lip-sync, presenter, voiceover) or **moves fast** (running, dancing, fighting, sports, action), these are the two most common sources of distortion and need specific stabilization. Before building the prompt, read `references/talking-and-motion.md` and adapt the base formula to suit:

- **Talking** → reduce facial complexity: close-up/medium close-up, head mostly still, short calm dialogue (5–12 words), locked-off camera, neutral expression, an Element with a clean reference (and voice binding if available), plus a mouth-targeted negative prompt.
- **Fast motion** → isolate variables: one clear action per shot, wide full-body framing, stable camera (fast subject *or* fast camera, never both), controlled slow motion, minimal background motion, multi-shot for sequences.

The single most important rule: **don't make a character talk while moving fast in the same shot unless unavoidable** — generate the dialogue shot and the action shot separately and edit them together. The reference file has ready-to-use safe-default prompts and a troubleshooting table for both cases.

### Exotic cameras, rigs, and stylized references — read the reference first

A second class of requests needs the same kind of upfront stabilization as talking/fast-motion: anything where the *camera itself* is the unusual element. Before building the prompt, read `references/camera-and-multishot.md` and adapt the formula accordingly. Triggers:

- **Impossible camera moves** — bullet time, dolly zoom / Vertigo, camera-through-object (keyhole, window, doorway), infinite/cosmic zoom, Droste/recursive zoom, long-take oner. Each has a precise vocabulary and a safer fallback when Kling can't sustain the technique.
- **Physically impossible rigs** — FPV through tight spaces, body-mount/snorricam, 360° orbit mid-action, crash zoom, whip pan as mid-action move.
- **Lens looks** — ultra-wide/GoPro, fisheye, anamorphic, macro/probe, snorkel/periscope, tilt-shift/miniature, telephoto compression. Kling treats these as style cues, not optical simulations; name the focal length AND the visible consequence.
- **POV variants** — walking, running, driver/passenger, looking-down-at-hands, over-the-shoulder, reflection/surveillance. Each has different risk levels.
- **Stylized references** — Wong Kar-wai step-printing, Edgar Wright whip-pans, Gondry/Jonze surreal, Wes Anderson symmetry, Fincher geometric. Naming a director helps a little; naming the visible technique helps a lot.
- **Action montages** — car commercials, fight scenes, pit stops, heist sequences, sports edits. These use a specific 2s × 5-shot pattern that violates the usual "avoid 1-second cuts" rule — see the action-montage template.
- **Camera rigs** — when the user says "onboard," "hood-mounted," "chassis-mount," "snorricam," "body-mount," "gimbal," "Steadicam," "FPV drone," or "POV," they're naming a rig, not a movement. Rig vocabulary disambiguates jitter, vibration, and stability in ways generic "handheld" doesn't.
- **Intra-shot beats and speed ramps** — when the user wants a single triggered change inside one continuous shot (a focus pull, a snap-zoom onto something passing overhead, slow-motion on impact, time ramping back to real speed), they need timestamped beats inside a single shot, not multi-shot.

The governing rule across all of these: **the more exotic the camera, the more boring the subject motion should be.** Don't stack a dolly zoom with a body-mount on a running character through a keyhole — pick one impossible thing per shot and let everything else stay calm. The reference file has glossaries, risk levels, fallbacks, and ready-to-fill templates for each case.

### Products, packaging, and logo-heavy work — read the reference first

A third class of requests has its own playbook: anything where a real product, its logo, label text, packaging, or brand mark must survive intact through the shot. Generic preservation language isn't enough — products break in specific ways (warped logos, misspelled labels, melted reflections, invented back-side details on rotation). Before building the prompt, read `references/product-element-guide.md`. Triggers:

- **Branded product video** — bottle, can, appliance, gadget, cosmetic, beverage, packaged good. Anything with a visible logo or label.
- **Ecommerce hero shots, product launches, premium ad spots, packshots, unboxing.**
- **Logo close-ups, macro detail shots of labels, typography, brand marks.**
- **Product rotation, turntable, orbit, or 360°** — these are the highest-risk moves for logo distortion; the reference covers the 30–45° fallback and when to use turntable vs. orbit.
- **Open-lid / feature-demo shots** — products with moving parts (lid, cap, hinge) where only one part should move.
- **Multi-shot product ads** — 3-shot or 5-shot ecommerce structure with continuity locks.

The governing rule: **the Element is the source of truth — don't re-describe the product, just direct the camera, lighting, and motion around it.** Re-describing what the Element already defines is the fastest way to make Kling reinvent the logo. The reference has master templates for hero shots, orbits, turntables, open-lid demos, logo close-ups, and the full multi-shot product ad structure.

## Step 3 — Pick the format

Mode (text-to-video / image-to-video / Element / Multi-Shot / Start+End) decides *what tools* the prompt uses. Format decides *how the prompt reads*. Four formats, each suited to a different request shape. **Default to the leanest format that fits the brief — heavier formats earn their weight only when the use case demands them.**

| Format | Use when | Risk if used wrongly |
|--------|----------|----------------------|
| **1. Prose** — one continuous sentence or short paragraph | Single shot, mood/scene focus, text-to-video, no identity lock needed | Too loose for commercial; identity will drift |
| **2. Compact formula** — one structured sentence (subject + motion + camera + light) | Image-to-video, single shot with one Element, "give me a shot" requests | Too dense for true multi-shot |
| **3. Labeled shot blocks** — Shot 1, 2, 3 with Camera/Lighting/Continuity | Multi-shot (3+ shots), commercial, action montage, identity-critical | Reads bureaucratic on simple single-shot requests; prompts look samey |
| **4. Omni @tag system** — `@Element` references + tone-tagged dialogue | Omni model, multiple Elements, dialogue, voice-bound characters | @tags get ignored on non-Omni endpoints |

**Default decisions:**
- Text-to-video, single shot, no identity lock → **Format 1 (prose).**
- Image-to-video, single shot → **Format 2 (compact).**
- Element-based, single shot → **Format 2 (compact)** with one preservation clause.
- Multi-Shot mode OR commercial/brand brief OR identity-critical sequence → **Format 3 (labeled blocks).**
- Omni model OR multiple Elements OR dialogue scene → **Format 4 (@tag).**

If the user explicitly asks for a format ("write it as prose," "give me labeled blocks"), honor that even when it's not the default. See `Format templates` below for ready-to-fill examples of each.

## Step 4 — Use the right formula for the mode

Write prompts as **scene directions**, not keyword lists. A weak prompt is "A futuristic product video, cinematic, beautiful, 4K." Every prompt should answer: who/what is the subject, what exactly moves, how the camera moves, what stays consistent, what changes over time, what must not happen.

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
Negative prompt:
```

**Example — brand ad:**
```
Subject: A premium matte-black smart watch with a glowing edge display.
Action: The watch slowly rises from a pool of dark reflective liquid as droplets roll off the metal frame.
Environment: Minimal black studio, glossy reflective floor, faint mist in the background.
Camera: Extreme close-up at first, then a slow macro push-in toward the watch face, ending on a clean hero shot.
Lighting: Soft top light, thin blue rim light, controlled reflections.
Style: High-end technology commercial, realistic, elegant, dramatic slow motion.
Motion details: Droplets move naturally, the watch remains perfectly stable, no warping.
Negative prompt: distorted watch face, extra buttons, unreadable text, flickering reflections, shaky camera, melted metal.
```

### Image-to-video

The image already defines subject, composition, color, product shape, and environment — so prompt mainly **what moves and how**, not the whole scene. Core formula: `Subject + Movement, Background + Movement`.

```
The [main subject in the image] [specific movement].
The [secondary object/background] [specific movement].
The camera [specific camera movement].
Preserve the original [face / product / logo / composition / lighting].
Negative prompt: [identity drift, warping, unwanted changes].
```

**Weak:** "Make it cinematic."
**Strong:** "The woman in the image slowly turns her head toward the camera and smiles softly. Her hair moves slightly in a gentle breeze. The background lights flicker subtly. The camera performs a slow push-in while keeping her face sharp and consistent. Preserve her facial identity, outfit, and original lighting. Negative prompt: face morphing, changing hairstyle, distorted eyes, extra people, unstable background."

Kling 3.0 has improved text/logo preservation (signs, captions, labels), but exact lettering is most reliable when it starts from a designed image or product reference.

#### Stronger continuity phrasings

Pure "preserve the original face / product / lighting" is the minimum. Kling 3.0 holds image-to-video continuity better when you name *what the start frame is for*. Add one or more of these phrasings depending on what needs to stay locked:

- **Start frame role** — "Use the provided image as the exact opening visual reference." / "Take image as the start frame." This tells Kling the image is the literal first frame, not just a style reference.
- **Colorimetry lock** — "Every shot preserves the color grading and atmosphere of the first frame." / "Preserve the exact color palette, contrast, and grade of the start frame across all shots." Strong for multi-shot ads where the look must hold.
- **Atmosphere lock** — "Preserve the atmosphere, light quality, and environmental mood of the start frame." Use for cinematic/moody work where the *feel* matters as much as the geometry.
- **Geometry lock** — "Preserve the exact composition, camera angle, framing, and subject position from the start frame for the first beat of the shot." Use when the first beat should match the still before anything moves.
- **Identity lock** (people) — "Preserve @CharacterA's exact face, hairstyle, expression, and outfit from the start frame across all shots."
- **Identity lock** (product) — "Preserve the exact product shape, logo, label, color, material, and brand placement from the start frame across all shots."

Stack the locks that apply, in order of priority (identity → colorimetry → atmosphere → geometry). Don't stack all five for every shot — pick the two or three that match the failure you're protecting against.

### Elements (reference-based, for consistency)

Use Elements to lock a face, product, mascot, wardrobe, brand asset, or recurring object across motion, camera changes, or multiple shots. Elements are created from a short character video or **2–4 reference images**; character elements can also carry a voice tone.

```
Use [Element Name] as the locked subject.
Preserve [identity / face / outfit / product shape / logo / color / material].
Scene: [new environment].
Action: [specific motion].
Camera: [specific camera move].
Do not alter [critical traits].
```

**Critical rule — name the element consistently.** Don't describe the same element two ways in one prompt.
- Bad: "Use the red bottle. Later, the blue glass perfume bottle rotates."
- Good: "Use the red cylindrical perfume bottle with a gold cap as the locked product element. Preserve the red glass, gold cap, and centered white logo throughout the shot."

If an Element already has a pre-bound voice tone, do NOT re-specify the tone in the prompt.

### Custom Multi-Shot

Use when the user needs a sequence, not one moving image. Multi-Shot can auto-plan transitions/framing; Custom Multi-Shot lets you control each shot and its duration.

```
Master scene: [overall concept, style, subject, environment].
Shot 1, [duration]: [framing] of [subject/action]. Camera [movement].
Shot 2, [duration]: [framing] of [subject/action]. Camera [movement].
Shot 3, [duration]: [framing] of [subject/action]. Camera [movement].
Continuity: Preserve [identity / product / lighting / style] across all shots.
Audio: [dialogue / music / ambient if needed].
Negative prompt: [artifacts].
```

Split a 10–15s ad into 3–5 shots. Keep one main action per shot. For anything beyond a simple sequence — choosing cut types (establishing/reverse/cross-cut/match/insert), shot counts and duration splits, per-shot structure, and the full camera-move glossary — read `references/camera-and-multishot.md`.

### Start + End frame

```
Start from the uploaded first frame.
Transition naturally into the uploaded end frame.
Connect them with: [subject motion] [camera motion] [environment change].
Preserve: [identity / product / scene details].
Negative prompt: [artifacts].
```

## Step 5 — Direct motion and camera explicitly

**Separate the four motion layers** instead of writing "a woman walking in the rain, cinematic":
```
Subject motion: The model walks slowly forward and turns her head toward the camera.
Object motion: Her coat moves naturally in the wind.
Environment motion: Light rain falls in the background, neon reflections shimmer on the road.
Camera motion: The camera tracks backward at walking speed, keeping her centered.
```

**Use exact camera verbs**, not "epic/dynamic/cinematic camera": static locked-off shot, slow push-in, slow pull-back, tracking shot, camera tracks backward, side tracking shot, low-angle dolly-in, top-down shot, macro close-up, slow orbit, gentle pan left, gentle tilt upward, crane rising slowly.

Give camera movement a purpose (reveal, emphasize, follow, transition) and use **one main camera move per shot** unless using Custom Multi-Shot — too much camera movement reduces consistency.

**Don't overload one shot.** Instead of "a man runs, jumps, turns into smoke, flies through a city, changes clothes, talks, camera spins," break it into shots with one clear action each.

For precise camera work — the full movement glossary (push-in, tracking, orbit, tilt, crane, POV, macro), angles and lenses, an intensity/risk scale, best moves per use case, and ready-made multi-shot templates — read `references/camera-and-multishot.md`.

## Step 6 — Audio and dialogue (when needed)

Native audio supports Chinese, English, Japanese, Korean, and Spanish plus dialects/accents. For dialogue, label each speaker with a visual anchor and a tone tag, and use temporal order to avoid merged speech:

```
[Character A, young woman in a green sweater, soft Kenyan English accent, calm but emotional]: "I think it's time we start again."
[Character B, young man in a dark jacket, low voice, gentle tone]: "Then we do it properly this time."
```
Use natural shot-reverse-shot framing for two-person scenes. Negative prompt for dialogue: mismatched lip sync, wrong speaker, overlapping voices. Don't set a tone if the speaker is a voice-bound Element.

## Step 7 — Write a failure-targeted negative prompt

Always include a negative prompt. Prefer targeting the **specific artifact you actually saw** over a giant generic block, and use only the category that fits the shot.

General-purpose block when you have no specific failure yet: blurry subject, distorted face, extra fingers, deformed hands, warped body, unstable clothing, flickering background, random text, unreadable logo, duplicated subject, morphing identity, unnatural motion, jittery camera, melted objects.

For the per-category catalogs (Product / Character / Motion / Scene) use the canonical lists in `references/prompt-craft.md` — that file is the single source of truth for negative-prompt groups; don't keep separate copies.

**Iterate by diagnosis, not by reusing one block forever:**
- Logo changed → add "preserve exact logo, no altered text"
- Face changed → add "preserve facial identity, no face morphing"
- Motion jittery → add "smooth natural motion, stable camera"
- Bad hands → add "hands mostly relaxed, no complex finger gestures"

## Core rules (apply to every prompt)

1. One main action per shot.
2. Camera movement must have a purpose; one main move per shot.
3. For image-to-video, describe movement, not the whole scene.
4. For consistency, repeat the exact subject label (e.g. "Product Element A", "the woman in the blue coat") — don't alternate woman/girl/model/lady.
5. Put preservation instructions next to the action: "The camera orbits the perfume bottle while preserving the exact label text, gold cap, red glass material, and silhouette."
6. Use Elements for anything that must stay identical across shots.
7. Update the negative prompt based on the actual defect from the last generation.
8. Hierarchy: lead with the most important instruction; for brand/product, lead with preservation.
9. Drive one major motion layer per shot (subject / camera / environment / light); keep the rest subtle.
10. State what must NOT move, and append a continuity block to every multi-shot prompt.
11. Adapt any vague or keyword-style request into this structure with sensible defaults — deliver what's asked, in the form that generates well.

## Ready-to-fill templates

**Product / ecommerce (image-to-video):**
```
Use the uploaded product image as the source. The product remains centered and keeps its exact shape, material, color, label, and logo. The camera performs a slow premium commercial orbit around the product. Soft studio light moves across the surface, creating elegant reflections. The background stays minimal and clean. Style: high-end ecommerce product video, realistic, polished, smooth slow motion. Negative prompt: warped product, changed logo, unreadable text, extra packaging, unstable reflections, random text, distorted edges.
```

**15-second product ad (Custom Multi-Shot):**
```
Master scene: Premium ecommerce commercial for [product], minimal studio, elegant lighting, realistic motion.
Shot 1, 4s: Macro close-up of the product material and texture. Camera slowly pushes in, shallow depth of field.
Shot 2, 5s: Medium hero shot on a clean pedestal. Camera slowly orbits left, keeping the logo readable.
Shot 3, 6s: Final wide shot, soft light sweeping across the product. Camera pulls back slightly, ends centered.
Continuity: Preserve exact product shape, color, material, logo, and label across all shots.
Negative prompt: warped product, changed branding, unreadable text, flickering light, extra objects, unstable camera.
```

**Character Element:**
```
Use [Element Name] as the locked character. Preserve [face, hairstyle, outfit, body type, voice if relevant]. [Character] [specific action] in [environment]. The camera [specific behavior]. Lighting: [description]. Style: [description]. Negative prompt: changing identity, different outfit, distorted hands, duplicate character, unstable face.
```

## Format templates

The per-mode templates above default to **Format 3 (labeled shot blocks)**. Use these patterns when Step 3 selects a different format.

### Format 1 — Prose (single continuous sentence/paragraph)

Pattern (labels are implied by position, never written):
> [Subject in environment] [doing action], [secondary motion or atmosphere]; the camera [one named move]; [lighting / lens / mood touch].

Example:
> A skater carves down a wet downtown street at dusk, neon reflections streaking across the pavement; the camera tracks alongside in a smooth low-angle gimbal pass; warm sodium streetlights against a cool blue ambient sky.

### Format 2 — Compact formula (one structured sentence)

Pattern:
> [Subject or @Element] [specific action], [environmental micro-motion]; camera [one named move]; [lighting + lens cue]; [one preservation clause if Element].

Example:
> @CharacterA walks slowly forward and turns her head toward the camera, hair drifting in a light breeze; camera slow push-in from medium to close-up; golden hour rim light, shallow depth of field; preserve face, hairstyle, and outfit.

### Format 3 — Labeled shot blocks

Use the per-mode templates above (product/ecommerce, 15-second multi-shot ad, character Element). The same pattern scales from 1 shot to 6.

### Format 4 — Omni @tag system

Pattern:
> [@CharacterA description if not pre-bound] in [@SceneRef or environment]. [Action]. Camera: [move]. Dialogue tagged per character with tone. [Optional second speaker with "Immediately" or "Then" timing keyword.] Ambient sound described.

Example:
> @CharacterA sits across from @CharacterB at a small café table, late afternoon light through the window. @CharacterA leans forward slightly. Camera: locked-off medium two-shot.
> @CharacterA, calm and low: "I've been thinking about it."
> Immediately, @CharacterB, surprised: "About what?"
> Ambient: faint café chatter, espresso machine hiss in the distance.

### Same brief, four formats — for comparison

Brief: Element of a woman in a navy blazer, push-in close-up at sunset on a rooftop, she looks at camera.

**Format 1 (prose):**
> A woman in a navy blazer stands on a sunset rooftop, city haze behind her, golden light catching her face as the camera slowly pushes in to a close-up; her gaze drifts to the lens and holds, breeze lifting her hair.

**Format 2 (compact):**
> @WomanA stands still on a rooftop at golden hour, turns her head toward the camera and holds her gaze, hair drifting; camera slow push-in from medium to close-up; warm sunset rim light, shallow depth of field; preserve face, hairstyle, blazer.

**Format 3 (labeled blocks):**
```
Preservation: Preserve @WomanA's face, hairstyle, and navy blazer.
Shot 1, 5s: Medium-to-close-up of @WomanA on a rooftop at golden hour. Subject action: she turns her head slowly toward the camera and holds her gaze. Camera: slow push-in, locked-off otherwise. Lighting: warm sunset rim light from the right, soft city ambient.
Negative prompt: face morphing, identity drift, jitter.
```

**Format 4 (Omni @tag):**
> @WomanA stands on a rooftop at sunset, city skyline behind her. She turns her head toward the camera and holds her gaze. Camera: slow push-in from medium to close-up.
> @WomanA, calm tone: "It's time."
> Ambient: distant city traffic, soft wind.

All four are craft-compliant — one motion layer dominates, camera named precisely, identity preserved. The right one depends on the brief, not on a default habit.

## Professional workflow

1. Design or generate a strong still image first (for product/fashion/brand work).
2. Use image-to-video for controlled animation — prompt motion only.
3. Create Elements for recurring people/products/mascots/brand assets.
4. Use Custom Multi-Shot for ads; split into 3–5 shots.
5. Test in stages: subject motion first, then camera, then audio/dialogue.
6. Iterate with failure-specific negative prompts, not a fixed generic block.
