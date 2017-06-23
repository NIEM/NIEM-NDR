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



<pattern>
  <rule context="catalog:uri[exists(@uri)]">
    <assert test="doc-available(resolve-uri(@uri, base-uri(.)))">catalog:uri/@uri must resolve to an XML document.</assert>
  </rule>
</pattern>

<pattern>
  <rule context="catalog:uri[exists(@uri)
                             and doc-available(resolve-uri(@uri, base-uri(.)))]">
    <let name="uri" value="resolve-uri(@uri, base-uri(.))"/>
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
                             and doc-available(resolve-uri(@uri, base-uri(.)))]">
    <let name="uri" value="resolve-uri(@uri, base-uri(.))"/>
    <let name="doc" value="doc($uri)"/>
    <assert test="empty($doc/xs:schema/@targetNamespace)
                  or @name = $doc/xs:schema/@targetNamespace"
            >Document element xs:schema of referenced XML Schema document must have @targetNamespace=@name (which is &quot;<value-of select="@name"/>&quot;).</assert>
  </rule>
</pattern>

</schema>
