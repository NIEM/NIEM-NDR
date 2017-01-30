<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ns="http://example.org/ns"
    xmlns:set="http://example.org/set"
    version="2.0">
  <output method="text"/>

  <function name="ns:print-args" as="xs:boolean">
    <param name="arg1" as="xs:string"/>
    <param name="arg2" as="xs:string"/>
    <message>
      <value-of select="concat('print-args(',$arg1,', ', $arg2, ')')"/>
    </message>
    <sequence select="true()"/>
  </function>

  <template match="/">
    <variable name="set1" select="('hello', 'this', 'is', 'not', 'a', 'set')"/>
    <variable name="set2" select="('goodbye', 'set', 'you', 'are', 'a', 'union')"/>
    <value-of select="every $arg1 in $set1, 
                            $arg2 in $set2 satisfies 
                        ns:print-args($arg1, $arg2)"/>
  </template>

</stylesheet>
