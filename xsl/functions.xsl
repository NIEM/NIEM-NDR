<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    version="2.0"
    xmlns:catalog="urn:oasis:names:tc:entity:xmlns:xml:catalog"
    xmlns:ct="http://release.niem.gov/niem/conformanceTargets/3.0/"
    xmlns:f="http://example.org/validation-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/XSL/Transform">

  <function name="f:get-effective-conformance-targets" as="xs:anyURI*">
    <param name="context" as="element()"/>
    <variable name="candidates" select="root($context)/descendant-or-self::*[exists(@ct:conformanceTargets)]"/>
    <sequence select="if (empty($candidates))
                      then ()
                      else for $uri 
                           in tokenize(normalize-space($candidates[1]/@ct:conformanceTargets),' ')
                           return xs:anyURI($uri)"/>
  </function>

  <function name="f:has-effective-conformance-target" as="xs:boolean">
    <param name="context" as="element()"/>
    <param name="match" as="xs:string"/>
    <sequence select="some $conformance-target in f:get-effective-conformance-targets($context)
                      satisfies $conformance-target = xs:anyURI($match)"/>
  </function>



</stylesheet>
