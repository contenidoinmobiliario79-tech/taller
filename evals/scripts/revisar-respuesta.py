#!/usr/bin/env python3
"""Revisa una respuesta guardada contra las regresiones de v1.1. Sin red.
Checks a saved answer for the v1.1 regressions.

Uso: python3 evals/scripts/revisar-respuesta.py <caso> <respuesta.md> [cantidad]
Casos:
  calendario  -> piezas = cantidad (3 por defecto), sin lista extra de ganchos, sin mercado inventado
  ganchos     -> exactamente <cantidad> ganchos (5 por defecto), tabla de guion y conteo de palabras
  storyboard  -> ficha de personaje repetida textual en cada prompt
  guion       -> tabla de tiempos, conteo con ritmo único 2,5 y vocabulario sin «historia»
  causa       -> conftest.py y la línea 'Causa en producción: … ¿Querés que la saque?'
  modulo      -> módulo o archivo nuevo, y mensaje de error claro (no un traceback crudo)
  buscar      -> buscó en todo el repo (rg) y mencionó las otras apariciones
  cambio-chico -> como máximo una skill (`verificar`), sin cargar taller-inicio
  csv         -> CSV con utf-8-sig / BOM, README y salida de CLI útil (pantalla o -o)
Los casos de contenido también revisan hashtags sin país inventado, ritmo 2,5 y sin «historia».
Los casos de código no exigen ritmo ni hashtags; sí rechazan la palabra «historia».
"""
import re, sys

PAISES = r"argentin|mexic|méxic|colombia|chile|peru|perú|espa[nñ]a|uruguay|venezuel|ecuador|bolivia|paraguay|buenosaires|cdmx|madrid|bogot|lima|santiago|latam"
DIAS = r"lun|mar|mi[eé]|jue|vie|s[aá]b|dom"

def filas(texto):
    return [l for l in texto.splitlines() if l.strip().startswith("|") and not re.match(r"^\|\s*:?-", l.strip())]

def mercado(texto, errores):
    for tag in re.findall(r"#\w+", texto):
        if re.search(PAISES, tag, re.I):
            errores.append(f"hashtag regional sin mercado dado: {tag}")

def comunes(texto, errores):
    mercado(texto, errores)
    for m in re.findall(r"#?\w*historia\w*", texto, re.I):
        errores.append(f"usa «historia» en hashtags o textos: {m}")
    for m in re.findall(r"÷\s*(\d+[,.]\d+)", texto):
        if m.replace(".", ",") != "2,5":
            errores.append(f"ritmo distinto de 2,5 palabras/s: ÷ {m}")

def tabla_guion(texto, errores):
    cab = [f.lower() for f in filas(texto) if "voz" in f.lower()]
    if not any(all(c in f for c in ["tiempo", "voz", "texto en pantalla", "toma", "sonido"]) for f in cab):
        errores.append("falta la tabla Tiempo | Voz | Texto en pantalla | Toma | Sonido")
    if not re.search(r"\d+\s*palabras\s*÷\s*2[,.]5\s*=\s*\d", texto):
        errores.append("falta el conteo verificado 'N palabras ÷ 2,5 = X s'")

def guion(texto, _n, errores):
    tabla_guion(texto, errores)

def calendario(texto, n, errores):
    piezas = [f for f in filas(texto) if re.match(rf"^\|\s*({DIAS})", f, re.I)]
    if len(piezas) != n:
        errores.append(f"{len(piezas)} piezas en el calendario (esperadas {n})")
    lista = re.findall(r"^\s*\d+\.\s*[\"“].+[\"”].*\d+\s*/\s*20", texto, re.M)
    if lista:
        errores.append(f"lista aparte de {len(lista)} ganchos puntuados que nadie pidió")
    if not re.search(r"supuse|supuesto", texto, re.I):
        errores.append("falta la línea de supuestos")

def ganchos(texto, n, errores):
    tabla = [f for f in filas(texto) if re.match(r"^\|\s*\d+\s*\|", f)]
    if len(tabla) != n:
        errores.append(f"{len(tabla)} ganchos (esperados {n})")
    tabla_guion(texto, errores)

