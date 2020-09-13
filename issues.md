
This document must be emptied out to close an issue. Any issue here needs to be resolved within the GitHub issue being worked, or must be dumped into its own GitHub issue.

# Move rule on sequence into section 5

Old rule:

```
<ruleSection>
  <title>Attribute <qName>structures:sequenceID</qName> establishes order of properties</title>
  <rule applicability="INS" class="Constraint">
    <p>Within the schema, a complex type definition SHALL include the attribute structures:sequenceID if the order of an occurrence of the type, within its parent, relative to its siblings, is meaningful and pertinent and if the schema does not specify the desired sequential order.</p>
  </rule>

  <p>This rule indicates that, if order is meaningful and the schema will not always represent the desired order, then data modelers need to include sequenceID to allow the proper order to be represented in instances.</p>
        
</ruleSection>
```


and 

```
      <p>[Rule 8-6] (INS)</p>
      
<p>The order of elements that are children of an element SHALL be presented as if their sequential order is as follows:
1. First, elements owning an attribute structures:sequenceID, in the order that would be yielded with their sequence IDs sorted via sort element as defined by [XSLT], with a data type of number and an order of ascending.
  2. Following those elements, the remaining elements, in the order in which they occur within the XML instance.</p>


      <p>Rationale</p>
      <p>Because of NIEM<char name="rsquo"/>s use of structured, defined types and its use of xsd:sequence, as well as various representation mechanisms, the order of data within an XML instance may require more precise definition and may vary from instance to instance. The true order of objects (such as parts of a name, lines in an address, or parts of a phone number) may need an explicit method to define their order.</p>
      <p>In this definition, the term <q>presented</q> may mean presentation to the user, reports, or transfer to other data hsystems. It is meaningful only when the order of appearance of items within a sequence is expressed. Such an order is only the default for the content within an instance. Any meaningful sorting or other processing may overrule it.</p>
      <p>[Rule 8-7] (REF, EXT, INS)</p>
      <p>Within a schema or instance, the attribute structures:sequenceID SHALL NOT be interpreted as meaningful beyond an indicator of sequential order of an object relative to its siblings.</p>
      <p>Rationale</p>
      <p>Siblings of a data item are items that have the same parent. Note that, using the reference and relationships mechanisms, data objects may have multiple parents. The sequenceID is truly metadata, helping to express the structure of the data rather than its content.</p>
      <p>Note that reference elements have the same semantics as concrete data elements; thus they follow the same rules for sequential order. By using reference elements, an entity may have one order within one structure and another order within another structure.</p>
      <p>Within NIEM-conformant instances, the order of objects is found to be given by sorting the objects by numerical value of their respective attribute structures:sequenceID, from smallest to highest. The relative order of objects with equal values for structures:sequenceID is their order within the XML instance. Objects with no value for structures:sequenceID occur after all objects that have values for structures:sequenceID, in their relative order within the XML instance.</p>
```



 
 
