<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:schold="http://www.ascc.net/xml/schematron"
                xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:nf="http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#NDRFunctions"
                xmlns:ct="http://release.niem.gov/niem/conformanceTargets/3.0/"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:appinfo="http://release.niem.gov/niem/appinfo/3.0/"
                xmlns:structures="http://release.niem.gov/niem/structures/3.0/"
                xmlns:term="http://release.niem.gov/niem/localTerminology/3.0/"
                version="2.0"><!--Importing stylesheet additions--><xsl:output xmlns:sch="http://www.ascc.net/xml/schematron" method="text"/>
   <!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
<xsl:param name="archiveDirParameter"/>
   <xsl:param name="archiveNameParameter"/>
   <xsl:param name="fileNameParameter"/>
   <xsl:param name="fileDirParameter"/>
   <xsl:variable name="document-uri">
      <xsl:value-of select="document-uri(/)"/>
   </xsl:variable>

   <!--PHASES-->


<!--PROLOG-->


<!--XSD TYPES FOR XSLT2-->


<!--KEYS AND FUNCTIONS-->


<!--DEFAULT RULES-->


<!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<xsl:template match="*" mode="schematron-select-full-path">
      <xsl:apply-templates select="." mode="schematron-get-full-path"/>
   </xsl:template>

   <!--MODE: SCHEMATRON-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<xsl:template match="*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">
            <xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>*:</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>[namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:variable name="preceding"
                    select="count(preceding-sibling::*[local-name()=local-name(current())                                   and namespace-uri() = namespace-uri(current())])"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="@*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">@<xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>@*[local-name()='</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>' and namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--MODE: SCHEMATRON-FULL-PATH-2-->
<!--This mode can be used to generate prefixed XPath for humans-->
<xsl:template match="node() | @*" mode="schematron-get-full-path-2">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="preceding-sibling::*[name(.)=name(current())]">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-3-->
<!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
<xsl:template match="node() | @*" mode="schematron-get-full-path-3">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="parent::*">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>

   <!--MODE: GENERATE-ID-FROM-PATH -->
<xsl:template match="/" mode="generate-id-from-path"/>
   <xsl:template match="text()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
   </xsl:template>
   <xsl:template match="comment()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.@', name())"/>
   </xsl:template>
   <xsl:template match="*" mode="generate-id-from-path" priority="-0.5">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:text>.</xsl:text>
      <xsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
   </xsl:template>

   <!--MODE: GENERATE-ID-2 -->
<xsl:template match="/" mode="generate-id-2">U</xsl:template>
   <xsl:template match="*" mode="generate-id-2" priority="2">
      <xsl:text>U</xsl:text>
      <xsl:number level="multiple" count="*"/>
   </xsl:template>
   <xsl:template match="node()" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>n</xsl:text>
      <xsl:number count="node()"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="string-length(local-name(.))"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="translate(name(),':','.')"/>
   </xsl:template>
   <!--Strip characters--><xsl:template match="text()" priority="-1"/>

   <!--SCHEMA SETUP-->
<xsl:template match="/">
      <xsl:apply-templates select="/" mode="M10"/>
      <xsl:apply-templates select="/" mode="M11"/>
      <xsl:apply-templates select="/" mode="M12"/>
      <xsl:apply-templates select="/" mode="M13"/>
      <xsl:apply-templates select="/" mode="M14"/>
      <xsl:apply-templates select="/" mode="M15"/>
      <xsl:apply-templates select="/" mode="M16"/>
      <xsl:apply-templates select="/" mode="M17"/>
      <xsl:apply-templates select="/" mode="M18"/>
      <xsl:apply-templates select="/" mode="M19"/>
      <xsl:apply-templates select="/" mode="M20"/>
      <xsl:apply-templates select="/" mode="M21"/>
      <xsl:apply-templates select="/" mode="M22"/>
      <xsl:apply-templates select="/" mode="M23"/>
      <xsl:apply-templates select="/" mode="M24"/>
      <xsl:apply-templates select="/" mode="M25"/>
      <xsl:apply-templates select="/" mode="M26"/>
      <xsl:apply-templates select="/" mode="M27"/>
      <xsl:apply-templates select="/" mode="M28"/>
      <xsl:apply-templates select="/" mode="M29"/>
      <xsl:apply-templates select="/" mode="M30"/>
      <xsl:apply-templates select="/" mode="M31"/>
      <xsl:apply-templates select="/" mode="M32"/>
      <xsl:apply-templates select="/" mode="M33"/>
      <xsl:apply-templates select="/" mode="M34"/>
      <xsl:apply-templates select="/" mode="M35"/>
      <xsl:apply-templates select="/" mode="M36"/>
      <xsl:apply-templates select="/" mode="M37"/>
      <xsl:apply-templates select="/" mode="M38"/>
      <xsl:apply-templates select="/" mode="M39"/>
      <xsl:apply-templates select="/" mode="M40"/>
      <xsl:apply-templates select="/" mode="M41"/>
      <xsl:apply-templates select="/" mode="M42"/>
      <xsl:apply-templates select="/" mode="M43"/>
      <xsl:apply-templates select="/" mode="M44"/>
      <xsl:apply-templates select="/" mode="M45"/>
      <xsl:apply-templates select="/" mode="M46"/>
      <xsl:apply-templates select="/" mode="M47"/>
      <xsl:apply-templates select="/" mode="M48"/>
      <xsl:apply-templates select="/" mode="M49"/>
      <xsl:apply-templates select="/" mode="M50"/>
      <xsl:apply-templates select="/" mode="M51"/>
      <xsl:apply-templates select="/" mode="M52"/>
      <xsl:apply-templates select="/" mode="M53"/>
      <xsl:apply-templates select="/" mode="M54"/>
      <xsl:apply-templates select="/" mode="M55"/>
      <xsl:apply-templates select="/" mode="M56"/>
      <xsl:apply-templates select="/" mode="M57"/>
      <xsl:apply-templates select="/" mode="M58"/>
      <xsl:apply-templates select="/" mode="M59"/>
      <xsl:apply-templates select="/" mode="M60"/>
      <xsl:apply-templates select="/" mode="M61"/>
      <xsl:apply-templates select="/" mode="M62"/>
      <xsl:apply-templates select="/" mode="M63"/>
      <xsl:apply-templates select="/" mode="M64"/>
      <xsl:apply-templates select="/" mode="M65"/>
      <xsl:apply-templates select="/" mode="M66"/>
      <xsl:apply-templates select="/" mode="M67"/>
      <xsl:apply-templates select="/" mode="M68"/>
      <xsl:apply-templates select="/" mode="M69"/>
      <xsl:apply-templates select="/" mode="M70"/>
      <xsl:apply-templates select="/" mode="M71"/>
      <xsl:apply-templates select="/" mode="M72"/>
      <xsl:apply-templates select="/" mode="M73"/>
      <xsl:apply-templates select="/" mode="M74"/>
      <xsl:apply-templates select="/" mode="M75"/>
      <xsl:apply-templates select="/" mode="M76"/>
      <xsl:apply-templates select="/" mode="M77"/>
      <xsl:apply-templates select="/" mode="M78"/>
      <xsl:apply-templates select="/" mode="M79"/>
      <xsl:apply-templates select="/" mode="M80"/>
      <xsl:apply-templates select="/" mode="M81"/>
      <xsl:apply-templates select="/" mode="M82"/>
      <xsl:apply-templates select="/" mode="M83"/>
      <xsl:apply-templates select="/" mode="M84"/>
      <xsl:apply-templates select="/" mode="M85"/>
      <xsl:apply-templates select="/" mode="M86"/>
      <xsl:apply-templates select="/" mode="M87"/>
      <xsl:apply-templates select="/" mode="M88"/>
      <xsl:apply-templates select="/" mode="M89"/>
      <xsl:apply-templates select="/" mode="M90"/>
      <xsl:apply-templates select="/" mode="M91"/>
      <xsl:apply-templates select="/" mode="M92"/>
      <xsl:apply-templates select="/" mode="M93"/>
      <xsl:apply-templates select="/" mode="M94"/>
      <xsl:apply-templates select="/" mode="M95"/>
      <xsl:apply-templates select="/" mode="M96"/>
      <xsl:apply-templates select="/" mode="M97"/>
      <xsl:apply-templates select="/" mode="M98"/>
      <xsl:apply-templates select="/" mode="M99"/>
      <xsl:apply-templates select="/" mode="M100"/>
      <xsl:apply-templates select="/" mode="M101"/>
      <xsl:apply-templates select="/" mode="M102"/>
      <xsl:apply-templates select="/" mode="M103"/>
      <xsl:apply-templates select="/" mode="M104"/>
      <xsl:apply-templates select="/" mode="M105"/>
      <xsl:apply-templates select="/" mode="M106"/>
      <xsl:apply-templates select="/" mode="M107"/>
      <xsl:apply-templates select="/" mode="M108"/>
      <xsl:apply-templates select="/" mode="M109"/>
      <xsl:apply-templates select="/" mode="M110"/>
      <xsl:apply-templates select="/" mode="M111"/>
      <xsl:apply-templates select="/" mode="M112"/>
      <xsl:apply-templates select="/" mode="M113"/>
      <xsl:apply-templates select="/" mode="M114"/>
      <xsl:apply-templates select="/" mode="M115"/>
      <xsl:apply-templates select="/" mode="M116"/>
      <xsl:apply-templates select="/" mode="M117"/>
      <xsl:apply-templates select="/" mode="M118"/>
      <xsl:apply-templates select="/" mode="M119"/>
      <xsl:apply-templates select="/" mode="M120"/>
      <xsl:apply-templates select="/" mode="M121"/>
      <xsl:apply-templates select="/" mode="M122"/>
      <xsl:apply-templates select="/" mode="M123"/>
   </xsl:template>

   <!--SCHEMATRON PATTERNS-->
<xsl:include xmlns:sch="http://purl.oclc.org/dsdl/schematron" href="ndr-functions.xsl"/>

   <!--PATTERN Conformance target identifiers-->


	<!--RULE -->
<xsl:template match="*[. is nf:get-document-element(.)]"
                 priority="1000"
                 mode="M10">

		<!--REPORT -->
<xsl:if test="true()">
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                       use-when="function-available('saxon:line-number')">
            <xsl:text>:</xsl:text>
            <xsl:value-of select="saxon:line-number()"/>
         </xsl:value-of>
         <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:report:</xsl:text>Rule 3-1: The document MUST be a conformant document as defined by the NIEM Conformance Targets Attribute Specification.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M10"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M10"/>
   <xsl:template match="@*|node()" priority="-2" mode="M10">
      <xsl:apply-templates select="*" mode="M10"/>
   </xsl:template>

   <!--PATTERN Conformance target identifiers-->


	<!--RULE -->
<xsl:template match="*" priority="1000" mode="M11">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="(. is nf:get-document-element(.)) = exists(@ct:conformanceTargets)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 3-2: An element MUST own an attribute {http://release.niem.gov/niem/conformanceTargets/3.0/}conformanceTargets if and only if it is the document element of an XML document.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M11"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M11"/>
   <xsl:template match="@*|node()" priority="-2" mode="M11">
      <xsl:apply-templates select="*" mode="M11"/>
   </xsl:template>

   <!--PATTERN Conformance target identifiers-->


	<!--RULE -->
<xsl:template match="*[. is nf:get-document-element(.)]"
                 priority="1000"
                 mode="M12">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="nf:has-effective-conformance-target(., xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ExtensionSchemaDocument'))"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 3-4: The document MUST have an effective conformance target identifier of http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ExtensionSchemaDocument.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M12"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M12"/>
   <xsl:template match="@*|node()" priority="-2" mode="M12">
      <xsl:apply-templates select="*" mode="M12"/>
   </xsl:template>

   <!--PATTERN Conformance to XML-->


	<!--RULE -->
<xsl:template match="*[. is nf:get-document-element(.)]"
                 priority="1000"
                 mode="M13">

		<!--REPORT -->
<xsl:if test="true()">
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                       use-when="function-available('saxon:line-number')">
            <xsl:text>:</xsl:text>
            <xsl:value-of select="saxon:line-number()"/>
         </xsl:value-of>
         <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:report:</xsl:text>Rule 6-1: The document MUST be a well-formed XML document, as defined by Extensible Markup Language.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M13"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M13"/>
   <xsl:template match="@*|node()" priority="-2" mode="M13">
      <xsl:apply-templates select="*" mode="M13"/>
   </xsl:template>

   <!--PATTERN Conformance to XML Namespaces-->


	<!--RULE -->
<xsl:template match="*[. is nf:get-document-element(.)]"
                 priority="1000"
                 mode="M14">

		<!--REPORT -->
<xsl:if test="true()">
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                       use-when="function-available('saxon:line-number')">
            <xsl:text>:</xsl:text>
            <xsl:value-of select="saxon:line-number()"/>
         </xsl:value-of>
         <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:report:</xsl:text>Rule 6-2: The document MUST be namespace-well-formed.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M14"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M14"/>
   <xsl:template match="@*|node()" priority="-2" mode="M14">
      <xsl:apply-templates select="*" mode="M14"/>
   </xsl:template>

   <!--PATTERN Conformance to XML Namespaces-->


	<!--RULE -->
<xsl:template match="*[. is nf:get-document-element(.)]"
                 priority="1000"
                 mode="M15">

		<!--REPORT -->
<xsl:if test="true()">
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                       use-when="function-available('saxon:line-number')">
            <xsl:text>:</xsl:text>
            <xsl:value-of select="saxon:line-number()"/>
         </xsl:value-of>
         <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:report:</xsl:text>Rule 6-3: The document MUST be namespace-valid.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M15"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M15"/>
   <xsl:template match="@*|node()" priority="-2" mode="M15">
      <xsl:apply-templates select="*" mode="M15"/>
   </xsl:template>

   <!--PATTERN Conformance to XML Schema-->


	<!--RULE -->
<xsl:template match="*[. is nf:get-document-element(.)]"
                 priority="1000"
                 mode="M16">

		<!--REPORT -->
<xsl:if test="true()">
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                       use-when="function-available('saxon:line-number')">
            <xsl:text>:</xsl:text>
            <xsl:value-of select="saxon:line-number()"/>
         </xsl:value-of>
         <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:report:</xsl:text>Rule 6-4: The document MUST be a schema document.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
      </xsl:if>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::xs:schema"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 6-4: The document element of the XML document must be {http://www.w3.org/2001/XMLSchema}schema.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M16"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M16"/>
   <xsl:template match="@*|node()" priority="-2" mode="M16">
      <xsl:apply-templates select="*" mode="M16"/>
   </xsl:template>

   <!--PATTERN No base type of xs:ID-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@base)]" priority="1000" mode="M17">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="resolve-QName(@base, .) != xs:QName('xs:ID')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-1: A schema component MUST NOT have an attribute {}base with a value of {http://www.w3.org/2001/XMLSchema}ID.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M17"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M17"/>
   <xsl:template match="@*|node()" priority="-2" mode="M17">
      <xsl:apply-templates select="*" mode="M17"/>
   </xsl:template>

   <!--PATTERN No base type of xs:IDREF-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@base)]" priority="1000" mode="M18">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="resolve-QName(@base, .) != xs:QName('xs:IDREF')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-2: A schema component MUST NOT have an attribute {}base with a value of {http://www.w3.org/2001/XMLSchema}IDREF.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M18"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M18"/>
   <xsl:template match="@*|node()" priority="-2" mode="M18">
      <xsl:apply-templates select="*" mode="M18"/>
   </xsl:template>

   <!--PATTERN No base type of xs:anyType-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@base)]" priority="1000" mode="M19">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="resolve-QName(@base, .) != xs:QName('xs:anyType')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-3: A schema component MUST NOT have an attribute {}base with a value of {http://www.w3.org/2001/XMLSchema}anyType.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M19"/>
   <xsl:template match="@*|node()" priority="-2" mode="M19">
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>

   <!--PATTERN No base type of xs:anySimpleType-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@base)]" priority="1000" mode="M20">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="resolve-QName(@base, .) != xs:QName('xs:anySimpleType')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-4: A schema component MUST NOT have an attribute {}base with a value of {http://www.w3.org/2001/XMLSchema}anySimpleType.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M20"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M20"/>
   <xsl:template match="@*|node()" priority="-2" mode="M20">
      <xsl:apply-templates select="*" mode="M20"/>
   </xsl:template>

   <!--PATTERN No base type of xs:NOTATION-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@base)]" priority="1000" mode="M21">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="resolve-QName(@base, .) != xs:QName('xs:NOTATION')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-5: A schema component MUST NOT have an attribute {}base with a value of {http://www.w3.org/2001/XMLSchema}NOTATION.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M21"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M21"/>
   <xsl:template match="@*|node()" priority="-2" mode="M21">
      <xsl:apply-templates select="*" mode="M21"/>
   </xsl:template>

   <!--PATTERN Simple type definition is top-level-->


	<!--RULE -->
<xsl:template match="xs:simpleType" priority="1000" mode="M22">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(parent::xs:schema)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-6: A simple type definition MUST be top-level.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M22"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M22"/>
   <xsl:template match="@*|node()" priority="-2" mode="M22">
      <xsl:apply-templates select="*" mode="M22"/>
   </xsl:template>

   <!--PATTERN Simple type has data definition-->


	<!--RULE -->
<xsl:template match="xs:simpleType" priority="1000" mode="M23">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(xs:annotation/xs:documentation)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-7: A simple type MUST be a documented component.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M23"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M23"/>
   <xsl:template match="@*|node()" priority="-2" mode="M23">
      <xsl:apply-templates select="*" mode="M23"/>
   </xsl:template>

   <!--PATTERN Simple type data definition is not empty-->


	<!--RULE -->
<xsl:template match="xs:simpleType/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]"
                 priority="1000"
                 mode="M24">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="string-length(normalize-space(string-join(text(), ''))) &gt; 0"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-8: A data definition MUST NOT be empty.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M24"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M24"/>
   <xsl:template match="@*|node()" priority="-2" mode="M24">
      <xsl:apply-templates select="*" mode="M24"/>
   </xsl:template>

   <!--PATTERN No list item type of xs:ID-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@itemType)]" priority="1000" mode="M25">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="resolve-QName(@itemType, .) != xs:QName('xs:ID')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-9: A schema component MUST NOT have an attribute {}itemType with a value of {http://www.w3.org/2001/XMLSchema}ID.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M25"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M25"/>
   <xsl:template match="@*|node()" priority="-2" mode="M25">
      <xsl:apply-templates select="*" mode="M25"/>
   </xsl:template>

   <!--PATTERN No list item type of xs:IDREF-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@itemType)]" priority="1000" mode="M26">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="resolve-QName(@itemType, .) != xs:QName('xs:IDREF')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-10: A schema component MUST NOT have an attribute {}itemType with a value of {http://www.w3.org/2001/XMLSchema}IDREF.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M26"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M26"/>
   <xsl:template match="@*|node()" priority="-2" mode="M26">
      <xsl:apply-templates select="*" mode="M26"/>
   </xsl:template>

   <!--PATTERN No list item type of xs:anySimpleType-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@itemType)]" priority="1000" mode="M27">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="resolve-QName(@itemType, .) != xs:QName('xs:anySimpleType')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-11: A schema component MUST NOT have an attribute {}itemType with a value of {http://www.w3.org/2001/XMLSchema}anySimpleType.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M27"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M27"/>
   <xsl:template match="@*|node()" priority="-2" mode="M27">
      <xsl:apply-templates select="*" mode="M27"/>
   </xsl:template>

   <!--PATTERN No union member types of xs:ID-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@memberTypes)]" priority="1000" mode="M28">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="every $type-qname                        in tokenize(normalize-space(@memberTypes), ' ')                       satisfies resolve-QName($type-qname, .) != xs:QName('xs:ID')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-12: A schema component MUST NOT have an attribute {}memberTypes that includes a value of {http://www.w3.org/2001/XMLSchema}ID.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M28"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M28"/>
   <xsl:template match="@*|node()" priority="-2" mode="M28">
      <xsl:apply-templates select="*" mode="M28"/>
   </xsl:template>

   <!--PATTERN No union member types of xs:IDREF-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@memberTypes)]" priority="1000" mode="M29">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="every $type-qname                        in tokenize(normalize-space(@memberTypes), ' ')                       satisfies resolve-QName($type-qname, .) != xs:QName('xs:IDREF')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-13: A schema component MUST NOT have an attribute {}memberTypes that includes a value of {http://www.w3.org/2001/XMLSchema}IDREF.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M29"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M29"/>
   <xsl:template match="@*|node()" priority="-2" mode="M29">
      <xsl:apply-templates select="*" mode="M29"/>
   </xsl:template>

   <!--PATTERN No union member types of xs:anySimpleType-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@memberTypes)]" priority="1000" mode="M30">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="every $type-qname                        in tokenize(normalize-space(@memberTypes), ' ')                       satisfies resolve-QName($type-qname, .) != xs:QName('xs:anySimpleType')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-14: A schema component MUST NOT have an attribute {}memberTypes that includes a value of {http://www.w3.org/2001/XMLSchema}anySimpleType.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M30"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M30"/>
   <xsl:template match="@*|node()" priority="-2" mode="M30">
      <xsl:apply-templates select="*" mode="M30"/>
   </xsl:template>

   <!--PATTERN Enumeration has data definition-->


	<!--RULE -->
<xsl:template match="xs:enumeration" priority="1000" mode="M31">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(xs:annotation/xs:documentation)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-16: An enumeration facet MUST be a documented component.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M31"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M31"/>
   <xsl:template match="@*|node()" priority="-2" mode="M31">
      <xsl:apply-templates select="*" mode="M31"/>
   </xsl:template>

   <!--PATTERN Enumeration data definition is not empty-->


	<!--RULE -->
<xsl:template match="xs:enumeration/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]"
                 priority="1000"
                 mode="M32">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="string-length(normalize-space(string-join(text(), ''))) &gt; 0"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-17: A data definition MUST NOT be empty.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M32"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M32"/>
   <xsl:template match="@*|node()" priority="-2" mode="M32">
      <xsl:apply-templates select="*" mode="M32"/>
   </xsl:template>

   <!--PATTERN Complex type definitions are top-level-->


	<!--RULE -->
<xsl:template match="xs:complexType" priority="1000" mode="M33">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(parent::xs:schema)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-18: A complex type definition must be top-level.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M33"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M33"/>
   <xsl:template match="@*|node()" priority="-2" mode="M33">
      <xsl:apply-templates select="*" mode="M33"/>
   </xsl:template>

   <!--PATTERN Complex type has data definition-->


	<!--RULE -->
<xsl:template match="xs:complexType" priority="1000" mode="M34">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(xs:annotation/xs:documentation)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-19: A complex type MUST be a documented component.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M34"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M34"/>
   <xsl:template match="@*|node()" priority="-2" mode="M34">
      <xsl:apply-templates select="*" mode="M34"/>
   </xsl:template>

   <!--PATTERN Complex type data definition is not empty-->


	<!--RULE -->
<xsl:template match="xs:complexType/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]"
                 priority="1000"
                 mode="M35">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="string-length(normalize-space(string-join(text(), ''))) &gt; 0"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-20: A data definition MUST NOT be empty.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M35"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M35"/>
   <xsl:template match="@*|node()" priority="-2" mode="M35">
      <xsl:apply-templates select="*" mode="M35"/>
   </xsl:template>

   <!--PATTERN No mixed content on complex type-->


	<!--RULE -->
<xsl:template match="xs:complexType[exists(@mixed)]" priority="1000" mode="M36">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="xs:boolean(@mixed) = false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-21: A complex type declaration MUST NOT have mixed content.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M36"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M36"/>
   <xsl:template match="@*|node()" priority="-2" mode="M36">
      <xsl:apply-templates select="*" mode="M36"/>
   </xsl:template>

   <!--PATTERN No mixed content on complex content-->


	<!--RULE -->
<xsl:template match="xs:complexContent[exists(@mixed)]"
                 priority="1000"
                 mode="M37">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="xs:boolean(@mixed) = false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-22: A complex type declaration MUST NOT have mixed content.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M37"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M37"/>
   <xsl:template match="@*|node()" priority="-2" mode="M37">
      <xsl:apply-templates select="*" mode="M37"/>
   </xsl:template>

   <!--PATTERN Complex type content is explicitly simple or complex-->


	<!--RULE -->
<xsl:template match="xs:complexType" priority="1000" mode="M38">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(xs:simpleContent) or exists(xs:complexContent)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-23: An element {http://www.w3.org/2001/XMLSchema}complexType MUST have a child element {http://www.w3.org/2001/XMLSchema}simpleContent or {http://www.w3.org/2001/XMLSchema}complexContent.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M38"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M38"/>
   <xsl:template match="@*|node()" priority="-2" mode="M38">
      <xsl:apply-templates select="*" mode="M38"/>
   </xsl:template>

   <!--PATTERN Complex type with complex content must have complex content-->


	<!--RULE -->
<xsl:template match="xs:complexType[       nf:has-effective-conformance-target(., (xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ReferenceSchemaDocument'),                                                xs:anyURI('http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/#ExtensionSchemaDocument')))]     /xs:complexContent       /xs:*[(self::xs:restriction or self::xs:extension)             and exists(@base)]"
                 priority="1000"
                 mode="M39">
      <xsl:variable name="not-complex-content"
                    select="for $qname in resolve-QName(@base, .),                         $not-structures-qname in $qname[namespace-uri-from-QName(.) != xs:anyURI('http://release.niem.gov/niem/structures/3.0/')],                         $base-type in nf:resolve-type(., $not-structures-qname),                         $base-complex-type in $base-type[self::xs:complexType],                         $base-not-complex-content in $base-complex-type[empty(xs:complexContent)]                     return $base-not-complex-content"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty($not-complex-content)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-25: The base type of complex type that has complex content MUST have complex content.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M39"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M39"/>
   <xsl:template match="@*|node()" priority="-2" mode="M39">
      <xsl:apply-templates select="*" mode="M39"/>
   </xsl:template>

   <!--PATTERN Element declaration is top-level-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@name)]" priority="1000" mode="M40">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(parent::xs:schema)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-30: An element declaration MUST be top-level.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M40"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M40"/>
   <xsl:template match="@*|node()" priority="-2" mode="M40">
      <xsl:apply-templates select="*" mode="M40"/>
   </xsl:template>

   <!--PATTERN Element declaration has data definition-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@name)]" priority="1000" mode="M41">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(xs:annotation/xs:documentation)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-31: An element declaration MUST be a documented component.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M41"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M41"/>
   <xsl:template match="@*|node()" priority="-2" mode="M41">
      <xsl:apply-templates select="*" mode="M41"/>
   </xsl:template>

   <!--PATTERN Element declaration data definition is not empty-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@name)]/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]"
                 priority="1000"
                 mode="M42">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="string-length(normalize-space(string-join(text(), ''))) &gt; 0"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-32: A data definition MUST NOT be empty.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M42"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M42"/>
   <xsl:template match="@*|node()" priority="-2" mode="M42">
      <xsl:apply-templates select="*" mode="M42"/>
   </xsl:template>

   <!--PATTERN Untyped element is abstract-->


	<!--RULE -->
