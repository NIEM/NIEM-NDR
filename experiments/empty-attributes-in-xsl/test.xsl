<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
   xmlns="http://www.w3.org/1999/XSL/Transform" 
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:ns="http://example.org/ns"
   version="2.0">
  <output method="text"/>

  <template match="text()"/>

  <template match="/ns:element">
    <message>invisible cast = &quot;<value-of select="if (xs:boolean(@attribute)) then true() else false()"/>&quot;</message>
    <message>@attribute = &quot;<value-of select="@attribute"/>&quot;</message>
    <message>xs:boolean(@attribute) = &quot;<value-of select="xs:boolean(@attribute)"/>&quot;</message>
    <message>(xs:boolean(@attribute) = true()) = &quot;<value-of select="xs:boolean(@attribute) = true()"/>&quot;</message>
    <message>(xs:boolean(@attribute) = false()) = &quot;<value-of select="xs:boolean(@attribute) = false()"/>&quot;</message>
    <message>(xs:boolean( () )) = &quot;<value-of select="xs:boolean( () )"/>&quot;</message>
    <message>exists(@attribute) and xs:boolean(@attribute) = &quot;<value-of select="exists(@attribute) and xs:boolean(@attribute)"/>&quot;</message>
    <message>empty(xs:boolean(@attribute)) = &quot;<value-of select="empty(xs:boolean(@attribute))"/>&quot;</message>
  </template>

</stylesheet>
