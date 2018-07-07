"""
read the output of the "XML" button in a FHIR tracker query and clean out url quoting

This needs to be done in the CDATA sections; example:
<![CDATA[ Small+error+in+a+definition ]]>
"""
import re
import urllib.parse
from io import open
from xml.sax.saxutils import escape


def unquote(url_str):
    return urllib.parse.unquote_plus(url_str)


def repl(m):
    g = m.group(1)
    u = unquote(g)
    u_strip = u.strip()
    return u_strip


def main():
    with open("/Users/jrhoads/Projects/FHIRBallots/2018-03-14PHDTrackers.xml",
              "r") as f:
        b = f.read()
    cdata_re = re.compile(r"<!\[CDATA\[(.*?)\]\]>", re.DOTALL)
    transformed_xml = re.sub(cdata_re, repl, b)
    cleaned_xml = transformed_xml.replace("&", "&amp;")

    with open("/Users/jrhoads/Projects/FHIRBallots/2018-03-14PHDTrackersX.xml",
              "w") as f:
        print(cleaned_xml, file=f)


if __name__ == "__main__":
    main()