<xsl:template match="xs:schema/xs:element[empty(@type)]"
                 priority="1000"
                 mode="M43">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(@abstract)                       and xs:boolean(@abstract) = true()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-33: A top-level element declaration that has no type MUST be abstract.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M43"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M43"/>
   <xsl:template match="@*|node()" priority="-2" mode="M43">
      <xsl:apply-templates select="*" mode="M43"/>
   </xsl:template>

   <!--PATTERN Element of type xs:anySimpleType is abstract-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@type)                                 and resolve-QName(@type, .) = xs:QName('xs:anySimpleType')]"
                 priority="1000"
                 mode="M44">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(@abstract)                       and xs:boolean(@abstract) = true()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-34: An element declaration that has a type {http://www.w3.org/2001/XMLSchema}anySimpleType MUST be abstract.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M44"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M44"/>
   <xsl:template match="@*|node()" priority="-2" mode="M44">
      <xsl:apply-templates select="*" mode="M44"/>
   </xsl:template>

   <!--PATTERN Element type not in the XML Schema namespace-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@type)]" priority="1000" mode="M45">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="for $type-qname in resolve-QName(@type, .) return                         $type-qname = xs:QName('xs:anySimpleType')                         or namespace-uri-from-QName($type-qname) != xs:anyURI('http://www.w3.org/2001/XMLSchema')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-35: An element type that is not {http://www.w3.org/2001/XMLSchema}anySimpleType MUST NOT have a namespace name http://www.w3.org/2001/XMLSchema.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M45"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M45"/>
   <xsl:template match="@*|node()" priority="-2" mode="M45">
      <xsl:apply-templates select="*" mode="M45"/>
   </xsl:template>

   <!--PATTERN Element type not in a special namespace-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@type)]" priority="1000" mode="M46">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(namespace-uri-from-QName(resolve-QName(@type, .))                           = (xs:anyURI('http://www.w3.org/XML/1998/namespace'),                                xs:anyURI('urn:us:gov:ic:ism'),                                xs:anyURI('urn:us:gov:ic:ntk')))"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-36: An element type MUST NOT have a namespace name that is in a special namespace.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M46"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M46"/>
   <xsl:template match="@*|node()" priority="-2" mode="M46">
      <xsl:apply-templates select="*" mode="M46"/>
   </xsl:template>

   <!--PATTERN No element default values-->


	<!--RULE -->
