# Product Element guide for Kling 3.0

When the product is already created as a Kling Element, treat the Element as the locked source of truth. The prompt should not re-invent the product. It should direct Kling to preserve the product identity while controlling camera movement, lighting, background, and motion.

The main goal is:

```text
Keep the product exactly the same while making the video feel premium, cinematic, and commercially useful.
```

---

## 1. Core rule

Do not describe the product in a way that conflicts with the Element.

Instead of:

```text
A silver kettle with a cool modern logo and black handle
```

Use:

```text
Use Product Element A as the locked product reference. Preserve the exact product shape, logo, label placement, colors, materials, handle, spout, lid, base, cable, and all visible brand details.
```

The Element already contains the product design. Your prompt should focus on: preservation, camera movement, lighting, surface/background, commercial style, and "No..." negative terms.

---

## 2. Best prompt structure

```text
Product preservation:
Use Product Element A as the locked product reference. Preserve the exact logo, label text, product shape, proportions, color, material, surface finish, buttons, handles, caps, lids, cords, and all brand details.

Scene:
The product is placed on [surface/background].

Camera:
The camera performs [one controlled camera movement].

Lighting:
[Specific lighting direction and reflection behavior].

Motion:
The product remains [still / slowly rotating / lid opens / light moves across surface].

Style:
[Commercial style].

Continuity:
The product remains identical across the full video.

No changed logo, no unreadable logo, no warped label, no incorrect typography, no altered product shape, no extra product parts, no missing handle, no missing lid, no missing cable, no deformed spout, no distorted reflections, no melted metal, no unstable shadows, no random text, no duplicate products, no collage layout.
```

---

## 3. Master prompt template

```text
Use Product Element A as the locked product reference. Preserve the exact logo, label text, typography, product shape, proportions, color, material, surface finish, brand placement, and all visible design details throughout the video.

Scene: The product sits on a clean [surface] in a [studio/environment].

Camera: [camera movement]. Keep the product centered and fully visible. Keep the logo frontal, sharp, and readable.

Lighting: [lighting setup]. Reflections move naturally across the surface without distorting the logo or product shape.

Motion: [product motion or no product motion]. The product remains solid, rigid, and physically accurate.

Style: Premium ecommerce product commercial, realistic, clean, polished, high-end advertising look.

Continuity: Preserve the exact same product design across every frame. No redesigning, no extra branding, no logo changes, no label changes.

No changed logo, no unreadable logo, no warped label, no incorrect typography, no altered product shape, no extra product parts, no missing handle, no missing lid, no missing cable, no deformed spout, no distorted reflections, no melted metal, no unstable shadows, no random text, no duplicate products, no collage layout.
```

---

## 4. Logo-safe hero shot

```text
Use Product Element A as the locked product reference. Preserve the exact logo, label placement, typography, product shape, color, material, handle, lid, spout, base, cable, and all visible brand details.

Create a premium ecommerce hero shot of the product on a clean white studio surface. The product remains centered and still. The camera performs a slow push-in from a medium product shot to a tighter hero shot. Keep the logo frontal, sharp, stable, and readable throughout the video.

Soft studio lighting moves gently across the product surface, creating realistic reflections without warping the logo or product shape. The background remains clean, minimal, and static.

Style: realistic premium product commercial, clean ecommerce advertising, polished studio look.

No changed logo, no unreadable logo, no warped text, no altered typography, no distorted product shape, no extra products, no duplicated product, no missing handle, no missing lid, no wrong spout shape, no unstable reflections, no melted metal, no flickering shadows, no random text, no reference-sheet labels.
```

---

## 5. Slow product orbit

Use this when you want a premium 3D-feeling product reveal.

```text
Use Product Element A as the locked product reference. Preserve the exact logo, label text, typography, product shape, proportions, color, material, handle, spout, lid, base, cable, and all brand details.

The product sits on a clean studio surface. The camera slowly orbits 30 degrees clockwise around the product while keeping the product centered. Keep the logo visible, stable, sharp, and readable for as long as possible. Do not rotate past the point where the logo becomes distorted.

Lighting: soft top light with subtle rim light. Reflections move naturally across the surface without changing the product shape or logo.

Style: premium ecommerce product commercial, realistic studio lighting, clean background, polished advertising look.

No changed logo, no unreadable label, no warped typography, no distorted product body, no incorrect handle shape, no missing cord, no wrong lid, no deformed spout, no extra buttons, no melted metal, no unstable reflection, no random text, no duplicate products.
```

