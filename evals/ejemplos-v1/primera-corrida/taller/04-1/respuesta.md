**Turno 1 (agente)**
Modo Normal: CLI chica con tests, unos 4 pasos, presupuesto estimado ~120k tokens (calculo usar ~25k).

Dos cosas que cambian lo que construyo:
1. **¿La primera fila del CSV son los encabezados?** Si sí, cada fila sale como objeto `{"columna": valor}`; si no, como lista de listas.
2. **¿La salida va por pantalla o a un archivo?** Puedo hacer las dos: stdout por defecto y `-o archivo.json`. Yo iría por eso.

**Turno 2 (persona, guionado)**
Primera fila como encabezados. Salida por stdout o a un archivo con -o.

**Turno 3 (agente)**
Pasos: 1) tests de encabezados, vacío, comillas, acentos, `-o` y error; 2) implementación mínima; 3) README; 4) verificación.

Rojo: con `convertir()` como esqueleto, `pytest` → `7 failed` (NotImplementedError y la CLI que todavía no escribe ni valida). Fallan por la razón esperada.
Verde: implementé `convertir()` con `csv.DictReader` y la CLI con `argparse` → `pytest -q` → `7 passed in 0.09s`.

Prueba manual: `python csv2json.py demo.csv` con `Ana,"Córdoba, AR"` → `[{"nombre": "Ana", "ciudad": "Córdoba, AR"}]` (coma interna y acento respetados).

**Resumen**
- Qué se hizo: `csv2json.py` (stdout o `-o`, error claro con código 1 si el archivo no existe, UTF-8 con BOM), `test_csv2json.py` (7 tests), `README.md`.
- Evidencia: `7 passed`.
- Pendiente: nada de lo pedido. Ideas para después: `--delimitador` para CSV con `;` (común en Excel en español).
- Costo: ~25k de 120k tokens estimados.
