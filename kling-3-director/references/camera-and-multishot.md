# Camera language & multi-shot direction for Kling 3.0

Prompt camera cuts and movement like a **shot list**, not one long paragraph. Kling 3.0 Multi-Shot understands scene coverage, camera angles, compositions, shot-reverse-shot dialogue, cross-cutting, and voice-over sequencing — but only if you separate **shot, duration, framing, subject action, and camera movement** instead of writing one cinematic block.

Read this reference whenever the user wants multiple shots/cuts, asks how to move the camera, uses vague camera language ("make it cinematic / dynamic / epic"), or needs a transition (match cut, cross-cut, insert, reverse).

## The one rule that prevents most failures

**One shot = one subject action + one camera movement + one clear framing.** Morphing, warping, and continuity breaks come from asking Kling to solve fast subject movement + fast camera + talking mouth + changing lighting + multiple cuts at once. Separate them.

- Bad: "A man walks in, looks at a product, picks it up, smiles, camera zooms, cuts to close-up, pans to the logo, then shows the city, cinematic."
- Good: split into Shot 1 (wide establishing, slow push-in), Shot 2 (medium, backward tracking), Shot 3 (close-up of hand, locked-off), Shot 4 (hero, slow orbit).

## Multi-shot structure

```
Master scene: [overall style, location, character/product, mood]
Shot 1, [duration]: [framing] of [subject/action]. Camera [movement]. Lighting [description].
Shot 2, [duration]: [framing] of [subject/action]. Camera [movement]. Lighting [description].
Shot 3, [duration]: [framing] of [subject/action]. Camera [movement]. Lighting [description].
Continuity: Preserve [character/product/lighting/style].
Negative prompt: [artifacts].
```

