
# NIEM-NDR

The NIEM Naming and Design Rules specifies the data model, XML Schema
components, and XML data for use with the National Information Exchange Model.

The NDR is governed by the NIEM Technical Architecture Committee (NTAC), with
input from the NIEM Business Architecture Committee (NBAC) and the community.

Please submit comments on this specification as issues at
https://github.com/NIEM/NIEM-NDR/issues.

Machine-readable rules in the NDR are available as Schematron documents in this
repository. You may also test against the rules using
[the Conformance Testing Assistant (Contesa) for NIEM at https://tools.niem.gov/contesa/](https://tools.niem.gov/contesa/).

See [the wiki](https://github.com/NIEM/NIEM-NDR/wiki) for additional documentation.

See this release on Github at <https://github.com/NIEM/NIEM-NDR/releases/tag/5.0beta1>.

# Files

- [niem-ndr.html](niem-ndr.html): NIEM Naming and Design Rules, HTML version
- [niem-ndr.txt](niem-ndr.txt): NIEM Naming and Design Rules, text version
- XML Schemas defined by the specification:
    - [appinfo.xsd](appinfo.xsd)
    - [structures.xsd](structures.xsd)
- [ndr-id-map.xml](ndr-id-map.xml): A mapping from identifiers that don't change from version-to-version in the NDR, to rule numbers that may change.
- Schematron rules:
    - [ndr-functions.xsl](ndr-functions.xsl): XSLT functions supporting the Schematron rules
    - [ndr-rules-conformance-target-ref.sch](ndr-rules-conformance-target-ref.sch): Rules for reference schema documents
    - [ndr-rules-conformance-target-ext.sch](ndr-rules-conformance-target-ext.sch): Rules for extension schema documents
    - [ndr-rules-conformance-target-set.sch](ndr-rules-conformance-target-set.sch): Rules for conformant schema document sets
    - [ndr-rules-conformance-target-ins.sch](ndr-rules-conformance-target-ins.sch): Rules for conformant XML instance documents
    - [ctas-conformant-document.sch](ctas-conformant-document.sch): Rules supporting the Conformance Targets Attribute Specification
    - Schematron rules compiled to XSLT:
        - [ndr-rules-conformance-target-ref.sch.xsl](ndr-rules-conformance-target-ref.sch.xsl)
        - [ndr-rules-conformance-target-ext.sch.xsl](ndr-rules-conformance-target-ext.sch.xsl)
        - [ndr-rules-conformance-target-set.sch.xsl](ndr-rules-conformance-target-set.sch.xsl)
        - [ndr-rules-conformance-target-ins.sch.xsl](ndr-rules-conformance-target-ins.sch.xsl)
        - [ctas-conformant-document.sch.xsl](ctas-conformant-document.sch.xsl)
