#!/usr/bin/env bash
# Validación estructural del pack Taller / Structural checks. Sin red, cero tokens.
# Requiere bash y python3. Uso: tests/validar.sh
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

python3 - <<'PY'
import json, os, re, sys, glob

root = os.getcwd()
errors, warnings = [], []

def err(m): errors.append(m)
def warn(m): warnings.append(m)

# 1. Manifiestos JSON
for path in [".claude-plugin/plugin.json", ".claude-plugin/marketplace.json",
             ".codex-plugin/plugin.json", ".cursor-plugin/plugin.json",
             ".agents/plugins/marketplace.json", "taller.config.example.json",
             "hooks/claude-hooks.json", "hooks/claude-hooks.windows.json",
             "hooks/cursor-hooks.json"]:
    try:
        with open(path, encoding="utf-8") as f:
            json.load(f)
    except Exception as e:
        err(f"JSON inválido en {path}: {e}")

versions = set()
for path in [".claude-plugin/plugin.json", ".codex-plugin/plugin.json", ".cursor-plugin/plugin.json"]:
    try:
        versions.add(json.load(open(path, encoding="utf-8")).get("version"))
    except Exception:
        pass
if len(versions) > 1:
    err(f"Versiones distintas entre manifiestos: {versions}")

# 2. Skills
name_re = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")
pressure = re.compile(r"\b(MUST|NEVER|ALWAYS|CRITICAL)\b|EXTREMELY_IMPORTANT|<IMPORTANT>")
skills = sorted(glob.glob("skills/*/SKILL.md"))
if not skills:
    err("No se encontraron skills")
for sk in skills:
    folder = os.path.basename(os.path.dirname(sk))
    text = open(sk, encoding="utf-8").read()
    m = re.match(r"^---\n(.*?)\n---\n", text, re.S)
    if not m:
        err(f"{sk}: falta frontmatter"); continue
    fm = {}
    try:
        import yaml
        fm = yaml.safe_load(m.group(1)) or {}
    except ImportError:
        for line in m.group(1).splitlines():
            k, _, v = line.partition(":")
            fm[k.strip()] = v.strip()
    except Exception as e:
        err(f"{sk}: frontmatter no parsea: {e}"); continue
    extra = set(fm) - {"name", "description", "license", "metadata", "allowed-tools"}
    if extra:
        warn(f"{sk}: claves extra en frontmatter {extra}")
    name, desc = fm.get("name", ""), fm.get("description", "")
    if name != folder:
        err(f"{sk}: name '{name}' distinto de la carpeta '{folder}'")
    if not name_re.match(str(name)) or len(str(name)) > 64:
        err(f"{sk}: name inválido")
    if not desc:
        err(f"{sk}: falta description")
    elif len(desc) > 200:
        err(f"{sk}: description de {len(desc)} caracteres (máx. 200 para Claude.ai)")
    if len(text.encode("utf-8")) > 8192:
        err(f"{sk}: SKILL.md supera 8 KB")
    if pressure.search(text):
        err(f"{sk}: lenguaje de presión encontrado")
    for ref in re.findall(r"`((?:references|examples)/[^`]+)`", text):
        if not os.path.exists(os.path.join(os.path.dirname(sk), ref)):
            err(f"{sk}: referencia rota {ref}")
    if not os.path.exists(f"evals/skills/{folder}.md"):
        err(f"{sk}: falta evals/skills/{folder}.md")

# 3. Hooks y scripts sin red
net = re.compile(r"\b(curl|wget|Invoke-WebRequest|Invoke-RestMethod|iwr|irm|nc|ssh|scp|http\.get|fetch\()|https?://", re.I)
for path in glob.glob("hooks/*.sh") + glob.glob("hooks/*.ps1") + glob.glob("evals/scripts/*") + glob.glob("scripts/*"):
    if not os.path.isfile(path):
        continue
    for i, line in enumerate(open(path, encoding="utf-8"), 1):
        if line.lstrip().startswith("#"):
            continue
        if net.search(line):
            err(f"{path}:{i}: posible llamada de red")

# 4. Versión igual en manifiestos, READMEs y CHANGELOG
import subprocess
ver = next(iter(versions)) if len(versions) == 1 else None
if ver:
    for path in ["README.md", "README.en.md"]:
        if f"v{ver}" not in open(path, encoding="utf-8").read():
            err(f"{path}: no menciona v{ver}")
    first = re.search(r"^## (\S+)", open("CHANGELOG.md", encoding="utf-8").read(), re.M)
    if not first or first.group(1) != ver:
        err(f"CHANGELOG.md: la última entrada no es {ver}")

# 5. AGENTS.md solo nombra skills que existen
existing = {os.path.basename(os.path.dirname(s)) for s in skills}
agents = open("AGENTS.md", encoding="utf-8").read()
for ref in re.findall(r"`([a-z0-9-]+)`", agents):
    if ref in existing:
        continue
    if "-" in ref:
        err(f"AGENTS.md: skill inexistente {ref}")
# Un cambio chico carga como máximo una skill, verificar, y no taller-inicio
row = re.search(r"\|\s*Cambio chico[^|]*\|\s*([^|]+)\|", agents)
if not row:
    err("AGENTS.md: falta la fila de cambio chico")
else:
    names = re.findall(r"`([a-z0-9-]+)`", row.group(1))
    if names != ["verificar"]:
        err(f"AGENTS.md: un cambio chico debe cargar solo verificar, no {names}")
if re.search(r"leé `skills/taller-inicio/SKILL.md` y después", agents, re.I):
    err("AGENTS.md: no debe pedir taller-inicio en todos los pedidos")