### Per-shot pattern (use for each shot)
```
Shot [number], [duration]:
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

The underlying issue: AI video models struggle when object motion and camera motion aren't cleanly separated. Keep one moving at a time.

### Movement glossary (use exact phrasing)
- **Locked-off / static** — safest when the subject is already moving; use for dialogue, lip-sync, fast body motion, product close-ups.
- **Slow push-in / dolly-in** — emotional reveal, product hero, face close-up. Don't combine with fast head movement or walking. Use push-in *or* dolly-in, not both.
- **Slow pull-back / dolly-out** — scene/brand reveal, ending shots.
- **Side tracking** — walking, running, fashion, street scenes; camera moves at the subject's speed.
- **Backward tracking** (camera in front of a forward-walking subject) — fashion walk, creator/founder intro. Don't use while the character talks (walking + talking + tracking destabilizes the mouth).
- **Slow orbit** — products, cars, poses, 3D reveals. Specify degrees: "slowly orbits 30 degrees clockwise, logo centered and readable." Never say "spin" — it distorts.
- **Pan left/right** — revealing a room, a product lineup, landscapes. Avoid fast pans (background warping).
- **Tilt up/down** — fashion/product/character reveal. Keep the subject still while the camera tilts; don't combine tilt-up with walking.
- **Crane / rising** — landscapes, large rooms, final reveals. Avoid with facial dialogue.
- **Top-down** — desks, food, flat lays, packaging, unboxing; limits face/body distortion.
- **Handheld** — only "subtle handheld, natural, no shake." Never "crazy/shaky."
- **POV** — entering a room, unboxing, exploration. Avoid fast POV running.
- **Macro** — jewelry, food, textures, watch/perfume detail; little or no camera movement.

## Camera rigs — how the camera is *attached*, not just how it moves

Two shots with the same nominal move (a forward push, a tracking pass) read completely differently depending on what the camera is physically attached to. Kling 3.0 responds to rig vocabulary, and naming the rig disambiguates the kind of jitter, vibration, and stability you want. If you only say "handheld," Kling picks an average — usually too shaky for product, too smooth for documentary.

Pair a rig with a move. The rig sets the *texture* of the motion; the move sets the *direction* of it.

### Rig glossary

- **Static tripod / locked-off** — no shake at all, no drift. Safest baseline. Use for dialogue, product, macro, dolly zoom, bullet-time.
- **Rigid mounted / mechanical vibration only** — the camera is bolted to a moving object (car chassis, hood, motorcycle, drone frame). The camera doesn't move relative to the object; the object's vibration transfers into the image. *No human jitter.* Use for onboard car shots, vehicle POVs, machine-mounted shots.
- **Onboard grip / hood-mount / nose-mount / chassis-mount / bumper-mount** — specific rigid-mount positions on a vehicle. Naming the position changes the framing automatically: hood-mount looks down the bonnet, nose-mount sits low and centered, chassis-mount skims the ground.
- **Gimbal / Steadicam — smooth but with subtle vibration** — stabilized handheld with a trace of organic movement, no jitter. Use for walking-alongside shots, slow tracking, "premium handheld" looks.
- **Handheld, subtle micro-jitters / organic sway** — human-operator feel: small natural drift, soft sway from breathing, no violent shake. Use for documentary, intimate scenes, raw realism.
- **Handheld, raw / imperfect framing / breathing movement** — stronger handheld: framing slightly off, natural recomposition, breath-driven rise and fall. Use for sports, vérité, action. Cap with "no violent shake" or Kling overcooks it.
- **Body-mount / chest-mount / snorricam** — see the impossible-rigs section below. Subject stays locked in frame, world swings.
- **Crane / jib** — smooth vertical or arcing motion, no jitter. Use for reveals, exits, finals.
- **Drone / FPV drone** — aerial, smooth at altitude; aggressive and reactive at low altitude. Pair with speed: "smooth high-altitude drone" vs. "aggressive low-altitude FPV."
- **Dolly / slider** — straight-line camera motion on rails. Smooth, mechanical, no jitter. Use when you want push-in or side tracking with zero organic feel.
- **POV / head-mounted** — first-person. Pair with motion: walking POV has gentle bob, running POV has heavy vertical bob, driver POV has road vibration only.

### Rig + move pairings that work

- **Rigid mount + fast forward motion** — car onboard at speed, motorcycle nose-cam.
- **Gimbal + side tracking** — model walks, camera flows alongside.
- **Handheld + medium close-up** — interview, raw character moment.
- **Locked-off + slow push-in or zoom** — product reveal, dolly zoom, dialogue.
- **Crane + slow pull-back** — establishing exit, brand reveal.
- **Drone + wide orbit** — landscape, architecture, large-scale environment.

### Audio-implied camera motion

Kling 3.0 reacts to sensory descriptions as motion cues, because native audio links sound to image behavior. Useful phrasings:

- "Engine vibration transmitted into the camera motion" — adds high-frequency tremor.
- "Heavy breathing inside the helmet causing subtle rhythmic image blur" — adds slow respiratory rise/fall.
- "Heartbeat-thump implied through visual shake" — adds low-frequency pulse.
- "Impact-driven shake on each footstep / on each gunshot / on each punch" — syncs shake to action beats.

These are advanced — treat as one extra layer on top of a named rig, not a replacement for it.

### Negative-prompt additions for rig confusion

When you want one rig and Kling picks another:
- Wanted rigid-mount, got handheld → add "no handheld shake, no human jitter, rigid mount only."
- Wanted handheld, got too smooth → add "no glassy stabilization, no perfect tripod, natural handheld drift."
- Wanted gimbal, got jittery → add "stabilized gimbal motion, no shake, no jitter."

## Camera angles
Eye-level (natural dialogue), low-angle (power/luxury hero), high-angle (flat lay/food/process), over-the-shoulder (screens, storytelling), Dutch angle (use sparingly — destabilizes), profile (mood, but bad for lip-sync).

## Intra-shot beats & speed ramps (advanced)

Default rule still holds: one shot = one subject action + one camera move + one framing. But Kling 3.0 will respect a *single* timed beat-change inside a shot if you mark it with explicit timestamps — a focus pull, a head turn, a time-ramp into slow motion, a tilt that follows an object. This is how you get a moment of intensity without paying for a multi-shot generation.

### When to use intra-shot beats

- A **single triggered change** within one continuous shot: a focus pull, a whip-pan to follow an object, a head turn, a snap-zoom into a detail, a slow-motion ramp on impact, a tilt-up following something that flies overhead.
- You want continuity *through* the moment, not a cut.
- The shot is at least 4 seconds (under that, the beats compress into mush).

### When NOT to use them

- More than one beat-change in the same shot — that's a multi-shot disguised as one. Split it.
- Identity-critical shots (talking close-ups, product hero shots) — the change risks face/product drift.
- Anything where the user wants a clean atomic shot.

### Format

Inside the shot, use bracketed timestamps:
```
Shot 1, 5s: [framing] of [subject/action].
0–2s: [stable initial beat — subject action + camera move].
2–3s: [the trigger — one named change, e.g. "the airplane crosses overhead and the camera snap-zooms onto it"].
3–5s: [resolution beat — what continues after the change].
```

### Speed ramps

Kling 3.0 handles speed ramps when you name the entry, the slow-motion duration, and the exit. Single ramp per shot.

```
Time treatment: real-time motion for 0–2s. At 2s, time ramps into extreme slow motion as [the trigger event] happens, holding slow motion for 2–4s. At 4s, time ramps smoothly back to real speed.
```

Pair speed ramps with **one impact event** (a punch lands, a car flips, an object passes overhead). Speed-ramping ambient motion (a walk, a conversation) looks artificial.

**Template — single-shot beat with snap-zoom:**
```
Shot 1, 5s: Medium handheld shot of @CharacterA standing on a running track, breathing heavily, shoulders rising and falling. Subject action: he stands still and looks up. Camera: subtle handheld micro-jitters, locked roughly on him.
0–3s: He breathes heavily, looking forward, camera holds steady on him.
3s: A passenger airplane crosses the sky behind him.
3–5s: The camera snap-zooms up and onto the airplane, leaving @CharacterA out of frame; the airplane is now the subject, crossing slowly against the clouds.
Lighting: natural daylight, gritty realism.
Negative prompt: motion smear during the zoom, warped airplane, identity drift on @CharacterA before the zoom, jittery frame after the zoom lands.
```

**Template — speed ramp on impact:**
```
Shot 1, 6s: Wide first-person POV inside a race car at speed on a packed oval speedway under floodlights. Subject action: the driver weaves through traffic; a chain-reaction crash erupts directly ahead at the 2-second mark.
Time treatment: real-time motion for 0–2s. At 2s, as a wrecked car launches upward toward the camera, time ramps into extreme slow motion, held for 2–4s while the camera tilts sharply upward following the airborne car, debris and sparks suspended around it. At 4s, time ramps smoothly back to real speed and the camera snaps forward to the track.
Camera: rigid mount inside the helmet, mechanical vibration only, sharp reactive head turns; no handheld jitter from a human operator.
Negative prompt: teleporting camera, broken physics during the ramp, identity drift on the wrecked car, jitter during slow motion, motion smear during the real-time segments.
```

## Lens / framing
wide, full-body, medium, medium close-up, close-up, extreme close-up, macro, shallow depth of field, deep focus, foreground blur, background bokeh, telephoto compression, wide-angle. Practical defaults: product → macro + shallow DOF; fashion → full-body + 85mm editorial look; dialogue → medium close-up + natural lens; action → wide full-body + deep focus. Avoid extreme close-up on a talking mouth — it exposes lip-sync artifacts.

## Best camera moves by use case
- **Product:** locked-off macro, slow push-in, slow orbit, slow pull-back, gentle pan, light sweep. Structure: macro detail → slow orbit → hero push-in/pull-back. Avoid fast orbit, whip pan, spinning.
- **Fashion:** backward/side tracking, slow tilt-up, static full-body, slow push-in. Structure: wide walking (side tracking) → static pose (tilt-up) → medium close-up (push-in). Avoid orbiting a walking model, talking while walking.
- **Dialogue:** locked-off, medium close-up, shot-reverse-shot, two-shot, very slow push-in. Structure: A speaks → B listens → B replies → two-shot. Avoid orbit/handheld during speech, tiny faces, extreme lip close-ups, multiple speakers per shot. (See also `talking-and-motion.md`.)
- **Action:** wide locked-off, smooth side/backward tracking, controlled slow motion. Structure: wide setup → one clear action (locked) → reaction/landing (static/slow push-in). Avoid fast subject + fast camera, spinning, tight close-ups during action. (See also `talking-and-motion.md`.)
- **City/environment:** slow crane rise, slow pan, slow push-in, wide establishing, POV walk-through. Structure: wide establishing → push-in through foreground → detail shot. Avoid teleporting/flying camera, rapid location changes.

## Impossible camera moves, lens looks & stylized references

Kling will *attempt* almost any camera technique you name — but several famous ones are physically impossible in the real world, and Kling solves them by stylistic interpretation, not optical simulation. That means two things: (a) the technique has to be named precisely (not "epic" or "cinematic"), and (b) when Kling can't do the real physics, it fakes it — and the fake either lands as a clean stylized effect or degrades into warping. Use this section to pick the technique, set a realistic expectation, and use the safer fallback when the high-risk version drifts.

The governing rule from earlier in this file still applies: **one subject action + one camera move + one framing per shot.** Impossible-camera prompts violate physics, not that rule. If anything they need it harder — the more exotic the camera, the more boring the subject motion should be.

### Glossary — impossible moves, lens looks, rigs, references

Format: **term — exact phrasing to use — risk — safer fallback.**

#### Impossible camera moves

- **Bullet-time / frozen orbit** — "the subject is completely frozen in place mid-[action]; the camera orbits 180 degrees around them at constant speed; strong parallax between foreground and background, deep depth." — **High risk.** Kling can't do true multi-camera bullet-time; it fakes it as a slow orbit around a near-frozen subject. Works best with one clearly posed subject and a deep background. **Fallback:** controlled slow-motion subject + slow 90° orbit.
- **Drone-/camera-through-object** (keyhole, doorway, window, blinds, ring, glass) — "the camera flies forward through the [object], emerging into the room beyond; the object frames the lens for the first beat, then clears as the camera passes through." — **Medium risk.** Strongest with a clean, contrasty foreground object and a simple room beyond. **Fallback:** start framed inside the object, then push in past it (no actual pass-through).
- **Infinite dolly / hyperzoom** (cosmic, micro, room-to-room) — "continuous forward push that never slows, traveling from [start scale] to [end scale], passing through [intermediate elements]." — **High risk.** Kling can hold ~3–5s of continuous push; longer asks degrade. **Fallback:** generate as 2–3 shots at different scales and match-cut them.
- **Droste / recursive zoom** (image-within-image) — "the camera pushes into [a screen / mirror / frame] and emerges into the same scene scaled down, then pushes again." — **Very high risk / often fails.** Kling rarely sustains the recursion. **Fallback:** stage a single push-in into a screen/mirror, generate the next nested layer separately, and edit together.
- **Camera through solid objects** (wall, body, glass, water surface) — "the camera passes through [the wall/glass surface] from one side to the other; the surface dissolves around the lens as it crosses." — **High risk.** Better with translucent or particulate surfaces (water, smoke, glass) than solid opaque ones. **Fallback:** a match-cut on a similar shape on either side of the "wall."
- **Long take / oner / one-shot scene** — "single continuous take, no cuts, the camera flows from [A] to [B] to [C] without breaking." — **High risk** beyond ~5s. **Fallback:** use Custom Multi-Shot and design invisible cuts on motion or matched movement.

#### Physically impossible rigs

- **Dolly zoom / Vertigo / Hitchcock zoom / Zolly** — "the [subject] remains constant size in the center of frame; the camera dollies backward while the lens zooms in at a matching rate; the background warps and stretches outward, foreground perspective compresses." — **Medium–high risk.** Naming both *physical dolly* and *opposing zoom* is required; Kling is reproducing the look, not the optics. Keep the subject still and centered. **Fallback:** slow push-in with strong foreground/background parallax.
- **FPV drone dive through tight space** — "aggressive first-person drone perspective diving down a [vertical structure / corridor / alley]; camera stays roughly centered in the gap; tight banking turns where the corridor bends; ~24mm wide field of view." — **Medium risk.** Works best with one straight corridor or one clear bend. **Fallback:** straight forward FPV through a single corridor, no banking.
- **Body-mount / snorricam** (camera rigidly attached to the subject, subject stays centered, world swings around) — "the camera is rigidly mounted to [subject A]'s chest facing them; [subject A]'s head and torso remain locked centered in frame; the background swings and shifts as they move." — **Medium risk.** Demands very stable subject identity. Use an Element. **Fallback:** locked-off close-up of the face while they move; describe the background motion explicitly.
- **360° orbit mid-action** — "the camera orbits 360° around [subject] while they continue [action] at controlled speed." — **High risk** (camera + subject both moving). **Fallback:** subject holds a pose, camera orbits 180–270°.
- **Crash zoom / snap zoom** — "sudden rapid zoom from [wide framing] to extreme close-up of [detail] in under one second." — **Medium risk.** Best on a static or near-static subject. **Fallback:** quick push-in over 1–2s instead of an instant snap.
- **Whip pan** — "rapid lateral camera whip to the right, extreme directional motion blur, transitioning from [scene/action A] to [scene/action B]." — **Medium risk** as a transition between two short shots; **high risk** mid-action. **Fallback:** generate the two halves separately and match-cut on the blur.

#### Lens looks (Kling treats these as style cues, not optics)

- **Ultra-wide / GoPro / action-cam** — "ultra-wide ~14–18mm field of view, lens held close to the subject, strong perspective exaggeration at the edges, subject's face/body slightly bulged toward the lens, deep focus." — **Medium risk** at extreme widths (face warping). **Fallback:** "wide-angle ~24mm, lens held close, subject centered, edges slightly stretched."
- **Fisheye** — "fisheye lens, ~180° field of view, strong barrel distortion, curved horizon, circular framing if needed." — **Medium risk** on faces (identity drift). Best on environments, skate/BMX-style action, or product flat lays. **Fallback:** "wide-angle with strong perspective distortion."
- **Anamorphic** — "anamorphic widescreen feel, 2.39:1 horizontal stretch, oval bokeh, horizontal lens flares from highlights, shallow depth of field." — **Low–medium risk.** Mostly a *look* (bokeh shape + flares + ratio), not an optical sim. Pair with the framing you actually want.
- **Macro / probe lens** — "extreme macro perspective, lens almost touching the [subject detail], razor-thin depth of field, subject fills frame, soft falloff into blur." — **Low risk** on still subjects, **high risk** on moving ones. Keep subject static.
- **Snorkel / periscope** — "snorkel-lens perspective, lens travels through tight spaces close to surfaces, deep focus, extreme wide field of view, the lens itself moves smoothly along a low straight path." — **Medium risk.** Works well across tabletops, through model environments, under furniture. Combine with slow forward dolly.
- **Tilt-shift / miniature** — "tilt-shift miniature effect, narrow horizontal band of sharp focus across the middle, strong gaussian blur on top and bottom thirds, subject looks like a scale model, high-angle shot." — **Low risk** as a style; best from a high or overhead angle.
- **Telephoto compression** — "long telephoto lens ~135–200mm, background heavily compressed forward, subject isolated mid-frame, shallow depth of field." — **Low risk.** Use when you want background elements to feel close to the subject.
- **Lens markers Kling responds to:** name the *focal length and behavior* together — "24mm wide, edges stretched," "50mm natural perspective," "85mm portrait compression, shallow DOF," "135mm telephoto compression." Focal length alone is weaker than focal length + the visual consequence.

#### POV variants

- **Walking POV** — "first-person POV walking forward at normal pace, subtle natural head bob, hands occasionally entering the lower frame, ~28mm wide field of view." — **Low–medium risk** at walking pace; **high risk** at running pace. **Fallback for running:** locked third-person shot from behind.
- **Running POV** — "first-person POV running forward, heavier vertical head bob, breath audible, motion blur on the edges." — **High risk** — combines fast subject + camera + environment. **Fallback:** "first-person POV jogging at controlled pace, gentle bob."
- **Driver / passenger POV** — "first-person POV from the driver's seat, hands on the steering wheel in the lower frame, road moving past through the windscreen, side mirrors visible." — **Low–medium risk.** Keep the road straight.
- **Looking-down-at-hands POV** — "first-person POV looking down at the subject's own hands performing [action] on [surface]." — **Low risk.** Strong for unboxing, cooking, writing, crafts.
- **Over-the-shoulder POV** — distinct from OTS coverage: "first-person POV from just behind and slightly above [subject A]'s shoulder, their head and shoulder framing the lower-left of frame, looking at [subject B / scene]." — **Low risk.**
- **Reflection / surveillance POV** — "the camera looks at the scene through [a mirror / a CCTV monitor / a phone screen], the framing element visible around the edges." — **Medium risk.** Keep the reflective surface large and clear.

#### Stylized references — describe the technique, not just the name

Naming a director helps a little; naming the *visible technique* helps a lot. Pair them.

- **Wong Kar-wai (step-printing / undercranking)** — "step-printed motion: a stuttering low-frame-rate motion blur on moving figures while the background remains in normal time; slow shutter trails on movement; saturated palette of deep reds, electric greens, and sodium-yellow streetlights on wet asphalt; wide-angle lens held close in cramped neon interiors." — **Medium risk.** Kling fakes step-printing as heavy directional motion blur on the subject — not true frame-stutter. Pair with handheld and a slow shutter description.
- **Edgar Wright (kinetic transitions)** — "fast whip pan to the right with strong directional motion blur as transition; rapid snap zoom into [detail]; precise Steadicam tracking alongside the subject at matching pace; sharp match cuts on motion." — **Medium risk.** Generate each move as its own short shot and edit together.
- **Michel Gondry / Spike Jonze (handmade surreal)** — "in-camera-feeling surreal effect: [one impossible element, e.g. paper props folding into objects / forced-perspective transitions / practical-feeling rotoscoped overlays]; otherwise realistic physics; soft daylight; warm analogue color palette; subtle film grain." — **Medium–high risk.** Strip to one impossible element per shot (see `prompt-craft.md` — one-impossible-thing rule).
- **Wes Anderson** — "perfectly symmetrical centered composition, frontal staging, deadpan tableau, pastel palette, slow lateral whip pan to reveal the next symmetrical tableau, locked-off camera otherwise." — **Low risk.**
- **Fincher** — "geometric framing, locked-off or precise slow dolly, desaturated palette skewing teal-and-amber, deep shadows, no handheld." — **Low risk.**
- **Christopher Doyle handheld (Wong Kar-wai's DP)** — "wide-angle handheld close to the subject, subtle natural drift, slow shutter trails, neon-lit cramped interiors, saturated practicals." — **Medium risk.**

### Templates — impossible cameras

Each template is ready to fill. Lead with preservation only if identity matters (named character, product, logo).

**1) Dolly zoom / Vertigo:**
```
Preservation: Preserve @CharacterA's facial identity, hairstyle, and outfit.

