<?xml version="1.0" encoding="UTF-8"?> <!-- -*-sgml-*- -->
<stylesheet 
    version="1.0"
    xmlns:ct="http://release.niem.gov/niem/conformanceTargets/3.0/"
    xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="text"/>

  <template match="/">
    <value-of select="//*[@ct:conformanceTargets][1]/@ct:conformanceTargets"/>
    <text>&#10;</text>
  </template>

</stylesheet>
