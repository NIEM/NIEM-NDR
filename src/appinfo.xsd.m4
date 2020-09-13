<?xml version="1.0" encoding="UTF-8"?>
<xs:schema
  targetNamespace="MACRO_NS_APPINFO"
  version="MACRO_NDR_VERSION"
  xml:lang="en-US"
  xmlns:appinfo="MACRO_NS_APPINFO"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xs:annotation>
    <xs:documentation>The appinfo schema provides support for high level data model concepts and additional syntax to support the NIEM conceptual model and validation of NIEM-conformant instances.</xs:documentation>
  </xs:annotation>

  <xs:attribute name="deprecated">
    <xs:annotation>
      <xs:documentation>The deprecated attribute provides a method for identifying schema components as being deprecated. A deprecated component is one that is provided, but the use of which is not recommended.</xs:documentation>
    </xs:annotation>
    <xs:simpleType>
      <xs:restriction base="xs:boolean">
        <xs:pattern value="true"/>
      </xs:restriction>
    </xs:simpleType>
  </xs:attribute>

  <xs:attribute name="appliesToTypes">
    <xs:annotation>
      <xs:documentation>The appliesToTypes attribute appears on the element declaration of a metadata element. It indicates a set of types to which the metadata element may be applied. The metadata element will also be applicable to any type that is derived from a listed type.</xs:documentation>
    </xs:annotation>
    <xs:simpleType>
      <xs:list itemType="xs:QName"/>
    </xs:simpleType>
  </xs:attribute>

  <xs:attribute name="appliesToElements">
    <xs:annotation>
      <xs:documentation>The appliesToElements attribute appears on the element declaration of a metadata element. It indicates a set of elements to which the metadata element may be applied. The metadata element will also be applicable to any element that is in the substitution group of a listed element.</xs:documentation>
    </xs:annotation>
    <xs:simpleType>
      <xs:list itemType="xs:QName"/>
    </xs:simpleType>
  </xs:attribute>

  <xs:attribute name="externalAdapterTypeIndicator">
    <xs:annotation>
      <xs:documentation>The externalAdapterTypeIndicator attribute indicates that a complex type is an external adapter type. An external adapter type is composed of elements and attributes from non-NIEM-conformant schemas.</xs:documentation>
    </xs:annotation>
    <xs:simpleType>
      <xs:restriction base="xs:boolean">
        <xs:pattern value="true"/>
      </xs:restriction>
    </xs:simpleType>
  </xs:attribute>

  <xs:attribute name="externalImportIndicator">
    <xs:annotation>
      <xs:documentation>The externalImportIndicator attribute is true if and only if a namespace identified via xs:import is expected to be non-conformant.</xs:documentation>
    </xs:annotation>
    <xs:simpleType>
      <xs:restriction base="xs:boolean">
        <xs:pattern value="true"/>
      </xs:restriction>
    </xs:simpleType>
  </xs:attribute>

  <xs:element name="LocalTerm">
    <xs:complexType>
      <xs:sequence>
	<xs:element name="SourceText" type="appinfo:NonemptyStringSimpleType" minOccurs="0" maxOccurs="unbounded" form="qualified"/>
      </xs:sequence>
      <xs:attribute name="term" type="appinfo:NonemptyStringSimpleType" use="required"/>
      <xs:attribute name="literal" type="appinfo:NonemptyStringSimpleType"/>
      <xs:attribute name="definition" type="appinfo:NonemptyStringSimpleType"/>
      <xs:attribute name="sourceURIs">
        <xs:simpleType>
          <xs:restriction>
            <xs:simpleType>
              <xs:list itemType="xs:anyURI"/>
            </xs:simpleType>
            <xs:minLength value="1"/>
          </xs:restriction>
        </xs:simpleType>
      </xs:attribute>
    </xs:complexType>
  </xs:element>

  <xs:simpleType name="NonemptyStringSimpleType">
    <xs:restriction base="xs:string">
      <xs:minLength value="1"/>
    </xs:restriction>
  </xs:simpleType>

</xs:schema>
m4_dnl Local Variables:
m4_dnl mode: sgml
m4_dnl indent-tabs-mode: nil
m4_dnl fill-column: 9999
m4_dnl sgml-basic-offset: 2
m4_dnl End:
