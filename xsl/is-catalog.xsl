<?xml version="1.0" encoding="UTF-8"?>
<stylesheet 
    version="2.0"
    xmlns:catalog="urn:oasis:names:tc:entity:xmlns:xml:catalog"
    xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="text"/>

  <template match="/">
    <value-of select="exists(/catalog:catalog)"/>
    <text>&#10;</text>
  </template>

</stylesheet>
<!-- 
  Local Variables:
  mode: sgml
  indent-tabs-mode: nil
  fill-column: 9999
  End:
-->
