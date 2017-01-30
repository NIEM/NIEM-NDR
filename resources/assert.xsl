<?xml version="1.0" encoding="UTF-8"?>
<stylesheet 
   xmlns:saxon="http://saxon.sf.net/"
   version="2.0"
   xmlns:assert="http://niem.gtri.gatech.edu/niem/ndr/3.0/xsl/assert"
   xmlns:oxsl="http://www.w3.org/1999/XSL/Transform/out"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <namespace-alias stylesheet-prefix="oxsl" result-prefix="xsl"/>

  <template match="assert:assert">
    <if test="empty(@test)">
      <message terminate="yes">element assert does not have @test.</message>
    </if>
    <if test="empty(@context)">
      <message terminate="yes">element assert does not have @context.</message>
    </if>
    <oxsl:if test="not({@test})">
      <oxsl:message terminate="yes">
        <oxsl:value-of select="base-uri({@context})"/>
        <oxsl:text>:</oxsl:text>
        <oxsl:value-of select="saxon:line-number({@context})"/>
        <oxsl:text>
          <text>: assert failed: </text>
          <value-of select="@test"/>
          <text>.</text>
        </oxsl:text>
      </oxsl:message>
    </oxsl:if>
  </template>

  <template match="@*|node()" priority="-1">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>
</stylesheet>
