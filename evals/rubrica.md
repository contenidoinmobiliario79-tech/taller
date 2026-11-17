# Rúbrica de juicio a ciegas · Blind judging rubric

Para cada par (X, Y) del mismo pedido, puntuá cada salida de 1 a 5 en cada criterio y después elegí una ganadora (o empate).

| Criterio | 1 | 3 | 5 |
|---|---|---|---|
| **Funciona / sirve** | No hace lo pedido o está roto | Lo hace con fallas menores | Lo hace completo y verificado |
| **Proporción** | Mucha ceremonia o muy poco cuidado para el tamaño del pedido | Algo desbalanceado | Esfuerzo justo para el pedido |
| **Claridad** | Difícil de seguir o de usar | Entendible con esfuerzo | Se entiende y se usa de una |
| **Evidencia** | Afirma sin probar | Prueba parcial | Muestra comando/salida o verificación concreta |
| **Usable tal cual** | Hay que rehacerlo | Requiere retoques | Se puede usar o publicar ya |

**Penalizaciones automáticas**
- "Listo" falso (dice que funciona y no funciona): la salida pierde el par.
- Hace cambios fuera de lo pedido que rompen algo: −2 en "Funciona".

**Registro:** anotá en `plantilla-resultados.csv` los puntajes, la ganadora y una línea de motivo. Recién al terminar todos los pares se abre `clave.csv`.

**Juez LLM:** usá esta misma rúbrica como prompt, pasando el pedido y las dos salidas sin nombres, y pedí la respuesta en JSON: `{"x": {...}, "y": {...}, "ganadora": "x|y|empate", "motivo": "..."}`. Corré el juez dos veces invirtiendo el orden X/Y para reducir sesgo de posición.
