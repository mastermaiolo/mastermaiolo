#!/usr/bin/env python3
"""
MAGGIO / SYSTEMS LAB — asset builder
Embeds ink artwork (base64 JPEG) into the hand-authored SVG templates
and expands data tokens (telemetry, sparklines) from data/*.json.

Run:  python3 scripts/build_assets.py
Output: assets/*.svg  (ready to commit)
"""
import base64, io, json, datetime, pathlib, sys
from PIL import Image

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from langbar import language_bar, spark_points

ROOT = pathlib.Path(__file__).resolve().parent.parent
TPL  = ROOT / "templates"
ART  = ROOT / "assets" / "art"
DATA = ROOT / "data"
OUT  = ROOT / "assets"

MONO = "ui-monospace,'SF Mono',Menlo,Consolas,monospace"

def data_uri(img: Image.Image, width: int, quality: int = 82) -> str:
    w, h = img.size
    if w > width:
        img = img.resize((width, round(h * width / w)), Image.LANCZOS)
    buf = io.BytesIO()
    img.convert("RGB").save(buf, "JPEG", quality=quality, optimize=True)
    return "data:image/jpeg;base64," + base64.b64encode(buf.getvalue()).decode()

def build_tokens():
    tokens = {}

    hero = Image.open(ART / "hero-ink.png")
    tokens["@@ART_HERO@@"] = data_uri(hero, 1400, 80)

    heishi = Image.open(ART / "heishi-art.png")
    tokens["@@ART_HEISHI@@"] = data_uri(heishi, 800, 80)

    plum = Image.open(ART / "plum-art.png")
    w, h = plum.size                       # crop pale paper border (~3.5%)
    cx, cy = int(w * 0.035), int(h * 0.05)
    plum = plum.crop((cx, cy, w - cx, h - cy))
    tokens["@@ART_PLUM@@"] = data_uri(plum, 1300, 80)

    # strip tile: crop dragon+eclipse region of hero art (right ~45%)
    w, h = hero.size
    crop = hero.crop((int(w * 0.52), int(h * 0.02), w, int(h * 0.98)))
    tokens["@@ART_STRIP@@"] = data_uri(crop, 720, 80)

    # card arts (ink series)
    for token, filename in [("@@ART_EYE@@", "card-eye.png"),
                            ("@@ART_RIPPLE@@", "card-ripples.png"),
                            ("@@ART_VESSEL@@", "card-vessel.png")]:
        tokens[token] = data_uri(Image.open(ART / filename), 1150, 80)

    # ---- live-ish data (seeded from data/*.json; the Action refreshes it) --
    stats = {"repos": 8, "langs": 12, "events": 28, "pushes": 15,
             "last": "2026-10-07"}
    spark90, spark14 = "0,50", "0,50"
    try:
        repos = json.load(open(DATA / "repos.json"))
        stats["repos"] = len([r for r in repos if not r.get("fork")])
        langs = json.load(open(DATA / "languages.json"))
        stats["langs"] = len(langs)
        ev = json.load(open(DATA / "events.json"))
        stats["events"] = len(ev)
        stats["pushes"] = sum(1 for e in ev if e["type"] == "PushEvent")
        pushes = [(e["created_at"][:10], len(e["payload"].get("commits", [])))
                  for e in ev if e["type"] == "PushEvent"]
        if pushes:
            stats["last"] = max(p[0] for p in pushes)
        now = datetime.datetime.now(datetime.timezone.utc)
        b90 = [0] * 18          # 18 buckets x 5 days = 90 days
        b14 = [0] * 14
        for e in ev:
            d = datetime.datetime.fromisoformat(e["created_at"].replace("Z", "+00:00"))
            age = (now - d).days
            if 0 <= age < 90: b90[17 - age // 5] += 1
            if 0 <= age < 14: b14[13 - age] += 1
        spark90 = spark_points(b90)
        spark14 = spark_points(b14, w=300, h=44)
    except FileNotFoundError:
        pass
    for k, v in stats.items():
        tokens[f"@@STAT_{k.upper()}@@"] = str(v)
    tokens["@@SPARK90@@"] = spark90
    tokens["@@SPARK14@@"] = spark14

    try:
        langs = json.load(open(DATA / "languages.json"))
    except FileNotFoundError:
        langs = {}
    bars, labels = language_bar(langs)
    tokens["@@LANG_BARS@@"] = bars
    tokens["@@LANG_LABELS@@"] = labels
    return tokens

def main():
    tokens = build_tokens()
    OUT.mkdir(exist_ok=True)
    for tpl in sorted(TPL.glob("*.tpl")):
        svg = tpl.read_text(encoding="utf-8")
        for k, v in tokens.items():
            svg = svg.replace(k, v)
        name = tpl.name[:-4]                      # strip .tpl
        (OUT / name).write_text(svg, encoding="utf-8")
        print(f"  assets/{name:<26} {(OUT/name).stat().st_size/1024:7.1f} KB")
    print("done.")

if __name__ == "__main__":
    main()
