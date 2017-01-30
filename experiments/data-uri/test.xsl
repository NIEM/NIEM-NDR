<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">

  <xsl:output method="html" version="4.01" indent="no"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Test Image</title>
      </head>
      <body>
        <p>Please see <a href="data:application/xml;base64,{unparsed-text('structures.base64')}"
                         >the schema</a> for more information.</p>
        <img src="data:image/png;base64,{unparsed-text('image.base64')}"/>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
