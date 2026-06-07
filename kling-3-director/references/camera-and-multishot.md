# Camera language & multi-shot direction for Kling 3.0

Prompt camera cuts and movement like a **shot list**, not one long paragraph. Kling 3.0 Multi-Shot understands scene coverage, camera angles, compositions, shot-reverse-shot dialogue, cross-cutting, and voice-over sequencing — but only if you separate **shot, duration, framing, subject action, and camera movement** instead of writing one cinematic block.

Read this reference whenever the user wants multiple shots/cuts, asks how to move the camera, uses vague camera language ("make it cinematic / dynamic / epic"), or needs a transition (match cut, cross-cut, insert, reverse).

## The one rule that prevents most failures

**One shot = one subject action + one camera movement + one clear framing.** Morphing, warping, and continuity breaks come from asking Kling to solve fast subject movement + fast camera + talking mouth + changing lighting + multiple cuts at once. Separate them.

- Bad: "A man walks in, looks at a product, picks it up, smiles, camera zooms, cuts to close-up, pans to the logo, then shows the city, cinematic."
- Good: split into Shot 1 (wide establishing, slow push-in), Shot 2 (medium, backward tracking), Shot 3 (close-up of hand, locked-off), Shot 4 (hero, slow orbit).

## Multi-shot structure

Use Custom Multi-Shot — one shot per field. Scene context goes in Shot 1's field.

**Shot 1 field:**
```
Master scene: [overall style, location, character/product, mood]
[Shot size + angle] of [subject/action]. Camera [movement]. Lighting [description].
```

**Shot 2 field:**
```
[Shot size + angle] of [subject/action]. Camera [movement]. Lighting [description].
```

**Last shot field:**
```
[Shot size + angle] of [subject/action]. Camera [movement]. Lighting [description].
Continuity: Preserve [character/product/lighting/style].
No [relevant artifacts].
```

### Per-shot pattern (use for each shot)
```
[Shot size] + [camera angle] of [subject] in [environment].
Subject action: [one action].
Camera movement: [one movement only].
Composition: [what stays centered / readable / visible].
Lighting/style: [short visual style].
Continuity: preserve [identity/product/outfit/logo].
```

## Shot count and duration
For a 15s video: **3 shots = safest, 4 = good control, 5–6 = higher risk.** Avoid 1-second cuts unless intentionally making a montage — very short shots produce underdeveloped motion.
- 3-shot ad: 4s / 5s / 6s
- 4-shot reel: 3s / 4s / 4s / 4s
- Dialogue: 3s / 3s / 4s / 5s

## Cut / transition types
Pick the structure that fits the use case:

1. **Establishing → medium → close-up → hero** — safest for ads, product, fashion, cinematic. Don't use only close-ups; Kling needs spatial context for continuity.
2. **Wide → action → detail → reaction** — for characters, founder videos, creator intros. Don't make the character talk while walking fast.
3. **Shot-reverse-shot** — for dialogue. One speaker per shot, locked-off camera, short lines. Never have both characters speak in one moving shot.
4. **Cross-cutting** (alternating two locations/actions) — for suspense, teasers, before/after. Keep to two locations; four or five causes drift.
5. **Match cut** (link two visually similar compositions) — for premium ads, logo reveals, design films. Only when the two shapes actually match, or Kling invents a messy transition.
6. **Insert shot** (a close-up detail between wider shots) — for fashion, jewelry, skincare, product usage. Use it to avoid overloading one shot with detail.

Cut vocabulary: "Cut to…", "Match cut from X to Y", "Cutaway to…", "Insert shot of…", "Reverse shot of…", "Return to the wide shot." Avoid whip cut, glitch cut, flash cut, rapid montage, hypercut — they increase drift.

## Camera movement — intensity scale

