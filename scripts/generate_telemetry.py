#!/usr/bin/env python3
"""
MAGGIO / SYSTEMS LAB — telemetry refresh (runs in GitHub Actions; works locally too)

Fetches your own public GitHub data (no third-party widgets) and rewrites:
  assets/panel-telemetry.svg   (numbers, 90-day sparkline, languages bar)
  assets/panel-signal.svg      (14-day sparkline)

Env:
  GITHUB_TOKEN  — provided automatically in Actions; optional locally
  PROFILE_USER  — default: GITHUB_REPOSITORY_OWNER or "mastermaiolo"

Stdlib only.
"""
import json, os, sys, datetime, pathlib, urllib.request

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from langbar import language_bar, spark_points   # stdlib-only module

ROOT = pathlib.Path(__file__).resolve().parent.parent
USER = os.environ.get("PROFILE_USER") or os.environ.get("GITHUB_REPOSITORY_OWNER") or "mastermaiolo"
TOKEN = os.environ.get("GITHUB_TOKEN")

def gh(url):
    req = urllib.request.Request(url, headers={
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28",
        "User-Agent": "maggio-profile-telemetry",
        **({"Authorization": f"Bearer {TOKEN}"} if TOKEN else {}),
    })
    with urllib.request.urlopen(req, timeout=30) as r:
        return json.load(r)

def spark(counts, w, h):
    return spark_points(counts, w=w, h=h)

def main():
    repos = gh(f"https://api.github.com/users/{USER}/repos?per_page=100&sort=pushed")
    events = gh(f"https://api.github.com/users/{USER}/events/public?per_page=100")

    langs: dict = {}
    for r in repos:
        for k, v in gh(r["url"] + "/languages").items():
            langs[k] = langs.get(k, 0) + v

    pushes = sum(1 for e in events if e["type"] == "PushEvent")
    push_dates = [e["created_at"][:10] for e in events if e["type"] == "PushEvent"]
    last = max(push_dates) if push_dates else "—"

    now = datetime.datetime.now(datetime.timezone.utc)
    b90, b14 = [0] * 18, [0] * 14
    for e in events:
        d = datetime.datetime.fromisoformat(e["created_at"].replace("Z", "+00:00"))
        age = (now - d).days
        if 0 <= age < 90: b90[17 - age // 5] += 1
        if 0 <= age < 14: b14[13 - age] += 1

    tokens = {
        "@@STAT_REPOS@@": str(len([r for r in repos if not r.get("fork")])),
        "@@STAT_LANGS@@": str(len(langs)),
        "@@STAT_PUSHES@@": str(pushes),
        "@@STAT_LAST@@": last,
        "@@SPARK90@@": spark(b90, 340, 52),
        "@@SPARK14@@": spark(b14, 300, 44),
        "@@LANG_BARS@@": "",
        "@@LANG_LABELS@@": "",
    }
    tokens["@@LANG_BARS@@"], tokens["@@LANG_LABELS@@"] = language_bar(langs)

    for tpl_name, out_name in [
        ("panel-telemetry.svg.tpl", "panel-telemetry.svg"),
        ("panel-signal.svg.tpl", "panel-signal.svg"),
    ]:
        svg = (ROOT / "templates" / tpl_name).read_text(encoding="utf-8")
        for k, v in tokens.items():
            svg = svg.replace(k, v)
        (ROOT / "assets" / out_name).write_text(svg, encoding="utf-8")
        print("refreshed assets/" + out_name)

if __name__ == "__main__":
    main()
