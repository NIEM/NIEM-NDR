<?xml version="1.0" encoding="us-ascii"?>
<stylesheet 
   exclude-result-prefixes="i20 tns s20 c"
   version="2.0"
   xmlns:c="http://example.org/common"
   xmlns:ct="http://release.niem.gov/niem/conformanceTargets/3.0/"
   xmlns:i20="http://niem.gov/niem/appinfo/2.0" 
   xmlns:s20="http://niem.gov/niem/structures/2.0" 
   xmlns:saxon="http://saxon.sf.net/"
   xmlns:structures="http://release.niem.gov/niem/structures/3.0/"
   xmlns:tns="http://example.org/this-namespace"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns="http://www.w3.org/1999/XSL/Transform"
   >

  <include href="common.xsl"/>

  <template match="/xs:schema">
    <variable name="context" select="."/>
    <element name="xs:schema">
      <namespace name="structures">http://release.niem.gov/niem/structures/3.0/</namespace>
      <for-each select="in-scope-prefixes(.)">
        <variable name="namespace-uri" select="namespace-uri-for-prefix(., $context)"/>
        <choose>
          <when test="$namespace-uri = ('http://niem.gov/niem/structures/2.0', 
                        'http://niem.gov/niem/appinfo/2.0', 
                        'http://www.w3.org/2001/XMLSchema')">
            <!-- These namespaces are already declared -->
          </when>
          <otherwise>
            <variable name="prefix" select="tns:get-prefix($context, $namespace-uri)"/>
            <namespace name="{$prefix}" select="$namespace-uri"/>
          </otherwise>
        </choose>
      </for-each>
      <apply-templates select="@*|node()"/>
    </element>
  </template>

  <template match="xs:*">
    <element name="xs:{local-name()}">
      <apply-templates select="@*|node()"/>
    </element>
  </template>

  <function name="tns:in-scope-namespace-uris" as="xs:anyURI*">
    <param name="context" as="element()"/>
    <sequence select="for $prefix in in-scope-prefixes($context)
                      return namespace-uri-for-prefix($prefix, $context)"/>
  </function>

  <function name="tns:get-prefix" as="xs:string">
    <param name="context" as="element()"/>
    <param name="namespace" as="xs:anyURI"/>
    <choose>
      <when test="$namespace = 'http://www.w3.org/2001/XMLSchema'">xs</when>
      <when test="$namespace = 'http://niem.gov/niem/structures/2.0'">structures</when>
      <when test="$namespace = 'http://niem.gov/niem/niem-core/2.0'">nc20</when>
      <when test="$namespace = 'http://niem.gov/niem/fbi/2.0'">fbi20</when>
      <!--
      <when test="$namespace = 'ZU'">ZP</when>
      -->
      <otherwise>
        <!-- fall back to whatever it already is -->
        <sequence select="exactly-one(
                            in-scope-prefixes($context)[
                              namespace-uri-for-prefix(., $context) eq $namespace])"/>
      </otherwise>
    </choose>
  </function>

  <function name="tns:get-qname-string" as="xs:string">
    <param name="context" as="element()"/>
    <param name="qname" as="xs:QName"/>
    <value-of select="concat(
                        tns:get-prefix($context, namespace-uri-from-QName($qname)),
                        ':',
                        local-name-from-QName($qname))"/>
  </function>

  <template match="xs:*/@*[local-name() = ('ref', 'base', 'type', 'itemType', 'memberTypes', 'substitutionGroup')
                           and namespace-uri() = '']">
    <variable name="ref-qname" as="xs:QName" select="resolve-QName(., ..)"/>
    <if test="c:assert(.., namespace-uri-from-QName($ref-qname) = tns:in-scope-namespace-uris(..), 
                'qname attribute has namespace that is not bound to a prefix. inconceivable.')"/>
    <attribute name="{local-name()}">
      <sequence select="tns:get-qname-string(.., resolve-QName(., ..))"/>
    </attribute>
  </template>

</stylesheet>
