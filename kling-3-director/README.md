# Kling 3.0 Director

A Claude Skill that turns rough ideas, keyword piles, or vague briefs into production-grade Kling 3.0 video prompts written in the right format for the use case.

## What it does

Kling 3.0 rewards prompts that read like a director's controlled shot, not a "make a video" wish. This skill enforces the craft rules that produce stable, professional output:

- Picks the right **mode** (text-to-video, image-to-video, Element, Custom Multi-Shot, start+end frame).
- Picks the right **format** (cinematic prose / compact one-sentence / labeled shot blocks / Omni @tag) — heavier formats only when the use case demands them.
- Leads with a **direction question** before drafting, so the prompt matches the user's actual intent.
- Stabilizes the **known failure modes**: talking mouths, fast motion, exotic cameras, product/logo work.
- Generates **failure-targeted negative prompts** instead of generic kitchen-sink blocks.

## File structure

```
kling-3-director/
├── SKILL.md                              # Entry point — always loaded
└── references/
    ├── prompt-craft.md                   # 20 craft rules + master template + canonical negative-prompt catalogs
    ├── camera-and-multishot.md           # Camera glossary, rigs, impossible moves, lens looks, multi-shot templates
    ├── talking-and-motion.md             # Talking-mouth stabilization + fast-motion distortion fixes
    └── product-element-guide.md          # Logo preservation, packshots, orbits, multi-shot product ads
```

Reference files load **on demand** — Claude reads them only when the request type warrants it. Token budget stays low until a task actually needs the depth.

## Install

### Option 1 — Claude Code (recommended for developers)

Clone the repo and install as a local skill:

```bash
git clone https://github.com/<your-username>/kling-3-director.git
cp -r kling-3-director ~/.claude/skills/
```

Or, for project-scoped install:

```bash
cp -r kling-3-director .claude/skills/
```

Then in Claude Code, the skill activates automatically when you mention Kling or describe a video prompt task.

### Option 2 — Claude.ai (paid plans, web/desktop)

1. Download or clone this repo.
2. In Claude.ai, go to Settings → Skills → Upload custom skill.
3. Upload the entire `kling-3-director/` folder (or a zipped version).
4. Skill activates when triggers in the description fire.

### Option 3 — Claude API

Use the `/v1/skills` endpoint to register the skill programmatically. See [Anthropic's Skills API docs](https://docs.claude.com/) for the upload flow.

### Option 4 — Claude Projects (manual, current fallback)

If Skills upload isn't available in your environment:

1. Create a new Project in Claude.ai.
2. Upload all five `.md` files (SKILL.md + the four references) to the project.
3. Use the project for Kling prompt work.

This works but skips the Skills auto-loading mechanism — all files sit in context permanently, which costs more tokens.

## How to use it

Once installed, just describe what you want:

- *"Make me a Kling prompt for a perfume bottle on marble with a slow orbit."*
- *"I need an image-to-video for this product shot, push-in close-up."*
- *"Write a 15-second car commercial in Kling 3.0 — drift montage."*
- *"Why does my character's face keep morphing when she talks? Fix the prompt."*

The skill leads with a direction question (tone, mood, intended use), then drafts in the format that fits — prose for a single mood shot, labeled blocks for a multi-shot ad, Omni @tag for dialogue scenes, etc.

If you want to skip elicitation, say *"just write it, no questions."*

## What this skill is opinionated about

A few choices worth knowing upfront, so you can evaluate fit:

- **Direction question first.** The skill asks one question (tone, references, intent) before drafting on most requests. Skip with *"no questions, just write it."*
- **Leanest format that fits.** Single shots default to prose or compact, not labeled blocks. Labeled blocks are reserved for multi-shot, commercial, and identity-critical work.
- **Failure-targeted negative prompts.** No "universal negative pack" — negatives target the actual artifact category, and grow shot-by-shot based on what you see in re-rolls.
- **One impossible thing per shot.** Exotic camera + fast subject + talking mouth + changing lighting in one shot will warp. The skill splits these into separate shots and notes they should be edited together.
- **Element is the source of truth.** When a product or character Element is in play, the skill won't re-describe what the Element already defines — that's the fastest way to make Kling reinvent the logo or face.

## Versioning

Skills are versioned via git tags. To pin to a specific version:

```bash
git checkout v1.0.0
```

Major version bumps indicate a change to the skill's default behavior (e.g. format selection logic, elicitation flow). Minor bumps add reference content or templates without changing defaults.

## Testing the skill

After install, test that it fires on the right triggers:

- *"Make a Kling prompt for X"* — should activate.
- *"Why is my Kling video warping?"* — should activate.
- *"Help me write a Sora prompt"* — should NOT activate (this skill is Kling-specific).

If the skill misses obvious triggers, the `description` field in `SKILL.md` needs tightening — Claude reads it to decide whether to load the skill.

## Contributing

Pull requests welcome. Particularly useful:

- New reference templates for specific use cases (food, fashion, music videos, real estate).
- Bug reports when prompts consistently fail in a specific way (include the input, the output, and the Kling version).
- Tightenings to the `description` triggers if you find the skill missing or over-firing.

## What this skill is NOT

- **Not a Kling tutorial.** It assumes you've used Kling at least a few times and know the basic UI.
- **Not for other video models.** Sora, Veo, Runway, Seedance — different models, different prompt grammars. Don't expect this to translate cleanly.
- **Not a guarantee.** Kling 3.0 is a moving target; behaviors drift between releases. Reference files reflect a snapshot. Test before relying on any specific technique for client work.

## License

MIT — see `LICENSE`.

## Credits

Built on top of community knowledge from the Kling prompt community, Anthropic's Skills documentation, and direct testing with Kling 3.0 and 3.0 Omni.