Shot 1, 4s: Medium shot of @CharacterA standing still and facing camera, centered in frame. Subject action: @CharacterA holds a still expression of dawning realization; only subtle blinking, no head movement. Camera: dolly zoom (Vertigo effect) — the camera physically dollies backward while the lens zooms in at a matching rate, keeping @CharacterA the exact same size in frame; the background warps, stretches outward, and compresses around them. Lighting: soft directional key, slightly cool ambient.

Continuity: @CharacterA's face, scale, and position remain identical from first to last frame.

Negative prompt: subject changing size, subject drifting off center, identity drift, face morphing, warped subject, jitter, motion smear on the subject, double exposure.
```

**2) Camera-through-object (keyhole / window / doorway):**
```
Master scene: A quiet [room interior] revealed from behind a [keyhole / window / doorway], realistic daylight.

Shot 1, 5s: The camera starts framed tightly inside the [object opening], with the dark edges of the opening framing the lens for the first beat. Subject action: nothing in the room moves — a still tableau. Camera: smooth forward dolly through the opening; the framing object clears the edges of frame by ~1.5s, then the camera continues pushing into the room at a slow steady pace. Lighting: soft window light from the far side, even ambient.

Continuity: The room layout, furniture positions, and lighting direction stay constant; the camera path is a single straight line.