Important: For logo-heavy products, use a **30–45 degree orbit**, not a full 360-degree orbit. Full rotation often forces Kling to invent unseen angles and may damage the logo.

---

## 6. Turntable rotation

Use only when you have strong product references from multiple angles.

```text
Use Product Element A as the locked product reference. Preserve the exact product design, logo, typography, label placement, shape, proportions, color, material, handle, lid, spout, base, cable, and all visible details.

Create a slow product turntable video. The product rotates slowly clockwise on a clean white studio surface while the camera remains locked-off. The rotation is controlled and smooth, showing the product from front 3/4 to side view only. Keep the product solid and physically accurate. Preserve the logo and brand details when visible.

Lighting: clean studio lighting with soft reflections on the product surface.

Style: ecommerce product showcase, realistic, clean, polished.

No full 360 distortion, no invented back side, no changed logo, no unreadable logo, no warped label, no duplicated product, no unstable rotation, no deformed handle, no missing lid, no wrong spout, no melted material, no flickering reflections.
```

Recommended: ask for **front 3/4 to side view only** before attempting a full 360.

---

## 7. Open-lid or feature demo

For products with moving parts, keep the product still and let only one part move.

```text
Use Product Element A as the locked product reference. Preserve the exact logo, label placement, typography, product shape, stainless-steel body, black handle, lid, spout, base, switch, cable, and all brand details.

The product sits still on a clean white studio surface in a front 3/4 view. The camera remains locked-off. Over 5 seconds, the lid opens slowly and naturally on its hinge, revealing the interior. Only the lid moves. The body, handle, spout, base, cable, logo, and water-level window remain stable and unchanged.

Lighting: soft studio lighting with realistic reflections on the metal surface.

Style: clean ecommerce feature demonstration, realistic, polished, product-focused.

No detached lid, no warped hinge, no changed logo, no unreadable logo, no deformed handle, no distorted spout, no missing water window, no moving body, no duplicated product, no melted metal, no unstable reflections, no random text.
```

---

## 8. Logo close-up

Use this when brand visibility matters.

```text
Use Product Element A as the locked product reference. Preserve the exact logo, typography, placement, product material, color, and surface texture.

Create a macro close-up of the logo area. The camera remains locked-off with a very subtle push-in. The logo stays sharp, frontal, stable, and readable. Soft light moves gently across the surface, showing the material texture without warping the text or logo.

Style: premium product detail shot, clean ecommerce advertising, realistic studio lighting.

No changed logo, no misspelled logo, no unreadable text, no warped typography, no random text, no stretched label, no flickering reflection, no melted surface, no unstable camera.
```

---

## 9. Multi-shot product ad structure

Use Custom Multi-Shot — one shot per field.

```text
Use Product Element A as the locked product reference. Preserve the exact product shape, logo, label text, typography, color, material, handle, lid, spout, base, cable, and all visible brand details across every shot.

Master scene: Premium ecommerce product commercial in a clean white studio. Minimal background, soft reflections, realistic product lighting.
```

**Shot 1 field (4s):**
```text
Macro close-up of the logo and material texture. Locked-off camera with a very subtle push-in. The logo remains sharp, stable, and readable.
No changed logo, no misspelled logo, no unstable camera.
```

**Shot 2 field (5s):**
```text
Medium front 3/4 hero shot of the product on a clean studio surface. The camera slowly orbits 30 degrees clockwise while keeping the product centered and the logo visible.
No warped product, no unreadable logo, no extra objects.
```

**Shot 3 field (6s):**
```text
Final centered hero shot. The camera slowly pulls back to reveal the full product, including handle, spout, lid, base, and cable. Product remains still and physically accurate.

Continuity: Preserve the exact same product design, logo, typography, shape, proportions, color, material, and brand placement in all shots. No redesigning, no extra logos, no random text.

No changed logo, no misspelled logo, no unreadable logo, no warped label, no incorrect typography, no altered product shape, no missing handle, no missing lid, no wrong spout, no missing cable, no duplicate product, no random text, no reference-sheet labels, no collage layout, no melted metal, no unstable reflections, no flickering shadows.
```

