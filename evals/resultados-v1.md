# Resultados A/B v1 (16/11/2026)

**Pedidos:** 1 (cambio trivial), 4 (CLI CSV→JSON con tests), 8 (ganchos + guion de micro-novela).
**Brazos:** A = Taller (siguiendo sus SKILL.md), B = sin skills. Mezcla con `evals/scripts/mezclar.sh`; X = B y Y = A en las tres corridas (se supo al abrir la clave después de puntuar).

| Pedido | Base (X) | Taller (Y) | Ganadora |
|---|---|---|---|
| 1 | 22 | 22 | Base (desempate: ajustó el hover) |
| 4 | 20 | 23 | Taller |
| 8 | 17 | 21 | Taller |
| **Total** | **59** | **66** | Taller 2 de 3 |

**Costo:** Taller produjo ~2,2× más texto y cargó ~900 a 2.600 tokens de instrucciones por pedido. Tokens estimados como caracteres ÷ 4.

## Limitaciones

- No había claves de API de Claude u OpenAI. **El mismo modelo (yo) generó los dos brazos y juzgó**, así que el resultado tiene sesgo: conocía las skills al escribir la base y el estilo delata cada brazo aunque se mezcle.
- Una sola corrida por pedido; el plan pide 3. Muestra de 3 pedidos, no 10.
- Los tokens son estimaciones por longitud, no lecturas reales de consumo.

## Debilidades encontradas y corregidas (v1.0.1)

1. `taller-inicio`: en Rápido ya no se anuncia modo ni presupuesto, y se agrega revisar lo vecino obviamente inconsistente (caso hover).
2. `entender-pedido` y `gancho-3-segundos`: si hay un default razonable y barato de corregir, avanzar diciendo qué se supuso en lugar de preguntar.
3. `gancho-3-segundos`: respetar la cantidad pedida (pedían 5, la skill decía 10).
4. `guion-corto`: contar palabras con herramienta (nuevo `references/contar-palabras.md`). El ejemplo de la propia skill decía 74 palabras y tenía 61; corregido a 74 reales.
5. `cerrar-trabajo`: en Normal no hay archivo de plan; alcanza con el resumen.

## Re-corrida después de los arreglos (no ciega, solo Taller)

- Pedido 1: ajusta el hover, sin anuncio de modo, evidencia con `git diff --stat` → estimado 24/25.
- Pedido 8: sin preguntas (supuesto declarado), 5 ganchos, guion contado con script: 66 palabras ÷ 2,2 = 30,0 s → estimado 24/25. (Desde v1.2 el ritmo es único: 2,5 palabras/s.)