def storyboard(texto, _n, errores):
    m = re.search(r"(Personaje [A-Z]:[^`\n|]+)", texto)
    if not m:
        errores.append("falta la ficha de personaje 'Personaje A: …'"); return
    ficha = m.group(1).strip().rstrip(".")
    prompts = [l for l in texto.splitlines() if re.search(r"9:16", l) and "Personaje" in l]
    if not prompts:
        errores.append("no hay prompts con el personaje")
    faltan = [p for p in prompts if ficha not in p]
    if faltan:
        errores.append(f"{len(faltan)} prompt(s) no repiten la ficha textual")


def causa(texto, _n, errores):
    if not re.search(r"Causa en producci[oó]n:", texto):
        errores.append("falta la línea 'Causa en producción: …'")
    if not re.search(r"Quer[eé]s que la saque", texto, re.I):
        errores.append("falta la pregunta '¿Querés que la saque?'")
    if not re.search(r"conftest", texto, re.I):
        errores.append("el arreglo compartido de tests no está en un lugar reutilizable (conftest.py)")

def csv(texto, _n, errores):
    if not re.search(r"utf-8-sig|utf8.?sig|\\ufeff|BOM", texto, re.I):
        errores.append("no lee el CSV con utf-8-sig / no contempla el BOM")
    if not re.search(r"README|readme", texto):
        errores.append("no actualizó el README (ni lo mencionó)")
    if not re.search(r"stdout|pantalla|\-o\b|salida por", texto, re.I):
        errores.append("no ofrece una salida de CLI útil (pantalla o -o)")

def modulo(texto, _n, errores):
    if not re.search(r"m[oó]dulo (aparte|nuevo|separado)|archivo (nuevo|aparte)", texto, re.I):
        errores.append("no prefiere un módulo o archivo nuevo")
    if re.search(r"traceback", texto, re.I) and not re.search(r"sin traceback", texto, re.I):
        errores.append("el error se muestra como traceback crudo")
    if not re.search(r"mensaje (claro|de error)", texto, re.I):
        errores.append("no hay un mensaje de error claro para quien usa la herramienta")

def buscar(texto, _n, errores):
    if not re.search(r"\brg\b|busc[aá].*todo el repo|todas las apariciones", texto, re.I):
        errores.append("no buscó en todo el repo todas las apariciones del valor")
    if not re.search(r"config\.py|COLOR_BOTON", texto):
        errores.append("no mencionó la otra aparición (por ejemplo COLOR_BOTON en config.py)")

def cambio_chico(texto, _n, errores):
    for m in re.finditer(r"taller-inicio", texto):
        prev = texto[max(0, m.start() - 40):m.start()].lower()
        if re.search(r"\bno\b|\bsin\b|no leas|excepto", prev):
            continue
        errores.append("cargó taller-inicio en un cambio chico (debe ser como máximo una skill: verificar)")
        break
    if not re.search(r"verificar", texto):
        errores.append("no indica que cargó solo la skill verificar")

def main():
    if len(sys.argv) < 3:
        sys.exit(__doc__)
    caso, ruta = sys.argv[1], sys.argv[2]
    contenido = {"calendario": 3, "ganchos": 5, "storyboard": 0, "guion": 0}
    codigo = {"causa": 0, "modulo": 0, "buscar": 0, "cambio-chico": 0, "csv": 0}
    defecto = {**contenido, **codigo}
    if caso not in defecto:
        sys.exit(f"caso desconocido: {caso}")
    n = int(sys.argv[3]) if len(sys.argv) > 3 else defecto[caso]
    texto = open(ruta, encoding="utf-8").read()
    texto = re.sub(r"<!--.*?-->", "", texto, flags=re.S)  # los comentarios no cuentan
    errores = []
    dispatch = {
        "calendario": calendario, "ganchos": ganchos, "storyboard": storyboard, "guion": guion,
        "causa": causa, "modulo": modulo, "buscar": buscar, "cambio-chico": cambio_chico, "csv": csv,
    }
    dispatch[caso](texto, n, errores)
    if caso in contenido:
        comunes(texto, errores)
    else:
        for m in re.findall(r"#?\w*historia\w*", texto, re.I):
            errores.append(f"usa «historia» en hashtags o textos: {m}")
    for e in errores:
        print(f"FALLA  {ruta}: {e}")
    if not errores:
        print(f"PASA   {ruta}")
    sys.exit(1 if errores else 0)

if __name__ == "__main__":
    main()
