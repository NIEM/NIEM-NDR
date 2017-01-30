<?xml version="1.0" encoding="US-ASCII"?>
<stylesheet 
   default-validation="preserve"
   version="2.0"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="xml" version="1.0" indent="yes"/>

  <import-schema namespace="http://example.org/ns1" schema-location="ns1.xsd"/>

  <template match="@*|node()">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

</stylesheet>
<!-- 
  Local Variables:
  mode: sgml
  indent-tabs-mode: nil
  fill-column: 9999
  End:
-->