---

## 10. Best camera moves for logo products

Use: locked-off camera, slow push-in, slow pull-back, slow 30-degree orbit, gentle pan, macro close-up, front 3/4 hero shot, centered product shot.

Avoid: fast orbit, full 360 rotation, whip pan, camera spin, rapid zoom, shaky handheld, extreme close-up of tiny text, camera passing behind the product, fast product rotation.

The more the logo rotates, shrinks, blurs, or bends with reflections, the more likely it is to distort.

---

## 11. Logo preservation phrases

Use these phrases often:

```text
Preserve the exact logo.
Keep the logo sharp and readable.
Keep the logo frontal.
Do not change the typography.
Do not alter the label placement.
The logo remains stable across every frame.
The brand mark does not morph.
No random text.
No misspelled logo.
No extra branding.
```

For packaging:
```text
Preserve the exact packaging shape, label layout, typography, barcode placement, cap, lid, color, and material.
```

For appliances:
```text
Preserve the exact handle, spout, lid, switch, cord, base, water window, logo placement, and stainless-steel finish.
```

---

## 12. What to avoid

Avoid this:
```text
Make the product spin quickly in a dramatic 360 camera move with flashing lights and logo close-ups.
```

Because it combines: fast product motion, camera motion, logo preservation, changing reflections, and high text detail. That is high-risk.

Use this instead:
```text
The product remains still. The camera slowly pushes in. The logo remains frontal, sharp, stable, and readable. Soft light moves gently across the product surface.
```

---

## 13. Best workflow

1. Create the product as a Kling Element.
2. Use a clean hero image or front 3/4 view as the main visual reference.
3. Generate short 3–5 second clips first.
4. Use locked-off camera or slow push-in for logo shots.
5. Use only 30–45 degree orbit for product reveal.
6. Avoid full 360 until the product is stable.
7. Generate macro logo, hero shot, and feature shot separately.
8. Edit the final product ad outside Kling.
9. Add final text overlays, price, CTA, and brand graphics in editing software, not inside Kling.

---

## 14. Final recommended prompt

Use Custom Multi-Shot — one shot per field.

```text
Use Product Element A as the locked product reference. Preserve the exact product shape, logo, label text, typography, color, material, handle, lid, spout, base, cable, and all visible brand details throughout the video.

Create a premium ecommerce product video in a clean white studio. The product sits on a smooth white surface and remains solid, rigid, and physically accurate.
```

**Shot 1 field (4s):**
```text
Macro close-up of the logo and brushed material texture. Locked-off camera with a very subtle push-in. The logo remains frontal, sharp, stable, and readable.
No changed logo, no unstable camera, no random text.
```

**Shot 2 field (5s):**
```text
Medium front 3/4 hero shot of the product. The camera slowly orbits 30 degrees clockwise, keeping the product centered and the logo visible. Reflections move naturally across the surface without warping the product.
No warped product, no unreadable logo, no extra objects, no flickering reflections.
```

**Shot 3 field (6s):**
```text
Final centered hero shot. The camera slowly pulls back to reveal the full product, including handle, spout, lid, base, cable, and overall silhouette.

Lighting: Soft studio top light, subtle rim light, clean controlled reflections.

Style: Premium ecommerce product commercial, realistic, clean, polished, high-end advertising look.

Continuity: The product remains identical across all shots. The logo, typography, shape, material, color, and all design details do not change.

No changed logo, no misspelled logo, no unreadable logo, no warped label, no incorrect typography, no altered product shape, no missing handle, no missing lid, no wrong spout, no missing cable, no extra buttons, no duplicate product, no random text, no reference-sheet labels, no collage layout, no melted metal, no unstable reflections, no flickering shadows, no shaky camera.
```

Key: because the product is already an Element, the prompt keeps saying **"Use Product Element A as the locked product reference"** and avoids re-describing the product creatively. The Element defines identity; the prompt defines motion, lighting, camera, and preservation.
