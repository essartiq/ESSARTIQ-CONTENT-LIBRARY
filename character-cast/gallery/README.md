# Gallery

Placeholder gallery for example outputs. There are no images yet — this is the place to add them.

## Two ways to view on GitHub

**Front-page gallery (immediate).** The main `README.md` has a Gallery section using Markdown image tags. Add images to `gallery/images/` and they render on the repo home page. No setup.

**Full HTML page (GitHub Pages).** `gallery/index.html` is a styled gallery page. GitHub shows `.html` as source by default — to render it as a real page, enable **Settings → Pages**, deploy from your branch, and visit `https://USERNAME.github.io/character-cast/gallery/`.

## Adding an image

1. Generate the image in your image tool.
2. Save it into `gallery/images/` with a clear name (e.g. `5a-front.png`).
3. In `index.html`, replace the matching `<div class="placeholder">…</div>` with `<img src="images/5a-front.png" alt="5A front full body">`.
4. In the root `README.md` Gallery section, uncomment/point the image line at the same file.
