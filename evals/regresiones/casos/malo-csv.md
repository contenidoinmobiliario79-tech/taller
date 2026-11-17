<!-- Defecto visto en el A/B de código v1.3 (16/11/2026): módulo nuevo, pero sin utf-8-sig, sin README y sin salida por pantalla. Debe FALLAR. -->

Implementé `tienda/csv_json.py`. Uso: `python3 -m tienda.csv_json entrada.csv salida.json`. Los 3 tests nuevos pasan. La suite completa da 8 pasados y 2 fallidos en `tests/test_carrito.py`, por estado compartido entre esos tests.
