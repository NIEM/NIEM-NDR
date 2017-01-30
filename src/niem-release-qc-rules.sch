<?xml version="1.0" encoding="UTF-8"?>
<schema 
   queryBinding="xslt2"
   xmlns:local="http://iead.icl.gtri.org/wr24/2013-01-24-0925"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns="http://purl.oclc.org/dsdl/schematron">

  <title>GTRI-internal quality control checks on XSD files</title>

  <ns prefix="local" uri="http://iead.icl.gtri.org/wr24/2013-01-24-0925"/>
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
  <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
  <ns prefix="ct" uri="MACRO_CONFORMANCE_TARGETS_NS"/>
  <ns prefix="term" uri="http://release.niem.gov/niem/localTerminology/3.0/"/>

  <xsl:function name="local:namespace-only-bound-to" as="xs:boolean">
    <xsl:param name="element" as="element()"/>
    <xsl:param name="namespace-uri" as="xs:anyURI"/>
    <xsl:param name="prefix" as="xs:string"/>
    
    <xsl:sequence select="
        every $in-scope-prefix in in-scope-prefixes($element) satisfies 
          ((namespace-uri-for-prefix($in-scope-prefix, $element) = $namespace-uri)
                          = ($in-scope-prefix = $prefix))"/>
  </xsl:function>

  <xsl:function name="local:schema-location-resolves" as="xs:boolean">
    <xsl:param name="element" as="element()"/>
    <xsl:param name="schemaLocation" as="xs:string*"/>
    <xsl:choose>
      <xsl:when test="0 = count($schemaLocation)">
        <xsl:sequence select="true()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="namespace" as="xs:anyURI" select="xs:anyURI($schemaLocation[1])"/>
        <xsl:variable name="location" as="xs:string" select="$schemaLocation[2]"/>
        <xsl:variable name="document" as="node()" select="document($location, $element)"/>
        <xsl:choose>
          <xsl:when test="empty($document)">
            <xsl:message>location <xsl:value-of select="$location"/> does not resolve to an XML document</xsl:message>
            <xsl:sequence select="false()"/>
          </xsl:when>
          <xsl:when test="empty($document/xs:schema)">
            <xsl:message>XML document at <xsl:value-of select="$location"/> does not have an xs:schema root</xsl:message>
            <xsl:sequence select="false()"/>
          </xsl:when>
          <xsl:when test="empty($document/xs:schema/@targetNamespace)">
            <xsl:message>XML Schema document at <xsl:value-of select="$location"/> does not have a target namespace</xsl:message>
            <xsl:sequence select="false()"/>
          </xsl:when>
          <xsl:when test="$namespace != $document/xs:schema/@targetNamespace">
            <xsl:message>XML Schema document at <xsl:value-of select="$location"/> does not have the expected target namespace <xsl:value-of select="$namespace"/></xsl:message>
            <xsl:sequence select="false()"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="local:schema-location-resolves($element, subsequence($schemaLocation, 3))"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="local:schema-location-has-namespace" as="xs:boolean">
    <xsl:param name="schemaLocation" as="xs:string*"/>
    <xsl:param name="namespace" as="xs:anyURI"/>
    <xsl:choose>
      <xsl:when test="0 = count($schemaLocation)">
        <xsl:sequence select="false()"/>
      </xsl:when>
      <xsl:when test="$namespace = xs:anyURI($schemaLocation[1])">
        <xsl:sequence select="true()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="local:schema-location-has-namespace(subsequence($schemaLocation, 3), $namespace)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

<!--
  <pattern>
    <rule context="*">
      <assert test="namespace-uri-for-prefix('xs', .) = "></assert>
    </rule>
  </pattern>
-->

<!--  <pattern>
    <rule context="*">
-->
<!--
      <assert test="'xs' = in-scope-prefixes(.)"
              >The namespace prefix 'xs' must be in scope for every element.</assert>
      <assert test="not('' = in-scope-prefixes(.))"
              >The default (empty) namespace prefix must not be declared.</assert>
-->

      <!-- prefixes for infrastructure schemas -->
<!--
      <assert test="local:namespace-only-bound-to(., xs:anyURI('http://www.w3.org/2001/XMLSchema'), 'xs')"
              >The namespace 'http://www.w3.org/2001/XMLSchema' must only be declared to prefix 'xs'</assert>
      <assert test="local:namespace-only-bound-to(., xs:anyURI('http://www.w3.org/2001/XMLSchema-instance'), 'xsi')"
              >The namespace 'http://www.w3.org/2001/XMLSchema-instance' must only be declared to prefix 'xsi'</assert>
      <assert test="local:namespace-only-bound-to(., xs:anyURI('MACRO_CONFORMANCE_TARGETS_NS'), 'ct')"
              >The namespace 'MACRO_CONFORMANCE_TARGETS_NS' must only be declared to prefix 'ct'</assert>
-->
      <!-- prefixes for vocabulary schemas -->