Negative prompt: warping opening edges, melting object, room geometry shifting, duplicated doorway, jitter, rotating camera.
```

**3) Bullet-time / frozen orbit:**
```
Preservation: Preserve @CharacterA's facial identity, outfit, body proportions, and exact pose throughout.

Shot 1, 5s: Wide full-body shot of @CharacterA frozen mid-[action — e.g. jump, kick, swing]. Subject action: @CharacterA is completely motionless; no limb movement, no facial expression change. Camera: smooth horizontal orbit 180 degrees clockwise around @CharacterA at constant speed, keeping them centered; strong parallax between near foreground and deep background. Lighting: even, no flicker.

Continuity: @CharacterA's pose, expression, clothing folds, and hair position remain identical across all frames.

Negative prompt: subject moving, limbs shifting, pose breaking, face morphing, identity drift, warped body, jitter, uneven orbit speed.
```

**4) FPV drone dive through tight space:**
```
Master scene: An [environment — e.g. narrow alley, factory corridor, canyon] shot from an aggressive FPV drone perspective, realistic daylight, kinetic.

Shot 1, 5s: Ultra-wide ~18mm first-person drone view diving forward through the [environment]. Subject action: the environment itself is mostly still; one or two pieces of debris or fabric move naturally. Camera: aggressive forward FPV dive at controlled speed, the corridor stays roughly centered in the gap; one smooth banking turn at the 3-second mark; no extreme rotation. Lighting: natural directional light, deep focus.

