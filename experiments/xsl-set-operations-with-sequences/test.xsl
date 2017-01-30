<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ns="http://example.org/ns"
    xmlns:set="http://example.org/set"
    version="2.0">
  <output method="text"/>

  <template match="/">
    <variable name="set1" select="('hello', 'this', 'is', 'not', 'a', 'set')"/>
    <variable name="set2" select="('goodbye', 'set', 'you', 'are', 'a', 'union')"/>
    <value-of select="string-join( set:add($set1, 'hey'), ', ' )"/>
    <text>&#10;</text>
    <value-of select="string-join( set:add($set1, 'this'), ', ' )"/>
    <text>&#10;</text>
  </template>

  <!-- operations: 
       union(a,b) -> set
       intersection(a,b) -> set
       difference(a,b) -> set -->
       
  <function name="set:add">
    <param name="set" as="item()*"/>
    <param name="item" as="item()"/>
    <sequence select="if ($item = $set) then $set else ($set, $item)"/>
  </function>

</stylesheet>
