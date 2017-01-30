<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="1.0">

  <output method="text"/>

  <template match="/*">
    <text>{</text>
    <value-of select="namespace-uri()"/>
    <text>}</text>
    <value-of select="local-name()"/>
    <text>&#10;</text>
  </template>

</stylesheet>
