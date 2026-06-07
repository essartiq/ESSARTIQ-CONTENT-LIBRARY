# Prompt craft for Kling 3.0 — the rules that govern every prompt

These are the craft principles behind every prompt this skill produces, regardless of mode. The mode formulas in SKILL.md tell you *what slots to fill*; this file tells you *how to fill them well*. The governing mindset: **don't ask Kling to "make a video" — ask it to execute a controlled shot.** The more a prompt reads like a director's shot list, the more stable the result.

Apply these whenever you write or refine a Kling prompt. Read this in full when the user wants higher fidelity, asks why results drift, or hands you a vague request you need to harden into a shootable prompt. (Camera detail lives in `camera-and-multishot.md`; talking/fast-motion in `talking-and-motion.md`.)

## Prompt hierarchy — most important instruction first
Kling obeys early, concrete instructions better than late, vague ones. For brand/product work the **first sentence should be a preservation command**, then the scene, then shots.
- Strong: "Use the uploaded product image as the locked reference. Preserve the exact bottle shape, logo, label, color, and material throughout. Shot 1…"
- Weak: "Make a cinematic product ad with nice lighting. Also keep the logo the same."

## Order: must-obey before style
Structure every full prompt in this order:
1. Preservation / identity rules
2. Scene description
3. Shot-by-shot action
4. Camera movement
5. Lighting / style
6. Audio / dialogue
7. "No..." negative terms (relevant artifacts only)

## Constraint words over aesthetic words
Aesthetic words ("cinematic, premium, beautiful, dramatic") shape the look; **constraint words make the model behave** and matter more: locked-off camera, full body visible, logo remains centered, one speaker per shot, head remains mostly still, camera moves slowly, product does not change shape, same outfit across all shots. Always include constraints, not just adjectives.

## Motion layers — animate one strongly, not all
Every shot has four motion layers: **subject, camera, environment, light.** Don't drive all four hard at once. Target **1 major motion layer + 1–2 subtle minor ones.**
- Stable product shot: product still / slow camera orbit / subtle mist drifting / soft light sweep.
- Risky: subject spins + camera spins + background moves + light flashes + particles fly.

## Prompt stillness explicitly
State what should NOT move — people forget this, and it reduces distortion: "The product remains perfectly still." "The face remains stable." "The logo stays centered and readable." "The background remains static." "The camera remains locked-off." "The outfit does not change." "Body proportions remain consistent."

## Don't over-style
Too many style references conflict. Use **one main style + at most one supporting style.**
- Bad: cinematic, anime, photorealistic, documentary, cyberpunk, luxury ad, 90s VHS, Wes Anderson, noir, surreal.
- Good: "photorealistic luxury perfume commercial, minimal black studio, soft gold rim light, shallow depth of field."

## Ground motion in physical realism
Kling performs better with physically grounded motion: realistic physics, natural body weight, natural fabric movement, realistic gravity, smooth acceleration/deceleration, subtle motion blur, clean body silhouette, feet stay grounded, hands move naturally, liquid moves realistically. E.g. "Character A walks at a normal pace with natural body weight. Feet contact the ground realistically. Arms swing subtly." For products: "The bottle remains solid and rigid; reflections move naturally across the glass."

## Define start and end pose
For difficult motion, bound the beginning and ending state to prevent endless uncontrolled movement: "The model begins standing still facing camera, turns her head slightly left, then returns to a relaxed forward-facing pose by the end." "The dancer begins balanced, performs one smooth spin, ends in a stable standing pose facing camera."

## Readable silhouette for bodies
For dance/action/fashion/sports motion: "clear readable body silhouette," "full body visible from head to feet," "arms and legs remain anatomically consistent." Avoid tight framing for complex movement.

## Composition anchors
Tell Kling what stays in frame — especially for multi-character scenes: "The product remains centered." "The logo stays in the center third." "Character A remains on the left, Character B on the right." "The camera keeps the subject's full body visible." "The face remains sharp and well-lit."

## Continuity block after any multi-shot prompt
Always append a continuity block after the shot list:
- People: "Preserve the same character identity, hairstyle, outfit, body proportions, lighting style, location, and color palette across all shots."
- Products: "Preserve the exact product shape, logo, label, color, material, cap, proportions, and brand placement across all shots."
- Locations: "Keep the same room layout, furniture positions, lighting direction, and color palette across all shots."

## Text and logos are still risky
Even with 3.0's better text handling, exact typography is fragile. Use image-to-video for logos/packaging, Elements for product identity, keep text large/frontal/stable, avoid rotating text, avoid tiny text and long on-screen paragraphs.
- Good: "Preserve the exact logo from the uploaded image. The logo remains centered, frontal, sharp, and readable. The camera moves slowly and does not rotate past the label."
- Risky: "The bottle spins quickly while the label stays perfectly readable."

## Fewer adjectives, more nouns and verbs
Kling needs concrete objects, movement, and spatial relationships.
- Weak: "A beautiful cinematic futuristic scene, amazing and dramatic."
- Better: "A silver electric motorcycle stands on a wet black road at night. Neon signs reflect on the asphalt. The camera slowly pushes in from a low angle. Blue rim light outlines the frame."

## Environmental micro-motion makes shots feel alive
Small ambient motion adds life without distortion: steam rises slowly, dust drifts in light, curtains move gently, water droplets slide, neon shimmers, hair moves slightly, fabric moves subtly, smoke drifts, leaves flutter, light sweeps across the product. Prefer this over moving the hero subject too much.

