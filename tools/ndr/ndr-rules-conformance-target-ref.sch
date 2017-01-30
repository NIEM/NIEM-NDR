<?xml version="1.0" encoding="US-ASCII" standalone="yes"?><sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2"><sch:title>Rules for reference XML Schema documents</sch:title><xsl:include href="ndr-functions.xsl"/>
<sch:ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
<sch:ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>
<sch:ns prefix="nf" uri="http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#NDRFunctions"/>
<sch:ns prefix="ct" uri="http://release.niem.gov/niem/conformanceTargets/3.0/"/>
<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
<sch:ns prefix="appinfo" uri="http://release.niem.gov/niem/appinfo/3.0/"/>
<sch:ns prefix="structures" uri="http://release.niem.gov/niem/structures/3.0/"/>
<sch:ns prefix="term" uri="http://release.niem.gov/niem/localTerminology/3.0/"/>
      
<sch:pattern id="rule_4-1"><sch:title>Schema is CTAS-conformant</sch:title>
  <sch:rule context="*[. is nf:get-document-element(.)]">
    <sch:report test="true()">Rule 4-1: The document MUST be a conformant document as defined by the NIEM Conformance Targets Attribute Specification.</sch:report>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_4-2"><sch:title>Document element has conformanceTargets</sch:title>
  <sch:rule context="*[. is nf:get-document-element(.)                        or exists(@ct:conformanceTargets)]">
    <sch:assert test="(. is nf:get-document-element(.)) = exists(@ct:conformanceTargets)">Rule 4-2: An element MUST own an attribute {http://release.niem.gov/niem/conformanceTargets/3.0/}conformanceTargets if and only if it is a [document element].</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_4-3"><sch:title>Schema claims reference schema conformance target.</sch:title>
  <sch:rule context="*[. is nf:get-document-element(.)]">
    <sch:assert test="nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument'))">Rule 4-3: The document MUST have an effective conformance target identifier of http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_7-1"><sch:title>Conformance to XML</sch:title>
  <sch:rule context="*[. is nf:get-document-element(.)]">
    <sch:report test="true()">Rule 7-1: The document MUST be a well-formed XML document, as defined by Extensible Markup Language.</sch:report>
  </sch:rule>
</sch:pattern>
        
<sch:pattern id="rule_7-2"><sch:title>Conformance to XML Namespaces</sch:title>
  <sch:rule context="*[. is nf:get-document-element(.)]">
    <sch:report test="true()">Rule 7-2: The document MUST be namespace-well-formed.</sch:report>
  </sch:rule>
</sch:pattern>            
        
<sch:pattern id="rule_7-3"><sch:title>Conformance to XML Namespaces</sch:title>
  <sch:rule context="*[. is nf:get-document-element(.)]">
    <sch:report test="true()">Rule 7-3: The document MUST be namespace-valid.</sch:report>
  </sch:rule>
</sch:pattern>            
        
<sch:pattern id="rule_7-4"><sch:title>Conformance to XML Schema</sch:title>
  <sch:rule context="*[. is nf:get-document-element(.)]">
    <sch:report test="true()">Rule 7-4: The document MUST be a schema document.</sch:report>
    <sch:assert test="self::xs:schema">Rule 7-4: The document element of the XML document must be xs:schema.</sch:assert>
  </sch:rule>
</sch:pattern>            
        
<sch:pattern id="rule_9-1"><sch:title>No base type of xs:ID</sch:title>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:ID')">Rule 9-1: A schema component MUST NOT have an attribute {}base with a value of xs:ID.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-2"><sch:title>No base type of xs:IDREF</sch:title>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:IDREF')">Rule 9-2: A schema component MUST NOT have an attribute {}base with a value of xs:IDREF.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-3"><sch:title>No base type of xs:anyType</sch:title>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:anyType')">Rule 9-3: A schema component MUST NOT have an attribute {}base with a value of xs:anyType.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-4"><sch:title>No base type of xs:anySimpleType</sch:title>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:anySimpleType')">Rule 9-4: A schema component MUST NOT have an attribute {}base with a value of xs:anySimpleType.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-5"><sch:title>No base type of xs:NOTATION</sch:title>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:NOTATION')">Rule 9-5: A schema component MUST NOT have an attribute {}base with a value of xs:NOTATION.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-6"><sch:title>Simple type definition is top-level</sch:title>
  <sch:rule context="xs:simpleType">
    <sch:assert test="exists(parent::xs:schema)">Rule 9-6: A simple type definition MUST be top-level.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-7"><sch:title>Simple type has data definition</sch:title>
  <sch:rule context="xs:simpleType">
    <sch:assert test="exists(xs:annotation/xs:documentation)">Rule 9-7: A simple type MUST be a documented component.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-8"><sch:title>Simple type data definition is not empty</sch:title>
  <sch:rule context="xs:simpleType/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]">
    <sch:assert test="string-length(normalize-space(string-join(text(), ''))) &gt; 0">Rule 9-8: A data definition MUST NOT be empty.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-9"><sch:title>No list item type of xs:ID</sch:title>
  <sch:rule context="xs:*[exists(@itemType)]">
    <sch:assert test="resolve-QName(@itemType, .) != xs:QName('xs:ID')">Rule 9-9: A schema component MUST NOT have an attribute {}itemType with a value of xs:ID.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-10"><sch:title>No list item type of xs:IDREF</sch:title>
  <sch:rule context="xs:*[exists(@itemType)]">
    <sch:assert test="resolve-QName(@itemType, .) != xs:QName('xs:IDREF')">Rule 9-10: A schema component MUST NOT have an attribute {}itemType with a value of xs:IDREF.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-11"><sch:title>No list item type of xs:anySimpleType</sch:title>
  <sch:rule context="xs:*[exists(@itemType)]">
    <sch:assert test="resolve-QName(@itemType, .) != xs:QName('xs:anySimpleType')">Rule 9-11: A schema component MUST NOT have an attribute {}itemType with a value of xs:anySimpleType.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-12"><sch:title>No union member types of xs:ID</sch:title>
  <sch:rule context="xs:*[exists(@memberTypes)]">
    <sch:assert test="every $type-qname                        in tokenize(normalize-space(@memberTypes), ' ')                       satisfies resolve-QName($type-qname, .) != xs:QName('xs:ID')">Rule 9-12: A schema component MUST NOT have an attribute {}memberTypes that includes a value of xs:ID.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-13"><sch:title>No union member types of xs:IDREF</sch:title>
  <sch:rule context="xs:*[exists(@memberTypes)]">
    <sch:assert test="every $type-qname                        in tokenize(normalize-space(@memberTypes), ' ')                       satisfies resolve-QName($type-qname, .) != xs:QName('xs:IDREF')">Rule 9-13: A schema component MUST NOT have an attribute {}memberTypes that includes a value of xs:IDREF.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-14"><sch:title>No union member types of xs:anySimpleType</sch:title>
  <sch:rule context="xs:*[exists(@memberTypes)]">
    <sch:assert test="every $type-qname                        in tokenize(normalize-space(@memberTypes), ' ')                       satisfies resolve-QName($type-qname, .) != xs:QName('xs:anySimpleType')">Rule 9-14: A schema component MUST NOT have an attribute {}memberTypes that includes a value of xs:anySimpleType.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-15"><sch:title>No simple type disallowed derivation</sch:title>
  <sch:rule context="xs:simpleType">
    <sch:assert test="empty(@final)">Rule 9-15: An element xs:simpleType MUST NOT have an attribute {}final.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-16"><sch:title>Enumeration has data definition</sch:title>
  <sch:rule context="xs:enumeration">
    <sch:assert test="exists(xs:annotation/xs:documentation)">Rule 9-16: An enumeration facet MUST be a documented component.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-17"><sch:title>Enumeration data definition is not empty</sch:title>
  <sch:rule context="xs:enumeration/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]">
    <sch:assert test="string-length(normalize-space(string-join(text(), ''))) &gt; 0">Rule 9-17: A data definition MUST NOT be empty.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-18"><sch:title>Complex type definitions are top-level</sch:title>
  <sch:rule context="xs:complexType">
    <sch:assert test="exists(parent::xs:schema)">Rule 9-18: A complex type definition must be top-level.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-19"><sch:title>Complex type has data definition</sch:title>
  <sch:rule context="xs:complexType">
    <sch:assert test="exists(xs:annotation/xs:documentation)">Rule 9-19: A complex type MUST be a documented component.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-20"><sch:title>Complex type data definition is not empty</sch:title>
  <sch:rule context="xs:complexType/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]">
    <sch:assert test="string-length(normalize-space(string-join(text(), ''))) &gt; 0">Rule 9-20: A data definition MUST NOT be empty.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-21"><sch:title>No mixed content on complex type</sch:title>
  <sch:rule context="xs:complexType[exists(@mixed)]">
    <sch:assert test="xs:boolean(@mixed) = false()">Rule 9-21: A complex type declaration MUST NOT have mixed content.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-22"><sch:title>No mixed content on complex content</sch:title>
  <sch:rule context="xs:complexContent[exists(@mixed)]">
    <sch:assert test="xs:boolean(@mixed) = false()">Rule 9-22: A complex type declaration MUST NOT have mixed content.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-23"><sch:title>Complex type content is explicitly simple or complex</sch:title>
  <sch:rule context="xs:complexType">
    <sch:assert test="exists(xs:simpleContent) or exists(xs:complexContent)">Rule 9-23: An element xs:complexType MUST have a child element xs:simpleContent or xs:complexContent.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-24"><sch:title>Complex content uses extension</sch:title>
  <sch:rule context="xs:complexContent">
    <sch:assert test="exists(xs:extension)">Rule 9-24: An element xs:complexContent MUST have a child xs:extension.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-25"><sch:title>Complex type with complex content must have complex content</sch:title>
  <sch:rule context="xs:complexType[       nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument'))       or nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ExtensionSchemaDocument'))]     /xs:complexContent       /xs:*[(self::xs:restriction or self::xs:extension)             and exists(@base)]">
    <sch:let name="not-complex-content" value="for $qname in resolve-QName(@base, .),                         $not-structures-qname in $qname[namespace-uri-from-QName(.) != xs:anyURI('http://release.niem.gov/niem/structures/3.0/')],                         $base-type in nf:resolve-type(., $not-structures-qname),                         $base-complex-type in $base-type[self::xs:complexType],                         $base-not-complex-content in $base-complex-type[empty(xs:complexContent)]                     return $base-not-complex-content"/>
    <sch:assert test="empty($not-complex-content)">Rule 9-25: The base type of complex type that has complex content MUST have complex content.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-26"><sch:title>Simple content uses extension</sch:title>
  <sch:rule context="xs:simpleContent">
    <sch:assert test="exists(xs:extension)">Rule 9-26: A complex type definition with simple content schema component must have a derivation method of extension.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-27"><sch:title>Complex types with simple content have structures:SimpleObjectAttributeGroup</sch:title>
  <sch:rule context="xs:simpleContent/xs:extension[       for $base in resolve-QName(@base, .),            $base-qname in namespace-uri-from-QName($base) return         (namespace-uri-from-QName($base) = 'http://www.w3.org/2001/XMLSchema'          or (some $type in nf:resolve-type(., $base) satisfies                node-name($type) = xs:QName('xs:simpleType')             )         )      ]">
    <sch:assert test="exists(                         xs:attributeGroup[                           exists(@ref)                           and resolve-QName(@ref, .) = xs:QName('structures:SimpleObjectAttributeGroup')                         ]                       )">Rule 9-27: A complex type definition with simple content schema component with a derivation method of extension that has a base type definition that is a simple type MUST incorporate the attribute group {http://release.niem.gov/niem/structures/3.0/}SimpleObjectAttributeGroup.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-28"><sch:title>No complex type disallowed substitutions</sch:title>
  <sch:rule context="xs:complexType">
    <sch:assert test="empty(@block)">Rule 9-28: An element xs:complexType MUST NOT have an attribute {}block.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-29"><sch:title>No complex type disallowed derivation</sch:title>
  <sch:rule context="xs:complexType">
    <sch:assert test="empty(@final)">Rule 9-29: An element xs:complexType MUST NOT have an attribute {}final.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-30"><sch:title>Element declaration is top-level</sch:title>
  <sch:rule context="xs:element[exists(@name)]">
    <sch:assert test="exists(parent::xs:schema)">Rule 9-30: An element declaration MUST be top-level.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-31"><sch:title>Element declaration has data definition</sch:title>
  <sch:rule context="xs:element[exists(@name)]">
    <sch:assert test="exists(xs:annotation/xs:documentation)">Rule 9-31: An element declaration MUST be a documented component.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-32"><sch:title>Element declaration data definition is not empty</sch:title>
  <sch:rule context="xs:element[exists(@name)]/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]">
    <sch:assert test="string-length(normalize-space(string-join(text(), ''))) &gt; 0">Rule 9-32: A data definition MUST NOT be empty.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-33"><sch:title>Untyped element is abstract</sch:title>
  <sch:rule context="xs:schema/xs:element[empty(@type)]">
    <sch:assert test="exists(@abstract)                       and xs:boolean(@abstract) = true()">Rule 9-33: A top-level element declaration that has no type MUST be abstract.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-34"><sch:title>Element of type xs:anySimpleType is abstract</sch:title>
  <sch:rule context="xs:element[exists(@type)                                 and resolve-QName(@type, .) = xs:QName('xs:anySimpleType')]">
    <sch:assert test="exists(@abstract)                       and xs:boolean(@abstract) = true()">Rule 9-34: An element declaration that has a type xs:anySimpleType MUST be abstract.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-35"><sch:title>Element type not in the XML Schema namespace</sch:title>
  <sch:rule context="xs:element[exists(@type)]">
    <sch:assert test="for $type-qname in resolve-QName(@type, .) return                         $type-qname = xs:QName('xs:anySimpleType')                         or namespace-uri-from-QName($type-qname) != xs:anyURI('http://www.w3.org/2001/XMLSchema')">Rule 9-35: An element type that is not xs:anySimpleType MUST NOT have a namespace name <namespace-uri-for-prefix xmlns="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258">xs</namespace-uri-for-prefix>.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-36"><sch:title>Element type not in a special namespace</sch:title>
  <sch:rule context="xs:element[exists(@type)]">
    <sch:assert test="not(namespace-uri-from-QName(resolve-QName(@type, .))                           = (xs:anyURI('http://www.w3.org/XML/1998/namespace'),                                xs:anyURI('urn:us:gov:ic:ism'),                                xs:anyURI('urn:us:gov:ic:ntk')))">Rule 9-36: An element type MUST NOT have a namespace name that is in a special namespace.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-38"><sch:title>No element disallowed substitutions </sch:title>
  <sch:rule context="xs:element">
    <sch:assert test="empty(@block)">Rule 9-38: An element xs:element MUST NOT have an attribute {}block.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-39"><sch:title>No element disallowed derivation</sch:title>
  <sch:rule context="xs:element">
    <sch:assert test="empty(@final)">Rule 9-39: An element xs:element MUST NOT have an attribute {}final.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-40"><sch:title>No element default values</sch:title>
  <sch:rule context="xs:element">
    <sch:assert test="empty(@default)">Rule 9-40: An element xs:element MUST NOT have an attribute {}default.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-41"><sch:title>No element fixed values</sch:title>
  <sch:rule context="xs:element">
    <sch:assert test="empty(@fixed)">Rule 9-41: An element xs:element MUST NOT have an attribute {}fixed.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-42"><sch:title>Element declaration is nillable</sch:title>
  <sch:rule context="xs:element[exists(@name)                                 and (empty(@abstract)                                      or xs:boolean(@abstract) = false())]">
    <sch:assert test="exists(@nillable)                       and xs:boolean(@nillable) = true()">Rule 9-42: An [element declaration schema component] MUST have the nillable property with a value of true.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-43"><sch:title>Attribute declarations are top-level</sch:title>
  <sch:rule context="xs:attribute[exists(@name)]">
    <sch:assert test="exists(parent::xs:schema)">Rule 9-43: An attribute declaration MUST be top-level.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-44"><sch:title>Attribute declaration has data definition</sch:title>
  <sch:rule context="xs:attribute[exists(@name)]">
    <sch:assert test="exists(xs:annotation/xs:documentation)">Rule 9-44: An attribute declaration MUST be a documented component.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-45"><sch:title>Attribute declaration data definition is not empty</sch:title>
  <sch:rule context="xs:attribute[exists(@name)]/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]">
    <sch:assert test="string-length(normalize-space(string-join(text(), ''))) &gt; 0">Rule 9-45: A data definition MUST NOT be empty.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-46"><sch:title>Attribute declaration has type</sch:title>
  <sch:rule context="xs:attribute[exists(@name)]">
    <sch:assert test="exists(@type)">Rule 9-46: A top-level attribute declaration MUST have a type.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-47"><sch:title>No attribute type of xs:ID</sch:title>
  <sch:rule context="xs:attribute[exists(@type)]">
    <sch:assert test="resolve-QName(@type, .) != xs:QName('xs:ID')">Rule 9-47: A schema component MUST NOT have an attribute {}type with a value of xs:ID.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-48"><sch:title>No attribute type of xs:IDREF</sch:title>
  <sch:rule context="xs:attribute[exists(@type)]">
    <sch:assert test="resolve-QName(@type, .) != xs:QName('xs:IDREF')">Rule 9-48: A schema component MUST NOT have an attribute {}type with a value of xs:IDREF.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-49"><sch:title>No attribute default values</sch:title>
  <sch:rule context="xs:attribute">
    <sch:assert test="empty(@default)">Rule 9-49: An element xs:attribute MUST NOT have an attribute {}default.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-50"><sch:title>No attribute fixed values</sch:title>
  <sch:rule context="xs:attribute">
    <sch:assert test="empty(@fixed)">Rule 9-50: An element xs:attribute MUST NOT have an attribute {}fixed.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-51"><sch:title>No use of element xs:notation</sch:title>
  <sch:rule context="xs:notation">
    <sch:assert test="false()">Rule 9-51: The schema SHALL NOT contain the element xs:notation.</sch:assert>
  </sch:rule>
</sch:pattern>
  
<sch:pattern id="rule_9-53"><sch:title>No xs:all</sch:title>
  <sch:rule context="xs:all">
    <sch:assert test="false()">Rule 9-53: The schema SHALL NOT contain the element xs:all</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-54"><sch:title>xs:sequence must be child of xs:extension</sch:title>
  <sch:rule context="xs:sequence">
    <sch:assert test="exists(parent::xs:extension)">Rule 9-54: An element xs:sequence must be a child of element xs:extension.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-56"><sch:title>No xs:choice</sch:title>
  <sch:rule context="xs:choice">
    <sch:assert test="false()">Rule 9-56: The schema SHALL NOT contain the element xs:choice</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-58"><sch:title>Sequence minimum cardinality</sch:title>
  <sch:rule context="xs:sequence">
    <sch:assert test="empty(@minOccurs) or xs:integer(@minOccurs) = 1">Rule 9-58: An element xs:sequence MUST either not have the attribute {}minOccurs, or that attribute MUST have a value of 1.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-59"><sch:title>Sequence maximum cardinality</sch:title>
  <sch:rule context="xs:sequence">
    <sch:assert test="empty(@maxOccurs) or (@maxOccurs instance of xs:integer                                             and 1 = xs:integer(@maxOccurs))">Rule 9-59: An element xs:sequence MUST either not have the attribute {}maxOccurs, or that attribute MUST have a value of 1.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-62"><sch:title>Attribute ref defined by conformant schemas</sch:title>
  <sch:rule context="xs:attribute[exists(@ref)]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@ref, .))"/>
    <sch:assert test="$namespace = nf:get-target-namespace(.)                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])">Rule 9-62: An attribute {}ref MUST have the target namespace or a namespace that is imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-63"><sch:title>Only known attribute groups</sch:title>
  <sch:rule context="xs:attributeGroup[exists(@ref)]">
    <sch:assert test="for $ref in exactly-one(resolve-QName(@ref, .)) return       ($ref = xs:QName('structures:SimpleObjectAttributeGroup')        or (for $ref-namespace in exactly-one(namespace-uri-from-QName($ref)) return              $ref-namespace = (xs:anyURI('urn:us:gov:ic:ism'),                               xs:anyURI('urn:us:gov:ic:ntk'))))">Rule 9-63: An attribute group reference MUST be structures:SimpleObjectAttributeGroup or have the IC-ISM or IC-NTK namespace.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-64"><sch:title>No use of xs:any</sch:title>
  <sch:rule context="xs:any">
    <sch:assert test="false()">Rule 9-64: The schema SHALL NOT contain the element xs:any.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-65"><sch:title>No use of xs:anyAttribute</sch:title>
  <sch:rule context="xs:anyAttribute">
    <sch:assert test="false()">Rule 9-65: The schema SHALL NOT contain the element xs:anyAttribute.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-66"><sch:title>No use of xs:unique</sch:title>
  <sch:rule context="xs:unique">
    <sch:assert test="false()">Rule 9-66: The schema SHALL NOT contain the element xs:unique.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-67"><sch:title>No use of xs:key</sch:title>
  <sch:rule context="xs:key">
    <sch:assert test="false()">Rule 9-67: The schema SHALL NOT contain the element xs:key.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-68"><sch:title>No use of xs:keyref</sch:title>
  <sch:rule context="xs:keyref">
    <sch:assert test="false()">Rule 9-68: The schema SHALL NOT contain the element xs:keyref.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-69"><sch:title>No use of xs:selector</sch:title>
  <sch:rule context="xs:selector">
    <sch:assert test="false()">Rule 9-69: The schema SHALL NOT contain the element xs:selector.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-70"><sch:title>No use of xs:field</sch:title>
  <sch:rule context="xs:field">
    <sch:assert test="false()">Rule 9-70: The schema SHALL NOT contain the element xs:field.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-71"><sch:title>No use of xs:group</sch:title>
  <sch:rule context="xs:group">
    <sch:assert test="false()">Rule 9-71: The schema MUST NOT contain the element xs:group.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-72"><sch:title>No definition of attribute groups</sch:title>
  <sch:rule context="xs:attributeGroup[@name]">
    <sch:assert test="false()">Rule 9-72: The schema MUST NOT contain an attribute group definition schema component.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-73"><sch:title>Comments are not recommended</sch:title>
  <sch:rule context="comment()">
    <sch:report test="true()">Rule 9-73: An XML Comment is not an XML Schema annotation component; XML Comments SHOULD NOT appear in the schema.</sch:report>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-74"><sch:title>Documentation elements have no element children</sch:title>
  <sch:rule context="xs:documentation/node()">
    <sch:assert test="self::text() or self::comment()">Rule 9-74: A child of element xs:documentation MUST be text or an XML comment.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-75"><sch:title>Appinfo has elements</sch:title>
  <sch:rule context="xs:appinfo/node()">
    <sch:assert test="self::comment() or self::element()">Rule 9-75: A child of element xs:appinfo MUST be an element or an XML comment.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-76"><sch:title>Appinfo child elements have namespaces</sch:title>
  <sch:rule context="xs:appinfo/*">
    <sch:assert test="namespace-uri() != xs:anyURI('')">Rule 9-76: An element that is a child of xs:appinfo MUST have a namespace name.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-77"><sch:title>Appinfo descendants are not XML Schema elements</sch:title>
  <sch:rule context="xs:appinfo//xs:*">
    <sch:assert test="false()">Rule 9-77: An element with a namespace name of xs: MUST NOT have an ancestor element xs:appinfo.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-78"><sch:title>Schema has data definition</sch:title>
  <sch:rule context="xs:schema">
    <sch:assert test="exists(xs:annotation/xs:documentation)">Rule 9-78: A schema document element MUST be a documented component.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-79"><sch:title>Schema data definition is not empty</sch:title>
  <sch:rule context="xs:schema/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]">
    <sch:assert test="string-length(normalize-space(string-join(text(), ''))) &gt; 0">Rule 9-79: A data definition MUST NOT be empty.</sch:assert>
  </sch:rule>
</sch:pattern>
      
<sch:pattern id="rule_9-80"><sch:title>Define target namespace</sch:title>
  <sch:rule context="xs:schema">
    <sch:assert test="exists(@targetNamespace)">Rule 9-80: The schema MUST define a target namespace.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-81"><sch:title>Target namespace is absolute URI</sch:title>
  <sch:rule context="xs:schema[exists(@targetNamespace)]">
    <sch:report test="true()">Rule 9-81: The value of the attribute targetNamespace MUST match the production &lt;absolute-URI&gt; as defined by RFC 3986.</sch:report>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-82"><sch:title>Schema must have version</sch:title>
  <sch:rule context="xs:schema">
    <sch:assert test="exists(@version)">Rule 9-82: An element xs:schema must have an attribute {}version.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-83"><sch:title>Schema version must not be empty.</sch:title>
  <sch:rule context="xs:schema[exists(@version)]">
    <sch:assert test="string-length(normalize-space(@version)) &gt; 0">Rule 9-83: An attribute version owned by an element xs:schema must not be empty.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-84"><sch:title>No disallowed substitutions</sch:title>
  <sch:rule context="xs:schema">
    <sch:assert test="empty(@blockDefault)">Rule 9-84: An element xs:schema MUST NOT have an attribute {}blockDefault.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-85"><sch:title>No disallowed derivations</sch:title>
  <sch:rule context="xs:schema">
    <sch:assert test="empty(@finalDefault)">Rule 9-85: An element xs:schema MUST NOT have an attribute {}finalDefault.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-86"><sch:title>No use of xs:redefine</sch:title>
  <sch:rule context="xs:redefine">
    <sch:assert test="false()">Rule 9-86: The schema MUST NOT contain the element xs:redefine.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-87"><sch:title>No use of xs:include</sch:title>
  <sch:rule context="xs:include">
    <sch:assert test="false()">Rule 9-87: The schema MUST NOT contain the element xs:include.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_9-88"><sch:title>xs:import must have namespace</sch:title>
  <sch:rule context="xs:import">
    <sch:assert test="exists(@namespace)">Rule 9-88: An element xs:import MUST have an attribute {}namespace.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_10-3"><sch:title>An object type with complex content is derived from an object type</sch:title>
  <sch:rule context="xs:complexType[       exists(xs:complexContent)       and not(ends-with(@name, 'AssociationType')           or ends-with(@name, 'MetadataType')           or ends-with(@name, 'AugmentationType'))]">
    <sch:assert test="         for $derivation-method in (xs:complexContent/xs:extension, xs:complexContent/xs:restriction),             $base in $derivation-method/@base,             $base-qname in resolve-QName($base, $derivation-method)           return ($base-qname = xs:QName('structures:ObjectType')                   or (for $base-namespace in namespace-uri-from-QName($base-qname) return                         (not($base-namespace                                = (xs:anyURI('http://www.w3.org/XML/1998/namespace'),                                   xs:anyURI('urn:us:gov:ic:ism'),                                   xs:anyURI('urn:us:gov:ic:ntk')))                          and (for $base-local-name in local-name-from-QName($base-qname) return                                 not(ends-with($base-local-name, 'AssociationType')                                     or ends-with($base-local-name, 'MetadataType')                                     or ends-with($base-local-name, 'AugmentationType'))                              )                         )                       )                   )">Rule 10-3: An object type with complex content MUST be derived from structures:Object type or from another object type.</sch:assert>
  </sch:rule>
</sch:pattern>
                
<sch:pattern id="rule_10-4"><sch:title>RoleOf element type is an object type</sch:title>
  <sch:rule context="xs:element[@name[starts-with(., 'RoleOf')]]">
    <sch:assert test="every $type in @type,                             $type-local-name in local-name-from-QName(resolve-QName($type, .)) satisfies                         not(ends-with($type-local-name, 'AssociationType')                             or ends-with($type-local-name, 'MetadataType')                             or ends-with($type-local-name, 'AugmentationType'))">Rule 10-4: The type definition of a RoleOf element SHALL be an object type.</sch:assert>
  </sch:rule>
</sch:pattern>
                
<sch:pattern id="rule_10-5"><sch:title>Only object types have RoleOf element</sch:title>
  <sch:rule context="xs:complexType[       empty(@appinfo:externalAdapterTypeIndicator)       and exists(descendant::xs:element[             exists(@ref[               starts-with(local-name-from-QName(resolve-QName(., ..)), 'RoleOf')])])]">
    <sch:assert test="not(ends-with(@name, 'AssociationType')                           or ends-with(@name, 'MetadataType')                           or ends-with(@name, 'AugmentationType'))">Rule 10-5: A complex type that includes a RoleOf element in its content model SHALL be an object type.</sch:assert>
  </sch:rule>
</sch:pattern>
                
<sch:pattern id="rule_10-16"><sch:title>External adapter type has complex content</sch:title>
  <sch:rule context="xs:complexType[exists(@appinfo:externalAdapterTypeIndicator)]">
    <sch:assert test="xs:complexContent">Rule 10-16: An external adapter type definition must be a complex type definition with complex content.</sch:assert>
  </sch:rule>
</sch:pattern>
                
<sch:pattern id="rule_10-17"><sch:title>External adapter type uses extension</sch:title>
  <sch:rule context="xs:complexType[exists(@appinfo:externalAdapterTypeIndicator)                                     and exists(xs:complexContent)]">
    <sch:assert test="xs:complexContent/xs:extension">Rule 10-17: An external adapter type definition must be use the extension derivation method.</sch:assert>
  </sch:rule>
</sch:pattern>
                
<sch:pattern id="rule_10-18"><sch:title>External adapter type extends structures:ObjectType</sch:title>
  <sch:rule context="xs:complexType[exists(@appinfo:externalAdapterTypeIndicator)                                     and exists(xs:complexContent/xs:extension)]">
    <sch:assert test="for $extension in xs:complexContent/xs:extension return                         resolve-QName($extension/@base, $extension) = xs:QName('structures:ObjectType')">Rule 10-18: An external adapter type definition MUST extend structures:ObjectType.</sch:assert>
  </sch:rule>
</sch:pattern>
                
<sch:pattern id="rule_10-19"><sch:title>External adapter types use sequence</sch:title>
  <sch:rule context="xs:complexType[exists(@appinfo:externalAdapterTypeIndicator)                                     and exists(xs:complexContent/xs:extension)]">
    <sch:assert test="exists(xs:complexContent/xs:extension/xs:sequence)">Rule 10-19: An external adapter type must use sequence as its top-level compositor.</sch:assert>
  </sch:rule>
</sch:pattern>
                
<sch:pattern id="rule_10-20"><sch:title>The name of a code type ends in "CodeType"</sch:title>
  <sch:rule context="xs:complexType">
    <sch:let name="has-code-type-name" value="ends-with(@name, 'CodeType')"/>
    <sch:let name="has-code-type-base" value="         exists(xs:simpleContent[           exists(xs:*[local-name() = ('extension', 'restriction')                       and (ends-with(@base, 'CodeSimpleType')                            or ends-with(@base, 'CodeType'))])])"/>
    <sch:assert test="$has-code-type-name = $has-code-type-base">Rule 10-20: A complex type with a [base type] of a code type or code simple type MUST have a name that ends in 'CodeType'.</sch:assert>
  </sch:rule>
</sch:pattern>
                
<sch:pattern id="rule_10-23"><sch:title>Association types are derived from association types</sch:title>
  <sch:rule context="xs:complexType">
    <sch:let name="is-association-type" value="exists(@name[ends-with(., 'AssociationType')])"/>
    <sch:let name="has-association-base-type" value="       exists(xs:complexContent[         exists(xs:*[local-name() = ('extension', 'restriction')                     and exists(@base[ends-with(., 'AssociationType')])])])"/>
    <sch:assert test="$is-association-type = $has-association-base-type">Rule 10-23: A type MUST have a association type name if an only if it is derived from a association type.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_10-24"><sch:title>Association element is an element of an association type</sch:title>
  <sch:rule context="xs:element[exists(@name)]">
    <sch:assert test="exists(@type[ends-with(., 'AssociationType')])                       = exists(@name[ends-with(., 'Association')])">Rule 10-24: An element MUST have a name that ends in 'Association' if and only if it has a type that is a association type.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_10-29"><sch:title>Augmentable type has augmentation point</sch:title>
  <sch:rule context="xs:complexType[                        exists(@name[                          not(ends-with(., 'MetadataType'))                          and not(ends-with(., 'AugmentationType'))])                        and empty(@appinfo:externalAdapterTypeIndicator)                        and exists(child::xs:complexContent)]">
    <sch:let name="augmentation-point-qname" value="QName(nf:get-target-namespace(.),                           replace(./@name, 'Type$', 'AugmentationPoint'))"/>
    <sch:assert test="count(xs:complexContent/xs:extension/xs:sequence/xs:element[                               exists(@ref[resolve-QName(., ..) = $augmentation-point-qname])]) = 1">Rule 10-29: An augmentable type MUST contain exactly one reference its augmentation point element.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-30"><sch:title>An augmentation point corresponds to an augmentable type</sch:title>
  <sch:rule context="xs:element[exists(@name[                                  matches(., 'AugmentationPoint$')])]">
    <sch:let name="element-name" value="@name"/>
    <sch:assert test="exists(                         parent::xs:schema/xs:complexType[                           @name = replace($element-name, 'AugmentationPoint$', 'Type')                           and exists(@name[                                   not(ends-with(., 'MetadataType'))                                   and not(ends-with(., 'AugmentationType'))])                                 and empty(@appinfo:externalAdapterTypeIndicator)                                 and exists(child::xs:complexContent)])">Rule 10-30: A schema document defining an augmentation point element MUST also define a corresponding [augmentable type].</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-31"><sch:title>An augmentation point has no type</sch:title>
  <sch:rule context="xs:element[exists(@name[                                  matches(., 'AugmentationPoint$')])]">
    <sch:assert test="empty(@type)">Rule 10-31: An augmentation point element MUST have no type.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-32"><sch:title>An augmentation point has no substitution group</sch:title>
  <sch:rule context="xs:element[exists(@name[                                  matches(., 'AugmentationPoint$')])]">
    <sch:assert test="empty(@substitutionGroup)">Rule 10-32: An augmentation point element MUST have no substitution group.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-33"><sch:title>Augmentation element may only be referenced by its type</sch:title>
  <sch:rule context="xs:complexType//xs:element[exists(@ref[                        matches(local-name-from-QName(resolve-QName(., ..)), 'AugmentationPoint$')]) ]">

    <sch:assert test="QName(nf:get-target-namespace(ancestor::xs:complexType[1]), ancestor::xs:complexType[1]/@name)                       = QName(namespace-uri-from-QName(resolve-QName(@ref, .)),                 replace(local-name-from-QName(resolve-QName(@ref, .)), 'AugmentationPoint$', 'Type'))">Rule 10-33: An augmentation element MUST only be referenced by its corresponding type.</sch:assert>
  </sch:rule>
</sch:pattern>            
            
<sch:pattern id="rule_10-34"><sch:title>Augmentation reference is optional</sch:title>
  <sch:rule context="xs:complexType//xs:element[exists(@ref[                            matches(local-name-from-QName(resolve-QName(., ..)), 'AugmentationPoint$')]) ]">
    <sch:assert test="exists(@minOccurs) and xs:integer(@minOccurs) = 0">Rule 10-34: An augmentation element particle MUST have attribute minOccurs equal to 0.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-35"><sch:title>Augmentation reference is unbounded</sch:title>
  <sch:rule context="xs:complexType//xs:element[exists(@ref[                            matches(local-name-from-QName(resolve-QName(., ..)), 'AugmentationPoint$')]) ]">
    <sch:assert test="exists(@maxOccurs) and string(@maxOccurs) = 'unbounded'">Rule 10-35: An augmentation element particle MUST have attribute maxOccurs set to unbounded.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-36"><sch:title>Augmentation reference must be last particle</sch:title>
  <sch:rule context="xs:complexType//xs:element[exists(@ref[                            matches(local-name-from-QName(resolve-QName(., ..)), 'AugmentationPoint$')]) ]">
    <sch:assert test="empty(following-sibling::*)">Rule 10-36: An augmentation element particle MUST be the last element atom in its content model.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-38"><sch:title>Augmentation type derived from augmentation type</sch:title>
  <sch:rule context="xs:complexType[@name[ends-with(., 'AugmentationType')]]">
    <sch:assert test="xs:complexContent/                         xs:*[self::xs:extension or self::xs:restriction]/                           @base[resolve-QName(., ..) = xs:QName('structures:AugmentationType')                                 or ends-with(., 'AugmentationType')]">Rule 10-38: The [base type definition] of an [augmentation type] MUST be either structures:AugmentationType or an [augmentation type].</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-39"><sch:title>Augmentation types are derived from augmentation types</sch:title>
  <sch:rule context="xs:complexType">
    <sch:let name="is-augmentation-type" value="exists(@name[ends-with(., 'AugmentationType')])"/>
    <sch:let name="has-augmentation-base-type" value="       exists(xs:complexContent[         exists(xs:*[local-name() = ('extension', 'restriction')                     and exists(@base[ends-with(., 'AugmentationType')])])])"/>
    <sch:assert test="$is-augmentation-type = $has-augmentation-base-type">Rule 10-39: A type MUST have a augmentation type name if an only if it is derived from a augmentation type.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_10-40"><sch:title>Augmentation element is an element of an augmentation type</sch:title>
  <sch:rule context="xs:element[exists(@name)]">
    <sch:assert test="exists(@type[ends-with(., 'AugmentationType')])                       = exists(@name[ends-with(., 'Augmentation')])">Rule 10-40: An element MUST have a name that ends in 'Augmentation' if and only if it has a type that is a augmentation type.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_10-45"><sch:title>Metadata types are derived from metadata types</sch:title>
  <sch:rule context="xs:complexType">
    <sch:let name="is-metadata-type" value="exists(@name[ends-with(., 'MetadataType')])"/>
    <sch:let name="has-metadata-base-type" value="       exists(xs:complexContent[         exists(xs:*[local-name() = ('extension', 'restriction')                     and exists(@base[ends-with(., 'MetadataType')])])])"/>
    <sch:assert test="$is-metadata-type = $has-metadata-base-type">Rule 10-45: A type MUST have a metadata type name if an only if it is derived from a metadata type.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_10-69"><sch:title>Deprecated annotates schema component</sch:title>
  <sch:rule context="*[exists(@appinfo:deprecated)]">
    <sch:assert test="namespace-uri-from-QName(node-name(.)) = xs:anyURI('http://www.w3.org/2001/XMLSchema')">Rule 10-69: The attribute appinfo:deprecated MUST be owned by an element with a namespace name <namespace-uri-for-prefix xmlns="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258">xs</namespace-uri-for-prefix>.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_10-70"><sch:title>External import indicator annotates import</sch:title>
  <sch:rule context="*[exists(@appinfo:externalImportIndicator)]">
    <sch:assert test="exists(self::xs:import)">Rule 10-70: The attribute {http://release.niem.gov/niem/appinfo/3.0/}externalImportIndicator MUST be owned by an element xs:import.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_10-71"><sch:title>External adapter type indicator annotates complex type</sch:title>
  <sch:rule context="*[exists(@appinfo:externalAdapterTypeIndicator)]">
    <sch:assert test="exists(self::xs:complexType)">Rule 10-71: The attribute appinfo:externalAdapterTypeIndicator MUST be owned by an element xs:complexType.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_10-72"><sch:title>Applies to types annotates metadata element</sch:title>
  <sch:rule context="*[exists(@appinfo:appliesToTypes)]">
    <sch:assert test="exists(self::xs:element[exists(@name)                                and ends-with(@name, 'Metadata')])">Rule 10-72: The attribute appinfo:appliesToTypes MUST be owned by a metadata element.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-74"><sch:title>Applies to elements annotates metadata element</sch:title>
  <sch:rule context="*[exists(@appinfo:appliesToElements)]">
    <sch:assert test="exists(self::xs:element[                           exists(@name)                           and ends-with(@name, 'Metadata')])">Rule 10-74: The attribute appinfo:appliesToElements MUST be owned by a metadata element.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-76"><sch:title>LocalTerm annotates schema</sch:title>
  <sch:rule context="term:LocalTerm">
    <sch:assert test="parent::xs:appinfo[parent::xs:annotation[parent::xs:schema]]">Rule 10-76: The element {http://release.niem.gov/niem/localTerminology/3.0/}LocalTerm MUST be application information an an element xs:schema.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_10-77"><sch:title>LocalTerm has literal or definition</sch:title>
  <sch:rule context="term:LocalTerm">
    <sch:assert test="exists(@literal) or exists(@definition)">Rule 10-77: The element {http://release.niem.gov/niem/localTerminology/3.0/}LocalTerm MUST have a literal or definition.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_11-1"><sch:title>Name of type ends in "Type"</sch:title>
  <sch:rule context="xs:complexType[exists(@name)                        and exists(xs:simpleContent/xs:extension/@base)                        and (for $extension in xs:simpleContent/xs:extension,                                 $base-qname in resolve-QName($extension/@base, $extension) return                               $base-qname = QName('http://www.w3.org/2001/XMLSchema', @name))]">
    <sch:report test="false()">Rule 11-1: The name of a proxy type does not end in "Type".</sch:report>
  </sch:rule>
  <sch:rule context="xs:*[(self::xs:simpleType or self::xs:complexType) and exists(@name)]">
    <sch:assert test="ends-with(@name, 'Type')">Rule 11-1: A type definition schema component that does not define a proxy type MUST have a name that ends in "Type".</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_11-2"><sch:title>Name of type is in upper camel case</sch:title>
  <sch:rule context="xs:complexType[exists(@name)                        and exists(xs:simpleContent/xs:extension/@base)                        and (for $extension in xs:simpleContent/xs:extension,                                 $base-qname in resolve-QName($extension/@base, $extension) return                               $base-qname = QName('http://www.w3.org/2001/XMLSchema', @name))]">
    <sch:report test="false()">Rule 11-2: The name of a proxy type is not upper camel case.</sch:report>
  </sch:rule>
  <sch:rule context="xs:*[(self::xs:simpleType or self::xs:complexType) and exists(@name)]">
    <sch:assert test="matches(@name, '^([A-Z][A-Za-z0-9\-]*)+$')">Rule 11-2: A type definition schema component that does not define a proxy type MUST be in upper camel case.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_11-3"><sch:title>Base type definition defined by conformant schema</sch:title>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@base, .))"/>
    <sch:assert test="$namespace = (nf:get-target-namespace(.), xs:anyURI('http://www.w3.org/2001/XMLSchema'))                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])">Rule 11-3: The [base type definition] of a [type definition] MUST have the target namespace or the XML Schema namespace or a namespace that is imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_11-4"><sch:title>Name of simple type ends in "SimpleType"</sch:title>
  <sch:rule context="xs:simpleType[@name]">
    <sch:assert test="ends-with(@name, 'SimpleType')">Rule 11-4: A simple type definition schema component MUST have a name that ends in "SimpleType".</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_11-5"><sch:title>Name of simple type is upper camel case</sch:title>
  <sch:rule context="xs:simpleType[exists(@name)]">
    <sch:assert test="matches(string(@name), '^([A-Z][A-Za-z0-9\-]*)+$')">Rule 11-5: The name of a simple type definition schema component MUST be upper camel case.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_11-7"><sch:title>List item type defined by conformant schemas</sch:title>
  <sch:rule context="xs:list[exists(@itemType)]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@itemType, .))"/>
    <sch:assert test="$namespace = (nf:get-target-namespace(.), xs:anyURI('http://www.w3.org/2001/XMLSchema'))                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])">Rule 11-7: The item type of a list simple type definition MUST have a target namespace equal to the target namespace of the XML Schema document within which it is defined, or a namespace that is imported as conformant by the schema document within which it is defined.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_11-8"><sch:title>Union member types defined by conformant schemas</sch:title>
  <sch:rule context="xs:union[exists(@memberTypes)]">
    <sch:assert test="every $qname in tokenize(normalize-space(@memberTypes), ' '),                             $namespace in namespace-uri-from-QName(resolve-QName($qname, .))                       satisfies ($namespace = nf:get-target-namespace(.)                                  or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                            and $namespace = xs:anyURI(@namespace)                                            and empty(@appinfo:externalImportIndicator)]))">Rule 11-8: Every member type of a union simple type definition MUST have a target namespace that is equal to either the target namespace of the XML Schema document within which it is defined or a namespace that is imported as conformant by the schema document within which it is defined.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_11-9"><sch:title>Name of a code simple type has standard suffix</sch:title>
  <sch:rule context="xs:simpleType[exists(@name)       and (xs:restriction/xs:enumeration            or xs:restriction[ends-with(local-name-from-QName(resolve-QName(@base, .)), 'CodeSimpleType')])]">
    <sch:assert test="ends-with(@name, 'CodeSimpleType')">Rule 11-9: A simple type definition schema component that has an enumeration facet or that is derived from a code type MUST have a name that ends in "CodeSimpleType".</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_11-10"><sch:title>Code simple type has enumerations</sch:title>
  <sch:rule context="xs:simpleType[exists(@name) and ends-with(@name, 'CodeSimpleType')]">
    <sch:assert test="xs:restriction[ends-with(local-name-from-QName(resolve-QName(@base, .)), 'CodeSimpleType')]                       or xs:restriction/xs:enumeration                       or (for $union in xs:union,                              $member-types in $union/@memberTypes return                            some $member-type in tokenize(normalize-space($member-types), ' ') satisfies                              ends-with(local-name-from-QName(resolve-QName($member-type, $union)), 'CodeSimpleType'))">Rule 11-10: A code simple type MUST be derived from a code simple type or have an enumeration facet.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_11-11"><sch:title>Element name is upper camel case</sch:title>
  <sch:rule context="xs:element[exists(@name)]">
    <sch:assert test="matches(string(@name), '^([A-Z][A-Za-z0-9\-]*)+$')">Rule 11-11: The name of an element declaration schema component MUST be upper camel case.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_11-12"><sch:title>Element type does not have a simple type name</sch:title>
  <sch:rule context="xs:element[exists(@type)]">
    <sch:assert test="not(ends-with(@type, 'SimpleType'))">Rule 11-12: The {type definition} of an [element declaration] MUST NOT have a {name} that ends in 'SimpleType'.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_11-13"><sch:title>Element type is from conformant namespace</sch:title>
  <sch:rule context="xs:element[exists(@type)]">
    <sch:assert test="for $type-qname in resolve-QName(@type, .),                           $type-namespace in namespace-uri-from-QName($type-qname) return                         $type-namespace = nf:get-target-namespace(.)                         or exists(nf:get-document-element(.)/xs:import[                                     xs:anyURI(@namespace) = $type-namespace                                     and empty(@appinfo:externalImportIndicator)])">Rule 11-13: The {type definition} of an {element declaration} MUST have a {target namespace} that is the target namesapce, or one that is imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_11-14"><sch:title>Name of element that ends in "Abstract" must be abstract</sch:title>
  <sch:rule context="xs:element[@name[ends-with(., 'Abstract')]]">
    <sch:assert test="exists(@abstract) and xs:boolean(@abstract) = true()">Rule 11-14: An element with a name that ends in 'Abstract' MUST be abstract.</sch:assert>
  </sch:rule>
</sch:pattern>
	    
<sch:pattern id="rule_11-15"><sch:title>Name of element that ends in "Representation" must be abstract</sch:title>
  <sch:rule context="xs:element[@name[ends-with(., 'Representation')]]">
    <sch:assert test="exists(@abstract) and xs:boolean(@abstract) = true()">Rule 11-15: An element with a name that ends in 'Representation' MUST be abstract.</sch:assert>
  </sch:rule>
</sch:pattern>
	    
<sch:pattern id="rule_11-16"><sch:title>Elements with simple content use representation term</sch:title>
  <sch:rule context="xs:element[       (nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument'))        or nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ExtensionSchemaDocument')))       and exists(@name)        and exists(@type)]">
    <sch:let name="has-simple-content" value="       some $type in nf:resolve-type(., resolve-QName(@type, .)) satisfies         exists($type[exists(xs:simpleContent)])"/>
    <sch:let name="name-uses-representation-term" value="       some $representation-term in ('Amount', 'BinaryObject', 'Graphic', 'Picture', 'Sound', 'Video', 'Code', 'DateTime', 'Date', 'Time', 'Duration', 'ID', 'URI', 'Indicator', 'Measure', 'Numeric', 'Value', 'Rate', 'Percent', 'Quantity', 'Text', 'Name', 'List') satisfies         ends-with(@name, $representation-term)"/>
    <sch:assert test="if ($has-simple-content) then $name-uses-representation-term else true()">Rule 11-16: the name of an element declaration that is of simple content MUST use a representation term.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_11-17"><sch:title>Metadata element is an element of a metadata type</sch:title>
  <sch:rule context="xs:element[exists(@name)]">
    <sch:assert test="exists(@type[ends-with(., 'MetadataType')])                       = exists(@name[ends-with(., 'Metadata')])">Rule 11-17: An element MUST have a name that ends in 'Metadata' if and only if it has a type that is a metadata type.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_11-18"><sch:title>Element substitution group defined by conformant schemas</sch:title>
  <sch:rule context="xs:element[exists(@substitutionGroup)]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@substitutionGroup, .))"/>
    <sch:assert test="$namespace = nf:get-target-namespace(.)                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])">Rule 11-18: An element substitution group MUST have either the target namespace or a namespace that is imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_11-19"><sch:title>Attribute type defined by conformant schemas</sch:title>
  <sch:rule context="xs:attribute[exists(@type)]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@type, .))"/>
    <sch:assert test="$namespace = (nf:get-target-namespace(.), xs:anyURI('http://www.w3.org/2001/XMLSchema'))                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])">Rule 11-19: The type of an attribute declaration MUST have the target namespace or the XML Schema namespace or a namespace that is imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_11-20"><sch:title>Attribute name uses representation term</sch:title>
  <sch:rule context="xs:attribute[exists(@name)]">
    <sch:assert test="some $representation-term in ('Amount', 'BinaryObject', 'Graphic', 'Picture', 'Sound', 'Video', 'Code', 'DateTime', 'Date', 'Time', 'Duration', 'ID', 'URI', 'Indicator', 'Measure', 'Numeric', 'Value', 'Rate', 'Percent', 'Quantity', 'Text', 'Name', 'List') satisfies                         ends-with(@name, $representation-term)">Rule 11-20: An attribute name MUST end with a representation term.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_11-22"><sch:title>Element ref in external type defined by external schemas</sch:title>
  <sch:rule context="xs:element[exists(@ref)                                 and exists(ancestor::xs:complexType[exists(@appinfo:externalAdapterTypeIndicator)])]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@ref, .))"/>
    <sch:assert test="$namespace != nf:get-target-namespace(.)                       and exists(nf:get-document-element(.)/self::xs:schema/xs:import[                           exists(@namespace)                           and $namespace = xs:anyURI(@namespace)                           and xs:boolean(@appinfo:externalImportIndicator) = true()])">Rule 11-22: An element reference that appears within an external adapter type MUST have a target namespace that is imported as external.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_11-23"><sch:title>Element reference defined by conformant schemas</sch:title>
  <sch:rule context="xs:element[exists(ancestor::xs:complexType[empty(@appinfo:externalAdapterTypeIndicator)]) and exists(@ref)]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@ref, .))"/>
    <sch:assert test="$namespace = nf:get-target-namespace(.)                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])">Rule 11-23: An element reference MUST be to a component that has a namespace that is either the target namespace of the [schema document] in which it appears, or which is imported as conformant by that [schema document].</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_11-34"><sch:title>Structures imported as conformant</sch:title>
  <sch:rule context="xs:import[exists(@namespace)                                 and xs:anyURI(@namespace) = xs:anyURI('http://release.niem.gov/niem/structures/3.0/')]">
    <sch:assert test="empty(@appinfo:externalImportIndicator)">Rule 11-34: The structures namespace MUST be imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>          
            
<sch:pattern id="rule_11-35"><sch:title>Schema for XML imported as conformant</sch:title>
  <sch:rule context="xs:import[exists(@namespace)                                and xs:anyURI(@namespace) = xs:anyURI('http://www.w3.org/XML/1998/namespace')]">
    <sch:assert test="empty(@appinfo:externalImportIndicator)">Rule 11-35: The namespace for XML MUST be imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>          
            
<sch:pattern id="rule_11-36"><sch:title>Schema for IC-ISM imported as conformant</sch:title>
  <sch:rule context="xs:import[exists(@namespace)                                and xs:anyURI(@namespace) = xs:anyURI('urn:us:gov:ic:ism')]">
    <sch:assert test="empty(@appinfo:externalImportIndicator)">Rule 11-36: The namespace for IC-ISM MUST be imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>          
            
<sch:pattern id="rule_11-37"><sch:title>Schema for IC-NTK imported as conformant</sch:title>
  <sch:rule context="xs:import[exists(@namespace)                                and xs:anyURI(@namespace) = xs:anyURI('urn:us:gov:ic:ntk')]">
    <sch:assert test="empty(@appinfo:externalImportIndicator)">Rule 11-37: The namespace for IC-NTK MUST be imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>          
            
<sch:pattern id="rule_11-39"><sch:title>Consistently marked namespace imports</sch:title>
  <sch:rule context="xs:import">
    <sch:let name="namespace" value="@namespace"/>
    <sch:let name="is-conformant" value="empty(@appinfo:externalImportIndicator)"/>
    <sch:let name="first" value="exactly-one(parent::xs:schema/xs:import[@namespace = $namespace][1])"/>
    <sch:assert test=". is $first                       or $is-conformant = empty($first/@appinfo:externalImportIndicator)">Rule 11-39: All xs:import elements that have the same namespace MUST have the same conformance marking via appinfo:externalImportIndicator.</sch:assert>
  </sch:rule>
</sch:pattern>
          </sch:schema>