<?xml version="1.0" encoding="US-ASCII"?>
<xs:schema
    targetNamespace="MACRO_NS_STRUCTURES"
    version="4.0"
    xmlns:structures="MACRO_NS_STRUCTURES"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xs:attribute name="id" type="xs:ID"/>
    <xs:attribute name="ref" type="xs:IDREF"/>
    <xs:attribute name="uri" type="xs:anyURI"/>
    <xs:attribute name="metadata" type="xs:IDREFS"/>
    <xs:attribute name="relationshipMetadata" type="xs:IDREFS"/>
   
    <xs:attributeGroup name="SimpleObjectAttributeGroup">
        <xs:attribute ref="structures:id"/>
        <xs:attribute ref="structures:ref"/>
        <xs:attribute ref="structures:uri"/>
        <xs:attribute ref="structures:metadata"/>
        <xs:attribute ref="structures:relationshipMetadata"/>
        <xs:anyAttribute namespace="urn:us:gov:ic:ism urn:us:gov:ic:ntk" processContents="lax"/>
    </xs:attributeGroup>

    <xs:complexType name="ObjectType" abstract="true">
        <xs:sequence>
            <xs:element ref="structures:ObjectAugmentationPoint" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute ref="structures:id"/>
        <xs:attribute ref="structures:ref"/>
        <xs:attribute ref="structures:uri"/>
        <xs:attribute ref="structures:metadata"/>
        <xs:attribute ref="structures:relationshipMetadata"/>
        <xs:anyAttribute namespace="urn:us:gov:ic:ism urn:us:gov:ic:ntk" processContents="lax"/>
    </xs:complexType>

    <xs:element name="ObjectAugmentationPoint" abstract="true">
        <xs:annotation>
            <xs:documentation>An augmentation point for ObjectType</xs:documentation>
        </xs:annotation>
    </xs:element>

    <xs:complexType name="AssociationType" abstract="true">
        <xs:sequence>
            <xs:element ref="structures:AssociationAugmentationPoint" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute ref="structures:id"/>
        <xs:attribute ref="structures:ref"/>
        <xs:attribute ref="structures:uri"/>
        <xs:attribute ref="structures:metadata"/>
        <xs:attribute ref="structures:relationshipMetadata"/>
        <xs:anyAttribute namespace="urn:us:gov:ic:ism urn:us:gov:ic:ntk" processContents="lax"/>
    </xs:complexType>

    <xs:element name="AssociationAugmentationPoint" abstract="true">
        <xs:annotation>
            <xs:documentation>An augmentation point for AssociationType</xs:documentation>
        </xs:annotation>
    </xs:element>

    <xs:complexType name="MetadataType" abstract="true">
        <xs:attribute ref="structures:id"/>
        <xs:attribute ref="structures:ref"/>
        <xs:attribute ref="structures:uri"/>
        <xs:anyAttribute namespace="urn:us:gov:ic:ism urn:us:gov:ic:ntk" processContents="lax"/>
    </xs:complexType>

    <xs:complexType name="AugmentationType" abstract="true">
        <xs:attribute ref="structures:id"/>
        <xs:attribute ref="structures:ref"/>
        <xs:attribute ref="structures:uri"/>
        <xs:attribute ref="structures:metadata"/>
        <xs:anyAttribute namespace="urn:us:gov:ic:ism urn:us:gov:ic:ntk" processContents="lax"/>
    </xs:complexType>

</xs:schema>
