<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    version="2.0"
    xmlns:catalog="urn:oasis:names:tc:entity:xmlns:xml:catalog"
    xmlns:ct="http://release.niem.gov/niem/conformanceTargets/3.0/"
    xmlns:f="http://example.org/validation-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="text"/>

  <include href="functions.xsl"/>

  <template match="/">
    <variable name="schema" as="element()?" select="xs:schema"/>
    <value-of select="xs:boolean(
                        exists($schema)
                        and f:has-effective-conformance-target($schema, 'http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument'))"/>
  </template>

</stylesheet>
