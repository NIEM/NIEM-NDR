<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ns="http://example.org/ns"
    xmlns:set="http://example.org/set"
    version="2.0">

  <output method="text"/>

  <template match="/">
    <value-of select="replace('img/this-is-a-file.png', '^img/(.*)$', 'img-base64/$1.base64')"/>
    <text>&#10;</text>
    <value-of select="matches('img/this-is-a-file.png', '^img/[^/]+$')"/>
    <text>&#10;</text>
  </template>

</stylesheet>
