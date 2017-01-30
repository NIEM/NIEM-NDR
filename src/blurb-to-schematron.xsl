<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<xsl:stylesheet 
   exclude-result-prefixes="xsl out"
   version="2.0"
   xmlns:out="http://iead.ittl.gtri.org/wr24/doc/2012-07-31-1611/out"    
   xmlns:sch="http://purl.oclc.org/dsdl/schematron"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl-out="http://www.w3.org/1999/XSL/Transform/out" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:namespace-alias stylesheet-prefix="xsl-out" result-prefix="xsl"/>

  <xsl:param name="title" as="xs:string" select="'TITLE UNSET'"/>

  <xsl:output method="xml" version="1.0" encoding="UTF-8"/>

  <xsl:template match="/">
    <sch:schema queryBinding="xslt2">

      <!-- <xsl:include href="xsd-functions.xsl"/> -->

      <sch:title><xsl:value-of select="$title"/></sch:title>

      <xsl-out:include href="ndr-functions.xsl"/>

      <xsl:apply-templates select="out:result/node()"/>

    </sch:schema>
  </xsl:template>

  <!-- the standard abstract-to-concrete pattern collapser in the
       default schematron distribution does not process parameters in
       concrete patterns that don't have @id. Go figure. So we add one. -->
  <xsl:template match="sch:pattern[exists(@is-a) and empty(@id)]">
    <xsl:copy copy-namespaces="no" inherit-namespaces="no">
      <xsl:attribute name="id" select="generate-id(.)"/>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- just copy everything else -->
  <xsl:template match="@*|node()" priority="-1">
    <xsl:copy copy-namespaces="no" inherit-namespaces="no">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
