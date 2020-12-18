
# NIEM Naming and Design Rules, version 5.0rc1

- Issue https://github.com/NIEM/NIEM-NDR/issues/96: Updated text to avoid preferring the term "MPD" for a message specification.
- Updated front matter for final release.

# NIEM Naming and Design Rules, version 5.0beta1

- Integrated source and publication repositories. Moved all published artifacts to /publish directory.
- Installed build system using GNU autoconf/configure, using Makefile.in.
- Added run script "run.in" for easy execution of common targets, without cluttering up the Makefile.
- Issue https://github.com/NIEM/NIEM-NDR/issues/95: Fixed error "used to by" in section 10.4.
- Issue https://github.com/NIEM/NIEM-NDR/issues/82: Remove metadata from `structures:AugmentationType`.
- Issue https://github.com/NIEM/NIEM-NDR/issues/86: Added documentation to components in the structures namespace.
- Issue https://github.com/NIEM/NIEM-NDR/issues/88: Update utility schemas for NIEM 5.0beta1.
    - structures: Added sequenceID.  Removed structures:metadata attribute from structures:AugmentationType. Added xml:lang. Added documentation.
    - appinfo: Added xml:lang. Revised documentation of attribute `appinfo:deprecated`.
- Issue https://github.com/NIEM/NIEM-NDR/issues/94: Updated structures, appinfo, and schema examples, and NIEM schemas for validation, to NIEM 5.0 draft versions.
    - Updated example XSD NIEM subset to entire NIEM 5.0rc1 tree.
    - Updated structures & appinfo schemas to UTF-8.
- Issue https://github.com/NIEM/NIEM-NDR/issues/81: Add text and rules supporting attribute `structures:sequenceID`.
    - Added new interpretation rule defining order of properties when `structures:sequenceID` is used.
    - Added text in Section 5.3 clarifying that NIEM expresses order of properties of an object via `structures:sequenceID`.
- Issue https://github.com/NIEM/NIEM-NDR/issues/90.: Changed type of @structures:sequenceID to positive integer.
- Issue https://github.com/NIEM/NIEM-NDR/issues/89: Updated NIEM version to 5.0.
- Issue https://github.com/NIEM/NIEM-NDR/issues/87: Required attribute `xml:lang` on component names and xs:documentation.
- Issue https://github.com/NIEM/NIEM-NDR/issues/83: Added RDF entailment for use of structures:metadata.
    - Stood up a section for schema components mapping to RDF.
- Issue https://github.com/NIEM/NIEM-NDR/issues/84: Added RDF entailment for @structures:relationshipMetadata.
    - Added description of properties being put into named graphs using structures:relationshipMetadata.
    - Added introduction of RDF datasets.
    - Described NIEM data as being triples that can be assigned to named graphs as needed.
    - Introduced N-Quads via text from its standard; added reference to N-Quads specification.
    - Expanded the section on elements as simple properties to cover cases with and without structures:relationshipMetadata.
    - Added RDF/N-Quad definition of attributes as simple properties.
    - Redefined RDF for elements and attributes applied via an augmentation type. Removed the separate sections for elements and attributes. Added new section for both elements and attributes, which defers to the sections for elements and attributes as simple properties.
    - Updated text & example in section 12 "instance metadata" section.
    - Broke out section on RDF mappings of instances to type information.
- Issue https://github.com/NIEM/NIEM-NDR/issues/43: Renamed table 10-2 to "Property representation terms".
- Issue https://github.com/NIEM/NIEM-NDR/issues/58: The term "linked data" now links to the W3C landing page for Linked Data.
- Issue https://github.com/NIEM/NIEM-NDR/issues/79: Added new rule 5-1, which defines the interpretation of XML data as defined by RDF mappings.
- Issue https://github.com/NIEM/NIEM-NDR/issues/72: Removed use of <namespace-uri-for-prefix> in rules.
- Issue https://github.com/NIEM/NIEM-NDR/issues/91: Clarify that properties are unordered in §5.
- Issue https://github.com/NIEM/NIEM-NDR/issues/92: Added principle of "optional and over-inclusive". Added to the section defining the "reference schema document" conformance target
- Issue https://github.com/NIEM/NIEM-NDR/issues/93: Revised definition of Representation Term "Date".
  - Revised to "A continuous or recurring period of time, of a duration greater than or equal to a day."
- Issue https://github.com/NIEM/NIEM-NDR/issues/76: Corrected name of RDF.
- Issue https://github.com/NIEM/NIEM-NDR/issues/75: Added new MUST rule that requires a component with a name ending in 'SimpleType' be a simple type definition, and with a name ending in 'Type' be a complex type definition.
- Issue https://github.com/NIEM/NIEM-NDR/issues/74: Fixed missing "an" in definition of conformant instance XML document.
- Issue https://github.com/NIEM/NIEM-NDR/issues/80: Added representation term "Representation" to table "Property representation terms".
- Issue https://github.com/NIEM/NIEM-NDR/issues/71: Revised section heading that repeated "id" instead of using "ref".
- Issue https://github.com/NIEM/NIEM-NDR/issues/70: Fix whitespace/blank lines in 5.6.2. RDF Literals
