---
name: ejecutar-y-revisar
description: Usar para ejecutar una lista de pasos o un plan. Trabaja inline o con subagentes según el modo y revisa en proporción al riesgo. Use to execute a plan.
---

# Ejecutar y revisar

La meta es terminar el plan con calidad y sin gastar de más. La revisión se ajusta al riesgo: lo delicado se revisa a fondo, lo trivial se verifica y listo.

## Elegí cómo ejecutar

- **Inline (vos misma/o):** modo Normal, o Profundo con menos de 5 tareas, o cuando no hay subagentes disponibles.
- **Con subagentes:** modo Profundo con tareas independientes. Un subagente por tarea; las tareas paralelas pueden ir a la vez.

## Por cada tarea

1. Marcá la tarea "en curso" en el plan.
2. Si es código y `fases.tests_primero` está activo, seguí `tests-primero`.
3. Hacé el trabajo. Si algo del plan no cierra, pará y resolvelo antes de improvisar.
4. Verificá con `verificar` usando el "Hecho cuando…" de la tarea.
5. Revisá según el riesgo (tabla de abajo).
6. Marcá la tarea "completada" y anotá en una línea qué se hizo.

## Revisión según riesgo

| Riesgo | Revisión |
|---|---|
| Bajo | Solo verificación con evidencia. |
| Medio | Autorrevisión con la lista de `revision-de-codigo` (o la rúbrica de contenido) antes de seguir. |
| Alto | Revisor separado (subagente con contexto limpio) + corrección + nueva verificación. Máximo 2 vueltas; si sigue fallando, consultá a la persona. |

Si `fases.revision` dice `"siempre"` o `"nunca"`, respetalo.

## Al delegar a un subagente

Usá la plantilla `references/encargo-subagente.md`. Pasale solo lo que necesita: la tarea completa del plan, las rutas relevantes y las convenciones del proyecto. Pedile que termine con uno de estos estados: **HECHO**, **HECHO CON DUDAS**, **NECESITO CONTEXTO** o **BLOQUEADO**, y respondé a cada uno: revisar, aclarar dudas, dar el contexto o reorganizar la tarea.

## Presupuesto

Sumá el costo de cada tarea a la cuenta. Al 80 % del techo, frená y mostrá: qué falta, cuánto calculás y opciones.

Al terminar todas las tareas, pasá a `cerrar-trabajo`.
