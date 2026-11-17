---
name: revision-de-codigo
description: Usar para pedir o recibir una revisión de código antes de integrar, o cuando llegan comentarios de revisión. Lista por severidad y respuesta técnica. Use for code review.
---

# Revisión de código

Una buena revisión encuentra problemas reales y los ordena por importancia. Una buena respuesta a la revisión verifica cada punto en lugar de aceptarlo o rechazarlo por reflejo.

## Para revisar (o pedir una revisión)

1. Juntá el contexto: qué se pidió, el plan o la tarea, y el diff (`git diff <base>...HEAD`).
2. Recorré la lista de `references/lista-revision.md`.
3. Devolvé los hallazgos agrupados por severidad:
   - **Bloqueante:** rompe algo, inseguro, pierde datos o no cumple lo pedido.
   - **Importante:** bug probable, falta un test clave, diseño que va a doler pronto.
   - **Menor:** estilo, nombres, pequeñas mejoras.
4. Cada hallazgo con archivo y línea, por qué es un problema y una sugerencia concreta.
5. Cerrá con un veredicto: **listo para integrar**, **listo con cambios menores** o **necesita cambios**.

Si hay subagentes, un revisor con contexto limpio ve cosas que quien escribió el código no ve.

## Para recibir una revisión

1. Leé todos los comentarios antes de cambiar nada.
2. Para cada uno, comprobá si es correcto: mirá el código, corré un test, buscá el caso que menciona.
3. Si es correcto, arreglalo. Si no lo es, respondé con la razón técnica y la evidencia. Si no está claro, preguntá.
4. Evitá el acuerdo automático ("¡Excelente punto!") y la defensa automática. Lo que cuenta es el código.
5. Volvé a verificar todo con `verificar` y contá qué cambiaste y qué no, con su porqué.
