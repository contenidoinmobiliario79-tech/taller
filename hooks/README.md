# Hooks opcionales · Optional hooks

Por defecto **Taller no instala ningún hook**: las skills se activan por su descripción y no suman tokens fijos a cada sesión. Si querés un recordatorio al empezar, activá el hook de tu herramienta.

*By default Taller installs no hooks. Enable one only if you want a short routing reminder at session start.*

Los archivos se llaman `claude-hooks.json` y `cursor-hooks.json` (no `hooks.json`) justamente para que ninguna herramienta los cargue sola.

| Herramienta | Cómo activarlo |
|---|---|
| Claude Code (macOS/Linux) | Agregá `"hooks": "./hooks/claude-hooks.json"` a `.claude-plugin/plugin.json`. |
| Claude Code (Windows sin Git Bash) | Usá `"hooks": "./hooks/claude-hooks.windows.json"`. |
| Cursor | Agregá `"hooks": "./hooks/cursor-hooks.json"` a `.cursor-plugin/plugin.json`. |
| Codex | Codex solo ejecuta hooks en plugins instalados manualmente en la app de escritorio; no hace falta para usar las skills. |

Para apagarlo sin desinstalar: `TALLER_HOOK_OFF=1`.

**Qué hacen los scripts:** imprimen un ruteo corto en JSON: en un cambio chico, leé solo `verificar`; en cualquier otro pedido, leé `taller-inicio` y la fila de `AGENTS.md`. No pegan el texto de `taller-inicio`, no usan la red, no escriben archivos y no envían datos a nadie. Podés comprobarlo leyendo `session-start.sh` y `session-start.ps1` (menos de 70 líneas cada uno).
