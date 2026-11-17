#!/usr/bin/env python3
"""Convert a CSV file to JSON."""
import argparse
import csv
import json
import sys


def convert(csv_path):
    with open(csv_path, newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def main(argv=None):
    parser = argparse.ArgumentParser(description="Convert CSV to JSON")
    parser.add_argument("input", help="Input CSV file")
    parser.add_argument("-o", "--output", help="Output JSON file (default: stdout)")
    parser.add_argument("--indent", type=int, default=2)
    args = parser.parse_args(argv)

    data = convert(args.input)
    text = json.dumps(data, indent=args.indent, ensure_ascii=False)
    if args.output:
        with open(args.output, "w", encoding="utf-8") as f:
            f.write(text)
    else:
        print(text)


if __name__ == "__main__":
    main()
