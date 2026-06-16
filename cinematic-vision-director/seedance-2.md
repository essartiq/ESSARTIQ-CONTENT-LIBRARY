# Seedance 2.0 — Render Rules

Translate the chosen Universal direction into Seedance's six-step formula. Seedance 2.0 is quad-modal (text, image, video, audio simultaneously). It rewards a tight, ordered, single-aesthetic prompt with a constraints tail.

> Built from current working guidance. Treat specifics as defaults the user may override from their own testing.

**Pillars travel here as logic, not labels.** The INTENT / AESTHETIC / EXECUTION reasoning always runs underneath — here it dissolves into the six-step prose: the *why* lives in how Motion and Camera are written (Seedance has no intent slot), the *world* in Subject/Scene/Style, the *play-by-play* in Motion/Camera. The structure is in the thinking, not on the page.

---

## The Six-Step Formula

Write in this **exact order**, total length **60–100 words**:

1. **Subject** — who or what is in frame: age, clothing/props, expression, posture. On an uploaded frame, keep this to the continuity essentials the model must hold — do not over-describe what the image already shows.
2. **Motion** — exactly what happens: action, pace, direction, duration. **Present tense.** This is where EXECUTION's action lands.
3. **Scene** — environment, spatial background, time of day, lighting. Brief; the frame carries most of it. Name the light logic to hold.
4. **Camera** — shot size (wide/medium/close), angle (low/high/eye-level), lens, and the one movement (slow dolly-in, pan, tracking, static). The single motivated move.
5. **Aesthetics/Style** — one core aesthetic and the color grade to preserve. **One** — do not stack looks.
6. **Constraints** — the tail that guards output: maintain face/clothing consistency without distortion, no subtitles, no warping. Specific, short.

---

## Core Behaviors

- **Word budget is real.** 60–100 words. This forces Restraint structurally — there is no room for a second camera move or a third aesthetic. Compress EXECUTION to one move + 2–3 cues and trust it.
- **Present tense for Motion.** "She turns and the light catches her face" — not "she will turn." The model reads present action as the through-line.
- **One aesthetic only.** Step 5 takes a single core look. Stacking grades muddies the output. Name the grade already in the frame and hold it.
- **Multimodal anchoring.** Seedance is strongest when the prompt rides on its reference inputs (the uploaded image, optional audio, optional video). The text directs; the references hold identity and world. Establish shot structure upfront.
- **Constraints tail is not optional.** Step 6 is where continuity is protected. It is the Seedance home for the Honesty/continuity guards.

---

## Pillar → Six-Step Mapping

- **INTENT** → informs the emotional register of Motion and the choice of Camera move (not stated as its own line; Seedance has no "intent" slot — it lives in *how* Motion and Camera are written).
- **AESTHETIC** → Subject (continuity) + Scene + Aesthetics/Style + the held grade.
- **EXECUTION** → Motion + Camera.
- **Constraints** → the protective tail.

The discipline: INTENT does not get its own sentence here — it is expressed through the *quality* of the motion and the *choice* of move. The grade-mood agreement still governs which move you pick.

---

## Output: Natural Language, Wrapped

The six steps are the *thinking* order, not an output form. Seedance reads flowing natural language — do not deliver bracketed fields. Write the prompt as prose in a code block, folding the six steps in sequence, holding **60–100 words**. Single paragraph for one shot; multi-shot sequence for more than one beat (both native to Seedance, not rigid).

**Single paragraph (≈85 words):**
```
A woman in a grey sweater stands at a rain-streaked window, still and contemplative. She exhales, her shoulders dropping, then slowly turns her face toward the door behind her. Dim apartment at dusk, cool window light, lifted shadows. Medium shot, eye-level, telephoto lens, a slow push-in compressing her against the blurred glass, settling as she turns. Cool low-contrast cinematic grade, lonely blue cast, fine film texture. Maintain face and clothing consistency without distortion, no warping, generate video without subtitles.
```

One subject, one motivated move (push-in motivated by the exhale), 2–3 cues (exhale, shoulder drop, head-turn), one aesthetic, constraints tail — inside budget.

**Multi-shot (sequence, each shot tight):**
```
Shot 1: A woman in a grey sweater lowers a letter to her lap, eyes down, cool window light on her face, medium shot, eye-level, the camera resting still.
Shot 2: The camera pulls back slowly to reveal an empty chair across the table, same dim dusk apartment, cool low-contrast grade and lifted shadows held. Maintain face and clothing consistency, no distortion, no subtitles.
```

