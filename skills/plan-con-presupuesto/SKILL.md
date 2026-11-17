---
name: plan-con-presupuesto
description: Usar en modo Profundo cuando ya hay acuerdo sobre qué construir. Arma un plan por tareas con criterio de hecho, costo estimado y puntos de control. Use to write a plan.
---

# Plan con presupuesto

Un buen plan permite que cualquier agente, incluso uno sin contexto, ejecute cada tarea sin adivinar. Además dice cuánto va a costar, para que la persona decida con información.

## Dónde guardarlo

En `docs/taller/planes/AAAA-MM-DD-<tema>.md` (o en `carpeta_planes` de `taller.config.json`). Usá la plantilla de `references/plantilla-plan.md`.

## Qué lleva cada tarea

Cada tarea se encabeza con `## Tarea N: <título>` (también se acepta `Task N`) y contiene:

1. **Objetivo** en una oración.
2. **Archivos** que crea o modifica, con rutas exactas.
3. **Pasos** concretos y cortos. Si hay código, incluí las firmas o fragmentos clave; si hay contenido, el formato exacto de salida.
4. **Hecho cuando…**: criterios verificables (un comando y su resultado esperado, una lista de chequeo).
5. **Costo estimado** en tokens, usando `references/estimar-tokens.md`.
6. **Riesgo**: bajo, medio o alto. Define si la tarea lleva revisión (ver `ejecutar-y-revisar`).

## Reglas de buen plan

- Tareas de 15 a 45 minutos de trabajo. Si una es más grande, dividila.
- Ordená por dependencias y marcá cuáles pueden ir en paralelo.
- Incluí solo lo acordado. Las ideas extra van en una sección "Para después".
- Agregá un **punto de control humano** después de las tareas de riesgo alto o al llegar a la mitad.

## Antes de ejecutar

Mostrá a la persona un resumen: número de tareas, costo total estimado, tiempo aproximado y puntos de control. Si el costo supera el presupuesto del modo, proponé recortes concretos. Con el "ok", pasá a `ejecutar-y-revisar`.
