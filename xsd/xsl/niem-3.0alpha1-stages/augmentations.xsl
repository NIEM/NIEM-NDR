<?xml version="1.0" encoding="us-ascii"?>
<stylesheet 
   exclude-result-prefixes="i20 tns s20 c saxon"
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
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output indent="yes" method="xml" version="1.0" encoding="us-ascii"/>

  <include href="common.xsl"/>

  <function name="tns:is-augmentable-type" as="xs:boolean">
    <param name="context()" as="element()"/>
    <sequence select="
      exists($context/self::xs:complexType[
        exists(@name)
        and not(matches(@name, 'AugmentationType$'))
      ]/xs:complexContent/xs:extension)
      "></sequence>
  </function>

  <function name="tns:get-augmentation-point-name-from-type-name" as="xs:string">
    <param name="type-name" as="xs:string"/>
    <value-of select="replace($type-name, 'Type$', 'AugmentationPoint')"/>
  </function>

  <template match="xs:complexType[tns:is-augmentable-type(.)]/xs:complexContent/xs:extension/xs:sequence">
    <if test="c:assert(., exists(../../../@name), 'greatgrandparent has no name')"/>
    <variable name="type-name" select="../../../@name" as="xs:string"/>
    <variable name="augmentation-point-local-name"
              select="tns:get-augmentation-point-name-from-type-name($type-name)"/>
    <copy>
      <apply-templates select="@*|node()"/>
      <xs:element ref="{c:get-qname-string(., QName(c:get-target-namespace(.), $augmentation-point-local-name))}"
                  minOccurs="0"
                  maxOccurs="unbounded"/>
    </copy>
  </template>

  <template match="xs:complexType[tns:is-augmentable-type(.)]">
    <if test="c:assert(., exists(@name), 'must have name')"/>
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
    <xs:element name="{tns:get-augmentation-point-name-from-type-name(@name)}" abstract="true">
      <xs:annotation>
        <xs:documentation>
          <text>An augmentation point for </text>
          <value-of select="if (matches(@name, '^[AEIOU])) then 'an' else 'a'"/>
          <text> </text>
          <value-of select="@name"/>
          <text>.</text>
        </xs:documentation>
      </xs:annotation>
    </xs:element>
  </template>

</stylesheet>
