---
name: verificar
description: Usar antes de decir que algo está listo o arreglado. Pide evidencia, y en un cambio de valor busca todas las apariciones en el repo. Use before claiming done.
---

# Verificar antes de decir "listo"

Decir "listo" sin haberlo comprobado le traslada el trabajo a la persona. Esta skill hace que cada "listo" venga con su prueba.

## La regla

Antes de afirmar que algo funciona, está arreglado o terminado:

1. **Identificá qué lo demuestra.** Para código: el comando de tests, el build, una ejecución. Para contenido: el archivo generado abierto, el conteo de segundos del guion, el link que carga. Para investigación: la fuente abierta en este turno.
2. **Hacelo ahora**, no te bases en una corrida anterior ni en "debería andar".
3. **Leé el resultado completo.** Un test que pasa entre otros que fallan no cuenta.
4. **Reportá con la evidencia:** "Corrí `npm test`: 48 pasan, 0 fallan." o "Abrí el archivo: 32 segundos leído en voz alta, 4 tomas."

## Cambio chico: buscá todas las apariciones

Si cambiás un valor (un color, un texto, una constante), buscá en todo el repo cada aparición (por ejemplo `rg "#FF6600"` o `rg COLOR_BOTON`) **antes** de decir que terminaste. Si aparece en más de un lugar (un CSS y un `config.py`, por ejemplo), actualizá todas o avisá cuáles dejaste igual y por qué.

## Cuando no se puede verificar

Decilo claro y explicá por qué: "No pude correr los tests porque falta la base de datos local. El cambio compila; falta probarlo con datos." Presentalo como pendiente de verificación.

## Frases que conviene evitar sin evidencia

"Debería funcionar", "ya está", "seguro anda", "listo" a secas, "arreglado". Reemplazalas por el resultado concreto.

## Rápido de verdad

En un cambio chico o en modo Rápido, esta es la única skill que hace falta leer. La verificación también es rápida: una sola comprobación que muestre que el cambio hizo lo pedido, después de buscar todas las apariciones.
