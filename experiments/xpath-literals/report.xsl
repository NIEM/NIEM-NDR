<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">
  <output method="text"/>

  <template match="/xs:schema/(xs:simpleType | xs:complexType)">
    <text>Matched </text>
    <value-of select="local-name()"/>
    <text> </text>
    <value-of select="@name"/>
    <text>&#10;</text>
  </template>

  <template match="text()"/>

</stylesheet>
