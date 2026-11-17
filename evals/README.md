# Evals de Taller · Taller evals

Tres niveles de prueba, del más barato al más caro:

| Nivel | Qué mide | Dónde | Costo |
|---|---|---|---|
| 1. Estructura | Frontmatter, tamaño, manifiestos, hooks sin red | `tests/validar.sh` | Cero tokens |
| 2. Disparo | ¿Se activa la skill correcta para cada pedido? | `disparo.jsonl` | ~2k tokens por pedido |
| 3. A/B a ciegas | ¿Taller produce mejores resultados que superpowers? | `prompts/ab-10.md` + `rubrica.md` | Alto: ver presupuesto abajo |

Las fallas reales encontradas en pruebas están en `regresiones/` con un revisor automático (`scripts/revisar-respuesta.py`).

Además, cada skill tiene su archivo en `skills/<nombre>.md` con 3 pedidos y el comportamiento esperado.

## Prueba A/B a ciegas (resumen)

1. **Entorno:** misma máquina, mismo modelo, misma versión de la herramienta. Perfil A con superpowers, perfil B con Taller. Nada más instalado.
2. **Pedidos:** los 10 de `prompts/ab-10.md`, cada uno 3 veces por perfil (60 corridas).
3. **Registro por corrida:** tokens, tiempo, preguntas antes de actuar, si funciona, si hubo un "listo" falso. Planilla: `plantilla-resultados.csv`.
4. **Mezcla a ciegas:** `scripts/mezclar.sh <salidas_A> <salidas_B> <destino>` renombra las salidas al azar como X/Y y guarda la clave aparte.
5. **Juicio:** una persona y un juez LLM con `rubrica.md` eligen la mejor de cada par sin conocer la clave.
6. **Éxito:** Taller gana o empata en ≥ 7 de 10 pedidos, usa ≥ 30 % menos tokens (mediana) y no tiene más "listos" falsos.

**Presupuesto orientativo:** entre 3 y 8 millones de tokens para las 60 corridas, según el modelo. Para una primera calibración, corré solo los pedidos 1, 4 y 8 una vez por perfil.

## Cómo correr una corrida

Desde una carpeta de trabajo limpia (por ejemplo un repo de ejemplo copiado para cada corrida), abrí la herramienta con el perfil que corresponda, pegá el pedido tal cual y respondé a las preguntas del agente con las respuestas guionadas de `prompts/ab-10.md`. Guardá la transcripción y los archivos resultantes en `runs/<perfil>/<pedido>-<n>/`.

Ningún script de esta carpeta llama a la red ni a modelos: solo ordenan y mezclan archivos locales.
