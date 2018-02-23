"""
Unquote a string with url encoding, for use on output of ballot reconciliation XSLTs

"""

import sys
import urllib.parse
import optparse
import os.path


def unquote(url_str):
    return urllib.parse.unquote_plus(url_str)


if __name__ == "__main__":
    p = optparse.OptionParser()
    p.add_option("-o", action="store", dest="outfile")
    p.add_option("--output", action="store", dest="outfile")
    # p.add_option("-x", action="store_true", dest = "xhtml")
    # p.add_option("--html", action="store_true", dest = "xhtml")
    # p.add_option("--wiki", action="store_true", dest = "wiki")
    # p.set_defaults(xhtml=True, wiki=True)
    opts, args = p.parse_args()
    fout = None
    if opts.outfile:
        fout = open(opts.outfile, "w")
    else:
        fout = sys.stdout

    if len(args):
        infilename = args[0]
    else:
        infilename = "BallotSubsetListRaw.html"

    if not os.path.exists(infilename):
        print("input file ", infilename, "not found")
    f = open(infilename)
    s = f.read()
    f.close()
    s = unquote(s)
    print(s, file=fout)
