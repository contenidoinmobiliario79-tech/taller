#!/usr/bin/env bash
# Mezcla a ciegas las salidas de dos perfiles / Blind-shuffle outputs of two profiles.
# Uso: mezclar.sh <carpeta_perfil_A> <carpeta_perfil_B> <destino>
# Cada carpeta contiene subcarpetas por corrida con el mismo nombre en ambos perfiles
# (por ejemplo 01-1, 01-2 ...). Solo copia archivos locales; sin red.
set -euo pipefail

if [ "$#" -ne 3 ]; then
  echo "Uso: $0 <carpeta_A> <carpeta_B> <destino>" >&2
  exit 2
fi

dir_a="$1"
dir_b="$2"
dest="$3"

[ -d "$dir_a" ] || { echo "No existe: $dir_a" >&2; exit 2; }
[ -d "$dir_b" ] || { echo "No existe: $dir_b" >&2; exit 2; }

mkdir -p "$dest/pares"
key="$dest/clave.csv"
printf 'corrida,X,Y\n' > "$key"

for run_path in "$dir_a"/*/; do
  run="$(basename "$run_path")"
  if [ ! -d "$dir_b/$run" ]; then
    echo "Aviso: falta $run en $dir_b, se omite" >&2
    continue
  fi
  mkdir -p "$dest/pares/$run"
  if [ $((RANDOM % 2)) -eq 0 ]; then
    cp -R "$dir_a/$run" "$dest/pares/$run/X"
    cp -R "$dir_b/$run" "$dest/pares/$run/Y"
    printf '%s,A,B\n' "$run" >> "$key"
  else
    cp -R "$dir_b/$run" "$dest/pares/$run/X"
    cp -R "$dir_a/$run" "$dest/pares/$run/Y"
    printf '%s,B,A\n' "$run" >> "$key"
  fi
done

chmod 600 "$key"
echo "Listo: pares en $dest/pares. Guardá $key sin mirarlo hasta terminar el juicio."
