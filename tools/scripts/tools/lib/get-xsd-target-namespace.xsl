<?xml version="1.0" encoding="US-ASCII"?>
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
   version="1.0">

  <output method="text"/>

  <template match="/">
    <for-each select="xs:schema/@targetNamespace">
      <value-of select="normalize-space(.)"/>
    </for-each>
  </template>

</stylesheet>
