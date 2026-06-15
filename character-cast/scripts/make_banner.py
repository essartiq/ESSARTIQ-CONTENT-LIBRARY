#!/usr/bin/env python3
import random, math
from PIL import Image, ImageDraw, ImageFont, ImageFilter

random.seed(7)

W, H = 1600, 500
IMG_DIR = "/home/claude/character-cast/gallery/images"

# ---- charcoal base ----
base = Image.new("RGB", (W, H), (18, 19, 23))
px = base.load()
# subtle vertical gradient (slightly lighter top-center)
for y in range(H):
    for x in range(0, W, 1):
        pass
# faster gradient via draw
grad = Image.new("L", (1, H))
for y in range(H):
    t = y / H
    grad.putpixel((0, y), int(40 - 18 * t))
grad = grad.resize((W, H))
tint = Image.new("RGB", (W, H), (30, 32, 40))
base = Image.composite(tint, base, grad)

draw = ImageDraw.Draw(base)

# ---- starfield (right 2/3, fading toward where the title sits) ----
for _ in range(900):
    x = random.randint(0, W)
    y = random.randint(0, H)
    r = random.choice([0, 0, 0, 1, 1, 2])
    b = random.randint(80, 230)
    # twinkle bias: brighter, denser on the right and top
    if random.random() < (x / W) * 0.5 + 0.2:
        draw.ellipse([x - r, y - r, x + r, y + r], fill=(b, b, min(255, b + 15)))
# a few brighter stars with tiny glow
for _ in range(40):
    x = random.randint(int(W * 0.2), W)
    y = random.randint(0, H)
    draw.ellipse([x - 1, y - 1, x + 1, y + 1], fill=(245, 245, 255))

# ---- film grain ----
noise = Image.effect_noise((W, H), 22).convert("L")
grain = Image.merge("RGB", (noise, noise, noise))
base = Image.blend(base, grain, 0.06)
draw = ImageDraw.Draw(base)

# ---- image strip down the RIGHT edge ----
strip_files = ["2a-front.jpeg", "6b-warmth.jpeg", "5a-front.jpeg"]  # headshot, expression, full body
# tile sizes: two square headshot-ish + one tall full body
tile_w = 150
gap = 14
right_pad = 24
x0 = W - right_pad - tile_w
# layout: full body tall on far right, two stacked headshots to its left
def load_cover(path, tw, th):
    im = Image.open(path).convert("RGB")
    iw, ih = im.size
    scale = max(tw / iw, th / ih)
    im = im.resize((int(iw * scale), int(ih * scale)))
    iw, ih = im.size
    left = (iw - tw) // 2
    top = 0
    return im.crop((left, top, left + tw, top + th))

def rounded(im, rad=14):
    mask = Image.new("L", im.size, 0)
    md = ImageDraw.Draw(mask)
    md.rounded_rectangle([0, 0, im.size[0], im.size[1]], radius=rad, fill=255)
    out = Image.new("RGBA", im.size)
    out.paste(im, (0, 0))
    out.putalpha(mask)
    return out

# full body (tall) on far right
fb_w, fb_h = 168, H - 60
fb = rounded(load_cover(f"{IMG_DIR}/5a-front.jpeg", fb_w, fb_h))
fb_x = W - right_pad - fb_w
fb_y = (H - fb_h) // 2
base.paste(fb, (fb_x, fb_y), fb)

# two stacked headshots to the left of full body
hs_w = 168
hs_h = (fb_h - gap) // 2
for i, f in enumerate(["2a-front.jpeg", "6b-warmth.jpeg"]):
    hs = rounded(load_cover(f"{IMG_DIR}/{f}", hs_w, hs_h))
    hx = fb_x - gap - hs_w
    hy = fb_y + i * (hs_h + gap)
    base.paste(hs, (hx, hy), hs)

# subtle dark scrim behind images so stars don't clash at edges
# (already fine; skip)

# ---- title centered in the middle band (left of the image strip) ----
def font(sz, bold=True):
    p = "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf" if bold else "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"
    return ImageFont.truetype(p, sz)

title1 = "CHARACTER"
title2 = "FORGE"
f_title = font(96, True)
f_sub = font(26, False)

# center within the region to the LEFT of the image strip
region_left = 40
region_right = fb_x - gap - hs_w - 40
cx = (region_left + region_right) // 2

def draw_centered(text, fnt, cy, fill, tracking=8, glow=False):
    # measure with tracking
    widths = [draw.textlength(ch, font=fnt) for ch in text]
    total = sum(widths) + tracking * (len(text) - 1)
    x = cx - total / 2
    if glow:
        glow_img = Image.new("RGBA", (W, H), (0, 0, 0, 0))
        gd = ImageDraw.Draw(glow_img)
        gx = x
        for ch, w in zip(text, widths):
            gd.text((gx, cy), ch, font=fnt, fill=(120, 150, 255, 90))
            gx += w + tracking
        glow_img = glow_img.filter(ImageFilter.GaussianBlur(8))
        base.alpha_composite(glow_img) if base.mode == "RGBA" else base.paste(
            Image.alpha_composite(base.convert("RGBA"), glow_img).convert("RGB"), (0, 0))
    for ch, w in zip(text, widths):
        draw.text((x, cy), ch, font=fnt, fill=fill)
        x += w + tracking

draw_centered(title1, f_title, H // 2 - 110, (238, 240, 248), tracking=10)
draw_centered(title2, f_title, H // 2 - 6, (238, 240, 248), tracking=22)
# thin accent rule under title
rule_w = 240
draw.rectangle([cx - rule_w // 2, H // 2 + 104, cx + rule_w // 2, H // 2 + 107], fill=(122, 162, 247))
draw_centered("photoreal characters · every angle · locked likeness", f_sub, H // 2 + 124, (150, 160, 178), tracking=2)

base.save("/home/claude/character-cast/gallery/images/banner.png")
print("banner saved", base.size)