**Very safe:** locked-off / static, slow push-in, slow pull-back, gentle pan, subtle tilt.
**Medium risk:** side tracking, backward tracking, slow orbit, subtle handheld, crane rise, POV walk-through.
**High risk:** fast orbit, whip pan, rapid zoom, camera spin, fast handheld, drone dive, 360° rotation, complex one-take moves.
**Avoid:** camera teleporting through objects, flying rapidly through a crowd, spinning around a running character, orbiting while a character talks.

### Movement glossary (use exact phrasing)
- **Locked-off / static** — safest when the subject is already moving; use for dialogue, lip-sync, fast body motion, product close-ups.
- **Slow push-in / dolly-in** — emotional reveal, product hero, face close-up. Don't combine with fast head movement or walking.
- **Slow pull-back / dolly-out** — scene/brand reveal, ending shots.
- **Side tracking** — walking, running, fashion, street scenes; camera moves at the subject's speed.
- **Backward tracking** — fashion walk, creator/founder intro. Don't use while the character talks.
- **Slow orbit** — products, cars, poses, 3D reveals. Specify degrees: "slowly orbits 30 degrees clockwise, logo centered and readable." Never say "spin."
- **Pan left/right** — revealing a room, a product lineup, landscapes. Avoid fast pans.
- **Tilt up/down** — fashion/product/character reveal. Keep the subject still while the camera tilts.
- **Crane / rising** — landscapes, large rooms, final reveals. Avoid with facial dialogue.
- **Top-down** — desks, food, flat lays, packaging, unboxing; limits face/body distortion.
- **Handheld** — only "subtle handheld, natural, no shake." Never "crazy/shaky."
- **POV** — entering a room, unboxing, exploration. Avoid fast POV running.
- **Macro** — jewelry, food, textures, watch/perfume detail; little or no camera movement.

## Camera rigs — how the camera is *attached*, not just how it moves

Two shots with the same nominal move read completely differently depending on what the camera is physically attached to. Kling 3.0 responds to rig vocabulary, and naming the rig disambiguates the kind of jitter, vibration, and stability you want.

### Rig glossary

- **Static tripod / locked-off** — no shake, no drift. Safest baseline.
- **Rigid mounted / mechanical vibration only** — bolted to a moving object (car, drone). No human jitter.
- **Onboard grip / hood-mount / nose-mount / chassis-mount** — specific rigid-mount positions on a vehicle.
- **Gimbal / Steadicam** — stabilized handheld with a trace of organic movement, no jitter.
- **Handheld, subtle micro-jitters** — human-operator feel: small natural drift, soft sway.
- **Handheld, raw / imperfect framing** — stronger handheld: framing slightly off, breath-driven. Cap with "no violent shake."
- **Body-mount / chest-mount / snorricam** — subject stays locked in frame, world swings.
- **Crane / jib** — smooth vertical or arcing motion, no jitter.
- **Drone / FPV drone** — smooth at altitude; aggressive at low altitude.
- **Dolly / slider** — straight-line camera motion on rails. Smooth, mechanical.
- **POV / head-mounted** — first-person. Walking POV has gentle bob, running POV has heavy bob.

### Rig + move pairings that work

- Rigid mount + fast forward motion — car onboard at speed.
- Gimbal + side tracking — model walks, camera flows alongside.
- Handheld + medium close-up — interview, raw character moment.
- Locked-off + slow push-in or zoom — product reveal, dialogue.
- Crane + slow pull-back — establishing exit, brand reveal.
- Drone + wide orbit — landscape, architecture.

### Negative terms for rig confusion

- Wanted rigid-mount, got handheld → add "no handheld shake, no human jitter, rigid mount only."
- Wanted handheld, got too smooth → add "no glassy stabilization, no perfect tripod, natural handheld drift."
- Wanted gimbal, got jittery → add "no shake, no jitter, stabilized gimbal motion."

## Camera angles
Eye-level (natural dialogue), low-angle (power/luxury hero), high-angle (flat lay/food/process), over-the-shoulder (screens, storytelling), Dutch angle (use sparingly — destabilizes), profile (mood, but bad for lip-sync).

