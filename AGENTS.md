# Taller

Este repositorio es un pack de skills (`skills/<nombre>/SKILL.md`). Si tu herramienta no carga plugins, leé **solo** las skills de la fila que corresponde a tu pedido. Las demás quedan sin abrir: así el trabajo es más rápido.

En un **cambio chico** (un color, un typo, un texto, una palabra) no leas `taller-inicio`. Hacelo, buscá en todo el repo cada aparición del valor (por ejemplo con `rg`) y comprobá con `verificar`. Una sola skill, sin plan ni preguntas.

| Tipo de pedido | Leé estas skills (y nada más) |
|---|---|
| Cambio chico de código o texto | `verificar` |
| Ganchos | `taller-inicio`, `gancho-3-segundos` |
| Guion corto (con o sin ganchos) | `taller-inicio`, `gancho-3-segundos`, `guion-corto` |
| Storyboard, imágenes o portada | `taller-inicio`, `storyboard-y-portada` (+ `guion-corto` si no hay guion) |
| Calendario o plan de contenido | `taller-inicio`, `calendario-de-contenido` (+ `guion-corto` si pide un guion modelo) |
| Bug | `taller-inicio`, `causa-raiz`, `verificar`. Si la causa sigue en producción, el cierre es `Causa en producción: … ¿Querés que la saque?`. |
| Código nuevo | `taller-inicio`, `entender-pedido`, `tests-primero`, `verificar` |
| Trabajo grande (Profundo) | `taller-inicio`, `entender-pedido`, `plan-con-presupuesto`, `ejecutar-y-revisar`, `cerrar-trabajo` |
| Crear o mejorar una skill | `crear-skill` |

Abrí las carpetas `references/` o `examples/` solo cuando una skill te mande ahí y lo necesites. En pedidos de contenido no hace falta correr comandos, salvo un conteo rápido de palabras si tenés terminal. Configuración opcional: `taller.config.json` (ver `docs/configuracion.md`).

*This repo is a skill pack. If your tool doesn't load plugins, read only the skills in the row that matches the request (table above). For a small one-step change, read only `verificar` — not `taller-inicio`. Search the whole repo for every occurrence of the value before calling it done. Open `references/` or `examples/` only when needed. Content requests need no commands beyond an optional quick word count.*
