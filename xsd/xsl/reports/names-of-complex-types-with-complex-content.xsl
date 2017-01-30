<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">
  <output method="text"/>

  <template match="/">
    <text>Complex types with complex content:&#10;</text>
    <apply-templates select="node()"/>
  </template>

  <template match="/xs:schema/xs:complexType[exists(xs:complexContent)]">
    <value-of select="@name"/>
    <text>&#10;</text>
  </template>

  <template match="text()" priority="-1"/>

  <template match="@*|node()" priority="-2">
    <apply-templates select="@*|node()"/>
  </template>

</stylesheet>
