# Contar palabras de la voz · Counting voice-over words

Ritmo único para guiones en español: **2,5 palabras por segundo**, también en tono dramático. Fórmula: `N palabras ÷ 2,5 = X s`.

Guardá el guion en `guion.md` (tabla con la columna **Voz** en segundo lugar) y corré:

```bash
python3 - guion.md <<'PY'
import re, sys
texto = open(sys.argv[1], encoding="utf-8").read()
voz = [fila.split("|")[2] for fila in texto.splitlines() if re.match(r"\|\s*\d", fila)]
n = sum(len(re.findall(r"[\wÁÉÍÓÚáéíóúÑñÜü]+", v)) for v in voz)
print(f"{n} palabras ÷ 2,5 = {n / 2.5:.1f} s")
PY
```

Sin terminal, anotá el subtotal de palabras de cada fila y sumalos.
