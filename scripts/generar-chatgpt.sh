#!/usr/bin/env bash
# Genera dist/taller-chatgpt.md (versión para pegar en ChatGPT o Claude) desde
# docs/taller-chatgpt.fuente.md, con la versión de .claude-plugin/plugin.json.
# Builds the paste-as-text file. Sin red. Límite: 7500 caracteres.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
python3 - <<'PY'
import json, sys
version = json.load(open(".claude-plugin/plugin.json", encoding="utf-8"))["version"]
text = open("docs/taller-chatgpt.fuente.md", encoding="utf-8").read().replace("{{VERSION}}", version)
limit = 7500
if len(text) > limit:
    sys.exit(f"ERROR: {len(text)} caracteres (máx. {limit})")
import os
os.makedirs("dist", exist_ok=True)
with open("dist/taller-chatgpt.md", "w", encoding="utf-8", newline="\n") as f:
    f.write(text)
print(f"OK  dist/taller-chatgpt.md · {len(text)} caracteres · v{version}")
PY
