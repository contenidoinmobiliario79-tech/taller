#!/usr/bin/env python3
"""Convierte un CSV (primera fila = encabezados) a JSON."""
import argparse
import csv
import io
import json
import sys
from pathlib import Path


def convertir(texto_csv: str) -> list[dict]:
    return list(csv.DictReader(io.StringIO(texto_csv)))


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description="Convierte un CSV a JSON.")
    parser.add_argument("entrada", help="archivo CSV")
    parser.add_argument("-o", "--salida", help="archivo JSON de salida (por defecto, stdout)")
    args = parser.parse_args(argv)

    ruta = Path(args.entrada)
    if not ruta.is_file():
        print(f"Error: el archivo {ruta} no existe", file=sys.stderr)
        return 1

    filas = convertir(ruta.read_text(encoding="utf-8-sig"))
    texto = json.dumps(filas, ensure_ascii=False, indent=2)
    if args.salida:
        Path(args.salida).write_text(texto + "\n", encoding="utf-8")
    else:
        print(texto)
    return 0


if __name__ == "__main__":
    sys.exit(main())
