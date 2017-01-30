<?xml version="1.0" encoding="us-ascii"?>
<stylesheet 
   exclude-result-prefixes="i20 tns s20 c saxon"
   version="2.0"
   xmlns:c="http://example.org/common"
   xmlns:f="http://ittl.gtri.org/wr24/2009-03-10-1439/xsl-functions"
   xmlns:ct="http://release.niem.gov/niem/conformanceTargets/3.0/"
   xmlns:i20="http://release.niem.gov/niem/appinfo/2.0" 
   xmlns:s20="http://release.niem.gov/niem/structures/2.0" 
   xmlns:saxon="http://saxon.sf.net/"
   xmlns:structures="http://release.niem.gov/niem/structures/3.0/"
   xmlns:tns="http://example.org/this-namespace"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output indent="yes" method="xml" version="1.0" encoding="us-ascii"/>

  <include href="common.xsl"/>

  <param name="PATH_TO_ROOT" as="xs:string" select="'PATH_TO_ROOT UNSET'"/>

  <template match="xs:schema">
    <if test="f:assert(., 
                exists(xs:annotation/xs:appinfo/i20:ConformantIndicator[xs:boolean(.) = true()]),
                'xs:schema must have ConformantIndicator')"/>
    <copy>
      <attribute name="ct:conformanceTargets"
        >http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument</attribute>
      <attribute name="xsi:schemaLocation"
        >http://release.niem.gov/niem/conformanceTargets/3.0/ <value-of select="$PATH_TO_ROOT"/>/conformanceTargets/3.0/conformanceTargets.xsd</attribute>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <!-- omit the old schema location -->
  <template match="attribute::xsi:schemaLocation"/>

  <template match="xs:complexType/xs:complexContent/xs:extension/@base[resolve-QName(., ..) = QName($ns-s3, 'ComplexObjectType')]">
    <attribute name="base">
      <value-of select="c:get-qname-string(.., QName($ns-s3, 'ObjectType'))"/>
    </attribute>
  </template>

  <template match="i20:Base"/>
  <template match="i20:ConformantIndicator"/>
  <template match="i20:ExternalAdapterTypeIndicator"/>
  <template match="i20:AppliesTo"/>

</stylesheet>
