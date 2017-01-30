<?xml version="1.0" encoding="us-ascii"?>
<stylesheet 
   exclude-result-prefixes="i20 tns s20"
   version="2.0"
   xmlns:saxon="http://saxon.sf.net/"
   xmlns:ct="http://release.niem.gov/niem/conformanceTargets/3.0/"
   xmlns:i20="http://niem.gov/niem/appinfo/2.0" 
   xmlns:s20="http://niem.gov/niem/structures/2.0" 
   xmlns:structures="http://release.niem.gov/niem/structures/3.0/"
   xmlns:tns="http://example.org/this-namespace"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns="http://www.w3.org/1999/XSL/Transform"
   >

  <output indent="yes" method="xml" version="1.0" encoding="us-ascii"/>

  <variable name="ns-s20" as="xs:anyURI" select="xs:anyURI('http://niem.gov/niem/structures/2.0')"/>

  <!-- 

    1. This does not clean up schemas; It only makes them 3.0 conformant.

    2. This script converts all conformant schemas to reference schemas.

    3. This only works on schemas out of the SSGT.

    -->
  
  <param name="PATH_TO_ROOT" as="xs:string" select="'PATH_TO_ROOT UNSET'"/>

  <template match="/">
    <variable name="phase-1">
      <apply-templates select="." mode="locate"/>
    </variable>
    <variable name="phase0">
      <apply-templates select="$phase-1" mode="renamespace"/>
    </variable>
    <variable name="phase1">
      <apply-templates select="$phase0" mode="augment"/>
    </variable>
    <variable name="phase2">
      <apply-templates select="$phase1" mode="prune"/>
    </variable>
    <variable name="phase3">
      <sequence select="tns:cleanup($phase2)"/>
    </variable>
    <sequence select="$phase3"/>
  </template>

  <function name="tns:cleanup" as="item()*">
    <param name="input" as="item()*"/>
    <variable name="cleaned-up" as="item()*">
      <apply-templates select="$input" mode="cleanup"/>
    </variable>
    <choose>
      <when test="deep-equal($input, $cleaned-up)">
        <sequence select="$cleaned-up"/>
      </when>
      <otherwise>
        <sequence select="tns:cleanup($cleaned-up)"/>
      </otherwise>
    </choose>
  </function>

  <!-- ################################################################## -->
  <!-- locate -->

  <template mode="locate"
            match="*">
    <copy>
      <attribute name="tns:location" select="tns:get-location(.)"/>
      <apply-templates select="@*|node()" mode="locate"/>
    </copy>
  </template>

  <template match="@*|node()" priority="-1" mode="locate">
    <copy>
      <apply-templates select="@*|node()" mode="locate"/>
    </copy>
  </template>

  <!-- ###################################################################### -->
  <!-- augment -->

  <template match="xs:schema" mode="augment">
    <copy>
    <if test="exists(xs:annotation/xs:appinfo/i20:ConformantIndicator[xs:boolean(.) = true()])">
      <attribute name="ct:conformanceTargets"
                 >http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument</attribute>
    </if>
    <attribute name="xsi:schemaLocation"
        >http://release.niem.gov/niem/conformanceTargets/3.0/ <value-of select="$PATH_TO_ROOT"/>/conformanceTargets/3.0/conformanceTargets.xsd</attribute>
    <apply-templates select="@*|node()" mode="augment"/>
    </copy>
  </template>

  <function name="tns:get-location" as="xs:string">
    <param name="context" as="element()"/>
    <choose>
      <when test="exists($context/@tns:location)">
        <value-of select="$context/@tns:location"/>
      </when>
      <otherwise>
        <value-of>
          <value-of select="base-uri($context)"/>
          <text>:</text>
          <value-of select="saxon:line-number($context)"/>
        </value-of>
      </otherwise>
    </choose>
  </function>

  <function name="tns:fail">
    <param name="context"/>
    <param name="message" as="xs:string"/>
    <message terminate="yes">
      <value-of select="tns:get-location($context)"/>
      <text>:</text>
      <value-of select="$message"/>
    </message>
  </function>

  <function name="tns:assert">
    <param name="context"/>
    <param name="condition" as="xs:boolean"/>
    <param name="message" as="xs:string"/>
    <if test="not($condition)">
      <sequence select="tns:fail($context,concat('assert:',$message))"/>
    </if>
  </function>

  <template match="xs:complexType/xs:complexContent" mode="augment">
