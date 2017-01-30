<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
   version="2.0"
   xmlns:doc="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258"
   xmlns:sch="http://purl.oclc.org/dsdl/schematron"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl-out="http://www.w3.org/1999/XSL/Transform/out" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:common="https://iead.ittl.gtri.org/wr24/document/functions/common/2011-10-05-1029"
   exclude-result-prefixes="doc xsl common">

  <xsl:import href="CONFIG_DOC_PROCESSING_COMMON_XSL"/>

  <xsl:namespace-alias stylesheet-prefix="xsl-out" result-prefix="xsl"/>

  <xsl:output method="xml" 
          version="1.0"
          encoding="US-ASCII"
          indent="no"
          standalone="yes"/>

  <xsl:param name="blurb-set" required="yes"/>
  <xsl:param name="title" required="yes"/>

  <xsl:template match="/">
    <xsl:if test="empty(doc:document)">
      <xsl:message terminate="yes">Not a doc:document.</xsl:message>
    </xsl:if>
    <xsl:if test="empty(doc:document/doc:blurbSet[@id = $blurb-set])">
      <xsl:message terminate="yes">Blurb set &quot;<xsl:value-of select="$blurb-set"/>&quot; not found</xsl:message>
    </xsl:if>
    <sch:schema queryBinding="xslt2">
      <sch:title><xsl:value-of select="normalize-space($title)"/></sch:title>
      <xsl-out:include href="ndr-functions.xsl"/>
      <xsl:apply-templates select="//doc:xmlBlurb[
                                   $blurb-set = tokenize(normalize-space(@memberOf), ' ')
                               ]/node()"/>
    </sch:schema>
  </xsl:template>

  <xsl:template match="sch:assert | sch:report">
    <xsl:copy copy-namespaces="no" inherit-namespaces="no">
      <xsl:apply-templates select="@*"/>
      <xsl:if test="exists(ancestor::doc:rule)">
        <xsl:apply-templates select="exactly-one(ancestor::doc:rule[1])" mode="get-label"/>
        <xsl:text>: </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="sch:pattern">
    <xsl:copy copy-namespaces="no" inherit-namespaces="no">
      <xsl:apply-templates select="@*[not(local-name() = 'id') 
                                      and not(namespace-uri() = xs:anyURI(''))]"/>
      <xsl:attribute name="id">
        <xsl:value-of select="concat('rule_', common:item-get-number(ancestor::doc:rule[1]))"/>
      </xsl:attribute>
      <sch:title>
        <xsl:apply-templates select="exactly-one((ancestor::doc:section | ancestor::doc:ruleSection)[last()]/doc:title)/node()"
                             mode="text"/>
      </sch:title>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy copy-namespaces="no">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="text()" mode="text">
    <xsl:value-of select="for $string in normalize-space(concat('X', ., 'X'))
                          return substring($string, 2, string-length($string) - 2)"/>
  </xsl:template>

  <!-- text things we might find in rule titles -->
  <xsl:template match="doc:code|doc:qName" mode="text">
    <xsl:apply-templates select="node()" mode="text"/>
  </xsl:template>

  <xsl:template match="doc:q" mode="text">
    <xsl:choose>
      <xsl:when test="(count(ancestor::doc:q) div 2) = 0">
        <xsl:text>&quot;</xsl:text>
        <xsl:apply-templates select="node()" mode="text"/>
        <xsl:text>&quot;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>&apos;</xsl:text>
        <xsl:apply-templates select="node()" mode="text"/>
        <xsl:text>&apos;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="@*|node()" priority="-1" mode="text">
    <xsl:message terminate="yes">Found unknown node: <xsl:value-of select="node-name(.)"/></xsl:message>
  </xsl:template>

</xsl:stylesheet>
<!-- 
  Local Variables:
  mode: sgml
  indent-tabs-mode: nil
  fill-column: 9999
  End:
-->
