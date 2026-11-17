---
name: diagnostico
description: Usar cuando una sesión salió cara, lenta o rara, o una skill no se activó. Explica qué pasó y qué ajustar en la config. Use to diagnose a costly or slow session.
---

# Diagnóstico de sesión

Cuando algo salió mal, lo útil es saber por qué y qué cambiar para la próxima, no solo pedir disculpas.

## 1. Juntá datos

- Qué pidió la persona y qué modo se eligió.
- Qué skills se usaron y en qué orden.
- Consumo estimado o real, por fase si se puede.
- Momentos donde se repitió trabajo, se releyeron archivos grandes o se lanzaron subagentes.

## 2. Buscá patrones

| Síntoma | Causa frecuente | Ajuste |
|---|---|---|
| Muy caro para algo chico | Modo demasiado alto | Bajar `modo_por_defecto` o decir "rápido" |
| Muchas preguntas | `entender-pedido` en un pedido ya claro | `fases.entender_pedido: false` |
| Revisiones en bucle | Plan ambiguo | Mejorar "Hecho cuando…" de las tareas |
| Releyó los mismos archivos | Falta de resumen entre tareas | Pasar contexto mínimo en el encargo |
| Una skill no se activó | Descripción que no menciona la situación | Ajustar `description` con `crear-skill` |
| Dijo "listo" y no andaba | Se salteó la verificación | Revisar `verificar` |

## 3. Informá

En 5 líneas o menos: qué pasó, la causa más probable con su evidencia, el ajuste recomendado (con el cambio exacto en `taller.config.json` si aplica) y cuánto se habría ahorrado.

## Privacidad

El diagnóstico queda en la conversación o en un archivo local. Compartirlo fuera (por ejemplo, abrir un issue) se hace solo si la persona lo pide, y antes se quitan rutas, nombres y datos privados.