<!--    <if test="exists(.//xs:sequence)">
      <message terminate="yes"><value-of select="tns:get-location(.)"/>complex content thing does not have sequence.</message>
    </if> 
    <sequence select="tns:assert(., exists(.//xs:sequence), 
                        'complexContent thing does not have sequence')"/>
    -->
  </template>

  <template match="@*|node()" priority="-1" mode="augment">
    <copy>
      <apply-templates select="@*|node()" mode="augment"/>
    </copy>
  </template>

  <!-- ###################################################################### -->
  <!-- prune -->

  <template match="i20:Base" mode="prune"/>

  <template match="i20:ConformantIndicator" mode="prune"/>

  <template match="i20:AppliesTo" mode="prune"/>

  <template match="xs:import[@namespace = 'http://niem.gov/niem/appinfo/2.0']" mode="prune"/>
  <template match="xs:import[@namespace = 'http://niem.gov/niem/structures/2.0']" mode="prune"/>

  <template match="@*|node()" priority="-1" mode="prune">
    <copy>
      <apply-templates select="@*|node()" mode="prune"/>
    </copy>
  </template>

  <!-- ###################################################################### -->
  <!-- cleanup -->

  <function name="tns:empty-element" as="xs:boolean">
    <param name="element" as="element()"/>
    <sequence select="
        not(
          exists($element/@*)
          or exists($element/*)
          or string-length(normalize-space(string($element/text()))) &gt; 0)"/>
  </function>

  <template match="xs:appinfo[tns:empty-element(.)]" mode="cleanup"/>
  <template match="xs:annotation[tns:empty-element(.)]" mode="cleanup"/>

  <template mode="cleanup"
            match="xs:*[
                   ((local-name() = ('simpleType', 'complexType', 'element', 'attribute')
                     and parent::xs:schema)
                    or local-name() = 'enumeration')
                   and empty(./xs:annotation/xs:documentation)]">
    <copy>
      <apply-templates mode="cleanup" select="@*"/>
      <xs:annotation>
        <xs:documentation>Undocumented component.</xs:documentation>
      </xs:annotation>
      <apply-templates mode="cleanup" select="node()"/>
    </copy>
  </template>    

  <template match="xs:element[matches(@name,'Augmentation$')]" mode="cleanup">
    <copy>
      <apply-templates select="@*|node()" mode="cleanup"/>
    </copy>
  </template>

  <!-- just copy everything else -->
  <template match="@*|node()" priority="-1" mode="cleanup">
    <copy>
      <apply-templates select="@*|node()" mode="cleanup"/>
    </copy>
  </template>

  <!-- ###################################################################### -->
  <!-- renamespace -->

  <template mode="renamespace"
            match="/xs:schema">
    <variable name="context" select="."/>
    <element name="xs:schema">
      <namespace name="structures">http://release.niem.gov/niem/structures/3.0/</namespace>
      <for-each select="in-scope-prefixes(.)">
        <variable name="prefix" select="."/>
        <variable name="namespace-uri" select="namespace-uri-for-prefix($prefix, $context)"/>
        <choose>
          <when test="$namespace-uri = ('http://niem.gov/niem/structures/2.0', 'http://niem.gov/niem/appinfo/2.0', 'http://www.w3.org/2001/XMLSchema')"/>
          <otherwise>
            <namespace name="{$prefix}" select="$namespace-uri"/>
          </otherwise>
        </choose>
      </for-each>
      <apply-templates mode="renamespace" select="@*|node()"/>
    </element>
  </template>

  <template mode="renamespace"
            match="xs:*">
    <element name="xs:{local-name()}">
      <apply-templates mode="renamespace" select="@*|node()"/>
    </element>
  </template>

  <template mode="renamespace"
            match="xs:*/@*[local-name() = ('ref', 'base', 'type', 'itemType', 'memberTypes')
                           and namespace-uri() = '']">
    <variable name="ref-qname" as="xs:QName" select="resolve-QName(., ..)"/>
    <if test="not(namespace-uri-from-QName($ref-qname) = tns:in-scope-namespace-uris(..))">
      <message terminate="yes">assert 2013-02-10-1322</message>
    </if>
    <attribute name="{local-name()}">
      <sequence select="tns:get-qname-string(.., resolve-QName(., ..))"/>
    </attribute>
  </template>

  <!-- just copy everything else -->
  <template match="@*|node()" priority="-1" mode="renamespace">
    <copy>
      <apply-templates select="@*|node()" mode="renamespace"/>
    </copy>
  </template>

</stylesheet>
