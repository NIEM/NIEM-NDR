<?xml version="1.0" encoding="US-ASCII"?>
<stylesheet 
   version="1.0"
   xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="text"/>

  <template match="svrl:successful-report | svrl:failed-assert">
    <variable name="pattern" select="preceding-sibling::svrl:active-pattern[1]">
    </variable>
    <value-of select="concat(@lineNumber, ':', local-name(), ':', $pattern/@descriptiveID, ':', $pattern/@id, ':', $pattern/@name, '&#10;')"/>
  </template>

  <template match="text()"/>

</stylesheet>
