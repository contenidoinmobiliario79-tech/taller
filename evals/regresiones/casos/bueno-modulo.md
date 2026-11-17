<!-- Respuesta que cumple tests-primero v1.3: módulo aparte y mensaje de error claro. Debe PASAR. -->

La conversión quedó en un módulo nuevo, `tienda/csv_a_json.py`, y la CLI solo lo llama. No metí la lógica en `cli.py`.

Si el CSV está vacío o le falta una columna, la CLI imprime un mensaje claro ("El CSV está vacío." / "Falta la columna nombre.") y sale con código 1, sin traceback. Los tests nuevos pasan 20 de 20.
