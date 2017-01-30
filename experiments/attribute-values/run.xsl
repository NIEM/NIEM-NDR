<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">
  <output method="text"/>

  <template match="/">
    <for-each select="*/*">
      <text>START(</text>
      <value-of select="@a1"/>
      <text>)END&#10;</text>
    </for-each>
  </template>

</stylesheet>