## Intra-shot beats & speed ramps

Default rule still holds: one shot = one subject action + one camera move. But Kling 3.0 will respect a *single* timed beat-change inside a shot if you mark it with explicit timestamps.

### When to use intra-shot beats
- A single triggered change within one continuous shot: a focus pull, a snap-zoom, a slow-motion ramp on impact.
- The shot is at least 4 seconds.

### When NOT to use them
- More than one beat-change — split into multi-shot.
- Identity-critical shots (talking close-ups, product hero shots).

### Format
```
Shot 1, 5s:
0–2s: [stable initial beat].
2–3s: [the trigger — one named change].
3–5s: [resolution beat].
```

### Speed ramps
```
Time treatment: real-time motion for 0–2s. At 2s, time ramps into extreme slow motion as [trigger event], holding slow motion for 2–4s. At 4s, time ramps smoothly back to real speed.
```

**Template — single-shot beat with snap-zoom:**
```
Shot 1, 5s: Medium handheld shot of @CharacterA standing on a running track. Subject action: he stands still and looks up. Camera: subtle handheld micro-jitters.
0–3s: He breathes heavily, looking forward, camera holds steady.
3s: A passenger airplane crosses the sky behind him.
3–5s: The camera snap-zooms up and onto the airplane, leaving @CharacterA out of frame.
Lighting: natural daylight, gritty realism.
No motion smear during the zoom, no warped airplane, no identity drift on @CharacterA, no jittery frame after the zoom lands.
```

**Template — speed ramp on impact:**
```
Shot 1, 6s: Wide first-person POV inside a race car at speed on a packed oval speedway.
Time treatment: real-time motion for 0–2s. At 2s, as a wrecked car launches upward, time ramps into extreme slow motion, held for 2–4s. At 4s, time ramps smoothly back to real speed.
Camera: rigid mount inside the helmet, mechanical vibration only.
No teleporting camera, no broken physics during the ramp, no identity drift, no jitter during slow motion, no motion smear during real-time segments.
```

## Lens / framing
wide, full-body, medium, medium close-up, close-up, extreme close-up, macro, shallow depth of field, deep focus, foreground blur, background bokeh, telephoto compression, wide-angle. Practical defaults: product → macro + shallow DOF; fashion → full-body + 85mm editorial look; dialogue → medium close-up + natural lens; action → wide full-body + deep focus. Avoid extreme close-up on a talking mouth.

## Best camera moves by use case
- **Product:** locked-off macro, slow push-in, slow orbit, slow pull-back, gentle pan, light sweep.
- **Fashion:** backward/side tracking, slow tilt-up, static full-body, slow push-in.
- **Dialogue:** locked-off, medium close-up, shot-reverse-shot, two-shot, very slow push-in.
- **Action:** wide locked-off, smooth side/backward tracking, controlled slow motion.
- **City/environment:** slow crane rise, slow pan, slow push-in, wide establishing, POV walk-through.

## Impossible camera moves, lens looks & stylized references

Kling will *attempt* almost any camera technique — but several famous ones are physically impossible. The governing rule: **the more exotic the camera, the more boring the subject motion should be.**

### Impossible camera moves

- **Bullet-time / frozen orbit** — "subject frozen mid-action; camera orbits 180 degrees." **High risk.** Fallback: slow-motion + 90° orbit.
- **Camera-through-object** — "camera flies through the [keyhole/window]." **Medium risk.** Fallback: push in past it without true pass-through.
- **Infinite dolly / hyperzoom** — "continuous forward push from [start] to [end scale]." **High risk.** Fallback: 2–3 shots at different scales, match-cut.
- **Droste / recursive zoom** — **Very high risk / often fails.** Fallback: single push-in into a screen, generate next layer separately.
- **Camera through solid objects** — **High risk.** Better with translucent surfaces. Fallback: match-cut.
- **Long take / oner** — **High risk** beyond ~5s. Fallback: Custom Multi-Shot with invisible cuts.

