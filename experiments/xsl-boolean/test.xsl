<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ns="http://example.org/ns"
    version="2.0">

  <output method="text"/>

  <variable name="value">
    <ns:element attribute2="true" attribute3="false"></ns:element>
  </variable>

  <template match="/"
>attribute1:<value-of select="xs:boolean($value/ns:element/@attribute1)"/>
attribute2:<value-of select="xs:boolean($value/ns:element/@attribute2)"/>
attribute3:<value-of select="xs:boolean($value/ns:element/@attribute3)"/>
attribute4:<value-of select="xs:boolean($value/ns:element/@attribute4)"/></template>

</stylesheet>
