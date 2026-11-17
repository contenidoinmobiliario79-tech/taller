<!-- Respuesta que cumple tests-primero v1.3: BOM con utf-8-sig, README y salida por pantalla o -o. Debe PASAR. -->

La conversión quedó en un módulo nuevo, `tienda/csv_json.py`. Leo el archivo con `utf-8-sig` para tolerar el BOM de Excel: un test abre un CSV que empieza con `\ufeffnombre,precio` y la clave queda `nombre`.

La CLI imprime el JSON en pantalla si no hay `-o`, o lo guarda en el archivo si se pasa `-o salida.json`. Actualicé el README con un ejemplo de uso. Los tests nuevos pasan 20 de 20, sin traceback.
