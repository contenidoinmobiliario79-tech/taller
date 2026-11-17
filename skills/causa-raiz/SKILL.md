---
name: causa-raiz
description: Usar ante un bug o test que falla. Reproduce, aísla y confirma. Si la causa sigue en producción, cerrá con: Causa en producción: … ¿Querés que la saque? Use for debugging.
---

# Causa raíz

Arreglar un síntoma suele crear otro bug. Esta skill encuentra por qué pasa antes de tocar nada.

Si la causa sigue en el código de producción, el mensaje final lleva **exactamente** esta línea (completá el corchete):

`Causa en producción: [qué es]. ¿Querés que la saque?`

Sin esa pregunta el trabajo no está cerrado. El arreglo de tests no reemplaza esta línea.

## 1. Reproducí

Conseguí una forma confiable de ver el fallo: un comando, un test, pasos exactos. Anotá qué esperabas y qué pasó. Si no se reproduce siempre, anotá cada cuánto falla y en qué condiciones.

## 2. Juntá pistas

- Leé el mensaje de error completo y la traza.
- Mirá qué cambió hace poco (`git log`, `git diff`, dependencias actualizadas).
- Buscá un caso parecido que sí funcione y compará.

## 3. Formulá hipótesis

Escribí 1 a 3 hipótesis concretas, de la más probable a la menos. Para cada una: qué observación la confirmaría y cuál la descartaría.

## 4. Probá de a una

Hacé el experimento más barato que distinga entre hipótesis: un log, un print, un test mínimo, cortar el caso por la mitad. Cambiá **una sola cosa** por vez. Si después de 3 intentos ninguna hipótesis se confirma, volvé al paso 2 con lo aprendido o consultá a la persona.

## 5. Arreglá la causa

- Escribí primero un test que falle por el bug (ver `tests-primero`).
- Arreglá donde nace el problema, no donde se nota.
- Si la causa es estado global o compartido, aislar los tests (una fixture) evita que fallen según el orden. Eso no quita la causa en el código de producción. No cierres sin la línea del paso 6.
- Si el arreglo de test sirve para tests futuros, ponelo en un lugar reutilizable (`conftest.py` en pytest, o el equivalente del proyecto), no solo en un archivo de test.
- Verificá con `verificar` y corré los tests relacionados.

## 6. Contalo

En 3 líneas: causa, arreglo y cómo se evita que vuelva.

Si la causa sigue en el código de producción (estado global, recurso compartido, etc.), el mensaje final incluye esta línea, con esta forma:

`Causa en producción: [qué es]. ¿Querés que la saque?`

Sin esa pregunta el trabajo no está cerrado. No hagas el cambio de diseño hasta tener el ok. Técnicas extra en `references/tecnicas.md`.
