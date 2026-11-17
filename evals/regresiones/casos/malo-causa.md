<!-- Defecto visto en el A/B de código v1.3 (16/11/2026): usó conftest.py y mencionó el estado global, pero no preguntó si sacarlo de producción. Debe FALLAR. -->

La causa era el estado global de `carrito.ITEMS`. Añadí una fixture en `tests/conftest.py` que limpia el carrito antes y después de cada test. Verifiqué la suite: 7 tests pasaron.

El carrito de producción sigue usando una lista global; esta corrección evita que ese estado compartido contamine los tests.
