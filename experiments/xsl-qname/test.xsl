<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ns="http://example.org/ns"
    xmlns:set="http://example.org/set"
    version="2.0">

  <output method="text"/>

  <variable name="ns-xs" select="namespace-uri-from-QName('xs:none' cast as xs:QName)"/>

  <function name="ns:clark-name" as="xs:string">
    <param name="qname" as="xs:QName"/>
    <value-of select="concat('{', namespace-uri-from-QName($qname), '}', local-name-from-QName($qname))"/>
  </function>

  <template match="/">
    <variable name="namespace-uri" as="xs:anyURI" select="xs:anyURI('http://example.com/')"/>
    <variable name="local-name" as="xs:string" select="'something'"/>
    <variable name="xs-qname" as="xs:QName" select="QName($namespace-uri, $local-name)"/>
    <variable name="qname" as="xs:QName" select="xs:QName('ns:something')"/>
    <value-of select="namespace-uri-from-QName('ns:nothing' cast as xs:QName)"/>
    <text>&#10;</text>
    <value-of select="namespace-uri-from-QName('xs:none' cast as xs:QName)"/>
    <text>&#10;</text>
    <value-of select="$ns-xs"/>
    <text>&#10;</text>
    <value-of select="ns:clark-name(for $qname in 'xs:string'
                                    return xs:QName('xs:string'))"/>
    <text>&#10;</text>
    <variable name="doc">
      <ns:something attr="hello" other="goodbye">
        <ns:otherthing>some value</ns:otherthing>
      </ns:something>
    </variable>
    <variable name="el" select="$doc/*[1]" as="element()"/>
    <variable name="qn2" select="node-name($el)" as="xs:QName"/>
    <value-of select="ns:clark-name($qn2)"/>
    <text>&#10;</text>
  </template>

</stylesheet>
