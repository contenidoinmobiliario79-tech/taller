---
name: storyboard-y-portada
description: Usar cuando hay un guion corto y hace falta storyboard por tomas, prompts de imagen por toma y una portada. Use for storyboards, shot lists and cover prompts.
---

# Storyboard y portada

Convierte un guion en una lista de tomas que se puede grabar o generar con IA, y propone una portada que invite a tocar.

## 1. Ficha de personaje (antes de cualquier toma)

Para que la protagonista sea la misma persona en todas las imágenes, escribí una ficha corta y fija, de una sola línea por personaje:

`Personaje A: mujer de 32 años, pelo castaño oscuro lacio hasta los hombros, piel trigueña, ojos marrones, blusa blanca y blazer azul marino.`

- Incluí siempre: edad, pelo (color, largo, peinado), piel, rasgo distintivo y ropa.
- Copiá esa línea **palabra por palabra** dentro de cada prompt de imagen donde aparece el personaje, incluida la portada. Sin sinónimos ni resúmenes: la herramienta de imagen solo mantiene la cara si recibe la misma descripción.
- Si la ropa cambia en el relato, escribí una ficha nueva ("Personaje A, look 2") y usala igual de fija desde ahí.
- Si la herramienta acepta imagen de referencia o "seed", sugerí generar primero un retrato con la ficha y usarlo de referencia en las demás tomas.

## 2. Ficha de estilo

Paleta, luz, lugar y formato vertical 9:16. También se repite igual en cada prompt.

## 3. Tomas

Una toma por cambio de imagen; para 30 s suelen ser 5 a 10. Para cada una: número, tiempo, encuadre (general, medio, detalle), movimiento de cámara, qué se ve, texto en pantalla y un **prompt de imagen** listo para pegar con esta estructura (detalles en `references/prompts-imagen.md`):

`[ficha de personaje textual], [acción], [lugar], [ficha de estilo], [encuadre], formato vertical 9:16`

## 4. Portada

3 opciones con imagen, texto (máx. 4 palabras, legible en miniatura, con vocabulario como «capítulo» o «serie» en lugar de «historia») y prompt (con la ficha de personaje textual). Recomendá una y explicá por qué.

## Cuidados

Evitá pedir imágenes de personas reales identificables sin su permiso, logos de marcas ajenas y texto largo dentro de la imagen (se agrega después en edición).

## Salida

Ficha de personaje + ficha de estilo + tabla de tomas + 3 portadas. Antes de entregar, revisá que la línea de la ficha aparezca idéntica en cada prompt donde está el personaje. Si la persona usa una herramienta de imagen concreta, adaptá el formato del prompt a esa herramienta.
