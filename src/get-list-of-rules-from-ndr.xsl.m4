<?xml version="1.0" encoding="us-ascii"?>
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:doc="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258"
    version="2.0">

  <import href="CONFIG_DOC_PROCESSING_COMMON_XSL"/>

  <output method="text"/>
  
  <template match="doc:rule" priority="2">
    <value-of select="@id"/>
    <text>&#9;</text>
    <value-of>
      <apply-templates select="." mode="get-label"/>
    </value-of>
    <text>&#9;</text>
    <value-of select="exactly-one(ancestor::doc:section[1]/doc:title)"/>
    <text>&#10;</text>
  </template>

  <template match="*" priority="1">
    <apply-templates/>
  </template>

  <template match="text()" priority="1"/>
  
</stylesheet>
m4_dnl Local Variables:
m4_dnl mode: sgml
m4_dnl indent-tabs-mode: nil
m4_dnl fill-column: 9999
m4_dnl  End:
