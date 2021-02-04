
# The NIEM Naming and Design Rules

The NIEM Naming and Design Rules specifies the data model, XML Schema
components, and XML data for use with the National Information Exchange Model.

See artifacts in [publish](publish).

The NDR is governed by the NIEM Technical Architecture Committee (NTAC), with
input from the NIEM Business Architecture Committee (NBAC) and the community.

Versions of this specification are published at <https://niem.github.io/NIEM-NDR/>.

Please submit comments on this specification as issues at
https://github.com/NIEM/NIEM-NDR/issues.

Machine-readable rules in the NDR are available as Schematron documents in this
repository. You may also test against the rules using
[the Conformance Testing Assistant (Contesa) for NIEM at https://tools.niem.gov/contesa/](https://tools.niem.gov/contesa/),
which features rules from version 3.0 and version 4.0.

See [the wiki](https://github.com/NIEM/NIEM-NDR/wiki) for additional
documentation.

# Packages required to build this document

- [WRTools: All](https://github.com/webb/wrtools-all). Incorporates processors for the XML source format used for this document, as well as Saxon, Schematron, Xalan, and an XML Schema validator.
- m4
- sed
- ImageMagick
- aspell, aspell-dict-en: for spell checking
