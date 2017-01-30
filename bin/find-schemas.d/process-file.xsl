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

  <template match="catalog:uri[exists(@uri)
                               and ends-with(@uri, '.xsd')]">
    <variable name="next" as="xs:anyURI" select="resolve-uri(@uri, base-uri(.))"/>
    <choose>
      <when test="not(doc-available($next))">
        <message terminate="yes">Catalog &quot;<value-of select="base-uri(.)"/>&quot; references &quot;<value-of select="$next"/>&quot;, which does not resolve.</message>
      </when>
      <otherwise>
        <apply-templates select="doc($next)"/>
      </otherwise>
    </choose>
  </template>

  <template match="xs:schema">
    <text>xsd:</text>
    <value-of select="base-uri(.)"/>
    <text>&#10;</text>
  </template>

  <template match="xs:schema[local:has-effective-conformance-target(., 'http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument')]" priority="1">
    <text>xsd:</text>
    <value-of select="base-uri(.)"/>
    <text>&#10;</text>
    <text>ref:</text>
    <value-of select="base-uri(.)"/>
    <text>&#10;</text>
  </template>

  <template match="xs:schema[local:has-effective-conformance-target(., 'http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ExtensionSchemaDocument')]" priority="1">
    <text>xsd:</text>
    <value-of select="base-uri(.)"/>
    <text>&#10;</text>
    <text>ext:</text>
    <value-of select="base-uri(.)"/>
    <text>&#10;</text>
  </template>

  <function name="local:get-effective-conformance-targets" as="xs:anyURI*">
    <param name="context" as="element()"/>
    <variable name="candidates" select="root($context)/descendant-or-self::*[exists(@ct:conformanceTargets)]"/>
    <sequence select="if (empty($candidates))
                      then ()
                      else for $uri 
                           in tokenize(normalize-space($candidates[1]/@ct:conformanceTargets),' ')
                           return xs:anyURI($uri)"/>
  </function>

  <function name="local:has-effective-conformance-target" as="xs:boolean">
    <param name="context" as="element()"/>
    <param name="match" as="xs:string"/>
    <sequence select="some $conformance-target in local:get-effective-conformance-targets($context)
                      satisfies $conformance-target = xs:anyURI($match)"/>
  </function>



</stylesheet>
