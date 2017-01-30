<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
   version="2.0"
   xmlns:extra="http://example.org/extra-xsl"
   xmlns:saxon="http://saxon.sf.net/"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="xml" version="1.0" indent="no"/>

  <!-- just copy everything else -->
  <template match="@*|node()">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <template match="extra:assert"/>

  <template match="text()[normalize-space(.) = '' 
                          and exists(following-sibling::extra:assert)]"/>

</stylesheet>