### Physically impossible rigs

- **Dolly zoom / Vertigo** — "subject stays same size; camera dollies back while lens zooms in; background warps." **Medium-high risk.** Fallback: slow push-in with parallax.
- **FPV drone dive** — "aggressive FPV through tight space, ~24mm wide." **Medium risk.** Fallback: straight forward FPV, no banking.
- **Body-mount / snorricam** — "camera rigidly mounted to subject's chest; subject locked in frame; world swings." **Medium risk.** Fallback: locked-off close-up.
- **360° orbit mid-action** — **High risk.** Fallback: subject holds pose, 180–270° orbit.
- **Crash zoom / snap zoom** — **Medium risk.** Fallback: quick push-in over 1–2s.
- **Whip pan** — **Medium risk** as transition; **high risk** mid-action. Fallback: generate halves separately, match-cut.

### Lens looks

- **Ultra-wide / GoPro** — "~14–18mm, strong perspective exaggeration." **Medium risk** on faces.
- **Fisheye** — "~180° field of view, barrel distortion." **Medium risk** on faces. Best on environments.
- **Anamorphic** — "2.39:1, oval bokeh, horizontal lens flares." **Low-medium risk.**
- **Macro / probe** — "extreme macro, razor-thin DOF." **Low risk** on still subjects.
- **Tilt-shift / miniature** — "narrow band of focus, subject looks like a scale model." **Low risk.**
- **Telephoto compression** — "~135–200mm, background compressed." **Low risk.**

### POV variants

- **Walking POV** — **Low-medium risk.** Running POV is **high risk.**
- **Driver / passenger POV** — **Low-medium risk.** Keep the road straight.
- **Looking-down-at-hands POV** — **Low risk.** Strong for unboxing, cooking, crafts.
- **Over-the-shoulder POV** — **Low risk.**
- **Reflection / surveillance POV** — **Medium risk.**

### Stylized references — describe the technique, not just the name

- **Wong Kar-wai** — "step-printed motion, stuttering low-frame-rate blur on subjects, saturated reds/greens/yellows, neon on wet asphalt." **Medium risk.**
- **Edgar Wright** — "fast whip pan, snap zoom, precise Steadicam tracking, match cuts on motion." **Medium risk.** Generate each move as its own shot.
- **Gondry / Jonze** — "one impossible in-camera element, otherwise realistic physics, warm analogue palette." **Medium-high risk.** One impossible element per shot.
- **Wes Anderson** — "symmetrical centered composition, frontal staging, pastel palette, lateral whip pan." **Low risk.**
- **Fincher** — "geometric framing, precise slow dolly, desaturated teal-and-amber, deep shadows." **Low risk.**

### Templates — impossible cameras

**Dolly zoom / Vertigo:**
```
Preservation: Preserve @CharacterA's facial identity, hairstyle, and outfit.

Shot 1, 4s: Medium shot of @CharacterA standing still and facing camera, centered. Subject action: holds still expression of dawning realization; only subtle blinking. Camera: dolly zoom — camera dollies backward while lens zooms in; @CharacterA stays exact same size; background warps and stretches outward. Lighting: soft directional key, slightly cool ambient.

Continuity: @CharacterA's face, scale, and position remain identical from first to last frame.

No subject changing size, no subject drifting off center, no identity drift, no face morphing, no warped subject, no jitter, no motion smear on the subject, no double exposure.
```

**Bullet-time / frozen orbit:**
```
Preservation: Preserve @CharacterA's facial identity, outfit, body proportions, and exact pose.

Shot 1, 5s: Wide full-body shot of @CharacterA frozen mid-[action]. Subject action: completely motionless. Camera: smooth horizontal orbit 180 degrees clockwise, strong parallax. Lighting: even, no flicker.

Continuity: Pose, expression, clothing folds, and hair remain identical across all frames.

No subject moving, no limbs shifting, no pose breaking, no face morphing, no identity drift, no warped body, no jitter, no uneven orbit speed.
```