Continuity: The corridor geometry stays consistent; no teleporting between locations.

Negative prompt: warping walls, geometry shifting, teleporting camera, extreme rotation, jitter, frame tearing, duplicated corridor, motion smearing the entire frame.
```

**5) Wong Kar-wai step-printed motion:**
```
Master scene: A figure walks through a neon-lit Hong Kong-style alley at night, wet asphalt, saturated palette of deep reds, electric greens, and sodium-yellow streetlights.

Shot 1, 5s: Wide-angle handheld medium shot of @CharacterA walking through the alley. Subject action: @CharacterA walks forward at a normal pace, eyes ahead, calm expression. Camera: subtle handheld, wide-angle ~28mm lens held close, gentle drift alongside the subject. Motion treatment: step-printed motion — a stuttering low-frame-rate motion blur on @CharacterA while the background remains in normal time; slow shutter trails on her movement. Lighting: saturated neon practicals, wet ground reflections.

Continuity: Preserve @CharacterA's face, hairstyle, outfit, and the alley's color palette throughout.

Negative prompt: full-frame stutter, background also step-printed, identity drift, face morphing, jitter on the background, washed-out color, daylight look.
```

**6) Body-mount / snorricam:**
```
Preservation: Preserve @CharacterA's face, hairstyle, outfit, and body proportions throughout.

