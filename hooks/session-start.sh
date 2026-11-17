#!/usr/bin/env bash
# Taller: hook opcional de inicio de sesión / optional session-start hook.
# Inyecta un ruteo corto. No pega taller-inicio: en un cambio chico no hace falta.
# Sin red, sin escribir archivos, sin telemetría. No network, no writes, no telemetry.
# Uso / usage: session-start.sh [claude|cursor|generic]
set -u

harness="${1:-claude}"

if [ "${TALLER_HOOK_OFF:-0}" = "1" ]; then
  printf '{}\n'
  exit 0
fi

text='Taller está instalado. No cargues taller-inicio de entrada.
- Cambio chico (un color, un typo, un texto): leé solo skills/verificar/SKILL.md.
- Cualquier otro pedido: leé skills/taller-inicio/SKILL.md y después solo las skills de la fila de AGENTS.md.'

# Escapado JSON propio: barra, comillas, saltos, tabs y retornos.
json_escape() {
  local s="$1"
  s="${s//\\/\\\\}"
  s="${s//\"/\\\"}"
  s="${s//$'\t'/\\t}"
  s="${s//$'\r'/}"
  s="${s//$'\n'/\\n}"
  printf '%s' "$s"
}

escaped="$(json_escape "$text")"

case "$harness" in
  cursor)
    printf '{"additional_context":"%s"}\n' "$escaped"
    ;;
  generic)
    printf '{"additionalContext":"%s"}\n' "$escaped"
    ;;
  *)
    printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$escaped"
    ;;
esac
