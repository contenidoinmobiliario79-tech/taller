# Modos de Taller · Modes

## Señales para clasificar

**Rápido** (default ~20k tokens)
- Se puede describir el resultado en una oración y no hay dudas sobre qué significa "terminado".
- Toca uno o dos archivos, o es una respuesta/explicación.
- Si sale mal, se deshace en segundos.

**Normal** (default ~120k tokens)
- Hay dos o más pasos dependientes, o una decisión chica que la persona debería tomar.
- Toca entre 3 y 10 archivos, o produce una pieza de contenido completa (guion + portada).
- Se puede validar con un comando, una prueba manual o una lista de criterios.

**Profundo** (default ~400k tokens)
- Hay decisiones de arquitectura, migraciones, cambios que afectan a otras personas o datos.
- Más de 10 archivos, o un paquete de contenido para varias semanas.
- Conviene repartir el trabajo entre subagentes o dejar un plan escrito para retomar después.

## Subir o bajar de modo

- Subí cuando descubras algo que cambia el alcance (un módulo acoplado, un requisito nuevo). Avisá en una línea y explicá por qué.
- Bajá cuando la persona diga "dale, hacelo nomás" o cuando el trabajo resulte más simple de lo previsto.

## Llevar la cuenta del presupuesto

Sumá una estimación cada vez que hagas algo costoso. Valores orientativos:

| Acción | Tokens aprox. |
|---|---|
| Leer un archivo de 200 líneas | 3k |
| Salida larga de un comando (tests, logs) | 2k–8k |
| Un turno de razonamiento + respuesta | 1k–3k |
| Lanzar un subagente con contexto | 15k–40k |
| Generar un guion corto completo | 2k–4k |

Si tu herramienta muestra el consumo real, usá ese número. Al 80 %, frená con un mensaje así:
"Llevamos ~95k de 120k. Me falta X. Calculo ~30k más. ¿Sigo, achico el alcance o paso a Profundo?"
