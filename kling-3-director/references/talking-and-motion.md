# Talking characters & fast motion in Kling 3.0

Two distinct failure modes, two distinct fixes. The single most important principle: **do not make a character talk while moving fast unless absolutely necessary.** Generate the action shot and the dialogue shot separately, then edit them together. Both problems come from the model trying to solve too many variables in one shot at once.

When the user asks for a talking character OR a moving character, adapt the base prompt formula (from SKILL.md) using the relevant section below. Diagnose which problem applies, then layer in the stability instructions and the targeted negative terms.

---

## Part A — Smooth talking mouths

Mouth morphing happens because the model is solving too much in the face region simultaneously: `speech phonemes + emotion + head movement + identity preservation + camera movement + lighting changes`. The fix is to **reduce facial complexity**.

Kling 3.0 added native audio, multi-character coreference, multilingual dialogue, dialect/accent support, and improved lip movement; 3.0 Omni can bind a voice to a character Element for better lip-sync and expression.

### Setup order for talking characters

1. Create or upload a clean character reference.
2. Use an Element / character reference.
3. Bind the voice if available (3.0 Omni: a 3–8s speaking video, or multi-angle images + 5–30s of clean audio; minimum ~3s of audio).
4. Use a close-up or medium close-up.
5. Keep the head mostly stable.
6. Use short dialogue.
7. Avoid strong facial expressions while speaking.
8. Avoid fast camera movement during dialogue.

### Talking-character prompt structure

```
[Shot type]
[Character identity / Element]
[Head and body stability]
[Dialogue]
[Expression]
[Camera]
[Lighting]
[No... negative terms]
```

**Single speaker:**
```
Close-up shot of @CharacterA facing the camera. @CharacterA keeps her head mostly still and speaks calmly with small, natural mouth movements. Her eyes blink subtly and her expression stays relaxed and confident.
@CharacterA, calm clear voice: "Welcome back. Today I want to show you something simple but powerful."
Camera: locked-off close-up, no zoom, no pan, no orbit. Soft even lighting on the face. Preserve the exact facial identity, lip shape, teeth, jawline, hairstyle, skin texture, and outfit.
No mouth morphing, no melting lips, no warped teeth, no changing face, no exaggerated jaw movement, no unstable cheeks, no distorted tongue, no face flicker, no head wobble, no duplicate mouth, no mismatched lip sync.
```

**Two-character dialogue** — use unique labels, a visual anchor per speaker, tone tags, and timing words ("then", "immediately") so the model doesn't merge speakers:
```
Medium close-up dialogue scene in a quiet studio.
[Character A: woman in blue jacket] sits on the left, looking at Character B. She keeps her head mostly still and speaks softly.
[Character A, calm clear voice]: "I think the design is almost ready."
Then the camera cuts to [Character B: man in black shirt] on the right. He nods once before speaking.
[Character B, low thoughtful voice]: "Yes, but the logo needs more space."
Camera: simple shot-reverse-shot, no fast camera movement. Both characters remain seated and stable while speaking. Natural lip sync, small mouth movements, controlled facial expressions.
No wrong speaker, no merged voices, no mouth morphing, no face morphing, no warped teeth, no unstable lips, no exaggerated expression, no duplicate faces, no mismatched lip sync.
```

### Dialogue length — keep it short
Fewer mouth shapes per continuous motion = cleaner lip sync. Use **5–12 words per line, one speaker per shot, 1–2 sentences max per shot.**
- Bad: one long 30-word sentence.
- Better: "I've been thinking." / "This project can grow." / "But we need a clearer strategy."

### Shot size for speech
- Best: medium close-up, close-up, front-facing head-and-shoulders, slight 3/4 angle.
- Risky: extreme close-up of lips (exposes artifacts), side profile, wide shot with a tiny face (too little detail), low-angle, fast handheld, talking while turning away.

### Element quality for talking characters
Reference images should be: front-facing + a 3/4 angle, neutral/relaxed mouth, good lighting, sharp eyes and mouth, no heavy lip shadows, no sunglasses, no hair over the mouth, no extreme smile. For voice binding use clean audio: quiet room, no music, no reverb, no background noise, normal pace, neutral consistent tone.

### Mouth-stability vocabulary
- Helpful phrases: small natural mouth movements, subtle lip movement, stable jawline, relaxed cheeks, natural lip sync, clear syllable timing, controlled facial expression, minimal head movement, head remains steady, front-facing close-up, locked-off camera, soft even face lighting.
- Negative terms to use: no mouth morphing, no melting lips, no warped teeth, no changing mouth shape, no exaggerated jaw motion, no unstable cheeks, no face flicker, no mismatched lip sync, no duplicate mouth, no distorted tongue, no identity drift, no head wobble.
- Avoid asking for: very emotional speech, dramatic screaming, talking very fast, huge smile while talking, crying/laughing while speaking, wild expression.

