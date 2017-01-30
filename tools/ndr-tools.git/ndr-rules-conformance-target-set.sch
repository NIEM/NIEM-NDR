<?xml version="1.0" encoding="US-ASCII" standalone="yes"?><sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2"><sch:title>Rules for XML Schema document sets</sch:title><xsl:include href="ndr-functions.xsl"/>
<sch:ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
<sch:ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>
<sch:ns prefix="nf" uri="http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#NDRFunctions"/>
<sch:ns prefix="ct" uri="http://release.niem.gov/niem/conformanceTargets/3.0/"/>
<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
<sch:ns prefix="appinfo" uri="http://release.niem.gov/niem/appinfo/3.0/"/>
<sch:ns prefix="structures" uri="http://release.niem.gov/niem/structures/3.0/"/>
<sch:ns prefix="term" uri="http://release.niem.gov/niem/localTerminology/3.0/"/>
      
<sch:pattern id="rule_9-25"><sch:title>Complex type with complex content must have complex content</sch:title>
  <sch:rule context="xs:complexType[       nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument'))       or nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ExtensionSchemaDocument'))]     /xs:complexContent       /xs:*[(self::xs:restriction or self::xs:extension)             and exists(@base)]">
    <sch:let name="not-complex-content" value="for $qname in resolve-QName(@base, .),                         $not-structures-qname in $qname[namespace-uri-from-QName(.) != xs:anyURI('http://release.niem.gov/niem/structures/3.0/')],                         $base-type in nf:resolve-type(., $not-structures-qname),                         $base-complex-type in $base-type[self::xs:complexType],                         $base-not-complex-content in $base-complex-type[empty(xs:complexContent)]                     return $base-not-complex-content"/>
    <sch:assert test="empty($not-complex-content)">Rule 9-25: The base type of complex type that has complex content MUST have complex content.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_9-27"><sch:title>A complex type with simple content has structures:SimpleObjectAttributeGroup</sch:title>
  <sch:rule context="xs:simpleContent/xs:extension[       for $base in resolve-QName(@base, .),            $base-namespace in namespace-uri-from-QName($base),           $target-namespace in nf:get-target-namespace(.) return (         $base-namespace = 'http://www.w3.org/2001/XMLSchema'         or some $type in nf:resolve-type(., $base) satisfies              node-name($type) = xs:QName('xs:simpleType'))]">
    <sch:assert test="exists(xs:attributeGroup[                         some $ref in @ref satisfies                           resolve-QName($ref, .) = xs:QName('structures:SimpleObjectAttributeGroup')])">Rule 9-27: A complex type definition with simple content schema component with a derivation method of extension that has a base type definition that is a simple type MUST incorporate the attribute group {http://release.niem.gov/niem/structures/3.0/}SimpleObjectAttributeGroup.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_9-38"><sch:title>Element type is not a simple type</sch:title>
  <sch:rule context="xs:element[(nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument'))                                  or nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ExtensionSchemaDocument')))                                 and exists(@type)]">
    <sch:assert test="every $type-qname in resolve-QName(@type, .),                             $type in nf:resolve-type(., $type-qname)                       satisfies empty($type/self::xs:simpleType)">Rule 9-38: An element type MUST NOT be a simple type.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-71"><sch:title>Applies to types indicates elements</sch:title>
  <sch:rule context="*[exists(@appinfo:appliesToTypes)]">
    <sch:assert test="every $item in tokenize(normalize-space(@appinfo:appliesToTypes), ' ') satisfies                         exists(nf:resolve-type(., resolve-QName($item, .)))">Rule 10-71: Every item in @appinfo:appliesToTypes MUST resolve to a type.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_10-73"><sch:title>Applies to elements indicates elements</sch:title>
  <sch:rule context="*[exists(@appinfo:appliesToElements)]">
    <sch:assert test="every $item in tokenize(normalize-space(@appinfo:appliesToElements), ' ') satisfies                         count(nf:resolve-element(., resolve-QName($item, .))) = 1">Rule 10-73: Every item in @appinfo:appliesToElements MUST resolve to an element.</sch:assert>
  </sch:rule>
</sch:pattern>
            
<sch:pattern id="rule_11-16"><sch:title>Elements with simple content use representation term</sch:title>
  <sch:rule context="xs:element[       (nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument'))        or nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ExtensionSchemaDocument')))       and exists(@name)        and exists(@type)]">
    <sch:let name="has-simple-content" value="       some $type in nf:resolve-type(., resolve-QName(@type, .)) satisfies         exists($type[exists(xs:simpleContent)])"/>
    <sch:let name="name-uses-representation-term" value="       some $representation-term in ('Amount', 'BinaryObject', 'Graphic', 'Picture', 'Sound', 'Video', 'Code', 'DateTime', 'Date', 'Time', 'Duration', 'ID', 'URI', 'Indicator', 'Measure', 'Numeric', 'Value', 'Rate', 'Percent', 'Quantity', 'Text', 'Name', 'List') satisfies         ends-with(@name, $representation-term)"/>
    <sch:assert test="if ($has-simple-content) then $name-uses-representation-term else true()">Rule 11-16: the name of an element declaration that is of simple content MUST use a representation term.</sch:assert>
  </sch:rule>
</sch:pattern>
              
<sch:pattern id="rule_11-33"><sch:title>Reference schemas import reference schemas.</sch:title>
  <sch:rule context="xs:import[                          nf:has-effective-conformance-target-identifier(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument'))                          and exists(@namespace)                          and empty(@appinfo:externalImportIndicator)                          and not(xs:anyURI(@namespace) = (                                    xs:anyURI('http://release.niem.gov/niem/structures/3.0/'),                                    xs:anyURI('http://www.w3.org/XML/1998/namespace'),                                    xs:anyURI('urn:us:gov:ic:ism'),                                    xs:anyURI('urn:us:gov:ic:ntk')))]">
    <sch:assert test="every $schema                        in nf:resolve-namespace(., @namespace)                       satisfies nf:has-effective-conformance-target-identifier($schema, xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument'))">Rule 11-33: A namespace imported as conformant from a reference schema document MUST identify a reference schema document.</sch:assert>
  </sch:rule>
</sch:pattern>
          
<sch:pattern id="rule_11-38"><sch:title>Each namespace may have only a single root schema in a schema set.</sch:title>
  <sch:rule context="xs:schema[exists(@targetNamespace)                                and (some $element                                     in nf:resolve-namespace(., xs:anyURI(@targetNamespace))                                    satisfies $element is .)]">
    <sch:assert test="count(nf:resolve-namespace(., xs:anyURI(@targetNamespace))) = 1">Rule 11-38: A namespace may appear as a root schema in a schema set only once.</sch:assert>
  </sch:rule>
</sch:pattern>
          </sch:schema>