<xsl:template match="xs:element" priority="1000" mode="M47">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@default)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-40: An element {http://www.w3.org/2001/XMLSchema}element MUST NOT have an attribute {}default.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M47"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M47"/>
   <xsl:template match="@*|node()" priority="-2" mode="M47">
      <xsl:apply-templates select="*" mode="M47"/>
   </xsl:template>

   <!--PATTERN No element fixed values-->


	<!--RULE -->
<xsl:template match="xs:element" priority="1000" mode="M48">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@fixed)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-41: An element {http://www.w3.org/2001/XMLSchema}element MUST NOT have an attribute {}fixed.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M48"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M48"/>
   <xsl:template match="@*|node()" priority="-2" mode="M48">
      <xsl:apply-templates select="*" mode="M48"/>
   </xsl:template>

   <!--PATTERN Attribute declarations are top-level-->


	<!--RULE -->
<xsl:template match="xs:attribute[exists(@name)]" priority="1000" mode="M49">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(parent::xs:schema)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-43: An attribute declaration MUST be top-level.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M49"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M49"/>
   <xsl:template match="@*|node()" priority="-2" mode="M49">
      <xsl:apply-templates select="*" mode="M49"/>
   </xsl:template>

   <!--PATTERN Attribute declaration has data definition-->


	<!--RULE -->
<xsl:template match="xs:attribute[exists(@name)]" priority="1000" mode="M50">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(xs:annotation/xs:documentation)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-44: An attribute declaration MUST be a documented component.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M50"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M50"/>
   <xsl:template match="@*|node()" priority="-2" mode="M50">
      <xsl:apply-templates select="*" mode="M50"/>
   </xsl:template>

   <!--PATTERN Attribute declaration data definition is not empty-->


	<!--RULE -->
<xsl:template match="xs:attribute[exists(@name)]/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]"
                 priority="1000"
                 mode="M51">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="string-length(normalize-space(string-join(text(), ''))) &gt; 0"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-45: A data definition MUST NOT be empty.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M51"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M51"/>
   <xsl:template match="@*|node()" priority="-2" mode="M51">
      <xsl:apply-templates select="*" mode="M51"/>
   </xsl:template>

   <!--PATTERN Attribute declaration has type-->


	<!--RULE -->
<xsl:template match="xs:attribute[exists(@name)]" priority="1000" mode="M52">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(@type)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-46: A top-level attribute declaration MUST have a type.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M52"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M52"/>
   <xsl:template match="@*|node()" priority="-2" mode="M52">
      <xsl:apply-templates select="*" mode="M52"/>
   </xsl:template>

   <!--PATTERN No attribute type of xs:ID-->


	<!--RULE -->
<xsl:template match="xs:attribute[exists(@type)]" priority="1000" mode="M53">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="resolve-QName(@type, .) != xs:QName('xs:ID')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-47: A schema component MUST NOT have an attribute {}type with a value of {http://www.w3.org/2001/XMLSchema}ID.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M53"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M53"/>
   <xsl:template match="@*|node()" priority="-2" mode="M53">
      <xsl:apply-templates select="*" mode="M53"/>
   </xsl:template>

   <!--PATTERN No attribute type of xs:IDREF-->


	<!--RULE -->
<xsl:template match="xs:attribute[exists(@type)]" priority="1000" mode="M54">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="resolve-QName(@type, .) != xs:QName('xs:IDREF')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-48: A schema component MUST NOT have an attribute {}type with a value of {http://www.w3.org/2001/XMLSchema}IDREF.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M54"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M54"/>
   <xsl:template match="@*|node()" priority="-2" mode="M54">
      <xsl:apply-templates select="*" mode="M54"/>
   </xsl:template>

   <!--PATTERN No attribute default values-->


	<!--RULE -->
<xsl:template match="xs:attribute" priority="1000" mode="M55">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@default)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-49: An element {http://www.w3.org/2001/XMLSchema}attribute MUST NOT have an attribute {}default.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M55"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M55"/>
   <xsl:template match="@*|node()" priority="-2" mode="M55">
      <xsl:apply-templates select="*" mode="M55"/>
   </xsl:template>

   <!--PATTERN No attribute fixed values-->


	<!--RULE -->
<xsl:template match="xs:attribute" priority="1000" mode="M56">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@fixed)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-50: An element {http://www.w3.org/2001/XMLSchema}attribute MUST NOT have an attribute {}fixed.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M56"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M56"/>
   <xsl:template match="@*|node()" priority="-2" mode="M56">
      <xsl:apply-templates select="*" mode="M56"/>
   </xsl:template>

   <!--PATTERN No use of element xs:notation-->


	<!--RULE -->
<xsl:template match="xs:notation" priority="1000" mode="M57">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-51: The schema SHALL NOT contain the element {http://www.w3.org/2001/XMLSchema}notation.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M57"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M57"/>
   <xsl:template match="@*|node()" priority="-2" mode="M57">
      <xsl:apply-templates select="*" mode="M57"/>
   </xsl:template>

   <!--PATTERN No xs:all-->


	<!--RULE -->
<xsl:template match="xs:all" priority="1000" mode="M58">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-52: The schema SHALL NOT contain the element {http://www.w3.org/2001/XMLSchema}all<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M58"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M58"/>
   <xsl:template match="@*|node()" priority="-2" mode="M58">
      <xsl:apply-templates select="*" mode="M58"/>
   </xsl:template>

   <!--PATTERN xs:sequence must be child of xs:extension or xs:restriction-->


	<!--RULE -->
<xsl:template match="xs:sequence" priority="1000" mode="M59">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(parent::xs:extension) or exists(parent::xs:restriction)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-54: An element {http://www.w3.org/2001/XMLSchema}sequence must be a child of element {http://www.w3.org/2001/XMLSchema}extension or {http://www.w3.org/2001/XMLSchema}restriction.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M59"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M59"/>
   <xsl:template match="@*|node()" priority="-2" mode="M59">
      <xsl:apply-templates select="*" mode="M59"/>
   </xsl:template>

   <!--PATTERN xs:choice must be child of xs:sequence-->


	<!--RULE -->
<xsl:template match="xs:choice" priority="1000" mode="M60">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(parent::xs:sequence)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-56: An element {http://www.w3.org/2001/XMLSchema}choice must be a child of element {http://www.w3.org/2001/XMLSchema}sequence.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M60"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M60"/>
   <xsl:template match="@*|node()" priority="-2" mode="M60">
      <xsl:apply-templates select="*" mode="M60"/>
   </xsl:template>

   <!--PATTERN Sequence minimum cardinality-->


	<!--RULE -->
<xsl:template match="xs:sequence" priority="1000" mode="M61">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@minOccurs) or xs:integer(@minOccurs) = 1"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-57: An element {http://www.w3.org/2001/XMLSchema}sequence MUST either not have the attribute {}minOccurs, or that attribute MUST have a value of 1.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M61"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M61"/>
   <xsl:template match="@*|node()" priority="-2" mode="M61">
      <xsl:apply-templates select="*" mode="M61"/>
   </xsl:template>

   <!--PATTERN Sequence maximum cardinality-->


	<!--RULE -->
<xsl:template match="xs:sequence" priority="1000" mode="M62">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@maxOccurs) or (@maxOccurs instance of xs:integer                                             and 1 = xs:integer(@maxOccurs))"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-58: An element {http://www.w3.org/2001/XMLSchema}sequence MUST either not have the attribute {}maxOccurs, or that attribute MUST have a value of 1.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M62"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M62"/>
   <xsl:template match="@*|node()" priority="-2" mode="M62">
      <xsl:apply-templates select="*" mode="M62"/>
   </xsl:template>

   <!--PATTERN Choice minimum cardinality-->


	<!--RULE -->
<xsl:template match="xs:choice" priority="1000" mode="M63">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@minOccurs) or 1 = xs:integer(@minOccurs)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-59: An element {http://www.w3.org/2001/XMLSchema}choice MUST either not have the attribute {}minOccurs, or that attribute MUST have a value of 1.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M63"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M63"/>
   <xsl:template match="@*|node()" priority="-2" mode="M63">
      <xsl:apply-templates select="*" mode="M63"/>
   </xsl:template>

   <!--PATTERN Choice maximum cardinality-->


	<!--RULE -->
<xsl:template match="xs:choice" priority="1000" mode="M64">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@maxOccurs) or (@maxOccurs instance of xs:integer                                             and 1 = xs:integer(@maxOccurs))"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-60: An element {http://www.w3.org/2001/XMLSchema}choice MUST either not have the attribute {}maxOccurs, or that attribute MUST have a value of 1.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M64"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M64"/>
   <xsl:template match="@*|node()" priority="-2" mode="M64">
      <xsl:apply-templates select="*" mode="M64"/>
   </xsl:template>

   <!--PATTERN Attribute ref defined by conformant schemas-->


	<!--RULE -->
<xsl:template match="xs:attribute[exists(@ref)]" priority="1000" mode="M65">
      <xsl:variable name="namespace"
                    select="namespace-uri-from-QName(resolve-QName(@ref, .))"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$namespace = nf:get-target-namespace(.)                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-61: An attribute ref MUST have the target namespace or a namespace that is imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M65"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M65"/>
   <xsl:template match="@*|node()" priority="-2" mode="M65">
      <xsl:apply-templates select="*" mode="M65"/>
   </xsl:template>

   <!--PATTERN Only known attribute groups-->


	<!--RULE -->
<xsl:template match="xs:attributeGroup[exists(@ref)]" priority="1000" mode="M66">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="for $ref in exactly-one(resolve-QName(@ref, .)) return       ($ref = xs:QName('structures:SimpleObjectAttributeGroup')        or (for $ref-namespace in exactly-one(namespace-uri-from-QName($ref)) return              $ref-namespace = (xs:anyURI('urn:us:gov:ic:ism'),                               xs:anyURI('urn:us:gov:ic:ntk'))))"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-62: An attribute group reference MUST be structures:SimpleObjectAttributeGroup or have the IC-ISM or IC-NTK namespace.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M66"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M66"/>
   <xsl:template match="@*|node()" priority="-2" mode="M66">
      <xsl:apply-templates select="*" mode="M66"/>
   </xsl:template>

   <!--PATTERN No use of xs:any-->


	<!--RULE -->
<xsl:template match="xs:any" priority="1000" mode="M67">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-63: The schema SHALL NOT contain the element {http://www.w3.org/2001/XMLSchema}any.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M67"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M67"/>
   <xsl:template match="@*|node()" priority="-2" mode="M67">
      <xsl:apply-templates select="*" mode="M67"/>
   </xsl:template>

   <!--PATTERN No use of xs:anyAttribute-->


	<!--RULE -->
<xsl:template match="xs:anyAttribute" priority="1000" mode="M68">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-64: The schema SHALL NOT contain the element {http://www.w3.org/2001/XMLSchema}anyAttribute.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M68"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M68"/>
   <xsl:template match="@*|node()" priority="-2" mode="M68">
      <xsl:apply-templates select="*" mode="M68"/>
   </xsl:template>

   <!--PATTERN No use of xs:unique-->


	<!--RULE -->
<xsl:template match="xs:unique" priority="1000" mode="M69">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-65: The schema SHALL NOT contain the element {http://www.w3.org/2001/XMLSchema}unique.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M69"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M69"/>
   <xsl:template match="@*|node()" priority="-2" mode="M69">
      <xsl:apply-templates select="*" mode="M69"/>
   </xsl:template>

   <!--PATTERN No use of xs:key-->


	<!--RULE -->
<xsl:template match="xs:key" priority="1000" mode="M70">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-66: The schema SHALL NOT contain the element {http://www.w3.org/2001/XMLSchema}key.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M70"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M70"/>
   <xsl:template match="@*|node()" priority="-2" mode="M70">
      <xsl:apply-templates select="*" mode="M70"/>
   </xsl:template>

   <!--PATTERN No use of xs:keyref-->


	<!--RULE -->
<xsl:template match="xs:keyref" priority="1000" mode="M71">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-67: The schema SHALL NOT contain the element {http://www.w3.org/2001/XMLSchema}keyref.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M71"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M71"/>
   <xsl:template match="@*|node()" priority="-2" mode="M71">
      <xsl:apply-templates select="*" mode="M71"/>
   </xsl:template>

   <!--PATTERN No use of xs:selector-->


	<!--RULE -->
<xsl:template match="xs:selector" priority="1000" mode="M72">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-68: The schema SHALL NOT contain the element {http://www.w3.org/2001/XMLSchema}selector.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M72"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M72"/>
   <xsl:template match="@*|node()" priority="-2" mode="M72">
      <xsl:apply-templates select="*" mode="M72"/>
   </xsl:template>

   <!--PATTERN No use of xs:field-->


	<!--RULE -->
<xsl:template match="xs:field" priority="1000" mode="M73">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-69: The schema SHALL NOT contain the element {http://www.w3.org/2001/XMLSchema}field.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M73"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M73"/>
   <xsl:template match="@*|node()" priority="-2" mode="M73">
      <xsl:apply-templates select="*" mode="M73"/>
   </xsl:template>

   <!--PATTERN No use of xs:group-->


	<!--RULE -->
<xsl:template match="xs:group" priority="1000" mode="M74">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-70: The schema MUST NOT contain the element {http://www.w3.org/2001/XMLSchema}group.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M74"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M74"/>
   <xsl:template match="@*|node()" priority="-2" mode="M74">
      <xsl:apply-templates select="*" mode="M74"/>
   </xsl:template>

   <!--PATTERN No definition of attribute groups-->


	<!--RULE -->
<xsl:template match="xs:attributeGroup[@name]" priority="1000" mode="M75">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-71: The schema MUST NOT contain an attribute group definition schema component.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M75"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M75"/>
   <xsl:template match="@*|node()" priority="-2" mode="M75">
      <xsl:apply-templates select="*" mode="M75"/>
   </xsl:template>

   <!--PATTERN Comments are not recommended-->


	<!--RULE -->
<xsl:template match="comment()" priority="1000" mode="M76">

		<!--REPORT -->
<xsl:if test="true()">
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                       use-when="function-available('saxon:line-number')">
            <xsl:text>:</xsl:text>
            <xsl:value-of select="saxon:line-number()"/>
         </xsl:value-of>
         <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:report:</xsl:text>Rule 7-72: An XML Comment is not an XML Schema annotation component; XML Comments SHOULD NOT appear in the schema.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M76"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M76"/>
   <xsl:template match="@*|node()" priority="-2" mode="M76">
      <xsl:apply-templates select="*" mode="M76"/>
   </xsl:template>

   <!--PATTERN Documentation elements have no element children-->


	<!--RULE -->
<xsl:template match="xs:documentation/node()" priority="1000" mode="M77">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::text() or self::comment()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-73: A child of element {http://www.w3.org/2001/XMLSchema}documentation MUST be text or an XML comment.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M77"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M77"/>
   <xsl:template match="@*|node()" priority="-2" mode="M77">
      <xsl:apply-templates select="*" mode="M77"/>
   </xsl:template>

   <!--PATTERN Appinfo has elements-->


	<!--RULE -->
<xsl:template match="xs:appinfo/node()" priority="1000" mode="M78">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="self::comment() or self::element()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-74: A child of element {http://www.w3.org/2001/XMLSchema}appinfo MUST be an element or an XML comment.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M78"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M78"/>
   <xsl:template match="@*|node()" priority="-2" mode="M78">
      <xsl:apply-templates select="*" mode="M78"/>
   </xsl:template>

   <!--PATTERN Appinfo child elements have namespaces-->


	<!--RULE -->
<xsl:template match="xs:appinfo/*" priority="1000" mode="M79">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="namespace-uri() != xs:anyURI('')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-75: An element that is a child of {http://www.w3.org/2001/XMLSchema}appinfo MUST have a namespace name.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M79"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M79"/>
   <xsl:template match="@*|node()" priority="-2" mode="M79">
      <xsl:apply-templates select="*" mode="M79"/>
   </xsl:template>

   <!--PATTERN Appinfo descendants are not XML Schema elements-->


	<!--RULE -->
<xsl:template match="xs:appinfo//xs:*" priority="1000" mode="M80">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-76: An element with a namespace name of {http://www.w3.org/2001/XMLSchema} MUST NOT have an ancestor element {http://www.w3.org/2001/XMLSchema}appinfo.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M80"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M80"/>
   <xsl:template match="@*|node()" priority="-2" mode="M80">
      <xsl:apply-templates select="*" mode="M80"/>
   </xsl:template>

   <!--PATTERN Schema has data definition-->


	<!--RULE -->
<xsl:template match="xs:schema" priority="1000" mode="M81">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(xs:annotation/xs:documentation)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-77: A schema document element MUST be a documented component.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M81"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M81"/>
   <xsl:template match="@*|node()" priority="-2" mode="M81">
      <xsl:apply-templates select="*" mode="M81"/>
   </xsl:template>

   <!--PATTERN Schema data definition is not empty-->


	<!--RULE -->
<xsl:template match="xs:schema/xs:annotation/xs:documentation[                          . is (../../xs:annotation/xs:documentation)[1]]"
                 priority="1000"
                 mode="M82">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="string-length(normalize-space(string-join(text(), ''))) &gt; 0"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-78: A data definition MUST NOT be empty.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M82"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M82"/>
   <xsl:template match="@*|node()" priority="-2" mode="M82">
      <xsl:apply-templates select="*" mode="M82"/>
   </xsl:template>

   <!--PATTERN Define target namespace-->


	<!--RULE -->
<xsl:template match="xs:schema" priority="1000" mode="M83">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(@targetNamespace)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-79: The schema MUST define a target namespace.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M83"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M83"/>
   <xsl:template match="@*|node()" priority="-2" mode="M83">
      <xsl:apply-templates select="*" mode="M83"/>
   </xsl:template>

   <!--PATTERN Target namespace is absolute URI-->


	<!--RULE -->
<xsl:template match="xs:schema[exists(@targetNamespace)]"
                 priority="1000"
                 mode="M84">

		<!--REPORT -->
<xsl:if test="true()">
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                       use-when="function-available('saxon:line-number')">
            <xsl:text>:</xsl:text>
            <xsl:value-of select="saxon:line-number()"/>
         </xsl:value-of>
         <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:report:</xsl:text>Rule 7-80: The value of the attribute targetNamespace MUST match the production &lt;absolute-URI&gt; as defined by RFC 3986.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M84"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M84"/>
   <xsl:template match="@*|node()" priority="-2" mode="M84">
      <xsl:apply-templates select="*" mode="M84"/>
   </xsl:template>

   <!--PATTERN Schema must have version-->


	<!--RULE -->
<xsl:template match="xs:schema" priority="1000" mode="M85">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(@version)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-81: An element {http://www.w3.org/2001/XMLSchema}schema must have an attribute {}version.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M85"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M85"/>
   <xsl:template match="@*|node()" priority="-2" mode="M85">
      <xsl:apply-templates select="*" mode="M85"/>
   </xsl:template>

   <!--PATTERN Schema version must not be empty.-->


	<!--RULE -->
<xsl:template match="xs:schema[exists(@version)]" priority="1000" mode="M86">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="string-length(normalize-space(@version)) &gt; 0"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-82: An attribute version owned by an element {http://www.w3.org/2001/XMLSchema}schema must not be empty.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M86"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M86"/>
   <xsl:template match="@*|node()" priority="-2" mode="M86">
      <xsl:apply-templates select="*" mode="M86"/>
   </xsl:template>

   <!--PATTERN No use of xs:redefine-->


	<!--RULE -->
<xsl:template match="xs:redefine" priority="1000" mode="M87">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-85: The schema MUST NOT contain the element {http://www.w3.org/2001/XMLSchema}redefine.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M87"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M87"/>
   <xsl:template match="@*|node()" priority="-2" mode="M87">
      <xsl:apply-templates select="*" mode="M87"/>
   </xsl:template>

   <!--PATTERN No use of xs:include-->


	<!--RULE -->
<xsl:template match="xs:include" priority="1000" mode="M88">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-86: The schema MUST NOT contain the element {http://www.w3.org/2001/XMLSchema}include.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M88"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M88"/>
   <xsl:template match="@*|node()" priority="-2" mode="M88">
      <xsl:apply-templates select="*" mode="M88"/>
   </xsl:template>

   <!--PATTERN xs:import must have namespace-->


	<!--RULE -->
<xsl:template match="xs:import" priority="1000" mode="M89">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(@namespace)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 7-87: An element {http://www.w3.org/2001/XMLSchema}import MUST have an attribute {}namespace.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M89"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M89"/>
   <xsl:template match="@*|node()" priority="-2" mode="M89">
      <xsl:apply-templates select="*" mode="M89"/>
   </xsl:template>

   <!--PATTERN Name of type ends in "Type"-->


	<!--RULE -->
<xsl:template match="xs:complexType[exists(@name)                        and exists(xs:simpleContent/xs:extension/@base)                        and (for $extension in xs:simpleContent/xs:extension,                                 $base-qname in resolve-QName($extension/@base, $extension) return                               $base-qname = QName('http://www.w3.org/2001/XMLSchema', @name))]"
                 priority="1001"
                 mode="M90">

		<!--REPORT -->
<xsl:if test="false()">
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                       use-when="function-available('saxon:line-number')">
            <xsl:text>:</xsl:text>
            <xsl:value-of select="saxon:line-number()"/>
         </xsl:value-of>
         <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:report:</xsl:text>Rule 8-1: The name of a proxy type does not end in "Type".<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M90"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="xs:*[(self::xs:simpleType or self::xs:complexType) and exists(@name)]"
                 priority="1000"
                 mode="M90">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="ends-with(@name, 'Type')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-1: A type definition schema component that does not define a proxy type MUST have a name that ends in "Type".<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M90"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M90"/>
   <xsl:template match="@*|node()" priority="-2" mode="M90">
      <xsl:apply-templates select="*" mode="M90"/>
   </xsl:template>

   <!--PATTERN Name of type is in upper camel case-->


	<!--RULE -->
<xsl:template match="xs:complexType[exists(@name)                        and exists(xs:simpleContent/xs:extension/@base)                        and (for $extension in xs:simpleContent/xs:extension,                                 $base-qname in resolve-QName($extension/@base, $extension) return                               $base-qname = QName('http://www.w3.org/2001/XMLSchema', @name))]"
                 priority="1001"
                 mode="M91">

		<!--REPORT -->
<xsl:if test="false()">
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
         <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                       use-when="function-available('saxon:line-number')">
            <xsl:text>:</xsl:text>
            <xsl:value-of select="saxon:line-number()"/>
         </xsl:value-of>
         <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:report:</xsl:text>Rule 8-2: The name of a proxy type is not upper camel case.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M91"/>
   </xsl:template>

	  <!--RULE -->
<xsl:template match="xs:*[(self::xs:simpleType or self::xs:complexType) and exists(@name)]"
                 priority="1000"
                 mode="M91">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="matches(@name, '^([A-Z][A-Za-z0-9\-]*)+$')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-2: A type definition schema component that does not define a proxy type MUST be in upper camel case.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M91"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M91"/>
   <xsl:template match="@*|node()" priority="-2" mode="M91">
      <xsl:apply-templates select="*" mode="M91"/>
   </xsl:template>

   <!--PATTERN Name of simple type ends in "SimpleType"-->


	<!--RULE -->
<xsl:template match="xs:simpleType[@name]" priority="1000" mode="M92">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="ends-with(@name, 'SimpleType')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-3: A simple type definition schema component MUST have a name that ends in "SimpleType".<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M92"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M92"/>
   <xsl:template match="@*|node()" priority="-2" mode="M92">
      <xsl:apply-templates select="*" mode="M92"/>
   </xsl:template>

   <!--PATTERN Name of simple type is upper camel case-->


	<!--RULE -->
<xsl:template match="xs:simpleType[exists(@name)]" priority="1000" mode="M93">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="matches(string(@name), '^([A-Z][A-Za-z0-9\-]*)+$')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-4: The name of a simple type definition schema component MUST be upper camel case.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M93"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M93"/>
   <xsl:template match="@*|node()" priority="-2" mode="M93">
      <xsl:apply-templates select="*" mode="M93"/>
   </xsl:template>

   <!--PATTERN Name of a code simple type has standard suffix-->


	<!--RULE -->
<xsl:template match="xs:simpleType[exists(@name)       and (xs:restriction/xs:enumeration            or xs:restriction[ends-with(local-name-from-QName(resolve-QName(@base, .)), 'CodeSimpleType')])]"
                 priority="1000"
                 mode="M94">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="ends-with(@name, 'CodeSimpleType')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-5: A simple type definition schema component that has an enumeration facet or that is derived from a code type MUST have a name that ends in "CodeSimpleType".<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M94"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M94"/>
   <xsl:template match="@*|node()" priority="-2" mode="M94">
      <xsl:apply-templates select="*" mode="M94"/>
   </xsl:template>

   <!--PATTERN Code simple type has enumerations-->


	<!--RULE -->
<xsl:template match="xs:simpleType[ends-with(@name, 'CodeSimpleType')]"
                 priority="1000"
                 mode="M95">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="xs:restriction[ends-with(local-name-from-QName(resolve-QName(@base, .)), 'CodeSimpleType')]                       or xs:restriction/xs:enumeration"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-6: A code simple type MUST be derived from a code simple type or have an enumeration facet.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M95"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M95"/>
   <xsl:template match="@*|node()" priority="-2" mode="M95">
      <xsl:apply-templates select="*" mode="M95"/>
   </xsl:template>

   <!--PATTERN An object type with complex content is derived from an object type-->


	<!--RULE -->
<xsl:template match="xs:complexType[       exists(xs:complexContent)       and not(ends-with(@name, 'AssociationType')           or ends-with(@name, 'MetadataType')           or ends-with(@name, 'AugmentationType'))]"
                 priority="1000"
                 mode="M96">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="         for $derivation-method in (xs:complexContent/xs:extension, xs:complexContent/xs:restriction),             $base in $derivation-method/@base,             $base-qname in resolve-QName($base, $derivation-method)           return ($base-qname = xs:QName('structures:ObjectType')                   or (for $base-namespace in namespace-uri-from-QName($base-qname) return                         (not($base-namespace                                = (xs:anyURI('http://www.w3.org/XML/1998/namespace'),                                   xs:anyURI('urn:us:gov:ic:ism'),                                   xs:anyURI('urn:us:gov:ic:ntk')))                          and (for $base-local-name in local-name-from-QName($base-qname) return                                 not(ends-with($base-local-name, 'AssociationType')                                     or ends-with($base-local-name, 'MetadataType')                                     or ends-with($base-local-name, 'AugmentationType'))                              )                         )                       )                   )"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-8: An object type with complex content MUST be derived from structures:Object type or from another object type.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M96"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M96"/>
   <xsl:template match="@*|node()" priority="-2" mode="M96">
      <xsl:apply-templates select="*" mode="M96"/>
   </xsl:template>

   <!--PATTERN Element name is upper camel case-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@name)]" priority="1000" mode="M97">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="matches(string(@name), '^([A-Z][A-Za-z0-9\-]*)+$')"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-13: The name of an element declaration schema component MUST be upper camel case.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M97"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M97"/>
   <xsl:template match="@*|node()" priority="-2" mode="M97">
      <xsl:apply-templates select="*" mode="M97"/>
   </xsl:template>

   <!--PATTERN Element type does not have a simple type name-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@type)]" priority="1000" mode="M98">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(ends-with(@type, 'SimpleType'))"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-14: The type of an element MUST NOT have a name that ends in 'SimpleType'.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M98"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M98"/>
   <xsl:template match="@*|node()" priority="-2" mode="M98">
      <xsl:apply-templates select="*" mode="M98"/>
   </xsl:template>

   <!--PATTERN Element type is from conformant namespace-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@type)]" priority="1000" mode="M99">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="for $type-qname in resolve-QName(@type, .),                           $type-namespace in namespace-uri-from-QName($type-qname) return                         $type-namespace = nf:get-target-namespace(.)                         or exists(nf:get-document-element(.)/xs:import[                                     xs:anyURI(@namespace) = $type-namespace                                     and empty(@appinfo:externalImportIndicator)])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-15: The type of an element MUST have a namespace that is the target namesapce, or one that is imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M99"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M99"/>
   <xsl:template match="@*|node()" priority="-2" mode="M99">
      <xsl:apply-templates select="*" mode="M99"/>
   </xsl:template>

   <!--PATTERN Structures imported as conformant-->


	<!--RULE -->
<xsl:template match="xs:import[exists(@namespace)                                 and xs:anyURI(@namespace) = xs:anyURI('http://release.niem.gov/niem/structures/3.0/')]"
                 priority="1000"
                 mode="M100">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@appinfo:externalImportIndicator)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-17: The structures namespace MUST be imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M100"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M100"/>
   <xsl:template match="@*|node()" priority="-2" mode="M100">
      <xsl:apply-templates select="*" mode="M100"/>
   </xsl:template>

   <!--PATTERN Schema for XML imported as conformant-->


	<!--RULE -->
<xsl:template match="xs:import[exists(@namespace)                                and xs:anyURI(@namespace) = xs:anyURI('http://www.w3.org/XML/1998/namespace')]"
                 priority="1000"
                 mode="M101">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@appinfo:externalImportIndicator)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-18: The namespace for XML MUST be imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M101"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M101"/>
   <xsl:template match="@*|node()" priority="-2" mode="M101">
      <xsl:apply-templates select="*" mode="M101"/>
   </xsl:template>

   <!--PATTERN Schema for IC-ISM imported as conformant-->


	<!--RULE -->
<xsl:template match="xs:import[exists(@namespace)                                and xs:anyURI(@namespace) = xs:anyURI('urn:us:gov:ic:ism')]"
                 priority="1000"
                 mode="M102">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@appinfo:externalImportIndicator)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-19: The namespace for IC-ISM MUST be imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M102"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M102"/>
   <xsl:template match="@*|node()" priority="-2" mode="M102">
      <xsl:apply-templates select="*" mode="M102"/>
   </xsl:template>

   <!--PATTERN Schema for IC-NTK imported as conformant-->


	<!--RULE -->
<xsl:template match="xs:import[exists(@namespace)                                and xs:anyURI(@namespace) = xs:anyURI('urn:us:gov:ic:ntk')]"
                 priority="1000"
                 mode="M103">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@appinfo:externalImportIndicator)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-20: The namespace for IC-NTK MUST be imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M103"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M103"/>
   <xsl:template match="@*|node()" priority="-2" mode="M103">
      <xsl:apply-templates select="*" mode="M103"/>
   </xsl:template>

   <!--PATTERN An augmentation point corresponds to an augmentable type-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@name[                                  matches(., 'AugmentationPoint$')])]"
                 priority="1000"
                 mode="M104">
      <xsl:variable name="element-name" select="@name"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(                         parent::xs:schema/xs:complexType[                           @name = replace($element-name, 'AugmentationPoint$', 'Type')                           and exists(@name[                                   not(ends-with(., 'MetadataType'))                                   and not(ends-with(., 'AugmentationType'))])                                 and empty(@appinfo:externalAdapterTypeIndicator)                                 and exists(child::xs:complexContent)])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-22: A schema document defining an augmentation point element MUST also define a corresponding [augmentable type].<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M104"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M104"/>
   <xsl:template match="@*|node()" priority="-2" mode="M104">
      <xsl:apply-templates select="*" mode="M104"/>
   </xsl:template>

   <!--PATTERN An augmentation point has no type-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@name[                                  matches(., 'AugmentationPoint$')])]"
                 priority="1000"
                 mode="M105">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@type)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-23: An augmentation point element MUST have no type.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M105"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M105"/>
   <xsl:template match="@*|node()" priority="-2" mode="M105">
      <xsl:apply-templates select="*" mode="M105"/>
   </xsl:template>

   <!--PATTERN An augmentation point has no substitution group-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@name[                                  matches(., 'AugmentationPoint$')])]"
                 priority="1000"
                 mode="M106">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(@substitutionGroup)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-24: An augmentation point element MUST have no substitution group.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M106"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M106"/>
   <xsl:template match="@*|node()" priority="-2" mode="M106">
      <xsl:apply-templates select="*" mode="M106"/>
   </xsl:template>

   <!--PATTERN Augmentation element may only be referenced by its type-->


	<!--RULE -->
