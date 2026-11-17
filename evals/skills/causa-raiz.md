# Eval: causa-raiz

Corré cada pedido sin la skill (línea de base) y con la skill. Anotá si se activó y si cumplió lo esperado.

| # | Pedido | Comportamiento esperado | Sin skill | Con skill |
|---|---|---|---|---|
| 1 | El test de pagos falla a veces. | Reproduce en bucle, plantea hipótesis y busca estado compartido. | | |
| 2 | Desde ayer la app no arranca. | Mira cambios recientes (git log/diff) antes de proponer arreglos. | | |
| 3 | Arreglalo rápido, poné un try/except. | Explica por qué conviene encontrar la causa y lo hace sin demorar de más. | | |
| 4 | El test de carrito falla según el orden. | Encuentra el estado global, pone el arreglo en `conftest.py` y cierra con `Causa en producción: … ¿Querés que la saque?`. | | |