### Default safe talking prompt
```
Close-up shot of @CharacterA facing the camera. @CharacterA speaks one short sentence with calm, natural lip movement. The head remains mostly still, with subtle blinking and a relaxed expression. The camera is locked-off, no zoom, no pan, no orbit. Soft even lighting clearly illuminates the face. Preserve the exact facial identity, lips, teeth, jawline, hairstyle, skin tone, and outfit.
@CharacterA, calm clear voice: "Your dialogue line here."
No mouth morphing, no melting lips, no warped teeth, no changing face, no exaggerated jaw movement, no unstable cheeks, no distorted tongue, no face flicker, no head wobble, no mismatched lip sync, no duplicate mouth.
```

---

## Part B — Fast motion without distortion

Fast motion breaks when too many things move at once: fast body + camera + object + expression + environment + clothing. The fix is to **isolate variables and divide motion across shots** rather than forcing one long chaotic take.

### Main rule — one clear action per shot
- Bad: "A man sprints through traffic, jumps over a car, spins, lands, runs toward camera while the camera circles fast, rain falls, cars move, explosions happen."
- Better, split:
  ```
  Shot 1: The man starts sprinting down a wet street, side-tracking camera, stable body motion.
  Shot 2: He jumps over a small obstacle in slow motion, locked-off camera.
  Shot 3: He lands and continues running forward, camera tracks backward smoothly.
  ```

### "Fast subject, slow camera" or "slow subject, fast camera"
Never make everything fast. Pick one to move quickly.
- Stable: fast subject + locked/stable camera — "A runner sprints left to right across the frame. The camera is locked-off in a wide shot. Motion is crisp and physically realistic. No camera shake."
- Stable: slow subject + fast camera reveal — "The model stands still as the camera quickly dollies past foreground lights, creating a dynamic reveal."
- Risky: fast subject + fast camera + fast background + fast lighting + fast clothing → warping.

### Use slow motion for complex action
Prompt: slightly slowed motion, controlled slow motion, readable athletic motion, clear body silhouette. Avoid: super fast, extreme speed, rapid chaotic movement, hyperactive camera. A good compromise: "The action is energetic, but the video presents it in controlled slow motion so the body remains readable and stable."

### Fast-motion prompt template
```
Wide shot of [subject] performing one clear fast action: [specific action]. The camera remains [locked-off / smooth side tracking / smooth backward tracking]. The subject's body stays anatomically consistent, with natural limb motion and realistic physics. The background moves minimally. Use slight motion blur, not distortion. Keep the action readable and clean.
No warped limbs, no melting body, no stretched arms, no twisted legs, no duplicate body, no broken anatomy, no jitter, no frame tearing, no unstable camera, no motion smearing, no distorted face, no flickering clothing.
```

### Image-to-video for fast motion
The image already supplies the scene, so prompt movement only (Subject + Movement, Background + Movement):
```
The person in the image performs one controlled movement: [specific movement]. The camera remains stable. Preserve the person's face, body proportions, clothing, and original scene. Movement is smooth and physically realistic, with slight natural motion blur.
No twisted limbs, no warped face, no duplicate body, no stretched clothing, no unstable background, no heavy motion blur, no jitter.
```

### Default safe fast-motion prompt
```
Wide full-body shot of @CharacterA performing one clear fast action: [describe action]. The full body remains visible from head to feet. The camera is locked-off / smoothly tracking, with no sudden rotation. The motion is energetic but controlled, physically realistic, and slightly slowed so the body silhouette stays readable. Preserve the character's face, body proportions, outfit, and anatomy.
No warped limbs, no twisted legs, no extra arms, no duplicate body, no rubber body, no stretched torso, no unstable face, no motion smearing, no jitter, no frame tearing, no shaky camera, no distorted clothing.
```

---

## Settings strategy (both cases)
Use Professional / high-quality mode for faces, dialogue, product, or commercial work; Standard mode is faster. Use shorter duration for hard motion, multi-shot for action sequences, Elements for talking characters, image-to-video when identity matters, start/end frames when pose control matters. Don't generate 15s first — test **3–5s → 6–8s → multi-shot 10–15s.**

## Troubleshooting

| Problem | Likely cause | Fix |
|---------|--------------|-----|
| Mouth melts while talking | Too much expression/head movement | Locked camera, stable head, neutral expression |
| Teeth warp | Extreme close-up or exaggerated speech | Medium close-up, short calm dialogue |
| Speaker changes identity | No Element / weak reference | Use a character Element, repeat the exact label |
| Wrong character talks | Ambiguous dialogue | Character A/B labels + speaker tags |
| Lip sync late/off | Long or fast dialogue | Shorter lines, slower voice, clearer timing |
| Face flickers | Moving light/camera during dialogue | Even lighting, no orbit, no fast zoom |
| Limbs distort in fast action | Too much action in one shot | Split into multi-shot |
| Body stretches | Subject partly out of frame | Full-body wide shot |
| Motion smears | Too fast + moving camera | Slow motion, locked camera |
| Background warps | Fast subject + fast background | Simplify background movement |

## Bottom line
- Talking: Elements + voice binding + close-up/medium close-up + short calm dialogue + locked camera + stable head + targeted "No..." terms for mouth artifacts.
- Fast motion: one action per shot + wide framing + stable camera + controlled slow motion + minimal background motion + multi-shot sequencing.
- Never combine the two in one shot unless unavoidable — split them and edit together.
