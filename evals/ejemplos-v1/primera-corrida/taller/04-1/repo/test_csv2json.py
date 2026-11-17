import json
import subprocess
import sys
from pathlib import Path

from csv2json import convertir

CLI = Path(__file__).with_name("csv2json.py")


def test_primera_fila_son_encabezados():
    assert convertir("nombre,edad\nAna,30\n") == [{"nombre": "Ana", "edad": "30"}]


def test_archivo_vacio_da_lista_vacia():
    assert convertir("") == []


def test_solo_encabezados_da_lista_vacia():
    assert convertir("nombre,edad\n") == []


def test_respeta_comillas_y_comas_internas():
    texto = 'producto,nota\n"Falda, larga","dijo ""hermosa"""\n'
    assert convertir(texto) == [{"producto": "Falda, larga", "nota": 'dijo "hermosa"'}]


def test_acentos_se_mantienen_en_la_salida(tmp_path):
    entrada = tmp_path / "a.csv"
    entrada.write_text("ciudad\nBogotá\n", encoding="utf-8")
    out = subprocess.run([sys.executable, str(CLI), str(entrada)], capture_output=True, text=True, check=True)
    assert "Bogotá" in out.stdout


def test_opcion_o_escribe_archivo(tmp_path):
    entrada = tmp_path / "a.csv"
    entrada.write_text("x\n1\n", encoding="utf-8")
    salida = tmp_path / "o.json"
    subprocess.run([sys.executable, str(CLI), str(entrada), "-o", str(salida)], check=True)
    assert json.loads(salida.read_text(encoding="utf-8")) == [{"x": "1"}]


def test_archivo_inexistente_sale_con_error(tmp_path):
    out = subprocess.run([sys.executable, str(CLI), str(tmp_path / "no.csv")], capture_output=True, text=True)
    assert out.returncode == 1
    assert "no existe" in out.stderr
