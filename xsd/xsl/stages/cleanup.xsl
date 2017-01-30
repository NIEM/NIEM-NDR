<?xml version="1.0" encoding="us-ascii"?>
<stylesheet 
   exclude-result-prefixes="i20 tns s20 c saxon"
   version="2.0"
   xmlns:c="http://example.org/common"
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

  <include href="common.xsl"/>

  <template match="/">
    <sequence select="tns:cleanup(.)"/>
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

  <template match="xs:appinfo[c:empty-element(.)]" mode="cleanup"/>
  <template match="xs:annotation[c:empty-element(.)]" mode="cleanup"/>

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

  <template match="i20:ConformantIndicator" mode="cleanup"/>
  <template match="i20:AppliesTo" mode="cleanup"/>
  <template match="i20:Base" mode="cleanup"/>

  <template match="@*|node()" priority="-1" mode="cleanup">
    <copy>
      <apply-templates select="@*|node()" mode="cleanup"/>
    </copy>
  </template>

</stylesheet>
