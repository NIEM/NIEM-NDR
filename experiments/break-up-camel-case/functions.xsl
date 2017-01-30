<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://example.org/functions"
    version="2.0">

  <function name="f:print-sequence" as="xs:string">
    <param name="seq" as="xs:string*"/>
    <choose>
      <when test="count($seq) = 0">()</when>
      <when test="count($seq) = 1">
        <value-of>
          <text>&quot;</text>
          <value-of select="$seq[1]"/>
          <text>&quot;</text>
        </value-of>
      </when>
      <otherwise>
        <value-of>
          <text>(</text>
          <value-of select="string-join(
                              for $item in $seq return
                                concat('&quot;', $item, '&quot;'),
                              ', ')"/>
          <text>)</text>
        </value-of>
      </otherwise>
    </choose>
  </function>

  <function name="f:tokenize-camel-case" as="xs:string*">
    <param name="string" as="xs:string"/>
    <variable name="length" select="string-length($string)"/>
    <sequence select="f:breakup($string, $length, $length)"/>
  </function>

  <function name="f:breakup" as="xs:string*">
    <param name="string" as="xs:string"/>
    <param name="start-index" as="xs:integer"/>
    <param name="end-index" as="xs:integer"/>
    <if test="$end-index &lt; $start-index"><message terminate="yes">$end-index &lt; $start-index</message></if>
    <choose>
      <when test="$end-index &lt; 1">
        <sequence select="()"/>
      </when>
      <when test="$start-index &lt; 1">
        <sequence select="substring($string, 1, $end-index)"/>
      </when>
      <when test="$start-index = $end-index
                  and f:get-character-class($string, $start-index) = 'other'">
        <sequence select="f:breakup($string, $start-index - 1, $start-index - 1),
                          substring($string, $start-index, 1)"/>
      </when>
      <when test="$start-index = $end-index">
        <sequence select="f:breakup($string, $start-index - 1, $end-index)"/>
      </when>
      <when test="f:get-character-class($string, $start-index) = 'other'">
        <sequence select="f:breakup($string, $start-index - 1, $start-index - 1),
                          substring($string, $start-index, 1),
                          substring($string, $start-index + 1, $end-index - $start-index)"/>
      </when>
      <!-- AB..., 12..., ab... -->
      <when test="f:get-character-class($string, $start-index) = f:get-character-class($string, $start-index + 1)">
        <sequence select="f:breakup($string, $start-index - 1, $end-index)"/>
      </when>
      <!-- Aa... -->
      <when test="f:get-character-class($string, $start-index) = 'upper'
                  and f:get-character-class($string, $start-index + 1) = 'lower'">
        <sequence select="f:breakup($string, $start-index - 1, $start-index - 1),
                          substring($string, $start-index, $end-index - $start-index + 1)"/>
      </when>
      <otherwise>
        <sequence select="f:breakup($string, $start-index - 1, $start-index),
                          substring($string, $start-index + 1, $end-index - $start-index)"/>
      </otherwise>
    </choose>
  </function>

  <function name="f:get-character-class" as="xs:string">
    <param name="string" as="xs:string"/>
    <param name="char-index" as="xs:integer"/>
    <choose>
      <when test="matches(substring($string, $char-index, 1), '[A-Z]')">upper</when>
      <when test="matches(substring($string, $char-index, 1), '[a-z]')">lower</when>
      <when test="matches(substring($string, $char-index, 1), '[0-9]')">number</when>
      <otherwise>other</otherwise>
    </choose>
  </function>

</stylesheet>
