<?xml version="1.0" encoding="us-ascii"?>
<stylesheet 
   exclude-result-prefixes="tns c"
   version="2.0"
   xmlns:f="http://ittl.gtri.org/wr24/2009-03-10-1439/xsl-functions"
   xmlns:c="http://example.org/common"
   xmlns:saxon="http://saxon.sf.net/"
   xmlns:structures="http://release.niem.gov/niem/structures/3.0/"
   xmlns:tns="http://example.org/this-namespace"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns="http://www.w3.org/1999/XSL/Transform"
   >

  <include href="xsl-functions.xsl"/>

  <template match="*">
    <variable name="context" select="."/>
    <element name="{tns:get-qname-string(., resolve-QName(name(), .))}"
             namespace="{tns:map-namespace(namespace-uri())}">
      <if test="empty(parent::*)">
        <for-each select="in-scope-prefixes(.)">
          <variable name="old-namespace-uri" select="namespace-uri-for-prefix(., $context)"/>
          <variable name="new-namespace-uri" select="tns:map-namespace($old-namespace-uri)"/>
          <namespace name="{tns:get-prefix($context, $old-namespace-uri, $new-namespace-uri)}" 
                     select="$new-namespace-uri"/>
        </for-each>
      </if>
      <apply-templates select="@*|node()"/>
    </element>
  </template>

  <template match="xs:schema/@targetNamespace">
    <attribute name="targetNamespace" select="tns:map-namespace(string(.))"/>
  </template>

  <!-- namespaced attributes -->
  <template match="@*[matches(name(), ':')]">
    <attribute name="{tns:get-qname-string(.., resolve-QName(name(), ..))}"
               namespace="{tns:map-namespace(namespace-uri())}"
               select="string(.)"/>
  </template>

  <!-- local attributes -->
  <template match="@*" priority="-1">
    <attribute name="{local-name()}"
               select="string(.)"/>
  </template>

  <template match="xs:*/@*[local-name() = ('ref', 'base', 'type', 'itemType', 'memberTypes', 'substitutionGroup')
                           and namespace-uri() = '']">
    <variable name="ref-qname" as="xs:QName" select="resolve-QName(., ..)"/>
    <if test="f:assert(.., namespace-uri-from-QName($ref-qname) = tns:in-scope-namespace-uris(..), 
                'qname attribute has namespace that is not bound to a prefix. inconceivable.')"/>
    <attribute name="{local-name()}">
      <sequence select="tns:get-qname-string(.., resolve-QName(., ..))"/>
    </attribute>
  </template>

  <template match="xs:import/@namespace">
    <attribute name="{local-name()}">
      <value-of select="tns:map-namespace(string(.))"/>
    </attribute>
  </template>

  <function name="tns:map-namespace" as="xs:string">
    <param name="in" as="xs:string"/>
    <choose>
      <when test="matches($in, 'http://release.niem.gov/.*[^/]$')">
        <value-of select="concat($in, '/')"/>
      </when>
      <otherwise>
        <value-of select="$in"/>
      </otherwise>
    </choose>
  </function>

  <variable name="prefix-map">
    <tns:namespace uri="http://www.w3.org/2001/XMLSchema" prefix="xs"/>
    <tns:namespace uri="http://niem.gov/niem/structures/3.0/" prefix="structures"/>
  </variable>

  <function name="tns:in-scope-namespace-uris" as="xs:anyURI*">
    <param name="context" as="element()"/>
    <sequence select="for $prefix in in-scope-prefixes($context)
                      return namespace-uri-for-prefix($prefix, $context)"/>
  </function>

  <function name="tns:get-prefix" as="xs:string">
    <param name="context" as="element()"/>
    <param name="old-namespace" as="xs:string"/>
    <param name="new-namespace" as="xs:string"/>
    <variable name="new-prefix" as="xs:string?" 
              select="zero-or-one($prefix-map/tns:namespace[@uri = $new-namespace]/@prefix)"/>
    <choose>
      <when test="exists($new-prefix)">
        <value-of select="$new-prefix"/>
      </when>
      <otherwise>
        <!-- fall back to whatever it already is -->
        <variable name="old-prefix" as="xs:string?"
                  select="in-scope-prefixes($context)[
                              namespace-uri-for-prefix(., $context) eq $old-namespace]"/>
        <if test="f:assert($context, exists($old-prefix), 
                      concat('no prefix for namespace ', $old-namespace))"/>
        <value-of select="exactly-one($old-prefix)"/>
      </otherwise>
    </choose>
  </function>

  <function name="tns:get-qname-string" as="xs:string">
    <param name="context" as="element()"/>
    <param name="old-qname" as="xs:QName"/>
    <variable name="old-namespace" as="xs:string" select="string(namespace-uri-from-QName($old-qname))"/>
    <variable name="new-namespace" as="xs:string" 
              select="tns:map-namespace($old-namespace)"/>
    <value-of select="concat(
                        tns:get-prefix($context, $old-namespace, $new-namespace),
                        ':',
                        local-name-from-QName($old-qname))"/>
  </function>

</stylesheet>
