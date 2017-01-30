<?xml version="1.0" encoding="UTF-8"?><stylesheet xmlns:f="http://ittl.gtri.org/wr24/2009-03-10-1439/xsl-functions" xmlns:private="http://ittl.gtri.org/wr24/2009-03-10-1439/xsl-functions/private" xmlns:saxon="http://saxon.sf.net/" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <!-- ============================================================ -->
  <!-- FUNCTIONS -->
  <!-- ============================================================ -->

  <!-- this is a side effect. Use in an empty if, like:
       <if test="c:assert($context, $condition, $message)"/>
  -->
  <function name="f:assert" as="xs:boolean">
    <param name="context"/>
    <param name="condition" as="xs:boolean"/>
    <param name="message" as="xs:string"/>
    <if test="not($condition)">
      <if test="f:fail($context,concat('assert:',$message))"/>
    </if>
    <sequence select="true()"/>
  </function>

  <function name="f:attribute-matches" as="xs:boolean">
    <param name="attribute" as="attribute()"/>
    <param name="qname" as="xs:QName"/>
    <variable name="attribute-qname" select="QName(namespace-uri($attribute), local-name($attribute))"/>
    <sequence select="$attribute-qname = $qname"/>
  </function>

  <!-- true if element has non-empty text and non-whitespace text content -->
  <function name="f:element-has-text-content" as="xs:boolean">
    <param name="element" as="element()"/>
    <sequence select="exists($element/text())                        and string-length(normalize-space($element/text())) &gt; 0"/>
  </function>

  <!-- this is a side effect. Use in an empty if, like:
       <if test="f:fail($context, $message)"/>
  -->
  <function name="f:fail" as="xs:boolean">
    <param name="context"/>
    <param name="message" as="xs:string"/>
    <message terminate="yes">
      <value-of select="f:get-location($context)"/>
      <text>:</text>
      <value-of select="$message"/>
    </message>
    <sequence select="true()"/>
  </function>

  <function name="f:get-item-description" as="xs:string">
    <param name="item" as="item()"/>
    <value-of>
      <if test="$item/self::node()"> node()</if>
      <if test="$item/self::text()"> text(<value-of select="$item"/>)</if>
      <if test="$item/self::comment()"> comment(<value-of select="$item"/>)</if>
      <if test="$item/self::element()"> element(<value-of select="namespace-uri($item)"/>, <value-of select="local-name($item)"/>)</if>
      <if test="$item/self::attribute()"> attribute(<value-of select="namespace-uri($item)"/>, <value-of select="local-name($item)"/>)</if>
      <if test="$item/self::document-node()"> document-node(<value-of select="namespace-uri($item)"/>, <value-of select="local-name($item)"/>)</if>
      <if test="$item/self::processing-instruction()"> processing-instruction()</if>
    </value-of>
  </function>

  <function name="f:get-location" as="xs:string">
    <!-- return a string that shows the file and line number of the
         given location.  -->
    <param name="context"/>
    <value-of>
      <value-of select="base-uri($context),'/'"/>
      <value-of use-when="function-available('saxon:line-number')">
        <text>:</text>
        <value-of select="saxon:line-number($context)"/>
      </value-of>
    </value-of>
  </function>

  <function name="f:get-message" as="xs:string">
    <!-- return a string that is a useful error message for some
         location -->
    <param name="context"/>
    <param name="message"/>
    <value-of>
      <value-of select="f:get-location($context)"/>
      <text>: </text>
      <value-of select="$message"/>
    </value-of>
  </function>

  <function name="f:get-namespace-from-qualified-name" as="xs:string">
    <param name="context" as="element()"/>
    <param name="qualified-name" as="xs:string"/>
    <value-of select="namespace-uri-from-QName(resolve-QName($qualified-name, $context))"/>
  </function>

  <!-- downselects string down to letters, numbers, and period.  Good for element names, types, etc. -->
  <function name="f:get-safe-string" as="xs:string">
    <param name="string" as="xs:string"/>
    <variable name="normalized" as="xs:string" select="normalize-space($string)"/>
    <value-of select="private:get-safe-string($normalized)"/>
  </function>

  <function name="f:implies" as="xs:boolean">
    <param name="lhs" as="xs:boolean"/>
    <param name="rhs" as="xs:boolean"/>
    <sequence select="not($lhs) or $rhs"/>
  </function>

  <function name="f:index-of-node" as="xs:integer*">
    <param name="sequence" as="node()*"/>
    <param name="srch" as="node()"/>
    <for-each select="$sequence">
      <if test=". is $srch">
        <sequence select="position()"/>
      </if>
    </for-each>
  </function>

  <function name="f:is-in" as="xs:boolean">
    <!-- true if item is in list -->
    <param name="item" as="item()"/>
    <param name="list" as="item()*"/>
    <sequence select="some $list-item in $list satisfies ($item = $list-item)"/>
  </function>

  <function name="f:is-qualified-name-same-as" as="xs:boolean">
    <param name="context"/>
    <param name="qualified-name" as="xs:string"/>
    <param name="namespace" as="xs:anyURI"/>
    <param name="local-name" as="xs:string"/>
    <sequence select="QName($namespace, $local-name) = resolve-QName($qualified-name, $context)"/>
  </function>

  <function name="f:items-get-string" as="xs:string">
    <param name="items" as="item()*"/>
    <value-of>
      <for-each select="$items">
        <value-of select="string(.)"/>
      </for-each>
    </value-of>
  </function>

  <function name="f:join-strings">
    <param name="lhs" as="xs:string"/>
    <param name="join-string" as="xs:string"/>
    <param name="rhs" as="xs:string"/>
    <value-of select="concat(                           $lhs,                            if ($lhs != '' and $rhs != '')                                then $join-string                                else '',                            $rhs)"/>
  </function>

  <function name="f:list-get-joined">
    <param name="list" as="xs:string"/>
    <param name="joinString" as="xs:string"/>
    <for-each select="tokenize(normalize-space($list), ' ')">
      <if test="position() &gt; 1">
        <value-of select="$joinString"/>
      </if>
      <value-of select="."/>
    </for-each>
  </function>

  <function name="f:node-get-QName" as="xs:QName">
    <param name="node" as="node()"/>
    <sequence select="QName(namespace-uri($node), local-name($node))"/>
  </function>

  <function name="f:QName-get-braces" as="xs:string">
    <param name="qname" as="xs:QName"/>
    <value-of select="concat('{', namespace-uri-from-QName($qname), '}', local-name-from-QName($qname))"/>
  </function>

  <function name="f:QName-get-clark-name" as="xs:string">
    <param name="qname" as="xs:QName"/>
    <value-of select="f:QName-get-braces($qname)"/>
  </function>

  <function name="f:QName-local-name-append" as="xs:QName">
    <param name="qname" as="xs:QName"/>
    <param name="string" as="xs:string"/>
    <sequence select="QName(                           namespace-uri-from-QName($qname),                           concat(                               local-name-from-QName($qname),                               $string))"/>
  </function>

  <function name="f:QName-local-name-join-append" as="xs:QName">
    <param name="qname" as="xs:QName"/>
    <param name="join-string" as="xs:string"/>
    <param name="string" as="xs:string"/>
    <sequence select="QName(                           namespace-uri-from-QName($qname),                           if ($string = '')                                then local-name-from-QName($qname)                               else concat(local-name-from-QName($qname), $join-string, $string))"/>
  </function>

  <function name="f:QName-local-name-prepend" as="xs:QName">
    <param name="qname" as="xs:QName"/>
    <param name="string" as="xs:string"/>
    <sequence select="QName(                         namespace-uri-from-QName($qname),                         concat($string,                              local-name-from-QName($qname)))"/>
  </function>

  <function name="f:qualified-name-get-prefix" as="xs:string">
    <param name="qualified-name" as="xs:string"/>
    <value-of select="substring-before($qualified-name, ':')"/>
  </function>

  <function name="f:regexp-all" as="xs:string">
    <param name="string" as="xs:string"/>
    <value-of select="concat('^', $string, '$')"/>
  </function>

  <function name="f:regexp-concat" as="xs:string">
    <param name="strings" as="xs:string*"/>
    <value-of>
      <for-each select="$strings">
        <value-of select="."/>
      </for-each>
    </value-of>
  </function>

  <function name="f:regexp-maybe" as="xs:string">
    <param name="string" as="xs:string"/>
    <value-of select="concat('(', $string, ')?')"/>
  </function>

  <function name="f:regexp-or" as="xs:string">
    <param name="strings" as="xs:string*"/>
    <value-of>
      <text>(</text>
      <for-each select="$strings">
        <if test="position() &gt; 1">|</if>
        <text>(</text>
        <value-of select="."/>
        <text>)</text>
      </for-each>
      <text>)</text>
    </value-of>
  </function>

  <function name="f:regexp-star" as="xs:string">
    <param name="string" as="xs:string"/>
    <value-of select="concat('(', $string, ')*')"/>
  </function>

  <function name="f:sequence-get-first" as="item()">
    <param name="sequence" as="item()*"/>
    <sequence select="$sequence[1]"/>
  </function>

  <function name="f:sequence-get-joined" as="xs:string">
    <param name="sequence" as="item()*"/>
    <param name="join-string" as="xs:string"/>
    <choose>
      <when test="count($sequence) = 0">
        <value-of/>
      </when>
      <when test="count($sequence) = 1">
        <value-of select="string(f:sequence-get-first($sequence))"/>
      </when>
      <otherwise>
        <value-of select="concat(string(f:sequence-get-first($sequence)),                                   $join-string,                                   f:sequence-get-joined(f:sequence-get-rest($sequence), $join-string))"/>
      </otherwise>
    </choose>
  </function>

  <function name="f:sequence-get-rest" as="item()*">
    <param name="sequence" as="item()*"/>
    <sequence select="subsequence($sequence, 2, count($sequence) - 1)"/>
  </function>

  <variable name="f:MATCH_Letter" as="xs:string" select="'[a-zA-Z]'"/>
  <variable name="f:MATCH_NCNameChar" as="xs:string" select="f:regexp-or( ($f:MATCH_Letter, '[0-9\._-]') )"/>
  <variable name="f:MATCH_NCName" as="xs:string" select="f:regexp-concat( (                                                            f:regexp-or( ($f:MATCH_Letter, '_') ),                                                            f:regexp-star($f:MATCH_NCNameChar)) )"/>
  <variable name="f:MATCH_QName" as="xs:string" select="f:regexp-concat(                                                            ( f:regexp-maybe(                                                               f:regexp-concat(                                                                 ( $f:MATCH_NCName, ':' ))),                                                             $f:MATCH_NCName ))"/>  
  <variable name="f:MATCH_QNameWithPrefix" as="xs:string" select="f:regexp-concat(                                                                      ( $f:MATCH_NCName,                                                                        ':',                                                                       $f:MATCH_NCName ))"/>  


  <function name="f:string-enquote" as="xs:string">
    <param name="string" as="xs:string"/>
    <value-of>
      <text>"</text>
      <value-of select="$string"/>
      <text>"</text>
    </value-of>
  </function>

  <function name="f:string-is-empty" as="xs:boolean">
    <param name="string" as="xs:string"/>
    <value-of select="string-length(normalize-space($string)) = 0"/>
  </function>

  <function name="f:string-is-not-empty" as="xs:boolean">
    <param name="string" as="xs:string"/>
    <value-of select="not(f:string-is-empty($string))"/>
  </function>

  <function name="f:string-to-csv-field" as="xs:string">
    <param name="string" as="xs:string"/>
    <value-of>
      <text>"</text>
      <value-of select="replace($string,'&#34;', '&#34;&#34;')"/>
      <text>"</text>
    </value-of>
  </function>

  <function name="f:string-to-node" as="node()">
    <param name="string" as="xs:string"/>
    <value-of select="$string"/>
  </function>

  <function name="f:strings-sort" as="xs:string*">
    <param name="strings" as="xs:string*"/>
    <perform-sort select="$strings">
      <sort select="."/>
    </perform-sort>
  </function>

  <!-- this is most useful on sorted lists, but can collapse sequences of repeats in unsorted lists -->
  <function name="f:strings-uniq" as="xs:string*">
    <param name="strings" as="xs:string*"/>
    <choose>
      <when test="count($strings) = 0"/>
      <when test="count($strings) = 1">
        <sequence select="$strings"/>
      </when>
      <otherwise>
        <variable name="uniqed-rest" select="f:strings-uniq(f:sequence-get-rest($strings))"/>
        <variable name="strings-first" select="f:sequence-get-first($strings)"/>
        <variable name="rest-first" select="f:sequence-get-first($uniqed-rest)"/>
        <choose>
          <when test="$strings-first = $rest-first">
            <sequence select="$uniqed-rest"/>
          </when>
          <otherwise>
            <sequence select="$strings-first,$uniqed-rest"/>
          </otherwise>
        </choose>
      </otherwise>
    </choose>
  </function>

  <function name="private:get-safe-string" as="xs:string">
    <param name="string" as="xs:string"/>
    <choose>
      <when test="string-length($string) = 0"><value-of select="''"/></when>
      <otherwise>
        <variable name="first" select="substring($string, 1, 1)"/>
        <variable name="rest" select="private:get-safe-string(substring($string,2))"/>
        <variable name="first-xformed" select="if (matches($first, '[a-zA-Z0-9\.]'))                               then $first                               else '_'"/>
        <value-of select="concat($first-xformed, $rest)"/>
      </otherwise>
    </choose>
  </function>

</stylesheet><!-- 
  Local Variables:
  mode: sgml
  indent-tabs-mode: nil
  fill-column: 9999
  End:
-->