<xsl:template match="xs:complexType//xs:element[exists(@ref[                        matches(local-name-from-QName(resolve-QName(., ..)), 'AugmentationPoint$')]) ]"
                 priority="1000"
                 mode="M107">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="QName(nf:get-target-namespace(ancestor::xs:complexType[1]), ancestor::xs:complexType[1]/@name)                       = QName(namespace-uri-from-QName(resolve-QName(@ref, .)),                 replace(local-name-from-QName(resolve-QName(@ref, .)), 'AugmentationPoint$', 'Type'))"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-25: An augmentation element MUST only be referenced by its corresponding type.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M107"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M107"/>
   <xsl:template match="@*|node()" priority="-2" mode="M107">
      <xsl:apply-templates select="*" mode="M107"/>
   </xsl:template>

   <!--PATTERN Augmentation reference must be last particle-->


	<!--RULE -->
<xsl:template match="xs:complexType//xs:element[exists(@ref[                            matches(local-name-from-QName(resolve-QName(., ..)), 'AugmentationPoint$')]) ]"
                 priority="1000"
                 mode="M108">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="empty(following-sibling::*)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-28: An augmentation element particle MUST be the last element atom in its content model.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M108"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M108"/>
   <xsl:template match="@*|node()" priority="-2" mode="M108">
      <xsl:apply-templates select="*" mode="M108"/>
   </xsl:template>

   <!--PATTERN Augmentation type derived from augmentation type-->


	<!--RULE -->
