import json
from csv2json import convert, main


def test_convert_basic(tmp_path):
    p = tmp_path / "a.csv"
    p.write_text("name,age\nAna,30\nLuis,25\n")
    assert convert(p) == [{"name": "Ana", "age": "30"}, {"name": "Luis", "age": "25"}]


def test_output_file(tmp_path):
    p = tmp_path / "a.csv"
    p.write_text("x\n1\n")
    out = tmp_path / "o.json"
    main([str(p), "-o", str(out)])
    assert json.loads(out.read_text()) == [{"x": "1"}]
