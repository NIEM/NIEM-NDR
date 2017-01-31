m4_define([[[MACRO_COMMENT]]],)m4_dnl
m4_define([[[MACRO_DOCUMENT_URI]]],[[[http://reference.niem.gov/niem/specification/naming-and-design-rules/4.0/]]])m4_dnl
m4_dnl
m4_dnl HREFs...
m4_dnl
m4_define([[[MACRO_HREF_JSON_LD]]],[[[https://www.w3.org/TR/2014/REC-json-ld-20140116/]]])m4_dnl
m4_dnl
m4_define([[[MACRO_HREF_RDF_SEMANTICS]]],[[[http://www.w3.org/TR/2014/REC-rdf11-mt-20140225/]]])m4_dnl
m4_define([[[MACRO_HREF_RDF_SCHEMA]]],[[[http://www.w3.org/TR/2014/REC-rdf-schema-20140225/]]])m4_dnl
m4_define([[[MACRO_HREF_RDF_CONCEPTS]]],[[[http://www.w3.org/TR/2014/REC-rdf11-concepts-20140225/]]])m4_dnl
m4_define([[[MACRO_HREF_RDF_PRIMER]]],[[[http://www.w3.org/TR/2014/NOTE-rdf11-primer-20140225/]]])m4_dnl
m4_dnl
m4_define([[[MACRO_HREF_XML_BASE]]],[[[http://www.w3.org/TR/2009/REC-xmlbase-20090128/]]])m4_dnl
m4_define([[[MACRO_HREF_XML_SCHEMA_1]]],[[[http://www.w3.org/TR/2004/REC-xmlschema-1-20041028/]]])m4_dnl
m4_define([[[MACRO_HREF_XML_SCHEMA_2]]],[[[http://www.w3.org/TR/2004/REC-xmlschema-2-20041028/]]])m4_dnl
m4_define([[[MACRO_HREF_XML]]],[[[http://www.w3.org/TR/2008/REC-xml-20081126/]]])m4_dnl
m4_define([[[MACRO_HREF_XML_INFOSET]]],[[[http://www.w3.org/TR/2004/REC-xml-infoset-20040204/]]])m4_dnl
m4_define([[[MACRO_HREF_XML_NAMESPACES]]],[[[http://www.w3.org/TR/2009/REC-xml-names-20091208/]]])m4_dnl	
m4_define([[[MACRO_HREF_CTAS]]],[[[http://reference.niem.gov/niem/specification/conformance-targets-attribute/3.0/NIEM-CTAS-3.0-2014-07-31.html]]])m4_dnl	
m4_define([[[MACRO_HREF_NARY]]],[[[http://www.w3.org/TR/2006/NOTE-swbp-n-aryRelations-20060412/]]])m4_dnl
m4_define([[[MACRO_HREF_RFC_3986]]],[[[http://tools.ietf.org/html/rfc3986]]])m4_dnl
m4_dnl
m4_dnl
m4_define([[[MACRO_CT_URI_REF]]],[[[MACRO_DOCUMENT_URI[[[]]]#ReferenceSchemaDocument]]])m4_dnl
m4_define([[[MACRO_CT_URI_EXT]]],[[[MACRO_DOCUMENT_URI[[[]]]#ExtensionSchemaDocument]]])m4_dnl
m4_define([[[MACRO_CT_URI_SUB]]],[[[MACRO_DOCUMENT_URI[[[]]]#SubsetSchemaDocument]]])m4_dnl
m4_define([[[MACRO_CONFORMANCE_TARGETS_NS]]],[[[http://release.niem.gov/niem/conformanceTargets/3.0/]]])m4_dnl
m4_define([[[MACRO_NS_CT]]],[[[MACRO_CONFORMANCE_TARGETS_NS]]])m4_dnl
m4_define([[[MACRO_NDR_FUNCTIONS_NS]]],[[[MACRO_DOCUMENT_URI[[[]]]#NDRFunctions]]])m4_dnl
m4_define([[[MACRO_NS_NDR_FUNCTIONS]]],[[[MACRO_DOCUMENT_URI[[[]]]#NDRFunctions]]])m4_dnl
m4_define([[[MACRO_NS_LOCAL_TERM]]],[[[http://release.niem.gov/niem/appinfo/4.0/]]])m4_dnl
m4_define([[[MACRO_SCH_NS]]],[[[http://purl.oclc.org/dsdl/schematron]]])m4_dnl
m4_define([[[MACRO_NS_SCH]]],[[[http://purl.oclc.org/dsdl/schematron]]])m4_dnl
m4_define([[[MACRO_XS_NS]]],[[[http://www.w3.org/2001/XMLSchema]]])m4_dnl
m4_define([[[MACRO_NS_APPINFO]]],[[[http://release.niem.gov/niem/appinfo/4.0/]]])m4_dnl
m4_define([[[MACRO_NS_STRUCTURES]]],[[[http://release.niem.gov/niem/structures/4.0/]]])m4_dnl
m4_define([[[MACRO_NS_NIEM_CORE]]],[[[http://release.niem.gov/niem/niem-core/4.0/]]])m4_dnl
m4_define([[[MACRO_NS_NIEM_DOMAIN_J]]],[[[http://release.niem.gov/niem/domains/jxdm/6.0/]]])m4_dnl
m4_define([[[MACRO_NS_NIEM_DOMAIN_SCR]]],[[[http://release.niem.gov/niem/domains/screening/4.0/]]])m4_dnl
m4_define([[[MACRO_NS_NIEM_DOMAIN_IM]]],[[[http://release.niem.gov/niem/domains/immigration/4.0/]]])m4_dnl
m4_define([[[MACRO_NS_NIEM_DOMAIN_CYFS]]],[[[http://release.niem.gov/niem/domains/cyfs/4.0/]]])m4_dnl
m4_define([[[MACRO_IS_UPPER_CAMEL_CASE]]],[[[matches($1, '^([A-Z][A-Za-z0-9\-]*)+$')]]])m4_dnl
m4_define([[[MACRO_NS_RDFS]]],[[[http://www.w3.org/2000/01/rdf-schema#]]])m4_dnl
m4_define([[[MACRO_NS_RDF]]],[[[http://www.w3.org/1999/02/22-rdf-syntax-ns#]]])m4_dnl
m4_define([[[MACRO_NS_XS]]],[[[MACRO_XS_NS]]])m4_dnl
m4_define([[[MACRO_NS_XML]]],[[[http://www.w3.org/XML/1998/namespace]]])m4_dnl
m4_define([[[MACRO_NS_XSI]]],[[[http://www.w3.org/2001/XMLSchema-instance]]])m4_dnl
m4_define([[[MACRO_GET_COMPONENT_QNAME]]],[[[QName(string(nf:get-target-namespace($1)), $1/@name)]]])m4_dnl
m4_define([[[MACRO_NS_IC_ISM]]],[[[urn:us:gov:ic:ism]]])m4_dnl
m4_define([[[MACRO_NS_IC_NTK]]],[[[urn:us:gov:ic:ntk]]])m4_dnl
m4_define([[[MACRO_HREF_JAVA_LANG_SPEC]]],[[[http://docs.oracle.com/javase/specs/jls/se8/html/]]])m4_dnl
m4_define([[[MACRO_HREF_JAVA_LANG_SPEC_SEC_DEPRECATED]]],[[[http://docs.oracle.com/javase/specs/jls/se8/html/jls-9.html#jls-9.6.4.6]]])m4_dnl
m4_dnl
m4_dnl Usage: MACRO_HAS_DATA_DEFINITION(Attribute declaration, at, xs:attribute[exists(@name)], An attribute declaration)
m4_dnl $1 = long name for title
m4_dnl $2 = short name for rule IDs
m4_dnl $3 = rule context
m4_dnl $4 = long term for rule text
m4_dnl
m4_define([[[MACRO_HAS_DATA_DEFINITION]]],[[[
<ruleSection>
  <title>$1 has data definition</title>
  <rule applicability="REF EXT" id="$2-has-dd" class="Constraint">
    <pre><xmlBlurb memberOf="ref ext" id="xb-$2-has-dd">
<sch:pattern>
  <sch:rule context="$3">
    <sch:assert test="some $definition in xs:annotation/xs:documentation[1] satisfies
                        string-length(normalize-space(string($definition))) &gt; 0"
      >$4 MUST have a data definition.</sch:assert>
  </sch:rule>
</sch:pattern>
    </xmlBlurb></pre>
  </rule>
  <p>This document defines the term <termRef>data definition</termRef>.</p>
</ruleSection>
]]])m4_dnl
m4_define([[[MACRO_IS_ADAPTER_TYPE]]],[[[exists(@appinfo:externalAdapterTypeIndicator)]]])m4_dnl
m4_define([[[MACRO_IS_NOT_ADAPTER_TYPE]]],[[[empty(@appinfo:externalAdapterTypeIndicator)]]])m4_dnl
m4_define([[[MACRO_IN_ADAPTER_TYPE]]],[[[exists(ancestor::xs:complexType[MACRO_IS_ADAPTER_TYPE])]]])m4_dnl
m4_define([[[MACRO_NOT_IN_ADAPTER_TYPE]]],[[[exists(ancestor::xs:complexType[MACRO_IS_NOT_ADAPTER_TYPE])]]])m4_dnl
m4_dnl # MACRO_MATCH_AUGMENTABLE_TYPE( $whitespace-for-indenting )
m4_define([[[MACRO_MATCH_AUGMENTABLE_TYPE]]],[[[xs:complexType[
$1[[[]]]  @name[not(MACRO_NAME_IS_METADATA_TYPE_NAME(.))
$1[[[]]]        and not(MACRO_NAME_IS_AUGMENTATION_TYPE_NAME(.))]
$1[[[]]]  and MACRO_IS_NOT_ADAPTER_TYPE
$1[[[]]]  and xs:complexContent]]]])m4_dnl
m4_dnl # MACRO_COMPLEX_TYPE_IS_AUGMENTABLE_TYPE_EXPR( $whitespace-for-indenting )
m4_define([[[MACRO_COMPLEX_TYPE_IS_AUGMENTABLE_TYPE_EXPR]]],[[[exists(@name[
$1[[[]]]    not(ends-with(., 'MetadataType'))
$1[[[]]]    and not(ends-with(., 'AugmentationType'))])
$1[[[]]]  and MACRO_IS_NOT_ADAPTER_TYPE
$1[[[]]]  and exists(child::xs:complexContent)]]])m4_dnl
m4_dnl # MACRO_COMPLEX_TYPE_GET_AUGMENTATION_POINT_NAME( $complex-type, $whitespace-for-indenting )
m4_define([[[MACRO_COMPLEX_TYPE_GET_AUGMENTATION_POINT_QNAME]]],[[[QName(string(nf:get-target-namespace($1)),
$2[[[]]]  replace($1/@name, 'Type$', 'AugmentationPoint'))]]])m4_dnl
m4_dnl
m4_dnl # MACRO_GET_AUGMENTATION_TYPE_LOCAL_NAME( $augmentation-point-local-name )
m4_define([[[MACRO_GET_AUGMENTATION_TYPE_LOCAL_NAME]]],[[[replace($1, 'AugmentationPoint$', 'Type')]]])m4_dnl
m4_dnl
m4_dnl # MACRO_GET_AUGMENTATION_TYPE_QNAME( $augmentation-point-qname, $whitespace-for-indenting )
m4_define([[[MACRO_GET_AUGMENTATION_TYPE_QNAME]]],[[[QName(string(namespace-uri-from-QName($1)), 
$2[[[]]]  MACRO_GET_AUGMENTATION_TYPE_LOCAL_NAME(local-name-from-QName($1)))]]])m4_dnl
m4_dnl
m4_dnl # MACRO_ELEMENT_IS_AUGMENTATION_POINT_REF_EXPR( $whitespace-for-indenting )
m4_define([[[MACRO_ELEMENT_IS_AUGMENTATION_POINT_REF_EXPR]]],[[[exists(@ref[
$1[[[]]]  matches(local-name-from-QName(resolve-QName(., ..)), 'AugmentationPoint$')]) ]]])m4_dnl
m4_dnl
m4_dnl # MACRO_ELEMENT_IS_AUGMENTATION_POINT_DECL_EXPR( $whitespace-for-indenting )
m4_define([[[MACRO_ELEMENT_IS_AUGMENTATION_POINT_DECL_EXPR]]],[[[exists(@name[
$1[[[]]]  matches(., 'AugmentationPoint$')])]]])m4_dnl
m4_dnl
m4_dnl # MACRO_COMPLEX_TYPE_IS_CANDIDATE_PROXY_TYPE( $whitespace-for-indenting )
m4_define([[[MACRO_COMPLEX_TYPE_IS_CANDIDATE_PROXY_TYPE]]], 
     [[[some $name in @name satisfies
$1[[[]]]  exists(xs:simpleContent[
$1[[[]]]    exists(xs:extension[
$1[[[]]]      resolve-QName(@base, .) = QName('MACRO_NS_XS', $name)])])]]])m4_dnl
m4_dnl
m4_dnl # MACRO_NAME_IS_ASSOCIATION_TYPE_NAME( $local-name )
m4_dnl
m4_define([[[MACRO_NAME_IS_ASSOCIATION_TYPE_NAME]]],[[[ends-with($1, 'AssociationType')]]])m4_dnl
m4_dnl
m4_dnl # MACRO_NAME_IS_METADATA_TYPE_NAME( $local-name )
m4_dnl
m4_define([[[MACRO_NAME_IS_METADATA_TYPE_NAME]]],[[[ends-with($1, 'MetadataType')]]])m4_dnl
m4_dnl
m4_dnl # MACRO_NAME_IS_AUGMENTATION_TYPE_NAME( $local-name )
m4_dnl
m4_define([[[MACRO_NAME_IS_AUGMENTATION_TYPE_NAME]]],[[[ends-with($1, 'AugmentationType')]]])m4_dnl
m4_dnl
m4_dnl # MACRO_COMPLEX_TYPE_LOCAL_NAME_IS_OBJECT_TYPE_NAME( $local-name as string, $whitespace-for-indenting )
m4_dnl
m4_define([[[MACRO_COMPLEX_TYPE_LOCAL_NAME_IS_OBJECT_TYPE_NAME]]],[[[not(MACRO_NAME_IS_ASSOCIATION_TYPE_NAME($1)
$2[[[]]]    or MACRO_NAME_IS_METADATA_TYPE_NAME($1)
$2[[[]]]    or MACRO_NAME_IS_AUGMENTATION_TYPE_NAME($1))]]])m4_dnl
m4_dnl
m4_dnl # MACRO_MATCH_PROXY_TYPE( $whitespace-for-indenting )
m4_dnl #     This is an unconstrained match expression
m4_dnl
m4_define([[[MACRO_MATCH_PROXY_TYPE]]],[[[xs:complexType[some $name in @name,
$1[[[]]]                    $extension in xs:simpleContent/xs:extension,
$1[[[]]]                    $base-qname in resolve-QName($extension/@base, $extension) satisfies
$1[[[]]]                 $base-qname = QName('MACRO_NS_XS', @name)]]]])m4_dnl
m4_dnl
m4_dnl # MACRO_ELEMENT_LOCAL_NAME_IS_METADATA_ELEMENT_NAME( $local-name )
m4_define([[[MACRO_ELEMENT_LOCAL_NAME_IS_METADATA_ELEMENT_NAME]]],[[[ends-with($1, 'Metadata')]]])m4_dnl
m4_dnl
m4_dnl # MACRO_ELEMENT_LOCAL_NAME_IS_ASSOCIATION_ELEMENT_NAME( $local-name )
m4_define([[[MACRO_ELEMENT_LOCAL_NAME_IS_ASSOCIATION_ELEMENT_NAME]]],[[[ends-with($1, 'Association')]]])m4_dnl
m4_dnl
m4_dnl # MACRO_ELEMENT_LOCAL_NAME_IS_AUGMENTATION_ELEMENT_NAME( $local-name )
m4_define([[[MACRO_ELEMENT_LOCAL_NAME_IS_AUGMENTATION_ELEMENT_NAME]]],[[[ends-with($1, 'Augmentation')]]])m4_dnl
m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_AMOUNT]]],[[[Amount]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_BINARYOBJECT]]],[[[BinaryObject]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_GRAPHIC]]],[[[Graphic]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_PICTURE]]],[[[Picture]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_SOUND]]],[[[Sound]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_VIDEO]]],[[[Video]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_CODE]]],[[[Code]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_DATETIME]]],[[[DateTime]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_DATE]]],[[[Date]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_TIME]]],[[[Time]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_DURATION]]],[[[Duration]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_ID]]],[[[ID]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_URI]]],[[[URI]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_INDICATOR]]],[[[Indicator]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_MEASURE]]],[[[Measure]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_NUMERIC]]],[[[Numeric]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_VALUE]]],[[[Value]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_RATE]]],[[[Rate]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_PERCENT]]],[[[Percent]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_QUANTITY]]],[[[Quantity]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_TEXT]]],[[[Text]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_NAME]]],[[[Name]]])m4_dnl
m4_define([[[MACRO_REPRESENTATION_TERM_LIST]]],[[[List]]])m4_dnl
m4_dnl
m4_dnl # MACRO_LIST_OF_REPRESENTATION_TERMS()
m4_dnl
m4_define([[[MACRO_LIST_OF_REPRESENTATION_TERMS]]],[[['MACRO_REPRESENTATION_TERM_AMOUNT', 'MACRO_REPRESENTATION_TERM_BINARYOBJECT', 'MACRO_REPRESENTATION_TERM_GRAPHIC', 'MACRO_REPRESENTATION_TERM_PICTURE', 'MACRO_REPRESENTATION_TERM_SOUND', 'MACRO_REPRESENTATION_TERM_VIDEO', 'MACRO_REPRESENTATION_TERM_CODE', 'MACRO_REPRESENTATION_TERM_DATETIME', 'MACRO_REPRESENTATION_TERM_DATE', 'MACRO_REPRESENTATION_TERM_TIME', 'MACRO_REPRESENTATION_TERM_DURATION', 'MACRO_REPRESENTATION_TERM_ID', 'MACRO_REPRESENTATION_TERM_URI', 'MACRO_REPRESENTATION_TERM_INDICATOR', 'MACRO_REPRESENTATION_TERM_MEASURE', 'MACRO_REPRESENTATION_TERM_NUMERIC', 'MACRO_REPRESENTATION_TERM_VALUE', 'MACRO_REPRESENTATION_TERM_RATE', 'MACRO_REPRESENTATION_TERM_PERCENT', 'MACRO_REPRESENTATION_TERM_QUANTITY', 'MACRO_REPRESENTATION_TERM_TEXT', 'MACRO_REPRESENTATION_TERM_NAME']]])m4_dnl
m4_dnl
m4_dnl  MACRO_ASSERT( $test, $message )
m4_dnl
m4_define([[[MACRO_ASSERT]]],[[[m4_dnl
m4_ifelse([[[$1]]],1,,[[[
m4_errprint(m4___file__[[[:]]]m4___line__[[[:]]],[[[assert failed:]]],m4_shift($@),[[[
]]])m4_dnl
m4_m4exit(1)m4_dnl
]]])]]])m4_dnl
m4_dnl
m4_dnl MACRO_FAIL( $message )
m4_dnl
m4_define([[[MACRO_FAIL]]],[[[m4_dnl
m4_errprint(m4___file__[[[:]]]m4___line__[[[:]]],$@,[[[
]]])m4_dnl
m4_m4exit(1)m4_dnl
]]])m4_dnl
m4_dnl
m4_dnl # MACRO_IS_EMPTY($1)
m4_dnl
m4_define([[[MACRO_IS_EMPTY]]],[[[m4_ifelse([[[$1]]],[[[]]],1,0)]]])m4_dnl
m4_dnl
m4_dnl # MACRO_NOT(0)
m4_dnl
m4_define([[[MACRO_NOT]]],[[[m4_ifelse([[[$1]]],1,0,1)]]])m4_dnl
m4_dnl
m4_dnl # MACRO_EQUALS( $lhs, $rhs ) -> { 1, 0 }
m4_dnl
m4_define([[[MACRO_EQUALS]]],[[[m4_ifelse([[[$1]]],[[[$2]]],1,0)]]])m4_dnl
m4_dnl
m4_dnl # MACRO_IS_IN( $item, $list... )
m4_dnl
m4_define([[[MACRO_IS_IN]]],[[[m4_dnl
MACRO_ASSERT(m4_eval([[[$# > 1]]]),[[[MACRO_IS_IN needs 2 or more arguments]]])m4_dnl
MACRO_IS_IN_SUB($@)]]])m4_dnl
m4_dnl
m4_define([[[MACRO_IS_IN_SUB]]],[[[m4_dnl
m4_ifelse([[[$#]]],[[[1]]],0,
	  [[[$1]]],[[[$2]]],1,
	  [[[$#]]],[[[2]]],0,
          [[[MACRO_IS_IN_SUB($1,m4_shift(m4_shift($@)))]]])]]])m4_dnl
m4_dnl
m4_dnl
m4_dnl # MACRO_AND(1,0,1,1)
m4_dnl
m4_define([[[MACRO_AND]]],[[[m4_dnl
MACRO_ASSERT(m4_eval([[[$# > 0]]]),[[[MACRO_AND must have an argument]]])m4_dnl
MACRO_ASSERT(MACRO_IS_IN([[[$1]]],[[[0]]],[[[1]]]),[[[MACRO_AND argument $$1 must be 0 or 1]]])m4_dnl
m4_ifelse(m4_dnl
[[[$#]]],[[[1]]],[[[$1]]],
[[[$1]]],0,0,m4_dnl
[[[$1]]],1,[[[MACRO_AND(m4_shift($@))]]])]]])m4_dnl
m4_dnl
m4_dnl # MACRO_OR(1,0,1,1)
m4_dnl
m4_dnl m4_define([[[MACRO_OR]]],[[[m4_ifelse(m4_dnl
m4_dnl [[[$#]]],0,0,m4_dnl
m4_dnl [[[$1]]],0,0,m4_dnl
m4_dnl [[[$1]]],1,[[[m4_ifelse([[[$#]]],1,1,[[[MACRO_AND(m4_shift($@))]]])]]])]]])m4_dnl
m4_dnl
m4_dnl
m4_dnl # MACRO_REF_EXTERNAL( $ndr-ref-id, $external-href, $section-number, $section-title )
m4_dnl #   you may omit $1 or $2.
m4_dnl
m4_define([[[MACRO_REF_EXTERNAL]]],[[[m4_dnl
MACRO_ASSERT(MACRO_NOT(MACRO_IS_EMPTY($4)),[[[MACRO_REF_EXTERNAL requires argument $section-title]]])m4_dnl
m4_ifelse([[[$1]]],[[[]]],[[[]]],[[[<ref idref="$1"/> ]]])m4_dnl
m4_ifelse([[[$2]]],[[[]]],[[[]]],[[[<a href="$2">]]])m4_dnl
m4_ifelse([[[$3]]],[[[]]],[[[m4_dnl
subsection <em>$4</em>m4_dnl
]]],[[[m4_dnl
Section $3, <em>$4</em>m4_dnl
]]])m4_dnl
m4_ifelse([[[$2]]],[[[]]],[[[]]],</a>)m4_dnl
]]])m4_dnl
