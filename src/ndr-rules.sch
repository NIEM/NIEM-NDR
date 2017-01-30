<?xml version="1.0" encoding="UTF-8"?>
<schema 
   queryBinding="xslt2"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:local="http://example.org/2012-10-01-1632/local-functions/"
   xmlns="http://purl.oclc.org/dsdl/schematron">

  <title>Assertions about NIEM NDR rules</title>

  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
  <ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>
  <ns prefix="doc" uri="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258"/>
  <ns prefix="sch" uri="http://purl.oclc.org/dsdl/schematron"/>

  <xsl:variable name="quot">&quot;</xsl:variable>
  <xsl:variable name="apos">&apos;</xsl:variable>

  <pattern>
    <rule context="doc:rule">
           <assert test="empty(@id) 
                         or matches(@id, '^[a-zA-Z0-9\-]+$')"
                   >Characters in a rule @id must be in (a-z, A-Z, 0-9, '-').</assert>
           <assert test="exists(@applicability)"
                   >A rule must have @applicability.</assert>
           <assert test="string-length(normalize-space(@applicability)) &gt; 0"
                   >A rule's applicability must be non-empty.</assert>
           <assert test="every $code in tokenize(normalize-space(@applicability), ' ') satisfies ($code = ('REF', 'EXT', 'SET', 'INS'))"
                   >Every applicability of a rule must be one of REF, EXT, SET, or INS.</assert>
           <assert test="exists(@class)">A rule must have @class.</assert>
           <report test="empty(parent::doc:ruleSection)">A rule SHOULD be in a ruleSection</report>
    </rule>
  </pattern>

  <pattern>
    <rule context="doc:rule[empty(ancestor::doc:comment)]">
      <assert test="true() or exists(@class)">Every rule must have an @class.</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="doc:rule//doc:xmlBlurb">
      <assert test="matches(@id,'^[a-zA-Z\-0-9]+$')">An @id of a doc:xmlBlurb must be from (a-z, A-Z, -, 0-9).</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="doc:reference">
      <let name="id" value="@id"></let>
      <assert test="exists(//doc:ref[@idref = $id])"
              >Reference was not used (<value-of select="$id"/>).</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="doc:rule[exists(@applicability)]//doc:xmlBlurb">

      <assert test="exists(@memberOf)">An xmlBlurb must have @memberOf</assert>

      <assert test="empty(@memberOf) 
                    or count(tokenize(normalize-space(@memberOf), ' ')) &gt;= 1"
              >An xmlBlurb in a rule must use @memberOf to indicate that it is a member of at least one blurbSet.</assert>

      <assert test="every $blurbSet in tokenize(normalize-space(@memberOf),' ')
                    satisfies upper-case($blurbSet) = tokenize(normalize-space(ancestor::doc:rule/@applicability),' ')"
              >Every blurbset for a blurb must coincide with a conformance target in the rule applicability statement (in <value-of select="@memberOf"/>).</assert>

      <assert test="every $target in tokenize(normalize-space(ancestor::doc:rule/@applicability),' ')
                    satisfies lower-case($target) = tokenize(normalize-space(@memberOf),' ')"
              >Every conformance target for a rule must have a corresponding blurbset for the blurbs (in <value-of select="ancestor::doc:rule/@applicability"/>).</assert>

    </rule>
  </pattern>

  <pattern>
    <rule context="*[exists(text())
                     and not( some $ancestor in ancestor-or-self::* 
                              satisfies node-name($ancestor) = ( 
                                  xs:QName('doc:pre'), 
                                  xs:QName('doc:todo'), 
                                  xs:QName('doc:code') ))]">
      <assert test="every $text in text() satisfies not(contains($text, $quot))">Text must not contain a quote.</assert>
      <assert test="every $text in text() satisfies not(contains($text, $apos))">Text must not contain an apostrophe.</assert>
    </rule>
  </pattern>

</schema>
<!--
Local Variables:
mode: sgml
indent-tabs-mode: nil
fill-column: 9999
End:
-->
