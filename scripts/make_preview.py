#!/usr/bin/env python3
"""Renders the final SVG assets into one long preview page (like a profile screenshot)."""
import cairosvg, io, pathlib
from PIL import Image

ROOT = pathlib.Path(__file__).resolve().parent.parent
A = ROOT / "assets"
W = 1600          # simulated README content width
BG = (13, 17, 23)  # github dark #0d1117

def render(name, width):
    svg = (A / name).read_text(encoding="utf-8")
    # preview-only: pin CJK to a locally installed family (cairosvg has no glyph fallback)
    svg = svg.replace("'Songti SC','Noto Serif CJK SC','Source Han Serif SC',STSong",
                      "'Noto Serif CJK SC','Noto Sans CJK SC'")
    
    png = cairosvg.svg2png(bytestring=svg.encode(), output_width=width, background_color="#0d1117")
    return Image.open(io.BytesIO(png)).convert("RGB")

rows, gap = [], 18
def row(imgs, widths):
    rs = [render(n, w) for n, w in zip(imgs, widths)]
    rows.append(rs)

row(["hero.svg"], [W])
row(["section-systems.svg"], [W])
row(["card-hyprvision.svg", "card-hyprai.svg"], [(W-gap)//2]*2)
row(["card-vinho.svg", "card-heishi.svg"], [(W-gap)//2]*2)
row(["panel-philosophy.svg", "panel-signal.svg"], [round(W*0.641), round(W*0.341)])
row(["panel-telemetry.svg"], [W])
row(["strip-visuals.svg"], [W])
row(["footer.svg"], [W])

H = sum(max(i.height for i in r) + gap for r in rows) + gap
page = Image.new("RGB", (W + 2*gap, H), BG)
y = gap
for r in rows:
    x = gap
    h = 0
    for im in r:
        page.paste(im, (x, y)); x += im.width + gap; h = max(h, im.height)
    y += h + gap
page.save(ROOT / "preview-page.png", optimize=True)
print("preview-page.png", page.size, f"{(ROOT/'preview-page.png').stat().st_size/1024:.0f} KB")
