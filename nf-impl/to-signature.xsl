<?xml version="1.0" encoding="UTF-8"?>
<stylesheet 
   version="2.0"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="text"/>

  <template match="xsl:function">
    <value-of select="@name"/>
    <text>(</text>
    <for-each select="xsl:param">
      <if test="position() &gt; 1">
        <text>, </text>
      </if>
      <text>$</text>
      <value-of select="@name"/>
      <text> as </text>
      <value-of select="@as"/>
    </for-each>
    <text>) as </text>
    <value-of select="@as"/>
    <text>&#10;</text>
  </template>

  <template match="text()"/>

</stylesheet>
