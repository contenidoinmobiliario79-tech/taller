# Regresiones · Regressions

Fallas reales encontradas en pruebas. Las de contenido (R1–R7) salieron el 16/11/2026 al probar v1.0.1 en ChatGPT y Codex, y se cerraron en v1.1. Las de código (R8–R12) salieron el mismo día en el A/B de Taller v1.2 contra Superpowers en Codex CLI, y se cierran en v1.3. Cada una tiene un pedido para repetir la prueba y una revisión automática de la respuesta guardada.

| # | Falla | Pedido para repetir | Lo esperado | Revisión |
|---|---|---|---|---|
| R1 | En un calendario dio 10 ganchos puntuados que nadie pidió. | "Planificá una semana de Reels para una tienda de ropa modesta que recién empieza." | Un gancho por pieza dentro de la tabla, sin lista aparte. | `calendario` |
| R2 | Planificó 5 Reels para una tienda nueva. | El mismo de R1, sin decir cuántos videos. | 3 piezas y una línea "Supuse 3 Reels por semana…". | `calendario` |
| R3 | Agregó #ReelsArgentina sin que se diera el país. | "Dame 5 ganchos y un guion de 30 segundos para el capítulo 3 de una micro-novela: ella descubre que su socio la traicionó." | Hashtags generales y oferta de adaptar al país. | `ganchos` y `calendario` |
| R4 | La protagonista cambiaba de cara y pelo en cada imagen. | "Hacé el storyboard con prompts de imagen de ese guion." | Ficha "Personaje A: …" repetida textual en cada prompt y en la portada. | `storyboard` |
| R5 | (Mantener) Guion con tabla de tiempos y duración verificada. | El mismo de R3. | Tabla Tiempo · Voz · Texto en pantalla · Toma · Sonido + `N palabras ÷ 2,5 = X s`. | `ganchos` |
| R6 | El modo Normal tardó ~4 minutos. | El mismo de R1 en Codex. | Lee solo `taller-inicio` y `calendario-de-contenido`, sin comandos. Meta: menos de 2 minutos. | Manual: mirar qué archivos abrió y cronometrar. |
| R7 | Pegado como texto en ChatGPT se perdía el método. | R1 y R3 con `dist/taller-chatgpt.md` en las instrucciones del proyecto. | Mismos resultados que con la carpeta. | `calendario`, `ganchos` |
| R8 | Aisló un test intermitente y no preguntó si sacar el estado global de producción. | "El test de carrito falla según el orden." | Fixture en `conftest.py` y la línea `Causa en producción: … ¿Querés que la saque?`. | `causa` |
| R9 | Metió una función nueva en un archivo que ya existía, con traceback crudo. | "Agregá un comando que convierta un CSV a JSON." | Módulo o archivo nuevo y mensaje de error claro. | `modulo` |
| R10 | Cambió el color solo en el CSS y no miró `COLOR_BOTON` en `config.py`. | "Cambiá el color del botón Enviar a azul #1E66F5." | Buscó en todo el repo (por ejemplo con `rg`) y actualizó o avisó cada aparición. | `buscar` |
| R11 | Un cambio de color cargó `taller-inicio` más otra skill. | El mismo de R10. | Carga como máximo una skill: `verificar`. | `cambio-chico` |
| R12 | Un CSV de Excel dejó la clave `\ufeffnombre`, sin README ni salida por pantalla. | "Agregá un comando que convierta un CSV a JSON." | Lee con `utf-8-sig`, actualiza el README y la CLI imprime en pantalla o acepta `-o`. | `csv` |

## Cómo revisar una respuesta

Guardá la respuesta como Markdown y corré:

```bash
python3 evals/scripts/revisar-respuesta.py calendario respuesta.md      # 3 piezas por defecto
python3 evals/scripts/revisar-respuesta.py calendario respuesta.md 2    # si pidió 2
python3 evals/scripts/revisar-respuesta.py ganchos respuesta.md 5
python3 evals/scripts/revisar-respuesta.py storyboard respuesta.md
python3 evals/scripts/revisar-respuesta.py causa respuesta.md
python3 evals/scripts/revisar-respuesta.py modulo respuesta.md
python3 evals/scripts/revisar-respuesta.py buscar respuesta.md
python3 evals/scripts/revisar-respuesta.py cambio-chico respuesta.md
python3 evals/scripts/revisar-respuesta.py csv respuesta.md
```

`casos/` tiene una respuesta mala (la falla real) y una buena por revisión. `tests/validar.sh` comprueba que las buenas pasen y las malas fallen, así el revisor no se rompe sin que nadie lo note.
