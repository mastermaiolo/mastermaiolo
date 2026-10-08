"""Shared helper: renders the segmented languages bar as inline SVG groups.
Imported by build_assets.py (seed render) and generate_telemetry.py (Action refresh).
"""

PALETTE = ["#e8e6e2", "#a5a5ad", "#6b6b73", "#484850", "#33333a"]

def spark_points(counts, w=340, h=52, pad=2):
    """Normalize a list of ints into an SVG polyline point string."""
    mx = max(counts) or 1
    n = len(counts)
    pts = []
    for i, c in enumerate(counts):
        x = pad + i * (w - 2 * pad) / (n - 1)
        y = h - pad - (c / mx) * (h - 2 * pad - 6)
        pts.append(f"{x:.1f},{y:.1f}")
    return " ".join(pts)

def language_bar(langs: dict, x0: int = 40, x1: int = 1560,
                 y: int = 492, h: int = 10, gap: int = 4):
    """langs: {name: bytes}. Returns (bars_svg, labels_svg) with top-4 + OTHER."""
    if not langs:
        langs = {"Rust": 29, "Python": 28, "TypeScript": 24, "Shell": 5, "Other": 13}
    items = sorted(langs.items(), key=lambda kv: -kv[1])
    total = sum(v for _, v in items) or 1
    top = items[:4]
    other = sum(v for _, v in items[4:])
    segs = [(k, v) for k, v in top] + ([("Other", other)] if other else [])

    usable = (x1 - x0) - gap * (len(segs) - 1)
    widths = [max(8, round(usable * v / total)) for _, v in segs]
    widths[-1] += (x1 - x0) - gap * (len(segs) - 1) - sum(widths)  # absorb rounding

    bars, labels, x = [], [], x0
    for i, ((name, val), w) in enumerate(zip(segs, widths)):
        color = PALETTE[min(i, len(PALETTE) - 1)]
        bars.append(f'<rect x="{x}" y="{y}" width="{w}" height="{h}" fill="{color}"/>')
        pct = round(100 * val / total)
        upper = name.upper()
        if name == "Other":
            labels.append(f'<text x="{x1}" y="{y + 38}" text-anchor="end" fill="#55555d">{pct}% OTHER</text>')
        else:
            labels.append(f'<text x="{x}" y="{y + 38}" fill="{color}">{pct}% '
                          f'<tspan fill="#8a8a93">{upper}</tspan></text>')
        x += w + gap
    bars_svg = "  <g>\n    " + "\n    ".join(bars) + "\n  </g>"
    labels_svg = ('  <g font-size="12" letter-spacing="1.5">\n    '
                  + "\n    ".join(labels) + "\n  </g>")
    return bars_svg, labels_svg