<xsl:template match="xs:complexType[@name[ends-with(., 'AugmentationType')]]"
                 priority="1000"
                 mode="M109">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="xs:complexContent/                         xs:*[self::xs:extension or self::xs:restriction]/                           @base[resolve-QName(., ..) = xs:QName('structures:AugmentationType')                                 or ends-with(., 'AugmentationType')]"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 8-30: The [base type definition] of an [augmentation type] MUST be either structures:AugmentationType or an [augmentation type].<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M109"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M109"/>
   <xsl:template match="@*|node()" priority="-2" mode="M109">
      <xsl:apply-templates select="*" mode="M109"/>
   </xsl:template>

   <!--PATTERN Deprecated annotates schema component-->


	<!--RULE -->
<xsl:template match="*[exists(@appinfo:deprecated)]" priority="1000" mode="M110">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(self::xs:*)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 9-1: The attribute appinfo:deprecated MUST be owned by an element with a namespace name http://www.w3.org/2001/XMLSchema.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M110"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M110"/>
   <xsl:template match="@*|node()" priority="-2" mode="M110">
      <xsl:apply-templates select="*" mode="M110"/>
   </xsl:template>

   <!--PATTERN External import indicator annotates import-->


	<!--RULE -->
<xsl:template match="*[exists(@appinfo:externalImportIndicator)]"
                 priority="1000"
                 mode="M111">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(self::xs:import)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 9-2: The attribute {http://release.niem.gov/niem/appinfo/3.0/}externalImportIndicator MUST be owned by an element {http://www.w3.org/2001/XMLSchema}import.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M111"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M111"/>
   <xsl:template match="@*|node()" priority="-2" mode="M111">
      <xsl:apply-templates select="*" mode="M111"/>
   </xsl:template>

   <!--PATTERN Applies to types annotates metadata element-->


	<!--RULE -->
<xsl:template match="*[exists(@appinfo:appliesToTypes)]"
                 priority="1000"
                 mode="M112">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(self::xs:element[exists(@name)                                and ends-with(@name, 'Metadata')])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 9-4: The attribute appinfo:appliesToTypes MUST be owned by a metadata element.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M112"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M112"/>
   <xsl:template match="@*|node()" priority="-2" mode="M112">
      <xsl:apply-templates select="*" mode="M112"/>
   </xsl:template>

   <!--PATTERN Applies to elements annotates metadata element-->


	<!--RULE -->
<xsl:template match="*[exists(@appinfo:appliesToElements)]"
                 priority="1000"
                 mode="M113">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(self::xs:element[                           exists(@name)                           and ends-with(@name, 'Metadata')])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 9-6: The attribute appinfo:appliesToElements MUST be owned by a metadata element.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M113"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M113"/>
   <xsl:template match="@*|node()" priority="-2" mode="M113">
      <xsl:apply-templates select="*" mode="M113"/>
   </xsl:template>

   <!--PATTERN LocalTerm annotates schema-->


	<!--RULE -->
<xsl:template match="term:LocalTerm" priority="1000" mode="M114">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="parent::xs:appinfo[parent::xs:annotation[parent::xs:schema]]"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 9-8: The element {http://release.niem.gov/niem/localTerminology/3.0/}LocalTerm MUST be application information an an element {http://www.w3.org/2001/XMLSchema}schema.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M114"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M114"/>
   <xsl:template match="@*|node()" priority="-2" mode="M114">
      <xsl:apply-templates select="*" mode="M114"/>
   </xsl:template>

   <!--PATTERN LocalTerm has literal or definition-->


	<!--RULE -->
<xsl:template match="term:LocalTerm" priority="1000" mode="M115">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="exists(@literal) or exists(@definition)"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 9-9: The element {http://release.niem.gov/niem/localTerminology/3.0/}LocalTerm MUST have a literal or definition.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M115"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M115"/>
   <xsl:template match="@*|node()" priority="-2" mode="M115">
      <xsl:apply-templates select="*" mode="M115"/>
   </xsl:template>

   <!--PATTERN Element type defined by conformant schemas-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@type)]" priority="1000" mode="M116">
      <xsl:variable name="namespace"
                    select="namespace-uri-from-QName(resolve-QName(@type, .))"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$namespace = (nf:get-target-namespace(.),                                     xs:anyURI('http://www.w3.org/2001/XMLSchema'))                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 15-1: The type of an element declaration MUST have target namespace or a namespace that is imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M116"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M116"/>
   <xsl:template match="@*|node()" priority="-2" mode="M116">
      <xsl:apply-templates select="*" mode="M116"/>
   </xsl:template>

   <!--PATTERN Element substitution group defined by conformant schemas-->


	<!--RULE -->
<xsl:template match="xs:element[exists(@substitutionGroup)]"
                 priority="1000"
                 mode="M117">
      <xsl:variable name="namespace"
                    select="namespace-uri-from-QName(resolve-QName(@substitutionGroup, .))"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$namespace = nf:get-target-namespace(.)                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 15-2: An element substitution group MUST have either the target namespace or a namespace that is imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M117"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M117"/>
   <xsl:template match="@*|node()" priority="-2" mode="M117">
      <xsl:apply-templates select="*" mode="M117"/>
   </xsl:template>

   <!--PATTERN Element ref defined by conformant schemas-->


	<!--RULE -->
<xsl:template match="xs:element[exists(ancestor::xs:complexType[empty(@appinfo:externalAdapterTypeIndicator)]) and exists(@ref)]"
                 priority="1000"
                 mode="M118">
      <xsl:variable name="namespace"
                    select="namespace-uri-from-QName(resolve-QName(@ref, .))"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$namespace = nf:get-target-namespace(.)                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 15-3: An element ref MUST be from either the target namespace or from a namespace that is imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M118"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M118"/>
   <xsl:template match="@*|node()" priority="-2" mode="M118">
      <xsl:apply-templates select="*" mode="M118"/>
   </xsl:template>

   <!--PATTERN Element ref in external type defined by external schemas-->


	<!--RULE -->
<xsl:template match="xs:element[exists(ancestor::xs:complexType[exists(@appinfo:externalAdapterTypeIndicator)]) and exists(@ref)]"
                 priority="1000"
                 mode="M119">
      <xsl:variable name="namespace"
                    select="namespace-uri-from-QName(resolve-QName(@ref, .))"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$namespace != nf:get-target-namespace(.)                       or exists(ancestor::xs:schema[1]/xs:import[                           exists(@namespace)                           and $namespace = xs:anyURI(@namespace)                           and empty(@appinfo:externalImportIndicator)])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 15-4: An element ref MUST be from either the target namespace or from a namespace that is imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M119"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M119"/>
   <xsl:template match="@*|node()" priority="-2" mode="M119">
      <xsl:apply-templates select="*" mode="M119"/>
   </xsl:template>

   <!--PATTERN Attribute type defined by conformant schemas-->


	<!--RULE -->
<xsl:template match="xs:attribute[exists(@type)]" priority="1000" mode="M120">
      <xsl:variable name="namespace"
                    select="namespace-uri-from-QName(resolve-QName(@type, .))"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$namespace = (nf:get-target-namespace(.), xs:anyURI('http://www.w3.org/2001/XMLSchema'))                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 15-5: The type of an attribute declaration MUST have the target namespace or the XML Schema namespace or a namespace that is imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M120"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M120"/>
   <xsl:template match="@*|node()" priority="-2" mode="M120">
      <xsl:apply-templates select="*" mode="M120"/>
   </xsl:template>

   <!--PATTERN Type base defined by conformant schemas-->


	<!--RULE -->
<xsl:template match="xs:*[exists(@base)]" priority="1000" mode="M121">
      <xsl:variable name="namespace"
                    select="namespace-uri-from-QName(resolve-QName(@base, .))"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$namespace = (nf:get-target-namespace(.), xs:anyURI('http://www.w3.org/2001/XMLSchema'))                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 15-6: The [base type definition] of a [type definition] MUST have the target namespace or the XML Schema namespace or a namespace that is imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M121"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M121"/>
   <xsl:template match="@*|node()" priority="-2" mode="M121">
      <xsl:apply-templates select="*" mode="M121"/>
   </xsl:template>

   <!--PATTERN list item type defined by conformant schemas-->


	<!--RULE -->
<xsl:template match="xs:list[exists(@itemType)]" priority="1000" mode="M122">
      <xsl:variable name="namespace"
                    select="namespace-uri-from-QName(resolve-QName(@itemType, .))"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="$namespace = (nf:get-target-namespace(.), xs:anyURI('http://www.w3.org/2001/XMLSchema'))                       or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                     and $namespace = xs:anyURI(@namespace)                                     and empty(@appinfo:externalImportIndicator)])"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 15-7: The item type of a list MUST have the target namespace, the XML Schema namespace, or a namespace that is imported as conformant.<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M122"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M122"/>
   <xsl:template match="@*|node()" priority="-2" mode="M122">
      <xsl:apply-templates select="*" mode="M122"/>
   </xsl:template>

   <!--PATTERN union member types defined by conformant schemas-->


	<!--RULE -->
<xsl:template match="xs:union[exists(@memberTypes)]" priority="1000" mode="M123">

		<!--ASSERT -->
<xsl:choose>
         <xsl:when test="every $qname in tokenize(normalize-space(@memberTypes), ' '),                             $namespace in namespace-uri-from-QName(resolve-QName($qname, .))                       satisfies ($namespace = nf:get-target-namespace(.)                                  or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)                                            and $namespace = xs:anyURI(@namespace)                                            and empty(@appinfo:externalImportIndicator)]))"/>
         <xsl:otherwise>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="base-uri(.)"/>
            <xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron"
                          use-when="function-available('saxon:line-number')">
               <xsl:text>:</xsl:text>
               <xsl:value-of select="saxon:line-number()"/>
            </xsl:value-of>
            <xsl:text xmlns:sch="http://www.ascc.net/xml/schematron">:assert:</xsl:text>Rule 15-8: Every member type of a union MUST have the target namespace or a namespace that is imported as conformant<xsl:value-of xmlns:sch="http://www.ascc.net/xml/schematron" select="string('&#xA;')"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M123"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M123"/>
   <xsl:template match="@*|node()" priority="-2" mode="M123">
      <xsl:apply-templates select="*" mode="M123"/>
   </xsl:template>
</xsl:stylesheet>