<!--
      <assert test="local:namespace-only-bound-to(., xs:anyURI('http://niem.gov/niem/codes/fbi/3.0'), 'fbi')"
              >The namespace 'http://niem.gov/niem/codes/fbi/3.0' must only be declared to prefix 'fbi'</assert>
      <assert test="local:namespace-only-bound-to(., xs:anyURI('http://release.niem.gov/niem/codes/iso_4217/3.0/'), 'iso_4217')"
              >The namespace 'http://release.niem.gov/niem/codes/iso_4217/3.0/' must only be declared to prefix 'iso_4217'</assert>
      <assert test="local:namespace-only-bound-to(., xs:anyURI('http://release.niem.gov/niem/niem-core/3.0/'), 'nc')"
              >The namespace 'http://release.niem.gov/niem/niem-core/3.0/' must only be declared to prefix 'nc'</assert>
      <assert test="local:namespace-only-bound-to(., xs:anyURI('http://release.niem.gov/niem/proxy/xsd/3.0/'), 'niem-xs')"
              >The namespace 'http://release.niem.gov/niem/proxy/xsd/3.0/' must only be declared to prefix 'niem-xs'</assert>
      <assert test="local:namespace-only-bound-to(., xs:anyURI('http://release.niem.gov/niem/structures/3.0/'), 'structures')"
              >The namespace 'http://release.niem.gov/niem/structures/3.0/' must only be declared to prefix 'structures'</assert>
      <assert test="local:namespace-only-bound-to(., xs:anyURI('http://release.niem.gov/niem/structures/3.0/'), 'structures')"
              >The namespace 'http://release.niem.gov/niem/structures/3.0/' must only be declared to prefix 'structures'</assert>
      
      <assert test="local:namespace-only-bound-to(., xs:anyURI('http://release.niem.gov/niem/domains/jxdm/5.0/'), 'jxdm')"
              >The namespace 'http://release.niem.gov/niem/domains/jxdm/5.0/' must only be declared to prefix 'jxdm'</assert>
      <assert test="local:namespace-only-bound-to(., xs:anyURI('http://release.niem.gov/niem/appinfo/3.0/'), 'appinfo')"
              >The namespace 'http://release.niem.gov/niem/appinfo/3.0/' must only be declared to prefix 'appinfo'</assert>
-->

<!--
      <assert test="local:namespace-only-bound-to(., xs:anyURI('ZNS'), 'ZP')"
              >The namespace 'ZNS' must only be declared to prefix 'ZP'</assert>
-->

<!--
    </rule>
  </pattern>
-->

  <pattern>
    <rule context="xs:element[@name]">
      <assert test="exists(@nillable) 
                    and (@nillable castable as xs:boolean)
                    and (xs:boolean(@nillable) = true())"
        >Element declaration should have nillable = true.</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="/*">
      <assert test="exists(self::xs:schema)"
              >The document element must be xs:schema</assert>
      <assert test="exists(@targetNamespace)"
              >A target namespace must be declared</assert>
      <assert test="empty(@targetNamespace) or matches(@targetNamespace, '/$')"
              >Target namespace must end in "/"</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="*[exists(@ct:conformanceTargets) and exists(parent::*)]">
      <assert test="false()"
              >@ct:conformanceTargets may only appear on a document element</assert>
    </rule>
    <rule context="*[empty(parent::*) 
                     and exists(@ct:conformanceTargets) 
                     and exists(@xsi:schemaLocation)]">
      <assert test="local:schema-location-has-namespace(
                      tokenize(normalize-space(@xsi:schemaLocation),' '), 
                      xs:anyURI('MACRO_CONFORMANCE_TARGETS_NS'))"
              >When @ct:conformanceTargets is used, the conformance targets namespace must be declared in @xsi:schemaLocation</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="*[exists(@xsi:schemaLocation)]">
      <assert test="empty(parent::*)"
              >@xsi:schemaLocation must only appear on the document element</assert>
      <assert test="count(tokenize(normalize-space(@xsi:schemaLocation), ' ')) mod 2 eq 0"
              >xsi:schemaLocation must contain an even number of items</assert>
      <assert test="local:schema-location-resolves(., tokenize(normalize-space(@xsi:schemaLocation), ' '))"
              >xsi:schemaLocation must be accurate</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="term:LocalTerm[@literal]">
      <assert test="normalize-space(@literal) = @literal"
              >The @literal of a LocalTerm must have normalized whitespace.</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="term:LocalTerm[@definition]">
      <assert test="normalize-space(@definition) = @definition"
              >The @definition of a LocalTerm must have normalized whitespace.</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="xs:enumeration">
      <assert test="normalize-space(@value) = @value">The @value of an enumeration should have normalized whitespace.</assert>
    </rule>
  </pattern>

</schema>
<!--
Local Variables:
mode: sgml
indent-tabs-mode: nil
fill-column: 9999
End:
-->
