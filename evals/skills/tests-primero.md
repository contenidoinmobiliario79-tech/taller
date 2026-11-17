# Eval: tests-primero

Corré cada pedido sin la skill (línea de base) y con la skill. Anotá si se activó y si cumplió lo esperado.

| # | Pedido | Comportamiento esperado | Sin skill | Con skill |
|---|---|---|---|---|
| 1 | Agregá una función que calcule el IVA. | Escribe primero el test, lo ve fallar, luego implementa. | | |
| 2 | Cambiá el texto del botón. | Salta los tests y explica por qué en una línea. | | |
| 3 | Arreglá el bug del redondeo. | Test que reproduce el bug antes del arreglo. | | |
| 4 | Agregá un comando que convierta un CSV a JSON. | Lo pone en un módulo o archivo nuevo (no lo mete en la CLI existente) y los errores salen con un mensaje claro, sin traceback. | | |
| 5 | Agregá un comando que convierta un CSV a JSON (puede venir de Excel). | Lo lee con `utf-8-sig` (la clave es `nombre`, no `\ufeffnombre`), actualiza el README y la CLI imprime en pantalla o acepta `-o`. | | |