Shot 1, 5s: Tight medium close-up of @CharacterA, the camera rigidly mounted in front of their chest facing them. Subject action: @CharacterA walks/runs forward at a controlled pace; their head and torso remain locked centered and stable in frame. Camera: no camera movement relative to @CharacterA — they stay fixed in frame; the background swings, shifts, and parallaxes around them as they move through the [environment]. Lighting: natural daylight, even on the face.

Continuity: @CharacterA's framing, scale, and identity remain identical; only the background changes.

Negative prompt: subject drifting in frame, subject size changing, face morphing, identity drift, static background, jitter, warped face.
```

### Combining techniques — be brutal about it

Most of these techniques are themselves the *one big idea* in the shot. Don't stack them. A dolly zoom on a body-mount of a running character through a keyhole shot in anamorphic step-print will produce a smear. Pick one impossible thing and let everything else be calm.

Two combinations that *do* work cleanly:
- **Lens look + safe move** — anamorphic + slow push-in, fisheye + locked-off, tilt-shift + slow pan, telephoto + side tracking.
- **POV + simple environment motion** — walking POV + leaves falling, driver POV + rain on the windscreen, hands POV + steam rising.

Everything else: split into separate shots, edit together.

## Write movement precisely
- "cinematic camera movement" → "slow dolly-in toward the product"
- "dynamic camera" → "the camera tracks backward smoothly as the model walks forward"
- "epic orbit shot" → "slowly orbits 30 degrees clockwise, logo centered"
- "dramatic zoom" → "slow push-in from medium shot to close-up over 4 seconds"

## What to avoid in multi-shot prompts
- Inconsistent subject names across shots (woman/model/girl) → repeat "Character A".
- Conflicting camera instructions ("static while slowly orbiting") → pick one.
- Multiple camera moves in one shot ("pushes in, pans, tilts, orbits, zooms") → one move.
- Fast camera + fast subject → make one stable.
- Mouth working during camera motion → split dialogue and movement into separate shots.
- Too many locations → one main location, different framings.
- Vague adjectives with no physical instruction ("cinematic, premium, dramatic") → "slow push-in, soft rim light, shallow DOF, centered composition."

## Templates

**Product ad:**
```
Master scene: Premium product commercial for [product]. Minimal studio, clean background, luxury lighting, realistic motion.
Shot 1, 4s: Macro close-up of [product detail]. Locked-off camera. Soft light moves across the surface.
Shot 2, 5s: Medium shot of the product on a [surface]. Camera slowly orbits 30 degrees clockwise, logo centered and readable.
Shot 3, 6s: Final hero shot. Camera slowly pulls back to reveal the full product and clean background. Product stays sharp.
Continuity: Preserve exact product shape, color, material, label, logo, and lighting style.
Negative prompt: warped product, changed logo, unreadable text, extra objects, flickering reflections, unstable camera, melted edges.
```

**Fashion video:**
```
Master scene: Editorial fashion film in [location], realistic, premium, stylish.
Shot 1, 4s: Wide full-body shot of Character A standing in the location. Static camera, outfit clearly visible.
Shot 2, 5s: Character A walks forward confidently. Camera tracks backward smoothly at the same pace, keeping Character A centered.
Shot 3, 3s: Insert shot of fabric movement and accessories. Locked-off close-up.
Shot 4, 3s: Medium close-up of Character A looking toward camera. Slow push-in, stable face, no dialogue.
Continuity: Preserve face, hairstyle, outfit, body proportions, and location.
Negative prompt: changing face, unstable clothing, warped hands, distorted walking, jittery camera, duplicate character.
```

**Dialogue scene:**
```
Master scene: Quiet cinematic dialogue scene in [location], soft natural lighting.
Shot 1, 3s: Medium close-up of Character A facing Character B. Character A speaks one short sentence. Locked-off camera.
Shot 2, 3s: Reverse medium close-up of Character B listening and nodding once. Locked-off camera.
Shot 3, 4s: Medium close-up of Character B speaking one short sentence. Locked-off camera, natural lip sync.
Shot 4, 5s: Two-shot of both characters seated together. Subtle slow push-in, calm expressions.
Continuity: Preserve both characters' faces, outfits, positions, and lighting.
Negative prompt: wrong speaker, mouth morphing, face flicker, mismatched lip sync, duplicate faces, unstable eyes, warped teeth, camera shake.
```

**Action scene:**
```
Master scene: Cinematic action movement in [safe environment], realistic physics, clean body motion.
Shot 1, 3s: Wide establishing shot of Character A preparing to move. Static camera.
Shot 2, 5s: Wide full-body shot of Character A performing one clear fast action. Camera locked-off. Full body visible from head to feet.
Shot 3, 4s: Character A lands or stops naturally. Smooth side tracking camera, no rotation.
Shot 4, 3s: Medium close-up reaction shot. Slow push-in, stable face.
Continuity: Preserve body proportions, outfit, face, and environment.
Negative prompt: warped limbs, twisted legs, extra arms, duplicate body, rubber body, motion smear, jitter, shaky camera, broken anatomy.
```
Keep action athletic or dance-like rather than dangerous stunts for cleaner, safer generations.

**Action montage (the 2-second × 5-shot pattern):**

The default warning in this file still applies: **avoid 1-second cuts unless intentionally making a montage — very short shots produce underdeveloped motion.** The exception is the action montage, where short shots are the whole point — each one is a sensory hit rather than a developed beat. Use this pattern when the brief is "pit stop," "fight scene," "heist sequence," "car commercial drift montage," "kitchen prep montage" — anything where rhythm and impact matter more than dwell time.

When to use it:
- Action sequences with multiple discrete impact moments.
- Commercial spots where pacing IS the product (energy drinks, racing, fitness).
- A climax inside a longer piece — generate this as one segment and edit it into a slower sequence.

When NOT to use it:
- Dialogue, character moments, product hero shots.
- Any sequence where identity must hold across shots — 2s isn't enough for Kling to stabilize a face. Use an Element if you must.
- Slow brand films, fashion, cinematic narrative.

Structure rules:
- Exactly 4–5 shots, each 2s, total 8–12s.
- Each shot is one extreme angle or one extreme framing — not a balanced composition. Macro, ultra-low, top-down, whip pan, side-tracking, over-the-shoulder. Vary every shot.
- One subject action per shot, but the action across shots compounds toward a peak.
- Identity holds via Element + tight wardrobe/object preservation. Don't try to hold a face this fast without one.

```
Master scene: [Action type] montage in [location], [time of day], cinematic, kinetic editing.
Continuity: Preserve [character/product/vehicle identity, outfit, color palette] across all shots via [Element name].

