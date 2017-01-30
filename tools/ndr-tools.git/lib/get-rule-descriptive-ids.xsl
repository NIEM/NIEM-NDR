<?xml version="1.0" encoding="US-ASCII"?>
<stylesheet 
   version="1.0"
   xmlns:map="http://example.org/ns/map"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="text"/>

  <template match="map:rule[@descriptiveID]">
    <if test="string-length(normalize-space(@descriptiveID)) &gt; 0">
      <value-of select="@descriptiveID"/>
      <text>&#10;</text>
    </if>
    <apply-templates/>
  </template>

  <template match="text()"/>

</stylesheet>
