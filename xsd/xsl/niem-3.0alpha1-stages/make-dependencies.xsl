<?xml version="1.0" encoding="us-ascii"?>
<stylesheet 
   version="2.0"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="text"/>

  <template match="/">
    <apply-templates select="*">
      <with-param name="path" tunnel="yes">.</with-param>
    </apply-templates>
  </template>

  <template match="xslt:*[
                       parent::xslt:stylesheet
                       and local-name() = ('include', 'import')
                       and exists(@href)
                   ]">
    <param name="path" as="xs:string" tunnel="yes"/>
    <value-of select="$path"/>
    <text>/</text>
    <value-of select="@href"/>
    <text>&#10;</text>
    <apply-templates select="doc(@href)">
      <with-param name="path" select="concat($path, '/', @href)" tunnel="yes"/>
    </apply-templates>
  </template>

  <template match="*">
    <apply-templates select="*"/>
  </template>

</stylesheet>
