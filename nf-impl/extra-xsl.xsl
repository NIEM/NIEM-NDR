<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
   version="2.0"
   xmlns:extra="http://example.org/extra-xsl"
   xmlns:saxon="http://saxon.sf.net/"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl-out="http://www.w3.org/1999/XSL/Transform/alias" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="xml" version="1.0" indent="no"/>

  <namespace-alias
     stylesheet-prefix="xsl-out"
     result-prefix="xsl"/>

  <!-- just copy everything else -->
  <template match="@*|node()">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <!-- Usage:
       <extra:assert @test="{$expression}" @where="{$source of failure}"/>
       -->
  <template match="extra:assert">
    <if test="empty(@test)">
      <message terminate="yes">
        <value-of select="base-uri(.)"/>
        <value-of use-when="function-available('saxon:line-number')"
                  select="concat(':', saxon:line-number(.))"/>
        <text>: extra:assert must have @test</text>
      </message>
    </if>
    <xsl-out:choose>
      <xsl-out:when test="{@test}"/>
      <xsl-out:otherwise>
        <xsl-out:message terminate="yes">
          <if test="exists(@where)">
            <xsl-out:value-of select="base-uri({@where})"/>
            <xsl-out:value-of use-when="function-available('saxon:line-number')"
                              select="concat(':', saxon:line-number({@where}))"/>
          </if>
          <xsl-out:text>: assert failed: <value-of select="@test"/>&#10;</xsl-out:text>
        </xsl-out:message>
      </xsl-out:otherwise>
    </xsl-out:choose>
  </template>

  <!-- Usage:
       <extra:template-interface mode="$mode" as="$return-type">
         <xsl:template ...>
         <xsl:template ...>
         ...
       </extra:template-interface>
  -->
  <template match="extra:template-interface">
    <apply-templates/>
  </template>

  <template match="extra:template-interface/*[not(node-name(.) = (xs:QName('xsl:template'), xs:QName('xsl:param')))]">
    <message terminate="yes">
      <value-of select="base-uri(.)"/>
      <value-of use-when="function-available('saxon:line-number')"
                select="concat(':', saxon:line-number(.))"/>
      <text>: child of extra:template-interface must be xsl:template or xsl:param</text>
    </message>
  </template>

  <template match="extra:template-interface/xsl:param">
    <if test="empty(@name)">
      <message terminate="yes">
        <value-of select="extra:get-location(.)"/>
        <text>: xsl:param in a template interface must have a name.</text>
      </message>
    </if>
    <if test="some $earlier in preceding-sibling::xsl:param satisfies @name = $earlier/@name">
      <message terminate="yes">
        <value-of select="extra:get-location(.)"/>
        <text>: only one xsl:param with a given name may occur in a template interface.</text>
      </message>
    </if>
  </template>

  <function name="extra:has-all-attributes-from" as="xs:boolean">
    <param name="left" as="element()"/>
    <param name="right" as="element()"/>
    <sequence select="every $attr in $right/@* satisfies
                        (exists($left/@*[node-name(.) = node-name($attr)
                                         and . = $attr]))"/>
  </function>

  <template match="extra:template-interface/xsl:template">
    <variable name="interface" as="element(extra:template-interface)" select="parent::extra:template-interface"/>
    <variable name="template" as="element(xsl:template)" select="."/>

    <if test="not(extra:has-all-attributes-from($template, $interface))">
      <message terminate="yes">
        <value-of select="extra:get-location(.)"/>
        <text>: all interface attributes must appear in template.</text>
      </message>
    </if>

    <for-each select="$interface/xsl:param">
      <variable name="interface-param" as="element(xsl:param)" select="."/>
      <variable name="template-param" as="element(xsl:param)?" 
                select="$template/xsl:param[@name = $interface-param/@name]"/>

      <if test="empty($template-param)">
        <message terminate="yes">
          <value-of select="extra:get-location($template)"/>
          <text>: interface param </text>
          <value-of select="$interface-param/@name"/>
          <text> must appear in template.</text>
        </message>
      </if>

      <if test="not(
                  extra:has-all-attributes-from($template-param, $interface-param)
                  and extra:has-all-attributes-from($interface-param, $template-param)
                  )">
        <message terminate="yes">
          <value-of select="extra:get-location($template-param)"/>
          <text>: template parameter's attributes must match interface parameter's attributes.</text>
        </message>
      </if>
    </for-each>

    <for-each select="$template/xsl:param">
      <variable name="template-param" select="." as="element(xsl:param)"/>
      <variable name="interface-param" as="element(xsl:param)?" 
                select="$interface/xsl:param[@name = $template-param/@name]"/>

      <if test="empty($interface-param)">
        <message terminate="yes">
          <value-of select="extra:get-location($template)"/>
          <text>: template param </text>
          <value-of select="$template-param/@name"/>
          <text> does not appear in interface.</text>
        </message>
      </if>
    </for-each>

    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <function name="extra:get-location" as="xs:string">
    <param name="context" as="node()"/>
    <value-of>
      <value-of select="base-uri($context)"/>
      <value-of use-when="function-available('saxon:line-number')"
                select="concat(':', saxon:line-number($context))"/>
    </value-of>
  </function>
  
</stylesheet>
