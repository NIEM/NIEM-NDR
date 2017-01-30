<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="1.0">

  <param name="in"/>

  <output method="text"/>

  <template match="text()"/>

  <template match="xs:sequence">
    <value-of select="$in"/>
    <text>: </text>
    <value-of select="name(parent::*)"/>
    <text>&#10;</text>
  </template>

</stylesheet>
