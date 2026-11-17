#!/usr/bin/env bash
# Crea un ZIP por skill para subir a Claude.ai (Customize > Skills).
# Creates one ZIP per skill for Claude.ai upload. Sin red.
# Usa `zip` si está instalado; si no, python3.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
out="$root/dist/claude-ai"
mkdir -p "$out"

make_zip() {
  local name="$1" target="$2"
  if command -v zip >/dev/null 2>&1; then
    zip -qr "$target" "$name"
  else
    python3 - "$name" "$target" <<'PY'
import os, sys, zipfile
src, target = sys.argv[1], sys.argv[2]
with zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED) as z:
    for base, _dirs, files in os.walk(src):
        for f in sorted(files):
            p = os.path.join(base, f)
            z.write(p, p)
PY
  fi
}

cd "$root/skills"
for dir in */; do
  name="${dir%/}"
  [ -f "$name/SKILL.md" ] || continue
  rm -f "$out/$name.zip"
  make_zip "$name" "$out/$name.zip"
  echo "OK  $out/$name.zip"
done
