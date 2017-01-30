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
    <for-each select="f:tokenize-camel-case(.)">
      <value-of select="if (matches(., '^[A-Z][a-z]*$'))
                        then lower-case(.)
                        else ."/>
      <text>&#10;</text>
    </for-each>
  </template>

</stylesheet>
