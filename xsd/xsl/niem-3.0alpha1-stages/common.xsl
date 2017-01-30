<?xml version="1.0" encoding="us-ascii"?>
<stylesheet 
   version="2.0"
   xmlns:saxon="http://saxon.sf.net/"
   xmlns:c="http://example.org/common"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <include href="xsl-functions.xsl"/>

  <variable name="ns-s20" as="xs:anyURI" select="xs:anyURI('http://niem.gov/niem/structures/2.0')"/>
  <variable name="ns-s3" as="xs:anyURI" select="xs:anyURI('http://release.niem.gov/niem/structures/3.0/')"/>

  <template match="@*|node()" priority="-1">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <function name="c:empty-element" as="xs:boolean">
    <param name="element" as="element()"/>
    <sequence select="
        not(
          exists($element/@*)
          or exists($element/*)
          or string-length(normalize-space(string($element/text()))) &gt; 0)"/>
  </function>

  <function name="c:get-location" as="xs:string">
    <param name="context" as="element()"/>
    <value-of>
      <value-of select="base-uri($context)"/>
      <text>:</text>
      <value-of select="saxon:line-number($context)"/>
    </value-of>
  </function>

  <function name="c:get-target-namespace" as="xs:anyURI">
    <param name="context" as="element()"/>
    <sequence select="exactly-one(xs:anyURI($context/ancestor-or-self::xs:schema/@targetNamespace))"/>
  </function>

  <function name="c:in-scope-namespace-uris" as="xs:anyURI*">
    <param name="context" as="element()"/>
    <sequence select="for $prefix in in-scope-prefixes($context)
                      return namespace-uri-for-prefix($prefix, $context)"/>
  </function>

  <function name="c:get-prefix" as="xs:string">
    <param name="context" as="element()"/>
    <param name="namespace" as="xs:anyURI"/>
    <choose>
      <when test="$namespace = 'http://www.w3.org/2001/XMLSchema'">xs</when>
      <when test="$namespace = 'http://niem.gov/niem/structures/2.0'">structures</when>
      <otherwise>
        <sequence select="exactly-one(
                            in-scope-prefixes($context)[
                              namespace-uri-for-prefix(., $context) eq $namespace])"/>
      </otherwise>
    </choose>
  </function>

  <function name="c:get-qname-string" as="xs:string">
    <param name="context" as="element()"/>
    <param name="qname" as="xs:QName"/>
    <value-of select="concat(
                        c:get-prefix($context, namespace-uri-from-QName($qname)),
                        ':',
                        local-name-from-QName($qname))"/>
  </function>

</stylesheet>
