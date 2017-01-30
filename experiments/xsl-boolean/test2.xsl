<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ns="http://example.org/ns"
    version="2.0">
  <output method="text"/>

  <function name="ns:seq" as="xs:string">
    <param name="seq" as="xs:string*"/>
    <value-of select="string-join($seq, ',')"/>
  </function>

  <template match="/">
    <value-of select="ns:seq(('this', 'is', 'an', 'experiment'))"/>
  </template>

</stylesheet>
