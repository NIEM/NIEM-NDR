<?xml version="1.0" encoding="US-ASCII"?>
<stylesheet 
   version="1.0"
   xmlns:results="http://example.org/ns/results"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="text"/>

  <template match="results:results">
    <apply-templates>
      <sort select="@lineNumber" data-type="number"/>
      <sort select="@descriptiveID"/>
    </apply-templates>
  </template>

  <template match="results:successful-report">
    <value-of select="concat(@lineNumber, ':', @descriptiveID, ':report', '&#10;')"/>
  </template>

  <template match="results:failed-assert">
    <value-of select="concat(@lineNumber, ':', @descriptiveID, ':failed assert', '&#10;')"/>
  </template>

  <template match="text()"/>

</stylesheet>
