#! /usr/bin/env python3
"""
Unquote a string with url encoding, for use on output of ballot reconciliation XSLTs

note that this uses only standard library packages

Author: John Rhoads

"""

import sys
import urllib.parse
import argparse
import os.path
import html


def unquote(url_str):
    return urllib.parse.unquote_plus(url_str)


if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Undo url quoting - Get rid of plus signs and %nn codes")
    p.add_argument(dest="filename", metavar="filename", nargs='?')
    p.add_argument("-o", action="store", dest="outfile", help="output file")
    p.add_argument("--output", action="store", dest="outfile", help="output file")
    opts = p.parse_args()
    if opts.filename:
        if os.path.exists(opts.filename):
            f_input = open(opts.filename, "r")
        else:
            raise SystemExit(f"{opts.filename} not found")
    else:
        f_input = sys.stdin

    fout = None
    if opts.outfile:
        fout = open(opts.outfile, "w")
    else:
        fout = sys.stdout

    s = f_input.read()
    s = unquote(s)
    print(s, file=fout)
