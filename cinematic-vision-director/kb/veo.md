# Google Veo 3.1 — Render Rules

Translate the chosen Universal direction into Veo 3.1's native structure. Veo 3.1 is Google DeepMind's flagship video generation model — it generates video and audio simultaneously in a single pass. Unlike Kling and Seedance, it is primarily **text-driven**, but supports optional reference images via the **Ingredients to Video** feature for character and style consistency.

> Built from Google's official prompting guide and current working knowledge. Treat specifics as defaults the user may override from their own testing.

**Pillars travel here fully.** INTENT shapes the emotional register of the Action and the choice of camera move. AESTHETIC becomes Subject + Context + Style (described fully in text — Veo 3.1 does not take a first-frame image input the way Kling/Seedance do). EXECUTION becomes Cinematography + Action + Audio.

---

## The Formula

Veo 3.1 responds to a **five-part prompt**, written as flowing prose:

**Cinematography → Subject → Action → Context → Style & Ambiance**

Then audio as its own block underneath.

**Optimal length: 100–150 words / 3–6 sentences.** This is the sweet spot — enough detail for control, not so much the model fights itself.

---

## The Five Parts

1. **Cinematography** — open with this. Shot type, camera angle, lens, and the one motivated move. Veo 3.1 was trained on cinematic data and responds to film vocabulary far better than plain description. Examples: *slow telephoto push-in*, *low-angle static hold*, *handheld medium shot drifting left*.

2. **Subject** — who or what is central. Age, clothing, expression, posture — describe explicitly. Unlike Kling/Seedance, there is no uploaded first-frame to carry appearance. Be specific but not exhaustive.

3. **Action** — what happens. Concrete verbs, present tense, one clear beat. *She exhales and her shoulders drop. She turns her face toward the door.* Keep it to one primary action — Veo handles internal beats well but fights multiple competing events.

4. **Context** — the environment. Setting, time of day, weather, spatial depth. This is where AESTHETIC's world-building lands: the apartment, the street, the studio, the light quality, the physical space.

5. **Style & Ambiance** — the visual register. Color grade, mood, era, cinematic look. One clear aesthetic — do not stack. *Cool low-contrast cinematic grade, lonely blue cast, fine film texture.*

---

## Audio — Three Dedicated Categories

Veo 3.1 generates a complete synchronized soundtrack from text. Audio is a first-class citizen — treat it as its own block after the five visual parts. Use exactly these three categories, each as its own sentence:

- **Dialogue** — spoken lines with lip-sync. Use a natural attribution: *A woman says, "I already knew."* Keep lines short.
- **SFX** — specific sound events timed to action: *SFX: rain hammers the glass. SFX: a door closes softly in the distance.*
- **Ambient** — the continuous background soundscape: *Ambient noise: the low hum of fluorescent lights. Ambient noise: the quiet breath of an empty apartment.*

Use only what the scene calls for — not all three are required every time. Ambient is the default floor; SFX add punctuation; Dialogue is for speaking characters.

---

## Ingredients to Video (Reference Images)

When character consistency or a specific visual style matters, Veo 3.1 supports up to **4 reference images** uploaded alongside the prompt. This is the **Ingredients to Video** feature — available in VideoFX and Gemini Ultra.

- The uploaded frame from this skill's workflow becomes **the first reference image** — use it for character appearance and environment style
- Additional reference images can lock clothing, location, or visual treatment
- Connect references to prompt elements through description: *"the woman from the reference image, in the environment shown, with the color treatment of the style reference"*
- Veo 3.1 does not use explicit reference tags — description is the link

When the user's image is being used as a reference (not a first-frame to animate), shift the prompt accordingly: describe the world fully but use the reference to hold identity rather than to define it.

---

## Core Rules

- **One camera move only.** Stacking movements produces unstable output. Pick the one motivated move; let stillness do the rest.
- **Positive framing throughout.** Veo 3.1 ignores "no X" / "don't X." Say what you want: "steady camera" not "no shake," "clear background" not "no clutter."
- **Exclude via trailing sentence.** End the prompt with a clean exclusion: *Exclude subtitles, text overlays, and watermarks.*
- **Present tense for action.** Matches how Veo reads motion directives.
- **Duration:** 8-second clips. Budget beats accordingly — one clear hold-then-move fits; multiple hard cuts do not.
- **Resolution:** 1080p standard; 4K available on full Veo 3.1; 720p on Lite.

---

## Pillar → Formula Mapping

- **INTENT** → informs the emotional register of Action and the motivation behind the camera move. Not stated as its own line — it lives in *how* the action is written and *why* the camera moves.
- **AESTHETIC** → Subject + Context + Style & Ambiance. Must be fully described — no image anchor carries it.
- **EXECUTION** → Cinematography + Action + Audio block.

---

## Output: Natural Language, Wrapped

Deliver as flowing prose in a code block. Five parts flow into one paragraph; audio sits as its own block underneath. Single paragraph for one beat.

