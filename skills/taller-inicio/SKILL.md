---
name: taller-inicio
description: Usar al empezar un pedido que no sea un cambio chico de un paso (color, typo, un texto). Elige el modo Rápido, Normal o Profundo. Skip one-step typo or color tweaks.
---

# Taller · inicio

Antes de actuar, decidí cuánto trabajo merece el pedido. El objetivo es que una tarea chica se resuelva rápido y una grande se resuelva bien, sin ceremonia de más ni de menos.

## 1. Elegí el modo

| Modo | Cuándo | Camino |
|---|---|---|
| **Rápido** | Pedido claro, un solo paso, se revierte fácil (un color, un texto, una pregunta). | Hacerlo (buscando en todo el repo cada aparición del valor) → `verificar` → contar qué hiciste. Si `AGENTS.md` ya clasificó el pedido como cambio chico, no abras esta skill: alcanza con `verificar`. |
| **Normal** | Varios pasos o algo abierto, pero acotado a una tarde de trabajo. | `entender-pedido` (máx. 3 preguntas) → lista de pasos → `ejecutar-y-revisar` → `cerrar-trabajo`. En contenido: suponer lo que falte → escribir con las skills de la rama → verificar. |
| **Profundo** | Muchos archivos, decisiones de diseño, riesgo alto o varias horas. | `entender-pedido` → `plan-con-presupuesto` → `ejecutar-y-revisar` con subagentes → `cerrar-trabajo`. |

Si dudás entre dos modos, elegí el más liviano y subí de nivel cuando aparezca complejidad real. Si existe `taller.config.json`, respetá `modo_por_defecto` y `fases`.

## 2. Anunciá el modo (solo Normal y Profundo)

Ejemplo: "Modo Normal: lo resuelvo en 4 pasos, presupuesto estimado ~120k tokens." La persona puede cambiarlo con una palabra ("rápido", "profundo"). En modo Rápido no hace falta anunciar nada: hacelo y mostrá el resultado.

En cualquier modo, si el cambio deja algo vecino obviamente inconsistente (por ejemplo, el botón ahora es azul pero su hover sigue verde), ajustalo si es trivial y decilo en una línea, o mencionalo y preguntá.

## 3. Sumá la rama que corresponda

- Bug o comportamiento raro → `causa-raiz`.
- Código nuevo → `tests-primero` y, en Profundo, `rama-aislada`. Antes de integrar → `revision-de-codigo`.
- Video corto, Reels o TikTok → solo la que el pedido usa: ganchos → `gancho-3-segundos`; guion → `guion-corto`; tomas, imágenes o portada → `storyboard-y-portada`; semana o mes → `calendario-de-contenido`.
- Crear o mejorar una skill → `crear-skill`. Sesión cara o lenta → `diagnostico`.

## 4. Leé solo lo que el pedido necesita

- Abrí únicamente las skills de la rama que corresponde (la tabla de `AGENTS.md` dice cuáles). El resto queda sin leer. En un cambio chico, esa tabla pide solo `verificar`.
- Abrí `references/` o `examples/` solo cuando te falte un dato concreto.
- En contenido, el modo Normal se resuelve en una sola respuesta: sin comandos, sin archivos de plan y sin explorar carpetas. La única excepción útil es un conteo rápido de palabras si hay terminal.

## 5. Entregá lo pedido, en la cantidad pedida

- Si la persona dice un número (5 ganchos, 2 videos), entregá exactamente ese número.
- Si no lo dice, elegí una cantidad realista para alguien que recién empieza y explicala en una línea ("Supuse 3 videos por semana; si podés más, lo amplío").
- Sumá extras solo cuando aportan a lo pedido y son cortos. Una lista que nadie pidió alarga la respuesta y tapa lo importante.
- Mercado o país: usá el que diga la persona. Si no lo dice, escribí en un español neutro, con hashtags generales, y ofrecé adaptarlo a su país en una línea.

## 6. Cuidá el presupuesto

Llevá una cuenta aproximada (ver `references/modos.md`). Al llegar al 80 % del techo del modo, frená y preguntá antes de seguir.

Las indicaciones directas de la persona y sus archivos de proyecto (CLAUDE.md, AGENTS.md) tienen prioridad sobre estas skills. Respondé en el idioma de la persona.
