"""
Unquote a string with url encoding, for use on output of ballot reconciliation XSLTs

"""

import urllib.parse
import optparse


def unquote(url_str):
    return urllib.parse.unquote_plus(url_str)


if __name__ == "__main__":
    filename = "../PoCDSubsetList.html"
    f = open(filename)
    s = f.read()
    f.close()
    s = unquote(s)
    print(s)