Shot 1, 2s: Wide establishing shot of [subject + setup action]. Camera: [rig + one move, e.g. low rigid mount tracking alongside at wheel level]. Lighting: [one specific descriptor].

Shot 2, 2s: [Different framing — e.g. medium cockpit/interior] of [subject + secondary action]. Camera: [different rig + different move].

Shot 3, 2s: Extreme close-up / macro of [impact detail — the hands, the eyes, the gear, the contact point]. Camera: [rig + push-in or micro-shake on contact].

Shot 4, 2s: [Different angle entirely — top-down, ultra-low, or whip-pan transition] of [peak moment]. Camera: [whip pan / snap zoom / rapid lateral move].

Shot 5, 2s: [Resolution framing — wide release or exit] of [final state]. Camera: [rig + final move, e.g. crane rise / static low rear-angle].

Negative prompt: identity drift across shots, outfit changes, warped [product/vehicle], duplicated subjects, flicker, motion smear on faces, frame tearing.
```

**Camera-style variety across the 5 shots is the point.** Pull from different rigs deliberately: macro (close detail) → ultra-low (impact angle) → shoulder-height handheld (human scale) → whip pan (transition) → static low rear (exit). If two consecutive shots use the same rig, you've lost half the point of the pattern.

## Phrase bank
**Stable cinematic:** locked-off camera, static wide shot, slow push-in, slow pull-back, gentle pan left/right, subtle tilt up/down, smooth side tracking, smooth backward tracking, slow clockwise orbit, slow crane rise, macro close-up, medium close-up, wide establishing shot, over-the-shoulder, shot-reverse-shot, insert shot, cutaway, final centered hero shot.
**Avoid (vague/aggressive):** crazy camera, insane/super dynamic, rapid zoom, fast orbit, whip pan, camera spins, 360° rotation, chaotic handheld, extreme/hyper-fast motion, transformation while running, talking while sprinting, multiple characters speaking at once.

## Bottom line
- One shot = one subject action + one camera movement + one framing.
- Safe workflow: establishing → medium action → insert/detail → close-up/hero.
- Talking: shot-reverse-shot + locked camera + one speaker per shot.
- Fast motion: wide full-body + stable camera + one action per shot.
- Product: macro detail → slow orbit → centered hero.
