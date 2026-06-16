# Kling 3.0 / Kling 3 Omni — Render Rules

Translate the chosen Universal direction into Kling's native structure. Kling 3.0 is the cinematic flagship; **Omni** is its directable flagship mode (reference-video character lock, unified audio across cuts, multi-shot). Both share this grammar.

> Built from current third-party guidance. Treat model-specific quirks as working defaults the user may override from their own testing.

**Pillars travel here as logic, not labels.** You have already reasoned in INTENT / AESTHETIC / EXECUTION. This render re-expresses that thinking in Kling's grammar: the *why* shapes how the action and move are written, the *world* becomes the brief continuity anchor, the *play-by-play* becomes the action + camera + audio. Don't print the pillar labels; don't lose the reasoning.

---

## The Five-Layer Order

Write in this exact sequence:

**Scene → Characters → Action → Camera → Audio & Style**

1. **Scene** — ground the model in the environment first. On an uploaded frame, this is a brief continuity anchor, not a fresh description: name the setting and the grade to hold.
2. **Characters** — who is in frame. The start frame handles appearance; keep this light — do not re-describe what the image already locks.
3. **Action** — one clear action. Present, specific, motivated.
4. **Camera** — the single motivated move + framing. Name the move plainly (push-in, slow dolly, lateral track, static hold).
5. **Audio & Style** — sound design and the look to preserve.

---

## Core Behaviors

- **One thing well.** Kling's biggest failure mode is a prompt trying to do too much. One subject, one clear action, one camera move. This *is* the Restraint doctrine — enforce it hard here.
- **Image-to-video = direction.** Upload sets appearance and style; the prompt focuses on motion and camera, not description. Cut what the frame already shows.
- **Start frame** locks character/appearance/style. **Start + end frame** interpolates between two compositions — Kling generates the transition. This is the mechanism for the before/after **reveal**: the uploaded frame is the start; the inferred "after" can be described as the end composition, and the prompt describes the camera path and transformation connecting them.
- **The motion-budget quirk.** Kling spends its motion budget on **character motion and camera work** before environmental events. If you ask for both a head-turn and a lightning flash, expect the character beat to win and the environmental one to be weak or dropped. *Design around this:* put the emotional weight on the subject and the camera, not on background spectacle. Let the grade and existing light do the atmospheric work rather than prompting big environmental events.
- **Refine one layer at a time.** When iterating, change either style or motion in a single pass — never both. Matches the system's general iteration discipline.

---

## Features to Deploy

- **Native audio / dialogue** — Kling 3.0 generates synchronized speech and sound effects. Put diegetic sound the moment implies into the Audio layer (the door-slam she reacts to; rain on glass; a held silence). Dialogue can be quoted directly for lip-synced delivery.
- **Multi-shot (Omni)** — up to several camera angles in one generation. For a multi-beat direction, separate shots clearly and let Omni hold the character across cuts. Each shot still obeys one-move Restraint.
- **Negative prompt** — Kling supports true negatives. Use it for **Restraint and continuity guards**: distortion, warping, extra limbs, identity drift, unwanted camera shake, subtitles. Do not stuff it; name the few real risks.
- **Duration** — 3 to 15 seconds. Budget beats accordingly; longer clips need a clear hold-then-move rhythm or they wander.

---

## Output: Natural Language, Wrapped

The five-layer order above is how you *think*, not how you write the final prompt. Kling reads flowing natural language. Deliver the prompt in a code block, as either a **single paragraph** (one shot) or a **multi-shot sequence** (Shot 1 / Shot 2 …). Both are native to Kling — not rigid. Fold the five layers into prose in roughly that order.

**Single paragraph (start-frame I2V):**
```
A woman stands at a rain-streaked apartment window at dusk, cool low-contrast light, lifted shadows. She exhales and her shoulders drop, then slowly turns her face a few degrees toward the door behind her. A slow telephoto push-in compresses her against the blurred glass, settling as she turns. Steady rain on the glass, one distant passing car, no music. Hold the cool, lonely blue cast throughout.
```

**Multi-shot (the before/after as a cut):**
```
Shot 1 — Medium shot, she lowers the letter to her lap, eyes still down, the cool window light holding on her face. The camera rests, barely breathing.
Shot 2 — The camera pulls back steadily to reveal the empty chair across the table; rain ambience swells faintly; the same cool grade and lifted blacks carry across the cut.
```

**Start + end frame (the reveal):** uploaded image is the start; the inferred "after" is the end composition; the prompt describes the connecting path in prose — *"The camera pulls back steadily as she lowers the letter, revealing the empty chair across the table; cool grade held, rain ambience, slow and deliberate."*

**Negative prompt** (separate field, only the real risks): `face distortion, identity drift, extra limbs, camera shake, subtitles`
