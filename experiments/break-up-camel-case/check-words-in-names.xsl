<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://example.org/functions"
    xmlns:words="http://example.org/words"
   xmlns:saxon="http://saxon.sf.net/"
    version="2.0">

  <import href="functions.xsl"/>

  <param name="words-file" select="'param &quot;$words-file&quot; not set.'"/>
  <param name="error-if-present" select="'param &quot;$error-if-present&quot; not set.'"/>

  <output method="text"/>

  <variable name="words" select="doc($words-file)" as="document-node()"/>
  <variable name="is-error-if-present" as="xs:boolean" select="xs:boolean($error-if-present)"/>

  <template match="/">
    <!--
    <message>error-if-present=&quot;<value-of select="$error-if-present"/>&quot;</message>
    <message>is-error-if-present=&quot;<value-of select="$is-error-if-present"/>&quot;</message>
    <message>words-file = &quot;<value-of select="$words-file"/>&quot;</message>
    <message>doc contains <value-of select="$words//text()"/></message>
    <text>is-error-if-present = &quot;</text>
    <value-of select="$is-error-if-present"/>
    <text>&quot;&#10;</text>
    -->
    <apply-templates/>
  </template>

  <template match="@*|node()" priority="-1">
    <apply-templates select="@*|node()"/>
  </template>

  <template match="text()"/>

  <template match="xs:*[@name]">
    <variable name="context" as="element()" select="."/>
    <variable name="name" as="xs:string" select="@name"/>
    <for-each select="f:tokenize-camel-case($name)">
      <variable name="original-word" as="xs:string" 
                select="."/>
      <variable name="re-cased-word" as="xs:string" 
                select="if (matches(., '^[A-Z][a-z]*$'))
                        then lower-case(.)
                        else ."/>
      <choose>
        <when test="$original-word = '-'"/>
        <when test="matches($original-word, '[0-9]+')"/>
        <when test="exists($words/words:words/words:word[string-join(text(), '') = $re-cased-word])
                    = $is-error-if-present">
          <!--
          <message>
            <value-of select="$is-error-if-present"/>
            <text>:&quot;</text>
            <value-of select="$re-cased-word"/>
            <text>&quot; in </text>
            <value-of select="f:print-sequence(f:tokenize-camel-case($name))"/>
          </message>
          -->
          <value-of select="base-uri($context)"/>
          <text>:</text>
          <value-of use-when="function-available('saxon:line-number')">
            <value-of select="saxon:line-number($context)"/>
            <text>:</text>
          </value-of>
          <text>word &quot;</text>
          <value-of select="$re-cased-word"/>
          <text>&quot; in &quot;</text>
          <value-of select="$name"/>
          <text>&quot;&#10;</text>
        </when>
      </choose>
    </for-each>
  </template>

</stylesheet>
