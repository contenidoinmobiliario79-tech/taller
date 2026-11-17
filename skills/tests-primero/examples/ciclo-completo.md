# Ciclo completo en Python

**Comportamiento:** `duracion_lectura(texto)` devuelve segundos estimados a 2,5 palabras por segundo.

**Rojo**
```python
def test_diez_palabras_son_cuatro_segundos():
    assert duracion_lectura("uno dos tres cuatro cinco seis siete ocho nueve diez") == 4
```
`pytest` → falla con `NameError: duracion_lectura` → falla esperada.

**Verde**
```python
def duracion_lectura(texto: str) -> int:
    return round(len(texto.split()) / 2.5)
```
`pytest` → 1 passed.

**Siguiente comportamiento:** texto vacío devuelve 0 → nuevo test rojo → ya pasa → se deja el test como documentación.

**Ordenar:** extraer `PALABRAS_POR_SEGUNDO = 2.5` como constante y volver a correr.