**FPV drone dive:**
```
Shot 1, 5s: Ultra-wide ~18mm first-person drone view diving forward through [environment]. Subject action: environment mostly still. Camera: aggressive forward FPV at controlled speed, one smooth banking turn at 3s. Lighting: natural, deep focus.

Continuity: Corridor geometry stays consistent.

No warping walls, no geometry shifting, no teleporting camera, no extreme rotation, no jitter, no frame tearing, no duplicated corridor.
```

**Body-mount / snorricam:**
```
Preservation: Preserve @CharacterA's face, hairstyle, outfit, and body proportions.

Shot 1, 5s: Tight medium close-up, camera rigidly mounted to @CharacterA's chest facing them. Subject action: walks/runs forward; head and torso locked centered in frame. Background swings and parallaxes as they move. Lighting: natural daylight, even on face.

Continuity: @CharacterA's framing, scale, and identity remain identical; only background changes.

No subject drifting in frame, no subject size changing, no face morphing, no identity drift, no static background, no jitter, no warped face.
```

### Combining techniques

Most of these are themselves the *one big idea* in the shot. Don't stack them. Two combinations that *do* work cleanly:
- **Lens look + safe move** — anamorphic + slow push-in, fisheye + locked-off, tilt-shift + slow pan.
- **POV + simple environment motion** — walking POV + leaves falling, driver POV + rain.

Everything else: split into separate shots, edit together.

## Write movement precisely
- "cinematic camera movement" → "slow dolly-in toward the product"
- "dynamic camera" → "the camera tracks backward smoothly as the model walks forward"
- "epic orbit shot" → "slowly orbits 30 degrees clockwise, logo centered"
- "dramatic zoom" → "slow push-in from medium shot to close-up over 4 seconds"

## What to avoid in multi-shot prompts
- Inconsistent subject names across shots → repeat "@CharacterA".
- Conflicting camera instructions → pick one.
- Multiple camera moves in one shot → one move.
- Fast camera + fast subject → make one stable.
- Mouth working during camera motion → split into separate shots.
- Too many locations → one main location, different framings.
- Vague adjectives → use physical instructions.

## Templates

**Product ad — use Custom Multi-Shot:**

**Shot 1 field (4s):**
```
Premium product commercial for [product]. Minimal studio, clean background, luxury lighting.
Macro close-up of [product detail]. Locked-off camera. Soft light moves across the surface.
No warped product, no changed logo.
```

**Shot 2 field (5s):**
```
Medium shot of the product on a [surface]. Camera slowly orbits 30 degrees clockwise, logo centered and readable.
No unreadable text, no extra objects.
```

**Shot 3 field (6s):**
```
Final hero shot. Camera slowly pulls back to reveal the full product and clean background. Product stays sharp.
Continuity: Preserve exact product shape, color, material, label, logo, and lighting style.
No warped product, no changed logo, no unreadable text, no extra objects, no flickering reflections, no unstable camera, no melted edges.
```

**Fashion video — use Custom Multi-Shot:**

**Shot 1 field (4s):**
```
Editorial fashion film in [location], realistic, premium. Wide full-body shot of @CharacterA standing. Static camera, outfit clearly visible.
```

**Shot 2 field (5s):**
```
@CharacterA walks forward confidently. Camera tracks backward at the same pace, keeping @CharacterA centered.
```

**Shot 3 field (3s):**
```
Insert shot of fabric movement and accessories. Locked-off close-up.
```

**Shot 4 field (3s):**
```
Medium close-up of @CharacterA looking toward camera. Slow push-in, stable face, no dialogue.
Continuity: Preserve face, hairstyle, outfit, body proportions, and location.
No changing face, no unstable clothing, no warped hands, no distorted walking, no jittery camera, no duplicate character.
```

**Dialogue scene — use Custom Multi-Shot:**

