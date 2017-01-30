<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">
  <output method="text"/>

  <template match="/">
    <variable name="seq" as="xs:string*" select="'a', 'b', 'c'"/>
    <value-of select="'a' = $seq"/>
    <text>&#10;</text>
    <value-of select="'a' is $seq"/>
    <text>&#10;</text>
  </template>

</stylesheet>
