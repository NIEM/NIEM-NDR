<?xml version="1.0" encoding="US-ASCII"?>
<stylesheet 
   version="1.0"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:ct="http://release.niem.gov/niem/conformanceTargets/3.0/"
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="text"/>

  <template match="/">
    <value-of select="concat(
                        translate(normalize-space(//*[@ct:conformanceTargets][1]/@ct:conformanceTargets),
                                  ' ', '&#10;'),
                        '&#10;')"/>
  </template>

</stylesheet>