**Shot 1 field (3s):**
```
Quiet cinematic dialogue scene in [location], soft natural lighting. Medium close-up of @CharacterA facing @CharacterB. @CharacterA speaks one short sentence. Locked-off camera.
No wrong speaker, no mouth morphing.
```

**Shot 2 field (3s):**
```
Reverse medium close-up of @CharacterB listening and nodding once. Locked-off camera.
No face flicker, no identity drift.
```

**Shot 3 field (4s):**
```
Medium close-up of @CharacterB speaking one short sentence. Locked-off camera, natural lip sync.
No mismatched lip sync, no warped teeth.
```

**Shot 4 field (5s):**
```
Two-shot of both characters seated together. Subtle slow push-in, calm expressions.
Continuity: Preserve both characters' faces, outfits, positions, and lighting.
No wrong speaker, no mouth morphing, no face flicker, no mismatched lip sync, no duplicate faces, no unstable eyes, no warped teeth, no camera shake.
```

**Action scene — use Custom Multi-Shot:**

**Shot 1 field (3s):**
```
Cinematic action in [environment], realistic physics. Wide establishing shot of @CharacterA preparing to move. Static camera.
```

**Shot 2 field (5s):**
```
Wide full-body shot of @CharacterA performing one clear fast action. Camera locked-off. Full body visible head to feet.
No warped limbs, no broken anatomy.
```

**Shot 3 field (4s):**
```
@CharacterA lands or stops naturally. Smooth side tracking camera.
No twisted legs, no duplicate body.
```

**Shot 4 field (3s):**
```
Medium close-up reaction shot. Slow push-in, stable face.
Continuity: Preserve body proportions, outfit, face, and environment.
No warped limbs, no twisted legs, no extra arms, no duplicate body, no rubber body, no motion smear, no jitter, no shaky camera, no broken anatomy.
```

**Action montage (2s × 5-shot pattern):**

Use when rhythm and impact matter more than dwell time. 2s per shot. Vary the camera rig every shot.

**Shot 1 field (2s):**
```
[Action type] montage in [location]. Wide establishing of [subject + setup action]. Camera: [rig + one move].
```

**Shot 2 field (2s):**
```
[Different framing] of [secondary action]. Camera: [different rig + different move].
```

**Shot 3 field (2s):**
```
Extreme close-up / macro of [impact detail]. Camera: [rig + push-in or micro-shake].
```

**Shot 4 field (2s):**
```
[Different angle — top-down, ultra-low, or whip-pan] of [peak moment]. Camera: [whip pan / snap zoom].
```

**Shot 5 field (2s):**
```
[Resolution framing — wide release or exit] of [final state]. Camera: [rig + final move].
Continuity: Preserve [character/product/vehicle identity, outfit, color palette] via @Element.
No identity drift, no outfit changes, no warped [product/vehicle], no duplicated subjects, no flicker, no motion smear on faces, no frame tearing.
```

## Phrase bank
**Stable cinematic:** locked-off camera, static wide shot, slow push-in, slow pull-back, gentle pan left/right, subtle tilt up/down, smooth side tracking, smooth backward tracking, slow clockwise orbit, slow crane rise, macro close-up, medium close-up, wide establishing shot, over-the-shoulder, shot-reverse-shot, insert shot, cutaway, final centered hero shot.
**Avoid (vague/aggressive):** crazy camera, insane/super dynamic, rapid zoom, fast orbit, whip pan, camera spins, 360° rotation, chaotic handheld, extreme/hyper-fast motion, transformation while running, talking while sprinting, multiple characters speaking at once.

## Bottom line
- One shot = one subject action + one camera movement + one framing.
- Safe workflow: establishing → medium action → insert/detail → close-up/hero.
- Talking: shot-reverse-shot + locked camera + one speaker per shot.
- Fast motion: wide full-body + stable camera + one action per shot.
- Product: macro detail → slow orbit → centered hero.
