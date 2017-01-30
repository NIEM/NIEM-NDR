<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    version="2.0"
    xmlns:catalog="urn:oasis:names:tc:entity:xmlns:xml:catalog"
    xmlns:ct="http://release.niem.gov/niem/conformanceTargets/3.0/"
    xmlns:local="http://example.org/local-namespace"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="text"/>

  <template match="text()"/>

  <template match="catalog:uri[exists(@uri)]">
    <variable name="next" as="xs:anyURI" select="resolve-uri(@uri, base-uri(.))"/>
    <choose>
      <when test="not(doc-available($next))">
        <message terminate="yes">Catalog &quot;<value-of select="base-uri(.)"/>&quot; references &quot;<value-of select="$next"/>&quot;, which does not resolve.</message>
      </when>
      <otherwise>
        <value-of select="$next"/>
        <text>&#10;</text>
      </otherwise>
    </choose>
  </template>

</stylesheet>
