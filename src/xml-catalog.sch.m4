<?xml version="1.0" encoding="US-ASCII"?>
<schema 
   queryBinding="xslt2"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns="http://purl.oclc.org/dsdl/schematron">

<title>Assertions about XML Catalog</title>

<ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
<ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>
<ns prefix="catalog" uri="urn:oasis:names:tc:entity:xmlns:xml:catalog"/>

<pattern>
  <rule context="/">
    <assert test="exists(catalog:catalog)"
            >Document element must be catalog:catalog.</assert>
  </rule>
</pattern>

<pattern>
  <rule context="catalog:uri">
    <assert test="exists(@name)">catalog:uri must have @name.</assert>
    <assert test="exists(@uri)">catalog:uri must have @uri.</assert>
  </rule>
</pattern>

<pattern>
  <rule context="catalog:uri[exists(@name)]">
    <assert test="empty(preceding::catalog:uri[@name = current()/@name])"
            >There should be only one catalog:uri for an @name, but there is a duplicate for @name=&quot;<value-of select="current()/@name"/>.&quot;</assert>
  </rule>
</pattern>

m4_define([[[M_URI]]],[[[resolve-uri(@uri, base-uri(.))]]])
m4_define([[[M_DOC_AVAILABLE]]],[[[doc-available(M_URI)]]])
<pattern>
  <rule context="catalog:uri[exists(@uri)]">
    <assert test="M_DOC_AVAILABLE">catalog:uri/@uri must resolve to an XML document.</assert>
  </rule>
</pattern>

<pattern>
  <rule context="catalog:uri[exists(@uri)
                             and M_DOC_AVAILABLE]">
    <let name="uri" value="M_URI"/>
    <let name="doc" value="doc($uri)"/>
    <assert test="exists($doc/xs:schema)">Referenced XML document must have document element xs:schema.</assert>
    <assert test="empty($doc/xs:schema)
                  or exists($doc/xs:schema/@targetNamespace)"
            >Document element xs:schema of referenced XML Schema document must have @targetNamespace.</assert>
  </rule>
</pattern>

<pattern>
  <rule context="catalog:uri[exists(@uri)
                             and exists(@name)
                             and M_DOC_AVAILABLE]">
    <let name="uri" value="M_URI"/>
    <let name="doc" value="doc($uri)"/>
    <assert test="empty($doc/xs:schema/@targetNamespace)
                  or @name = $doc/xs:schema/@targetNamespace"
            >Document element xs:schema of referenced XML Schema document must have @targetNamespace=@name (which is &quot;<value-of select="@name"/>&quot;).</assert>
  </rule>
</pattern>

</schema>
m4_dnl Local Variables:
m4_dnl mode: sgml
m4_dnl indent-tabs-mode: nil
m4_dnl fill-column: 9999
m4_dnl  End:
