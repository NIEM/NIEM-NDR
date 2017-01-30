<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://example.org/functions"
    version="2.0">

  <import href="functions.xsl"/>

  <output method="text"/>

  <template match="/">
    <apply-templates/>
  </template>

  <template match="@*|node()" priority="-1">
    <apply-templates select="@*|node()"/>
  </template>

  <template match="text()"/>

  <template match="@name">
    <value-of select="."/>
    <text> -&gt; </text>
    <variable name="sequence" as="xs:string*" select="f:tokenize-camel-case(.)"/>
    <value-of select="f:print-sequence($sequence)"/>
    <text>&#10;</text>
    <if test=". != string-join($sequence, '')"><message terminate="yes">Failed on <value-of select="."/>.</message></if>
  </template>

</stylesheet>