## Transformations are high-risk
Only attempt a transformation if it's the whole shot, and strip all other complexity. Otherwise split: stand still → clothing subtly shifts → close-up of the final result, no dialogue.

## One impossible thing only
For surreal work, choose a single impossible element and keep everything else realistic. "A glass perfume bottle floats gently above a marble pedestal; everything else follows realistic physics." Many surreal elements at once become visual noise.

## Category-based negative terms (use the relevant group only)

Write these inline at the end of your prompt using "No..." phrasing. Pick only the category that fits the shot — don't combine all categories into one block.

- **Product:** No changed logo, no unreadable label, no warped packaging, no altered product shape, no extra products, no random text, no flickering reflections, no melted edges, no unstable shadows.
- **Character:** No changing face, no identity drift, no distorted eyes, no warped teeth, no mouth morphing, no extra fingers, no deformed hands, no unstable outfit, no duplicate person.
- **Motion:** No jitter, no motion smear, no warped limbs, no twisted legs, no rubber body, no frame tearing, no broken anatomy, no unstable camera.
- **Scene:** No random background objects, no changing location, no flickering lighting, no inconsistent color palette, no unstable architecture, no melting walls.
- **Image-to-video:** No changing original composition, no distorted source image, no face morphing, no warped background, no extra objects, no unstable camera, no loss of detail.

## Iterate one variable at a time
Don't rewrite everything after a failure. Version up: V1 subject + camera only → V2 add lighting → V3 add environment motion → V4 add audio/dialogue → V5 add "No..." terms from observed errors. This isolates the cause.

## Use reference images strategically
Product → product image; character → Element/reference; logo/text → designed image; fashion → full-body outfit reference; dialogue → clean face reference; action → full-body pose reference. A pure text prompt is weakest exactly when identity matters.

## Prompt with editing in mind
Don't expect one generation to be the whole film. Generate clean 3–5s shots, each solving one purpose, then edit together and add sound design, captions, logo, and color grade outside Kling. For ecommerce this beats forcing a single perfect 15s output.

## What NOT to copy from beginner Kling guides

Beginner-level Kling prompt guides circulate widely online and contain a few patterns that look helpful but actively hurt the craft rules in this file. Flagging them so you can recognize and skip them.

### The "universal negative pack"

Many guides give a single fixed block to append to every prompt:
> *no morphing, no flicker, no face distortion, no identity change, no outfit change, no warped anatomy, no extra limbs, no rubbery motion, no teleporting, no broken physics, no CGI look, no cartoon, no unreal reflections, no melting objects, no duplicates …*

**Why it's weak:** it violates the *Iterate one variable at a time* and *failure-targeted negative* rules. A 15-item block:
- Spends prompt budget on artifacts that aren't happening in this shot.
- Conflicts internally on stylized shoots (e.g. "no CGI look, no cartoon" actively fights a stylized brief).
- Makes it impossible to tell from a re-roll which negative caused the change.
- Treats negative terms as an incantation instead of a diagnostic tool.

**Use instead:** start with the small relevant category (Product / Character / Motion / Scene / Image-to-video) and add specific items as defects appear in generations. The "No..." terms should grow shot-by-shot, not arrive fully formed.

### 1-second cuts as a default

Some guides recommend 5-shot structures with each shot at 1–2 seconds for *every* video. This works for action montages (see the action-montage template in `camera-and-multishot.md`) and almost nothing else. At 1–2s, Kling cannot develop:
- A face — identity will drift between shots.
- A camera move — push-ins, orbits, and reveals need 3–5s to read.
- A product reveal — the hero beat needs dwell time.
- A dialogue moment — even one short line needs ~3s.

**Use instead:** the per-use-case shot counts in `camera-and-multishot.md` ("Shot count and duration"). 3–5s shots are the safe default; 1–2s is reserved for montage-style work.

### "Avoid impossible camera moves" as a blanket rule

Some guides tell beginners to never prompt impossible moves (dolly zoom, bullet time, camera-through-object, FPV through tight space). The advice is over-corrected. Kling 3.0 *can* execute many of these — they just need the precise vocabulary, the named fallbacks, and one major motion layer per shot. The impossible-camera section in `camera-and-multishot.md` is the right reference; the blanket-avoid rule from beginner guides isn't.

### Mixing languages mid-prompt

Some circulating prompts end in a sentence in a different language (e.g. an English prompt that closes with a Russian continuity instruction). Kling 3.0 is multilingual and will often comply, but the behavior is unreliable and the prompt becomes harder to debug. Write one prompt in one language.

### Stacking lens specs as if they're optical settings

"Anamorphic lens, 24mm, f/2.8, 24fps, 180-degree shutter" — Kling reads these as *style cues*, not optical parameters (Kling's own docs confirm this for aperture). Naming all five does not give you compound control; it gives you a vague "filmic" look. Name the focal length *and the visible consequence* you want — "85mm portrait compression, shallow depth of field" beats "85mm, f/1.4."

## High-performing master template
```
Preservation:
Preserve [exact identity / product / logo / outfit / location details].

Master scene:
[Subject] in [environment], [visual style], [mood].

Shot 1, [duration]:
[Shot size + angle] of [subject/action].
Camera movement: [one camera move].
Motion: [one main motion + optional subtle micro-motion].
Lighting: [specific lighting].

Shot 2, [duration]:
[Shot size + angle] of [subject/action].
Camera movement: [one camera move].
Motion: [one main motion + optional subtle micro-motion].
Lighting: [specific lighting].

Continuity:
Preserve [identity, outfit/product details, color palette, lighting direction, environment].

No [only relevant artifacts from the matching category above].
```
