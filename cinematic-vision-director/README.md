# Cinematic Vision Director

An independent creative agent for image-to-video prompting. Upload a still frame; it reads the image like a director of photography — inferring what happened before and what comes next — and writes directed, production-grade image-to-video prompts.

It relies on its own brain. It does not call other skills. All cinematic judgment lives in `SKILL.md` and the `kb/` reference files.

---

## What It Does

1. **Reads the frame** as evidence — frozen motion, light direction, eyeline geography, blocking, depth, eye-path, and the existing color grade → mood.
2. **Infers time** — what produced this moment, where it is going, and the emotional beat.
3. **Chooses cinematography** with a DP's instincts — lens as psychology, camera move serving the beat, mood–camera agreement, pacing as breath.
4. **Resolves into three pillars** — INTENT (why) · AESTHETIC (world) · EXECUTION (play-by-play), no repetition across them.
5. **Presents 2–3 divergent directions**, each with a vetoable one-line read.
6. **Asks which model** you are rendering on, then translates into that model's exact format.

---

## The Three Doctrines

- **Honesty** — reads are inferences from visible evidence, never invention; continuity describes only what is there.
- **Restraint** — one clear camera move + two to three motion cues. Always.
- **Motivated Motion** — every camera move names its cause. An unmotivated move is the tell of machine footage.

---

## Render Targets

- **Universal** — the model-agnostic three-pillar source of truth, in Classic or Brief Auteur style.
- **Kling 3.0 / Kling 3 Omni** — five-layer order, native audio, multi-shot, negative prompts, start/end frame.
- **Seedance 2.0** — six-step formula, 60–100 words, present-tense motion, single aesthetic, constraints tail.

---

## Files

| File | Role |
|------|------|
| `SKILL.md` | The brain — four-layer reasoning, three doctrines, runtime flow. **Edit this one file** for behavior changes. |
| `kb/index.md` | The KB map — what each KB file is and when the skill reaches for it. |
| `kb/cinematography.md` | Internalized film grammar; every term paired with its psychological function. Also the color-grade diagnostic key. |
| `kb/universal.md` | Three-pillar spec, the two Auteur styles, image-to-video reveal skeletons. |
| `kb/kling-3.md` | Kling 3.0 / Omni render rules. |
| `kb/seedance-2.md` | Seedance 2.0 render rules. |

---

## Runtime Flow

```
upload image
   ↓
run the brain (Read → Infer → Craft → Pillars)   [model-agnostic]
   ↓
present 2–3 Universal directions (each with a vetoable "Read:")
   ↓
ask: which model? — Kling 3.0/Omni · Seedance 2.0 · Universal
   ↓
translate chosen direction via the model's kb file
```

---

## Updating it

Edit `SKILL.md` on GitHub for any behavior change — pencil icon, change it, Commit changes. To add or revise knowledge, edit the relevant file in `kb/` (and add a line to `kb/index.md` if you add a new KB file). No build, no zip, no re-upload.

---

## License

MIT.
