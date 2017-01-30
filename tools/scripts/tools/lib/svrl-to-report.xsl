<?xml version="1.0" encoding="US-ASCII"?>
<stylesheet 
   version="1.0"
   xmlns:exslt-dyn="http://exslt.org/dynamic"
   xmlns:map="http://example.org/ns/map"
   xmlns:results="http://example.org/ns/results"
   xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
   xmlns:xalan-nodeinfo="org.apache.xalan.lib.NodeInfo"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="xml" version="1.0" indent="yes"/>

  <param name="ndr-id-map"/>

  <variable name="map" select="document($ndr-id-map)/map:map"/>

  <template match="/">
    <results:results>
      <apply-templates/>
    </results:results>
  </template>

  <template match="svrl:successful-report">
    <results:successful-report>
      <call-template name="get-details"/>
    </results:successful-report>
  </template>

  <template match="svrl:failed-assert">
    <results:failed-assert>
      <call-template name="get-details"/>
    </results:failed-assert>
  </template>

  <template name="get-details">
    <variable name="location-string" select="@location"/>
    <variable name="active-pattern" select="preceding-sibling::svrl:active-pattern[1]"/>
    <variable name="document-file-name" select="$active-pattern/@document"/>
    <variable name="rule-id" select="$active-pattern/@id"/>
    <variable name="rule-descriptive-id" select="$map/map:rule[@ruleID = $rule-id]/@descriptiveID"/>
    <variable name="line-number">
      <for-each select="document($document-file-name)">
        <value-of select="xalan-nodeinfo:lineNumber( exslt-dyn:evaluate( $location-string ) )"/>
      </for-each>
    </variable>
    <attribute name="descriptiveID">
      <value-of select="$rule-descriptive-id"/>
    </attribute>
    <attribute name="lineNumber">
      <value-of select="$line-number"/>
    </attribute>
  </template>

  <template match="text()"/>

</stylesheet>