**Example (text-only):**
```
Slow telephoto push-in, medium shot, eye-level. A woman in a grey sweater, still and contemplative, exhales — her shoulders dropping — then turns her face slowly toward the door behind her. A dim apartment at dusk, cool window light falling from the left, lifted shadows and rain on the glass. Cool low-contrast cinematic grade, lonely blue cast, fine film texture.

Ambient noise: steady rain on glass. SFX: one distant car passes. A woman says, "I already knew."

Exclude subtitles, text overlays, and watermarks.
```

**Example (with reference image):**
```
Slow telephoto push-in, medium shot, eye-level. The woman from the reference image — grey sweater, still — exhales and her shoulders drop, then turns her face toward the door. The apartment from the reference image at dusk, the color treatment and grade matching the visual reference. Cool low-contrast cinematic grade, blue cast held throughout.

Ambient noise: rain on glass. SFX: a door shifts in the wind somewhere above.

Exclude subtitles, text overlays, and watermarks.
```

---

## Start/End Frame Animation

Veo 3.1 supports providing both a **first frame** and a **last frame** — the model interpolates the video between the two images guided by the text prompt. This is the Veo equivalent of Kling's start+end frame reveal.

**How it works:**
- Upload the first frame (the frozen moment) and the last frame (the resolved state)
- The prompt describes the **camera path, transformation, and audio** that connects them — not the frames themselves
- Both compositions are locked; spend your words on the journey between them

**Prompt shift for start/end frame:**
Do not describe what the first or last frame shows — the images carry that. Write the connecting motion:
`The camera [motivated move] as [subject transforms/moves] from [implied state A] to [implied state B]. [Audio.]`

**Critical constraint — choose one mode only:**
Veo 3.1 cannot use reference images (Ingredients to Video) and first/last frames simultaneously. Pick one:
- **First/last frame** → for precise before/after control, reveal sequences, transformation arcs
- **Reference images** → for character consistency across a freely generated scene

**Example (start/end frame):**
```
The camera holds in a slow telephoto push-in as she completes her turn — shoulders settled, gaze finally at the door. The cool blue light holds constant across the transition, the rain on the glass unchanged.

Ambient noise: steady rain. SFX: her breath releases once.

Exclude subtitles, text overlays, and watermarks.
```

---

## Timestamp Prompting (Cut Frames / Multi-Shot Sequences)

When a direction requires genuine cuts — a discontinuous jump between angles, subjects, or spatial states — Veo 3.1 supports **timestamp prompting**: breaking the 8-second clip into timed segments, each with its own shot, action, and audio.

### The Format

Each segment uses a time block followed by its shot description:

```
[00:00-00:03] [Shot type + camera move], [subject + action]. [Audio for this segment.]
[00:03-00:06] [Shot type + camera move], [subject + action]. [Audio for this segment.]
[00:06-00:08] [Shot type + camera move], [subject + action]. [Audio for this segment.]

Exclude subtitles, text overlays, and watermarks.
```

### Rules per Segment

- **One camera move per segment** — Restraint still holds inside each timestamp block
- **Each segment is self-contained** — shot type, action, and audio described fresh; do not assume the previous segment carries over
- **Audio resets per segment** — state ambient/SFX/dialogue for each block that needs it; silent segments need no audio line
- **Keep to 2–3 segments** across 8 seconds — cramming 4+ cuts into 8 seconds starves each beat and causes the model to drift or average ideas into one muddy shot

### When to use timestamps

Use timestamps only when the direction requires a **genuine cut** — a new angle, a new subject, or a spatial state the previous shot cannot reach with a continuous move:
- Action → reaction (her line → cut to his face)
- Before/after as a hard cut (not a reveal pull-back)
- Location change between beats
- Multi-subject exchange

**Do NOT use timestamps** for: one subject with one continuous move, a reveal done by camera motion, or to "feel cinematic" — those stay as a single paragraph.

### Honesty Caveat

Timestamp prompting (`[00:00-00:02]` syntax) is a **community workflow convention** — not an officially documented Veo 3.1 API feature at time of writing. It works consistently in practice across VideoFX and third-party interfaces, but treat it as a reliable working default the user may find behaves differently across platforms. This is the same status as Seedance's `->` Macro-State pipeline.

### Example — Three-shot sequence

```
[00:00-00:03] Medium shot, eye-level, camera holding still. She lowers the letter to her lap, eyes down, cool window light on her face. Ambient noise: rain on glass.
[00:03-00:06] Close-up, telephoto, slow push-in. Her jaw tightens — a micro-expression, nothing more. SFX: a floorboard creaks once somewhere behind her.
[00:06-00:08] Wide shot, static, pulling back to reveal the empty chair across the table. Ambient noise: rain continues, one distant car.

Cool low-contrast grade, lifted blacks, blue cast held across all three shots. Exclude subtitles, text overlays, and watermarks.
```

Note: grade and style continuity are stated once at the end — they govern all segments.