Keep the constraints tail once at the end of the sequence. Total still lands tight — multi-shot trades paragraph length for shot count, it does not license bloat.

---

## Optional: Macro-State Pipeline (multi-beat sequences)

For directions that span several beats with **cuts** between them, an alternative EXECUTION mode makes the state-inheritance explicit and keeps a long sequence readable. This is **not the default** — the single paragraph above is. Reach for the pipeline only when a cut is genuinely required.

### What triggers it

Multi-shot is earned by the direction's *structure*, never by the model or by mood:

1. **A cut is required** — the camera must jump to a new angle/subject, not move continuously (e.g. reaction shots: her line → cut to his reaction). One continuous move cannot cut.
2. **More than one subject in exchange** — a conversation, confrontation, action/reaction.
3. **A change of state the frame can't hold** — not "she turns within frame" (one beat), but "at the window → crosses the room → opens the door" (distinct spatial states).
4. **A beat sequence with its own rhythm** — setup → escalation → turn → resolution, each its own held moment.
5. **Before/after as an actual cut** rather than a continuous `pull back to reveal`.

**Does NOT trigger it:** one subject + one continuous move (even with several actions inside it); a reveal done by camera move; "make it feel cinematic" (decoration, not structure); most single-frame I2V. If one motivated move within the frame serves the beat, it stays a paragraph.

**Decision rule:** *Default to the single paragraph. Use the pipeline only when the direction requires a cut — a discontinuous jump between angles, subjects, or spatial states that one continuous move cannot achieve.*

**Duration sanity-check:** Seedance clips are short. A trigger means a sequence *can* be multi-shot, not that it *should* run long. Confirm the beats fit the clip length — cramming six Macro-States into a few seconds starves each. Restraint still rules: one move per line, sequence only as long as the beats can breathe.

### The structure

- **One line = one Macro-State = one cinematic beat.** Each line's start inherits the previous line's environment, props, and camera geography — do not re-describe the room each line. The model carries the "physical baggage" forward.
- **Sub-states within a line are separated by `->`**, tagged `[CAM] [ACT] [AUDIO]` (extensible: `[SFX] [VFX] [PROP] [MOTION]`).
- **Tags are for human pre-visualization and are deletable.** To the generator, `[CAM] MCU, low-angle` reads the same as `MCU, low-angle`. They force director-then-choreographer-then-sound-designer thinking; strip them to save character count once the scene is planned.
- **Restraint holds per line** — one camera move per Macro-State.

### Honesty caveat (carry this, do not drop it)

The `->` arrow as a literal pipeline step is **unproven**. The model's tokenizer may treat it as a generic separator or ignore it. Use the pipeline as a *planning* structure that also happens to generate well in practice — not a guaranteed mechanism. This is observation and intuition, not validated behavior.

### Template

```
[OPENING]
<first-frame anchor = the uploaded image as starting state: shot size, camera, subject blocking, grade to hold>

[EXECUTION]
[CAM] <move> -> [ACT] <action + implied motivation> -> <dialogue if any> -> [AUDIO] <sound>
[CAM] <move> -> [ACT] <action> -> [AUDIO] <sound>
... one line per beat, each inheriting the last

[CONSTRAINTS]
<continuity guards once, at the end>
```

### Example (sequence — same scene, deliberately cut into beats)

```
[OPENING]
MS, eye-level, a woman in a grey sweater stands frame-left at a rain-streaked window at dusk, cool low-contrast light, lifted shadows.

[EXECUTION]
[CAM] MS, slow push-in -> [ACT] she exhales, shoulders dropping -> [AUDIO] rain on glass.
[CAM] MCU, telephoto on her face -> [ACT] she turns a few degrees toward the door behind her, eyes shifting -> [AUDIO] one distant passing car.
[CAM] INS, close on her hand at the sill -> [ACT] her fingers tighten on the frame -> [AUDIO] faint creak.
[CAM] MCU, holding her profile -> [ACT] her gaze settles, resolve arriving -> [AUDIO] rain steady, no music.

[CONSTRAINTS]
Maintain face and clothing consistency, cool low-contrast grade held throughout, no distortion, no subtitles.
```

The window, sweater, dusk, and grade carry forward without restating. One move per line. Tags present for planning, deletable for budget. The same scene as a *single beat* would collapse to the one-paragraph form above — the only difference is whether the direction needs cuts.
