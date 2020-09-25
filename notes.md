# Document conventions:

- The user/developer is a "she" / "her", unless there are multiples, in which cases the 2nd may be a "he".
- Only put rules in as "SET" rules if it adds something above & beyond the REF/EXT checks. Like add'l cross-schema validations. Or if it needs to be checked on files that aren't REF/EXT, like external schemas.
- Keep document references in Zotero
    - Enter niem specs as type 'document'
    - Generate citations as "Chicago Manual of Style 16th edition (full note)"

# functions used

- fn:QName($paramURI as xs:string?, $paramQName as xs:string) as xs:QName
- fn:in-scope-prefixes($element as element()) as xs:string*
- fn:namespace-uri-for-prefix($prefix as xs:string?, $element as element()) as xs:anyURI?
- fn:namespace-uri-from-QName($arg as xs:QName?) as xs:anyURI?
- fn:resolve-QName($qname as xs:string?, $element as element()) as xs:QName?
- fn:string($arg as item()?) as xs:string
- fn:matches($input as xs:string?, $pattern as xs:string) as xs:boolean

# Tree of types

- simple: Simple Type (name = *SimpleType)
    - code: code simple type
- complex: Complex type (otherwise)  
    - association: AssociationType (name = *AssociationType)
    - metadata: Metadata type (name = *MetadataType)
    - augmentation: AugmentationType (name = *AugmentationType)
    - object: Object type (otherwise)
        - csc: CSC
            - proxy: Proxy type
            - role: role type
            - code : Code type
        - ccc: CCC
            - adapter: Adapter type

# Complex types by name, in conformant schema:

  - *AssociationType
  - *MetadataType
  - *AugmentationType
  - otherwise: object type

# Tree of elements

- Metadata element
- Association element

# Conformant schema patterns

  - xs:schema
    - xs:complexType
      - xs:complexContent
        - xs:extension/@base
        - xs:restriction/@base
      - xs:simpleContent
    - xs:simpleType
      -xs:restriction
    - xs:attribute
      - xs:
    - xs:element

# XML Schema References

  xs:simpleType/xs:restriction/@base = simpleType
  xs:complextype/xs:{restriction,extension}/@base = type
  xs:element/@substitutionGroup : element
  xs:attribute/@type : simpleType
  xs:element/@type : type
  xs:{element,attribute}/@ref
  xs:union/@memberTypes = simpleType*
  xs:list/@itemType = simpleType
   
# Namespaces in play:

  - target namespace: nf:get-target-namespace(.)
  - structures namespace: xs:anyURI('MACRO_NS_STRUCTURES') 
  - the XML Schema namespace: xs:anyURI('MACRO_NS_XS')
  - The XML namespace: anyURI('MACRO_NS_XML') http://www.w3.org/XML/1998/namespace
  - the IC namespaces:
    - NTK: xs:anyURI('MACRO_NS_IC_NTK')
    - ISM: xs:anyURI('MACRO_NS_IC_ISM')

# Images / Powerpoint

- Save slides from the powerpoint
  - as PNG
  - size 720x540

# Augmentations

An AUGMENTABLE TYPE is:

  - or (
    - association
    - object : 
      - and
        - not a CSC
        - not an external
  