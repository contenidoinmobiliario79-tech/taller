Te armé `csv2json.py`, una CLI en Python que usa la primera fila como encabezados:

```bash
python csv2json.py datos.csv            # imprime JSON por stdout
python csv2json.py datos.csv -o out.json
python csv2json.py datos.csv --indent 4
```

Incluye `test_csv2json.py` con pytest (conversión básica y salida a archivo). Corré `pytest` para ejecutarlos: 2 tests pasan.
