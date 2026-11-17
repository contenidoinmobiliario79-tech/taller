---
name: rama-aislada
description: Usar en modo Profundo antes de tocar código en un repo git. Crea una rama o worktree aislado para no mezclar trabajo. Use to isolate work in a branch or worktree.
---

# Rama aislada

Trabajar en un espacio aparte protege el trabajo en curso de la persona y permite descartar todo si el camino no sirve.

## Pasos

1. **Mirá el estado.** `git status`. Si hay cambios sin guardar que no son tuyos, preguntá antes de seguir.
2. **Elegí el aislamiento:**
   - Tu herramienta tiene worktrees o sandboxes nativos → usalos.
   - Trabajo largo o en paralelo con otros agentes → `git worktree add ../<repo>-<tema> -b taller/<tema>`.
   - Trabajo corto → `git switch -c taller/<tema>`.
3. **Prepará el entorno.** Instalá dependencias si el worktree es nuevo y corré los tests una vez para conocer el punto de partida. Si ya había tests fallando, anotalos: no son tuyos.
4. **Trabajá ahí.** Todo cambio va a esa rama.
5. **Al cerrar,** `cerrar-trabajo` ofrece integrar o descartar. Para borrar un worktree: `git worktree remove <ruta>`, solo con el ok de la persona.

## Windows

Los mismos comandos funcionan en PowerShell. Usá rutas con `\` o entre comillas, por ejemplo: `git worktree add "..\mi-repo-login" -b taller/login`.

## Cuándo no hace falta

Modo Rápido, repos sin git, o si la persona pide trabajar directo en la rama actual (`fases.rama_aislada: false`).
