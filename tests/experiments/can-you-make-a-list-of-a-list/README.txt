No. You can't make a list of a list. You get this error:

$ ~/working/tools/bin/xsdvalid instance.xml
schema.xsd:11: error
  cos-st-restricts.2.1: In the definition of list type '#AnonType_refscontainer', type 'IDREFS' is an invalid item type because it is either a list type, or a union type that contains a list.
