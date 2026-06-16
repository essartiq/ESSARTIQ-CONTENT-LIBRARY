# KB Index — Cinematic Vision Director

The map of this skill's knowledge base. `SKILL.md` holds the instructions (the brain); the files below are the reference material it consults. This index says **what each file is and when the skill should reach for it**, so the model isn't guessing what exists.

These are reference, not commands — source material the brain reads and draws from while reasoning through its four layers.

| File | What it holds | When the skill reaches for it |
|------|---------------|-------------------------------|
| `cinematography.md` | Internalized film grammar — shot types, lenses, camera motion, speed, lighting, color grade, composition, balance — every term paired with its psychological/narrative function. Also the color-grade diagnostic key. | **Layer 1 (The Read)** — to read the existing grade in the frame against the color-grade key and infer mood. **Layer 3 (The Craft)** — to choose lens, move, lighting, and composition by *function*, not label. |
| `universal.md` | The three-pillar source-of-truth spec (INTENT · AESTHETIC · EXECUTION), the two Auteur styles (Classic / Brief), and the image-to-video reveal skeletons. | **Layer 4 (The Pillars)** — to resolve the read into pillars without repetition. Whenever the user keeps **Universal** as the render target. The reveal skeletons scaffold EXECUTION. |
| `kling-3.md` | Kling 3.0 / Kling 3 Omni render rules — five-layer order, native audio, multi-shot (Omni), negative prompts, start/end-frame logic, the motion-budget quirk. | **Translation step** — only when the user picks **Kling 3.0 / Omni** as the render target. |
| `seedance-2.md` | Seedance 2.0 render rules — six-step formula, 60–100 word budget, present-tense motion, single aesthetic, constraints tail, and the optional tagged Macro-State pipeline. | **Translation step** — only when the user picks **Seedance 2.0** as the render target. |

## How the brain loads these

- **Always in play:** `cinematography.md` (Layers 1 and 3) and `universal.md` (Layer 4) — the model-agnostic reasoning runs on these every time.
- **Loaded on demand:** `kling-3.md` and `seedance-2.md` are read only after the user names the render target, never before. Reason in Universal first; translate second.

> **Platform caveat — verify, don't assume.** *How* this KB is actually loaded (attached to a project, retrieved automatically, pasted, referenced) depends on the platform the skill is deployed to, and that mechanism is outside this repo's control. This index organizes the KB cleanly regardless — but confirm the loading method for your specific platform rather than assuming one universal way.