# 6. Archivo para pegar en ChatGPT/Claude: existe, al día y bajo 7500 caracteres
paste = "dist/taller-chatgpt.md"
if not os.path.exists(paste):
    err(f"falta {paste} (correr scripts/generar-chatgpt.sh)")
else:
    ptext = open(paste, encoding="utf-8").read()
    src = open("docs/taller-chatgpt.fuente.md", encoding="utf-8").read().replace("{{VERSION}}", str(ver))
    if ptext != src:
        err(f"{paste} desactualizado (correr scripts/generar-chatgpt.sh)")
    if len(ptext) > 7500:
        err(f"{paste}: {len(ptext)} caracteres (máx. 7500)")
    for needed in ["Personaje A:", "3 piezas por semana", "un gancho por pieza", "÷ 2,5", "Texto en pantalla | Toma | Sonido", "Si me decís tu país", "#MicroDrama"]:
        if needed.lower() not in ptext.lower():
            err(f"{paste}: falta la regla '{needed}'")
    if pressure.search(ptext):
        err(f"{paste}: lenguaje de presión encontrado")

# 7. Regresiones: las respuestas buenas pasan y las malas fallan
for caso in ["calendario", "ganchos", "storyboard", "guion", "causa", "modulo", "buscar", "cambio-chico", "csv"]:
    for tipo, esperado in [("bueno", 0), ("malo", 1)]:
        f = f"evals/regresiones/casos/{tipo}-{caso}.md"
        if not os.path.exists(f):
            err(f"falta {f}"); continue
        r = subprocess.run([sys.executable, "evals/scripts/revisar-respuesta.py", caso, f], capture_output=True, text=True)
        if r.returncode != esperado:
            err(f"regresión {caso}: {f} debía {'pasar' if esperado == 0 else 'fallar'}\n{r.stdout}")

# 8. Ritmo único de 2,5 palabras/s para guiones en español
ritmo = re.compile(r"÷\s*2[,.]2\b|2[,.]2\s*(palabras|si es|dram|como segundo)", re.I)
for path in glob.glob("skills/**/*.md", recursive=True) + glob.glob("docs/*.md") + glob.glob("evals/skills/*.md") + glob.glob("evals/prompts/*.md") + ["AGENTS.md", "dist/taller-chatgpt.md", "README.md", "README.en.md"]:
    if os.path.exists(path) and ritmo.search(open(path, encoding="utf-8").read()):
        err(f"{path}: ritmo distinto de 2,5 palabras/s")

# 9. Presentación lista para publicar: archivos, logo válido y links locales
import xml.etree.ElementTree as ET
for path in ["CONTRIBUTING.md", "docs/instalacion.md", "assets/taller-banner.svg", "assets/taller-logo.svg",
             "extras/ci/validar.yml", ".github/ISSUE_TEMPLATE/config.yml"]:
    if not os.path.exists(path):
        err(f"falta {path}")
for svg in glob.glob("assets/*.svg"):
    try:
        ET.parse(svg)
    except Exception as e:
        err(f"{svg}: SVG inválido: {e}")
for path in ["README.md", "README.en.md", "docs/instalacion.md", "CONTRIBUTING.md"]:
    if not os.path.exists(path):
        continue
    base = os.path.dirname(path)
    for link in re.findall(r"\]\(([^)#\s]+)", open(path, encoding="utf-8").read()) + re.findall(r'src="([^"]+)"', open(path, encoding="utf-8").read()):
        if link.startswith(("http", "mailto:")):
            continue
        if not os.path.exists(os.path.normpath(os.path.join(base, link))):
            err(f"{path}: link roto {link}")

# 10. Reglas v1.3 presentes y el nombre largo de skill ya no se usa
checks = {
    "skills/causa-raiz/SKILL.md": [r"conftest", r"Causa en producci[oó]n", r"Quer[eé]s que la saque"],
    "skills/tests-primero/SKILL.md": [r"m[oó]dulo", r"traceback|mensaje", r"utf-8-sig", r"README"],
    "skills/verificar/SKILL.md": [r"\brg\b", r"todas las apariciones|todo el repo"],
    "docs/instalacion.md": [r"\.agents/skills", r"CODEX_HOME|~/.codex/skills|~/.agents/skills"],
}
for path, pats in checks.items():
    text = open(path, encoding="utf-8").read() if os.path.exists(path) else ""
    if not text:
        err(f"falta {path}"); continue
    for pat in pats:
        if not re.search(pat, text, re.I):
            err(f"{path}: falta la regla v1.3 /{pat}/")
# El nombre largo no debe quedar como skill vigente (sí puede aparecer en el changelog)
for dirpath, _dirs, files in os.walk("."):
    if "/.git" in dirpath.replace("\\", "/") or dirpath.replace("\\", "/").startswith("./.git"):
        continue
    for fn in files:
        path = os.path.join(dirpath, fn)[2:] if os.path.join(dirpath, fn).startswith("./") else os.path.join(dirpath, fn)
        if path in ("CHANGELOG.md", "tests/validar.sh") or path.startswith("evals/resultados"):
            continue
        if not path.endswith((".md", ".jsonl", ".sh", ".py", ".ps1", ".yml", ".json", ".txt")):
            continue
        try:
            body = open(path, encoding="utf-8").read()
        except (UnicodeDecodeError, IsADirectoryError):
            continue
        nombre_largo = "probar-antes-de-" + "decir-listo"
        if nombre_largo in body:
            err(f"{path}: queda el nombre largo {nombre_largo} (renombrado a verificar)")

for w in warnings: print("AVISO:", w)
for e in errors: print("ERROR:", e)
print(f"Skills: {len(skills)} · Errores: {len(errors)} · Avisos: {len(warnings)}")
sys.exit(1 if errors else 0)
PY
