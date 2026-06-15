<p align="center">
  <img src="gallery/images/banner.png" alt="Character Cast — Character Forge" width="100%">
</p>

# Character Cast

An image-prompt generation system for **character consistency workflows**. It does not generate images — it produces ready-to-copy text prompts you paste into your image tool (Nano Banana, Midjourney, ChatGPT image, Leonardo, etc.).

The system has two independent halves:

- **Character Forge** — build a photorealistic character from a written description or a photo, and get back one annotated **reference sheet** (Mode A) or a clean **8-panel grid** (Mode B). Height and build are locked here.
- **Angle shots** — upload any character image (a photo, a Forge sheet, or existing art) and get **every angle prompt at once**, labeled: headshots, medium shots, full body, and expressions. Copy whichever you need.

Each half is a complete path. Use one, the other, or chain them.

---

## Flow

```
          ┌── upload image ────────────────→ ANGLE SHOTS → all angle prompts listed
START ────┤
          └── describe / START FORGE → FORGE → reference sheet (height + build fixed)
                                                 └─(optional)→ download sheet, re-upload → ANGLE SHOTS
```

- **Upload first** → straight into Angle shots.
- **Describe a character** → Character Forge → pick Mode A or B → sheet.
- **Bridge** → after the sheet, download and re-upload it to get individual angle prompts. The fixed height and build carry through automatically.

### The height line

Full-body prompts (5A front, 5B back, 5C three-quarter) render a thin vertical line at the character's side with a text label showing height. It appears on those three prompts only — never on headshots, medium shots, or expressions. Height is fixed when the character is built in Forge; on a direct upload it's requested only if a full-body prompt is chosen.

---

## What's in here

```
character-cast/
├── README.md          # this file
├── character-cast.md  # THE system prompt — edit this one file
├── SKILL.md           # same content, packaged as a Claude skill
├── gallery/           # example outputs + the banner
├── CHANGELOG.md
└── LICENSE
```

**One file to edit: `character-cast.md`.** It's the complete system prompt — instructions plus every angle prompt, self-contained. Change it directly on GitHub (pencil icon → edit → Commit changes). No build step, no tooling.

`SKILL.md` is the same content with a skill manifest on top. If you use the skill, edit it the same way, or just copy `character-cast.md`'s body into it.


---



## Deploy

`character-cast.md` is a single self-contained system prompt. Paste it into:

| Target | Where |
|---|---|
| Claude Project / Claude.ai | Project instructions / system prompt field |
| Custom GPT | Instructions field |
| API | `system` parameter |
| Notion / Obsidian | Saved as a reusable template |

---

## Install as a Claude skill

`SKILL.md` is the installable skill — manifest plus the full instructions in one self-contained file.

1. Install `SKILL.md` as a skill in Claude.
2. It triggers on requests like "build a character," "make a character sheet," "give me angles of this character," or "turn this photo into a turnaround."

For Custom GPT or API instead, paste `character-cast.md` into the system-prompt field — same content.


---

## Gallery

One character generated across every angle, body shot, and expression (slots A–P).

### Character Forge — reference sheets
| A — Mode A (annotated sheet) | B — Mode B (8-panel grid) |
|---|---|
| ![A](gallery/images/forge-sheet-a.jpeg) | ![B](gallery/images/forge-grid-b.jpeg) |

### Headshots
| C — 2A Front | D — 2B Three-quarter | E — 2C Side profile |
|---|---|---|
| ![C](gallery/images/2a-front.jpeg) | ![D](gallery/images/2b-threequarter.jpeg) | ![E](gallery/images/2c-profile.jpeg) |

### Medium shots
| F — 4A Front waist-up | G — 4B Three-quarter waist-up |
|---|---|
| ![F](gallery/images/4a-front.jpeg) | ![G](gallery/images/4b-threequarter.jpeg) |

### Full body (with height line)
| H — 5A Front | I — 5B Back | J — 5C Three-quarter |
|---|---|---|
| ![H](gallery/images/5a-front.jpeg) | ![I](gallery/images/5b-back.jpeg) | ![J](gallery/images/5c-threequarter.jpeg) |

### Expressions
| K — Neutral | L — Warmth | M — Concern |
|---|---|---|
| ![K](gallery/images/6a-neutral.jpeg) | ![L](gallery/images/6b-warmth.jpeg) | ![M](gallery/images/6c-concern.jpeg) |

| N — Intensity | O — Sadness | P — Surprise |
|---|---|---|
| ![N](gallery/images/6d-intensity.jpeg) | ![O](gallery/images/6e-sadness.jpeg) | ![P](gallery/images/6f-surprise.jpeg) |

For the full styled page, see `gallery/index.html` (enable GitHub Pages to view live).


---

## Updating it

Edit `character-cast.md` on GitHub — pencil icon, make your change, **Commit changes**. That's the whole update process. No zip, no re-upload, no build.

