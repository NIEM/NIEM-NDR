<?xml version="1.0" encoding="US-ASCII"?>
<document
   xmlns:appinfo="MACRO_NS_APPINFO"
   xmlns:ct="MACRO_CONFORMANCE_TARGETS_NS"
   xmlns:doc="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258"
   xmlns:example="http://example.org/example/"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:im="MACRO_NS_NIEM_DOMAIN_IM"
   xmlns:j="MACRO_NS_NIEM_DOMAIN_J"
   xmlns:nc="MACRO_NS_NIEM_CORE"
   xmlns:nf="MACRO_NS_NDR_FUNCTIONS"
   xmlns:niem-xs="http://release.niem.gov/niem/proxy/xsd/4.0/"
   xmlns:rdf="MACRO_NS_RDF"
   xmlns:rdfs="MACRO_NS_RDFS"
   xmlns:sch="MACRO_SCH_NS"
   xmlns:scr="MACRO_NS_NIEM_DOMAIN_SCR"
   xmlns:structures="MACRO_NS_STRUCTURES"
   xmlns:xs="MACRO_NS_XS"
   xmlns:xsi="MACRO_NS_XSI"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258"
   >
  <title>National Information Exchange Model Naming and Design Rules</title>
  <version>MACRO_NDR_VERSION</version>
  <date>MACRO_NDR_DATE</date>
  <author>NIEM Technical Architecture Committee (NTAC)</author>

  <blurbSet id="ref"/>
  <blurbSet id="ext"/>
  <blurbSet id="set"/>
  <blurbSet id="ins"/>

  <comment>
    <xmlBlurb id="schematron-title-ref" memberOf="ref">
      <sch:title>Rules for reference XML Schema documents</sch:title>
    </xmlBlurb>
    <xmlBlurb id="schematron-title-ext" memberOf="ext">
      <sch:title>Rules for extension XML Schema documents</sch:title>
    </xmlBlurb>
    <xmlBlurb id="schematron-title-set" memberOf="set">
      <sch:title>Rules XML Schema document sets</sch:title>
    </xmlBlurb>
    <xmlBlurb id="schematron-title-ins" memberOf="ins">
      <sch:title>Rules for instance XML documents</sch:title>
    </xmlBlurb>
    <xmlBlurb id="schematron-include" memberOf="ref ext set ins">
      <xsl:include href="ndr-functions.xsl"/>
    </xmlBlurb>
  </comment>

  <subsection>
    <title>Abstract</title>
    <p>This document specifies the data model, XML Schema components, and XML data for use with the National Information Exchange Model (NIEM) version 4.0.</p>
  </subsection>

  <subsection>
    <title>Authors</title>
    <p>Webb Roberts, Georgia Tech Research Institute (<link href="mailto:webb.roberts@gtri.gatech.edu">&lt;webb.roberts@gtri.gatech.edu&gt;</link>), Lead Author</p>
  </subsection>

  <subsection><title>Status</title>

    <p>This document is a draft of the specification for XML Schema documents, components, and instances
      for use with NIEM 4. It presents a technical architecture that has evolved through the collaborative work
      of the NIEM Business Architecture Committee (NBAC), the NIEM Technical Architecture Committee (NTAC), and
      their predecessors.</p>

    <p>This specification is a product of the NIEM Program Management Office (PMO).</p>

    <p>Updates, revisions, and errata for this specification are posted to
      <link>https://github.com/NIEM/NIEM-NDR</link>. Please submit comments on this specification as issues
      at <link>https://github.com/NIEM/NIEM-NDR/issues</link>.</p>

  </subsection>

  <subsection id="toc">
    <title>Contents</title>
    <tableOfContents/>
  </subsection>

  <subsection>
    <title>Table of Figures</title>
    <tableOfFigures/>
  </subsection>

  <subsection>
    <title>Table of Tables</title>
    <tableOfTables/>
  </subsection>

  <section><title>Introduction</title>

    <p>This Naming and Design Rules (NDR) document specifies XML Schema documents for use with the National
      Information Exchange Model (NIEM). NIEM is an information sharing framework based on the World Wide Web
      Consortium (W3C) Extensible Markup Language (XML) Schema standard. In February 2005, the U.S. Departments
      of Justice (DOJ) and Homeland Security (DHS) signed a cooperative agreement to jointly develop NIEM by
      leveraging and expanding the Global Justice XML Data Model (GJXDM) into multiple domains.</p>

    <p>NIEM is a product of a combined government and industry effort to improve information interoperability and
      exchange within the United States at federal, state, tribal, and local levels of government. NIEM may have
      started in the U.S., but its reach does not stop there. International governments and private sector
      organizations can benefit from the value of NIEM, as well. Communities in Europe, North America, and
      Australia already use NIEM for their information exchange efforts. NIEM 4.0 represents an initial step
      toward evolving NIEM to support a more-global exchange environment</p>

    <p>NIEM specifies a set of reusable information components for defining standard information exchange
      messages, transactions, and documents on a large scale: across multiple communities of interest and lines
      of business. These reusable components are rendered in XML Schema documents as type, element, and attribute
      declarations that comply with the W3C XML Schema specification. The resulting reference schemas are
      available to government practitioners and developers at <link>http://niem.gov/</link>.</p>

    <p>The W3C XML Schema standard enables information interoperability and sharing by providing a common
      language for describing data precisely. The constructs it defines are basic metadata building blocks
      <char name="mdash"/> baseline data types and structural components. Developers employ these building blocks
      to describe their own domain-oriented data semantics and structures, as well as structures for specific
      information exchanges and components for reuse across multiple information exchanges. Rules that profile
      allowable XML Schema constructs and describe how to use them help ensure that those components are
      consistent and reusable.</p>

    <p>This document specifies principles and enforceable rules for NIEM data components and schemas. Schemas and
      components that obey the rules set forth here are considered to be conformant to specific conformance
      targets. These targets are defined in order that they may be leveraged for comprehensive definitions of
      NIEM conformance. Such definitions may include more than the level of conformance defined by this NDR, and
      may include specific patterns of use, additional quality criteria, and requirements to reuse NIEM release
      schemas.</p>

    <section id="section-scope">
      <title>Scope</title>

      <p>This document was developed to specify NIEM 4.0. Later releases of NIEM may be specified by later
        versions of this document. The document covers the following issues in depth:</p>

      <ul>
        <li>
          <p>The underlying NIEM data model</p>
        </li>
        <li>
          <p>Guiding principles behind the design of NIEM</p>
        </li>
        <li>
          <p>Rules for using XML Schema constructs in NIEM</p>
        </li>
        <li>
          <p>Rules for modeling and structuring NIEM-conformant schemas</p>
        </li>
        <li>
          <p>Rules for creating NIEM-conformant instances</p>
        </li>
        <li>
          <p>Rules for naming NIEM components</p>
        </li>
        <li>
          <p>Rules for extending NIEM-conformant components</p>
        </li>
      </ul>
      <p>This document does NOT address the following:</p>
      <ul>
        <li>
          <p>A <em>formal</em> definition of the NIEM data model.</p>
          <p>Such a definition would focus on the Resource Definition Framework (RDF) and concepts not strictly required for interoperability. This document instead focuses on definition of schemas that work with the data model, to ensure translatability and interoperability.</p>
        </li>
        <li>
          <p>A detailed discussion of NIEM architecture and schema versioning.</p>
        </li>
        <li><p>Aggregate artifacts that define information exchanges and models, including
            information exchange packages (IEPs) and their specifications, information exchange package
            descriptions (IEPDs) or other forms of information exchange specifications (IESs),
            as well as enterprise information exchange models (EIEMs),
            and other forms of model package descriptions (MPDs).</p></li>
        <li><p>Normative guidance for the location of <termRef term="schema document">schema documents</termRef>
            or for schema assembly.</p></li>
      </ul>
      <p>This document is intended as a technical specification. It is not intended to be a tutorial or a user guide.</p>
    </section>
    <section>
      <title>Audience</title>
      <p>This document targets practitioners and developers who employ NIEM for information exchange and interoperability. Such information exchanges may be between organizations or within an organization. The NIEM reference schemas provide system implementers much content on which to build specific exchanges. However, there is a need for extended and additional content. The purpose of this document is to define the rules for such new content, so that it will be consistent with the NIEM reference schemas. These rules are intended to establish and, more importantly, enforce a degree of standardization across a broad set of users.</p>
    </section>
  </section>

  <section><title>Document conventions and normative content</title>

    <p>This document uses formatting and syntactic conventions to clarify meaning and avoid ambiguity.</p>

    <section><title>Document references</title>
      <p>This document relies on references to many outside documents. Such references are noted by bold,
        bracketed inline terms. For example, a reference to RFC 3986 is shown as <ref idref="RFC3986"/>. All
        reference documents are recorded in <ref idref="AppendixReferences"/>.</p>
    </section>


      <section>
        <title>Clark notation and qualified names</title>

        <p>This document uses both Clark notation and QName notation to represent qualified names.</p>

        <p>QName notation is defined by
          MACRO_REF_EXTERNAL(XMLNamespaces,MACRO_HREF_XML_NAMESPACES#NT-QName,4,Qualified Names). A
          QName for the XML Schema string datatype is <qName >xs:string</qName >. Namespace prefixes used within
          this specification are listed in <ref idref="section-use-of-namespaces" />.</p>

        <p>This document sometimes uses Clark notation to represent qualified names in normative text. Clark
          notation is described by <ref idref="ClarkNS"/>, and provides the information in a QName
          without the need to first define a namespace prefix, and then
          to reference that namespace prefix. A Clark notation representation for the qualified name for the XML
           Schema string datatype is <code >{http://www.w3.org/2001/XMLSchema}string</code >.</p>

        <p>Each Clark notation value usually consists of a namespace URI surrounded by curly braces, concatenated
          with a local name. The exception to this is when Clark notation is used to represent the qualified name
          for an attribute with no namespace, which is ambiguous when represented using QName notation. For
          example, the element <local-name>targetNamespace</local-name>, which has no [namespace name]
          property, is represented in Clark notation as <code>{}targetNamespace</code>.</p>

      </section>

    <section id="section-use-of-namespaces">
      <title>Use of namespaces and namespace prefixes</title>

      <p>The following namespace prefixes are used consistently within this specification. These prefixes are not
        normative; this document issues no requirement that these prefixes be used in any conformant
        artifact. Although there is no requirement for a schema or XML document to use a particular namespace
        prefix, the meaning of the following namespace prefixes have fixed meaning in this document.</p>

      <ul>
        <li><p><code>xs</code>: The namespace for the XML Schema definition language
            as defined by <ref idref="XMLSchema-1"/> and
            <ref idref="XMLSchema-2"/>, <q><namespace-uri-for-prefix>xs</namespace-uri-for-prefix></q>.</p></li>

        <li><p><code>xsi</code>: The XML Schema instance namespace, defined by
            MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#Instance_Document_Constructions,2.6,Schema-Related Markup in Documents Being Validated),
            for use in XML documents, <q><namespace-uri-for-prefix >xsi</namespace-uri-for-prefix ></q >.</p></li>

        <li><p><code>sch</code>: The Schematron namespace, as defined by <ref idref="Schematron"
            />, <q><namespace-uri-for-prefix >sch</namespace-uri-for-prefix ></q>.</p></li>

        <li><p><code>nf</code>: The namespace defined by this specification for XPath
            functions, <q><namespace-uri-for-prefix>nf</namespace-uri-for-prefix></q>.</p></li>

        <li><p><code>ct</code>: The namespace defined by <ref idref="CTAS" /> for
            the <code>conformanceTargets</code>
            attribute, <q><namespace-uri-for-prefix >ct</namespace-uri-for-prefix ></q>.</p></li>

        <li><p><code>appinfo</code>: The namespace for the <termRef>appinfo
              namespace</termRef>, <q><namespace-uri-for-prefix>appinfo</namespace-uri-for-prefix></q>.</p></li>

        <li><p><code>structures</code>: The namespace for the <termRef>structures
              namespace</termRef>, <q><namespace-uri-for-prefix>structures</namespace-uri-for-prefix></q>.</p></li>

    </ul>

      <p>In addition to the prefixes above, the prefix <code>example</code> is used for XML examples, denoting a
        user-defined namespace, such as might be defined by an information exchange specification.</p>

  </section>

      <section id="SectionNormativeAndInformativeContent">
        <title>Normative and informative content</title>
        <p>This document includes a variety of content. Some content of this document
          is <termRef>normative</termRef>, while other content is <termRef>informative</termRef>. In general, the
          informative material appears as supporting text, description, and rationales for the normative
          material.</p>

        <definition term="normative">
          <p>The term <q>normative</q> is as defined by MACRO_REF_EXTERNAL(ConfReq,,7.2,Conformance by key words), which states:</p>
          <blockquote>
            <p>NORMATIVE <char name="mdash"/> statements provided for the prescriptive parts of the specification, providing that which is necessary in order to be able to claim conformance to the specification.</p>
          </blockquote>
        </definition>
        <definition term="informative">
          <p>The term <q>informative</q> is as defined by MACRO_REF_EXTERNAL(ConfReq,,7.2,Conformance by key words), which states:</p>
          <blockquote>
            <p>INFORMATIVE (NON-NORMATIVE) <char name="mdash"/> statements provided for informational purposes,
              intended to assist the understanding or use of the specification and shall not contain provisions
              that are required for conformance.</p>
          </blockquote>
        </definition>

        <p>Conventions used within this document include:</p>
        <bogusDefinition term="&lt;term&gt;">
          <p>A formal definition of a term associated with NIEM.</p>
        </bogusDefinition>

        <p>Definitions are <termRef>normative</termRef>. Uses of these terms are given special formatting, using raised dots to
        identify the term, for example this use of the term <termRef>conformance target</termRef>.</p>

        <bogusPrinciple number="&lt;number&gt;">
          <p>A guiding principle for NIEM.</p>
        </bogusPrinciple>
        <p>The principles represent requirements, concepts, and goals that have helped shape NIEM. Principles are informative, not normative, but act as the basis on which the rules are defined.</p>
        <p>Accompanying each principle is a short discussion that justifies the application of the principle to NIEM design.</p>
        <p>Principles are numbered in the order in which they appear in the document.</p>

        <section id="section-rules">
          <title>Rules</title>

          <p>A rule states a specific requirement on an artifact or on the interpretation of an artifact. The classes of
            artifacts are identified by <termRef term="conformance target">conformance targets</termRef> that are
            enumerated by this document in <ref idref="SectionConformanceTargetsDefined"/>. The rules are
            normative. Human-readable text in rules uses <ref idref="BCP14"/> terminology as described in <ref idref="section-terminology-bcp-14"/> for normative requirements and recommendations.</p>

          <bogusRule section="&lt;section&gt;" number="&lt;number&gt;" applicability="&lt;applicability&gt;" class="&lt;classification&gt;">
            <p>An enforceable rule for NIEM.</p>
          </bogusRule>

          <p>Each rule has a <em>classification</em>, which is either <q>Constraint</q> or <q>Interpretation</q>. If
            the classification is <q>Constraint</q>, then the rule is a <termRef>constraint rule</termRef>. If the classification
            is <q>Interpretation</q>, then the rule is an <termRef>interpretation rule</termRef>.</p>

          <definition term="constraint rule">
            <p>A <strong>constraint rule</strong> is a rule that sets a requirement on an artifact with respect to
              its conformance to a <termRef>conformance target</termRef>.</p>
          </definition>

          <definition term="interpretation rule">
            <p>An <strong>interpretation rule</strong> is a rule that sets the methodology, pattern, or procedure
              for understanding some aspect of an instance of a conformance target.</p>
          </definition>

          <p>Each rule identifies its <em>applicability</em>. This identifies the conformance targets to which
            the rule applies. Each entry in the list is a code from
            <ref idref="TableCodesRepresentingConformanceTargets" />. If a code appears in the applicability list
            for a rule, then the rule applies to the corresponding conformance target. The conformance targets
            are defined in <ref idref="SectionNIEMConformanceTargets"/>. For example, a rule with
            applicability <q>(REF, EXT)</q> would be applicable to a <termRef>reference schema document</termRef>, as well as to an <termRef>extension schema document</termRef>.</p>

          <p>Rules are stated with the help of XML Infoset terminology (e.g., elements and attributes), as described by
            <ref idref="SectionTerminologyXMLInfoset"/>, and XML Schema terminology (e.g., schema components),
            as described by <ref idref="SectionTerminologyXMLSchema"/>. The choice of terminology is driven by which
            terms best express a concept. Certain concepts are more clearly expressed using XML Infoset
            terms items, others using XML Schema terms; still others are best expressed using a
            combination of terminology drawn from each standard.</p>

          <p>Rules are numbered according to the section in which they appear and the order in which they appear
            within that section. For example, the first rule in Section 7 is Rule 7-1.</p>

        </section>

      <section><title>Use of normative Schematron</title>

        <p>This document defines many normative rules using Schematron
          rule-based validation syntax, as defined by <ref idref="Schematron"/>.
          For example, see <ref idref="ct-has-content-type"/>.
          Effort has been made to make the rules precise and unambiguous. Very
          detailed text descriptions of rules can introduce ambiguity, and they
          are not directly executable by users. Providing NDR rules that are
          expressed as Schematron rules ensures that the rules are precise, and
          that they are directly executable through commercially-available and
          free tools.</p>

        <p>Many rules herein do not have executable Schematron supporting them. Some are not fit for automatic
          validation, and others may be difficult or cumbersome to express in Schematron. In neither case are
          such rules any less normative. A rule that has no Schematron is just as normative as a rule that does
          have Schematron. The level of requirements and recommendations within a rule is expressed using
          terminology from <ref idref="BCP14"/> as described in
          <ref idref="section-terminology-bcp-14"/>.</p>

        <p>The Schematron rules are written using XPath2 as defined by
          <ref idref="XPath2"/>. These executable rules are normative.</p>

        <p>An execution of a Schematron pattern that issues a failed assertion (represented
          via <qName>sch:assert</qName>) represents a validation error, and signifies that the assessed artifact
          violates a requirement (i.e., a <q>MUST</q>) of a conformance rule. An example of a constraint rule that uses Schematron is
          <ref idref="st-top-level"/>.</p>

        <p>An execution of a Schematron pattern that issues a report (represented via <qName>sch:report</qName>)
          indicates a warning. This may be an indication that an automated rule has found that the assessed
          artifact violates a recommendation of the specification (i.e., a <q>SHOULD</q>, rather than
          a <q>MUST</q>), and that attention should be paid to ensure that the artifact maintains the spirit of
          the specification. For example, see <ref idref="el-representation-is-abstract"/>.</p>
          
        <p>In addition to the exclusive use of <qName>sch:report</qName> for warnings, this document annotates
          <qName>sch:report</qName> elements with attribute <code>role="warning"</code>, which is interpreted by
          some Schematron platforms to indicate that a failure indicates a warning, rather than an error.</p>

        <p>In either case, a diagnostic report generated by testing an XML document against the Schematron
          rules may identify specific locations (e.g., line numbers) within the document that need further
          attention.</p>

      </section>
  <section id="section-normative-xpath-functions">
    <title>Normative XPath functions</title>

    <p>The Schematron within this document is supported by functions, to make
      the rules more comprehensible, and to abstract away process-specific
      operations. Each function has a normative XPath interface and a normative
      text definition. Any implementation provided for these functions should be
      considered informative, not normative, but may be useful for certain
      implementations of the rules.</p>

    <p>The following XPath functions are defined normatively when used within
      Schematron by this specification:</p>

    <ul>
      <li>
        <pre>nf:get-document-element($context as element()) as element()</pre>

        <p>Yields the document element of the XML document in which <code>$context</code> occurs.</p>

        <p>This function provides the ability for a validator to consolidate multiple XML Schema documents and
          XML instance documents into a single XML document, which may simplify validation, and allow for
          preprocessing of <qName>xs:include</qName> elements.</p>
      </li>

      <li>
        <pre>nf:get-target-namespace($element as element()) as xs:anyURI?</pre>

        <p>Yields the target namespace of the XML Schema document in which <var>$element</var> appears.  If it is
          a <termRef>schema document</termRef> with no target namespace defined, then it yields the
          zero-length <qName>xs:anyURI</qName> value (<code >xs:anyURI('')</code >). If the <termRef>XML
          document</termRef> in which <var>$element</var> appears is not a <termRef>schema document</termRef>,
          then the function yields the empty sequence (<code>()</code>).</p>
      </li>

      <li>
        <pre>nf:resolve-namespace($context as element(), $namespace-uri as xs:anyURI) as element(xs:schema)?</pre>

        <p>Yields the document element of the first available <termRef>schema document</termRef> that has the
          target namespace <var>$namespace-uri</var>. If there is no such
          <termRef>schema document</termRef> available, it yields the empty sequence (<code>()</code>).</p>
      </li>

      <li>
        <pre>nf:resolve-type($context as element(), $qname as xs:QName) as element()?</pre>

        <p>Yields the first occurrence of an element <qName>xs:simpleType</qName> or <qName>xs:complexType</qName>
          that defines a type with a {target namespace} and {name} matching <var>$qname</var>, that is a [child]
          of the element yielded by <code>nf:resolve-namespace()</code>, above. If there is no such occurrence,
          it yields the empty sequence (<code>()</code>).</p>
      </li>

      <li>
        <pre>nf:resolve-element($context as element(), $qname as xs:QName) as element(xs:element)?</pre>

        <p>Yields the first occurrence of an element <qName>xs:element</qName> that declares an element with a
        {target namespace} and {name} matching <var>$qname</var>, that is a [child] of the element yielded
        by <code>nf:resolve-namespace()</code>, above. If there is no occurrence available, it yields the empty
        sequence. (<code>()</code>)</p>
      </li>

      <li>
        <pre>nf:has-effective-conformance-target-identifier($context as element(), $match as xs:anyURI) as xs:boolean</pre>

        <p>Yields true if and only if an <termRef>effective conformance target identifier</termRef> of the XML document containing <var>$context</var> is <var>$match</var>.</p>
      </li>

    </ul>
  </section>

  <section>
    <title>Normative Schematron namespace declarations</title>
    <p>The following Schematron namespace declarations are normative
    for the Schematron rules and supporting Schematron code within this specification:</p>
    <figure>
      <title>Normative Schematron namespace declarations</title>
      <pre><xmlBlurb id="schematron-ns-decl" memberOf="ref ext set ins">
<sch:ns prefix="xs" uri="MACRO_NS_XS"/>
<sch:ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>
<sch:ns prefix="nf" uri="MACRO_NDR_FUNCTIONS_NS"/>
<sch:ns prefix="ct" uri="MACRO_CONFORMANCE_TARGETS_NS"/>
<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
<sch:ns prefix="appinfo" uri="MACRO_NS_APPINFO"/>
<sch:ns prefix="structures" uri="MACRO_NS_STRUCTURES"/>
      </xmlBlurb></pre>
    </figure>

    <p>Note that the binding of the prefix <code>xml</code> to the XML namespace
      (<q><namespace-uri-for-prefix>xml</namespace-uri-for-prefix></q>) is implicit.</p>
  </section>
      </section>

    <section>
      <title>Additional formatting</title>

        <p>In addition to the special formatting above, this document uses additional formatting conventions.</p>

        <p>[square brackets]: Terms in plain [square brackets] are properties of XML information set information
          items, as defined by <ref idref="XMLInfoset"/>. The information items and many of the information
          items<char name="rsquo"/> properties are defined in that document. <ref idref="XMLSchema-1"/> defines
          additional information item properties that are contributed by validation of an <termRef>XML
          document</termRef> against an <termRef>XML Schema</termRef>.</p>

        <p>{curly brackets}: Terms in plain {curly brackets} are properties of <termRef term="schema
            component">schema components</termRef>, as defined by <ref idref="XMLSchema-1"/>.</p>

        <p><code>Courier</code>: All words appearing in <code>Courier</code> font are values, objects, keywords, or literal XML text.</p>
        <p><em>Italics</em>: A phrase appearing in <em>italics</em> is one of:</p>
        <ul>
          <li><p>a title of a section of document or a rule,</p></li>
          <li><p>a locally-defined term, often one that is not normatively defined, or</p></li>
          <li><p>is emphasized for importance or prominence.</p></li>
        </ul>
        <p><strong>Bold</strong>: A phrase appearing in <strong>bold</strong> is one of:</p>
        <ul>
          <li><p>a term being defined within a definition,</p></li>
          <li><p>a term that was bold in the original source text for a quote</p></li>
          <li><p>a heading, such as for a section, a figure, a principle, definition, or rule, or</p></li>
          <li><p>a cross-reference within the document, to a reference to an outside document, or to a normative
              heading.</p></li>
        </ul>

        <p>Throughout the document, fragments of XML Schema or XML instances are used to clarify a principle or rule. These fragments are specially formatted in <code>Courier</code> font and appear in text boxes. An example of such a fragment follows:</p>
        <figure>
          <title>Example of an XML fragment</title>
          <pre><![CDATA[<xs:complexType name="PersonType">
  ...
</xs:complexType>]]></pre>
        </figure>
      </section>

  </section>

    <section>
      <title>Terminology</title>
      <p>This document uses standard terminology from other standards to explain the principles and rules that
      describe NIEM. In addition, it defines terms related to these other standards. This section enumerates this
      externally-dependent terminology.</p>

      <section id="section-terminology-bcp-14">
        <title>IETF Best Current Practice 14 terminology</title>
        <p>The key words <q>MUST</q>, <q>MUST NOT</q>, <q>REQUIRED</q>, <q>SHALL</q>,
          <q>SHALL NOT</q>, <q>SHOULD</q>, <q>SHOULD NOT</q>, <q>RECOMMENDED</q>, <q>NOT RECOMMENDED</q>,
          <q>MAY</q>, and <q>OPTIONAL</q> in this document are to be interpreted as described in
          <ref idref="BCP14"/> <ref idref="RFC2119"/> <ref idref="RFC8174"/> when, and only when, they appear in
          all capitals, as shown here.</p>
      </section>
      <section><title>XML terminology</title>

        <definition term="XML document">
          <p>The term <q>XML document</q> is as defined by MACRO_REF_EXTERNAL(XML,MACRO_HREF_XML#dt-xml-doc,2,Documents), which states:</p>
          <blockquote>
            <p>A data object is an XML document if it is well-formed, as defined in this specification. In addition, the XML document is valid if it meets certain further constraints.</p>
          </blockquote>
        </definition>

      </section>
      <section id="SectionTerminologyXMLInfoset">
        <title>XML Information Set terminology</title>

        <p>When discussing XML documents, this document uses terminology and language as defined by
          <ref idref="XMLInfoset"/>.</p>

        <p><ref idref="XMLInfoset"/> uses the term <q>information item</q> to describe pieces of XML
          documents. Documents, elements, and attributes are types of information items. The use of the
          term <q>element information item</q>, for example, refers to the term as defined by
          <ref idref="XMLInfoset"/>. Shorthand terms may also be used to refer to information items, such
          as <termRef>element</termRef>, as defined below. The information items are identified and defined by
          MACRO_REF_EXTERNAL(XMLInfoset,MACRO_HREF_XML_INFOSET#infoitem,2,Information Items).</p>

        <definition term="element">
          <p>An <em>element</em> is an <em>element information item</em>, as defined by
            MACRO_REF_EXTERNAL(XMLInfoset,MACRO_HREF_XML_INFOSET#infoitem.element,2.2,Element Information Items)</p>
        </definition>

        <definition term="attribute">
          <p>An <em>attribute</em> is an <em>attribute information item</em>, as defined by
            MACRO_REF_EXTERNAL(XMLInfoset,MACRO_HREF_XML_INFOSET#infoitem.element,2.3,Attribute Information Items)</p>
        </definition>

        <p><ref idref="XMLInfoset"/> also describes properties of information items. Each class of information
          item carries a set of properties. Each property has a name, and the property is identified by putting
          the name into square brackets. For example, the element that contains an attribute is described as the
          [owner element] of an attribute information item, as defined in
          MACRO_REF_EXTERNAL(XMLInfoset,MACRO_HREF_XML_INFOSET#infoitem.attribute,2.3,Attribute Information Items).</p>

        <p>Shorthand terms for properties of information items include:</p>

        <ul>
          <li><p>parent (of an element): the value of the [parent] property of an element information
              item</p></li>
          <li><p>child (of an element): a member of the list of information items that is the value of the
              [children] property of an element information item</p></li>
          <li><p>owner (of an attribute): the value of the [owner element] property of an attribute information
              item</p></li>
          <li><p><termDef>document element</termDef>: the value of the [document element] property of a document information item;
              preferred over the term <q>root element</q>.</p></li>
        </ul>

      </section>

      <section id="SectionTerminologyXMLSchema">
        <title>XML Schema terminology</title>

        <p>This document uses many terms from <ref idref="XMLSchema-1"/> and <ref idref="XMLSchema-2"/> in a normative way.</p>

        <definition term="schema component">
          <p>The term <q>schema component</q> is as defined by MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#key-component,2.2,XML Schema Abstract Data Model), which states:</p>
          <blockquote>
            <p><strong>Schema component</strong> is the generic term for the
            building blocks that comprise the abstract data model of the
            schema.</p>
          </blockquote>
        </definition>

        <p>Note that this defines an abstract concept. This is not a direct reference to elements that are
        defined by the <termRef>XML Schema definition language</termRef>; this is an abstract concept that might
        be realized within a tool as an in-memory model of data objects.</p>

        <definition term="XML Schema">
          <p>The term <q>XML Schema</q> is as defined by MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#key-schema,2.2,XML Schema Abstract Data Model), which states:</p>
          <blockquote>
            <p>An <strong>XML Schema</strong> is a set of schema components.</p>
          </blockquote>
        </definition>

        <p>Note, again, that this is an abstract concept: the set of abstract <termRef term="schema
        component">schema components</termRef> that are put together to define a schema against which an XML
        document might be validated.</p>

        <definition term="XML Schema definition language">
          <p>The term <q>XML Schema definition language</q> is as defined by
            MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#abstract,,Abstract), which states:</p>
          <blockquote>
            <p>XML Schema: Structures specifies the XML Schema definition language, which offers facilities for describing the structure and constraining the contents of XML 1.0 documents, including those which exploit the XML Namespace facility. The schema language, which is itself represented in XML 1.0 and uses namespaces, substantially reconstructs and considerably extends the capabilities found in XML 1.0 document type definitions (DTDs).</p>
          </blockquote>
        </definition>

        <p>This describes the XML syntax (and related semantics) defined by the XML Schema specifications. It is
        through the <termRef>XML Schema definition language</termRef> that a complex type definition schema
        component is created using the <qName>xs:complexType</qName> element.</p>

        <definition term="schema document">
          <p>The term <q>schema document</q> is as defined by
            MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#key-schemaDoc,3.1.2,XML Representations of Components), which states:</p>
          <blockquote>
            <p>A document in this form (i.e. a &lt;schema&gt; element information item) is a <strong>schema document</strong>.</p>
          </blockquote>
        </definition>

        <p>This definition describes an <termRef>XML document</termRef> that follows the syntax of
          the <termRef>XML Schema definition language</termRef>.</p>

    <definition term="valid">
      <p>The term <q>valid</q> is as defined by
        MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#key-vn,2.1,Overview of XML Schema),
        which states:</p>
      <blockquote>
        <p>[Definition:] the word <strong>valid</strong> and its derivatives are used to refer to clause 1 above, the determination of local schema-validity.</p>
      </blockquote>
      <p>The referenced clause 1 is a part of a description of schema-validity:</p>
      <blockquote>
        <p>Schema-validity assessment has two aspects:</p>
        <ol>
          <li><p>Determining local schema-validity, that is whether an element or attribute information item satisfies the constraints embodied in the relevant components of an XML Schema;</p></li>
          <li><p>Synthesizing an overall validation outcome for the item, combining local schema-validity with the results of schema-validity assessments of its descendants, if any, and adding appropriate augmentations to the infoset to record this outcome.</p></li>
        </ol>
      </blockquote>
    </definition>

    <p>In addition, this specification locally defines terms relevant to XML Schema concepts:</p>

    <definition term="instance document">
      <p>An <em>instance document</em> (of an <termRef>XML Schema</termRef>) is an <termRef>XML document</termRef> that is <termRef>valid</termRef> against the <termRef>XML Schema</termRef>.</p>
    </definition>

    <p>The term <q>instance document</q> is used with <ref idref="XMLSchema-1"/>, but is not defined therein.</p>

    <definition term="XML Schema document set">
      <p>An <em>XML Schema document set</em> is a set of <termRef term="schema document">schema documents</termRef> that together define an <termRef>XML Schema</termRef> suitable for assessing the <termRef term="valid">validity</termRef> of an <termRef>XML document</termRef>.</p>
    </definition>

    <p>Schema assembly is a tricky topic that is not resolved by this document. Other specifications may express
      specifics about the process of turning a set of <termRef term="schema document">schema documents</termRef>
      into an <termRef>XML Schema</termRef>. Methods used may include use of tool-specific schema caches and
      mappings, use of XML catalogs and entity resolvers, use of <local-name>schemaLocation</local-name>
      attributes on <qName>xs:import</qName> elements, and <qName>xsi:schemaLocation</qName> attributes in XML
      documents, among others. The topic of schema assembly is discussed in
      <ref idref="section-principle-schema-locations-are-hints"/>. This specification abstracts away details of
      schema assembly through the use of XPath functions described by
      <ref idref="section-normative-xpath-functions"/>.</p>

    <section><title>Schema components</title>

      <p>In this document, the name of a referenced schema component may appear without the suffix <q>schema
      component</q> to enhance readability of the text. For example, the term <q>complex type definition</q> may
      be used instead of <q>complex type definition schema component</q>.</p>

        <definition term="base type definition">
          <p>The term <q>base type definition</q> is as defined by MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#key-baseTypeDefinition,2.2.1.1,Type Definition Hierarchy), which states:</p>
          <blockquote>
            <p>A type definition used as the basis for an extension or restriction is known as the base type definition of that definition.</p>
          </blockquote>
        </definition>

        <definition term="simple type definition">
          <p>The term <q >simple type definition</q > is as defined by
            MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#Simple_Type_Definition,2.2.1.2,Simple Type Definition).</p>
        </definition>

        <definition term="complex type definition">
          <p>The term <q>complex type definition</q> is as defined by
            MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#Complex_Type_Definition,2.2.1.3,Complex Type Definition).</p>
        </definition>

        <definition term="element declaration">
          <p>The term <q>element declaration</q> is as defined by
            MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#Element_Declaration,2.2.2.1,Element Declaration).</p>
        </definition>

    </section>

    <section>
      <title>Schema information set contributions</title>

      <p>As described in <ref idref="SectionTerminologyXMLInfoset"/>, the XML Information Set specification
        defined properties of the content of XML documents. The XML Schema specification also provides properties
        of the content of XML documents. These properties are called Schema information set contribution, as
        described by MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#gloss-sic,2.3,Constraints and
        Validation Rules), which defines them as:</p>
      <blockquote>
        <p>Augmentations to post-schema-validation infosets expressed by schema components, which follow as a
        consequence of validation and/or assessment.</p>
      </blockquote>
      <p>This document uses these property terms within definitions and other text. Terms used include:</p>
      <ul>
        <li><p><a href="MACRO_HREF_XML_SCHEMA_1#e-type_definition">[type definition] (of an element)</a>: The type of the element as determined at run-time. This will reflect the use of the attribute <qName>xsi:type</qName> in an XML document.</p></li>
      </ul>
    </section>
      </section>
      <section>
        <title>XML Namespaces terminology</title>
        <p>This document uses XML Namespaces as defined by <ref idref="XMLNamespaces"/> and <ref idref="XMLNamespacesErrata"/>.</p>
      </section>

      <section>
        <title>Conformance Targets Attribute Specification terminology</title>
        <p><ref idref="CTAS"/> defines several terms used normatively within this specification.</p>
        <definition term="conformance target">
          <p>The term <q>conformance target</q> is as defined by
            <ref idref="CTAS"/>, which states:</p>
          <blockquote>
            <p>A <em>conformance target</em> is a class of artifact, such as an
              interface, protocol, document, platform, process or service, that
              is the subject of conformance clauses and normative
              statements. There may be several conformance targets defined
              within a specification, and these targets may be diverse so as to
              reflect different aspects of a specification. For example, a
              protocol message and a protocol engine may be different
              conformance targets.</p>
          </blockquote>
        </definition>
        <definition term="conformance target identifier">
          <p>The term <q>conformance target identifier</q> is as defined by
          <ref idref="CTAS"/>, which states:</p>
          <blockquote>
            <p>A <em>conformance target identifier</em> is an internationalized
              resource identifier that uniquely identifies a conformance
              target.</p>
          </blockquote>
        </definition>
        <definition term="effective conformance target identifier">
          <p>The term <q>effective conformance target identifier</q> is as defined by
            MACRO_REF_EXTERNAL(CTAS,MACRO_HREF_CTAS#definition_effective_conformance_target_identifier,4,Semantics and Use), which states:</p>
          <blockquote>
            <p>An <em>effective conformance target identifier</em> of a conformant document is an
              internationalized resource identifier reference that occurs in the document<char name="rsquo"/>s effective conformance
              targets attribute.</p>
          </blockquote>
        </definition>
      </section>
    </section>

  <section id="SectionNIEMConformanceTargets">
    <title>Conformance targets</title>

    <section id="SectionConformanceTargetsDefined">
      <title>Conformance targets defined</title>

      <p>This section defines and describes conformance targets of this specification. Each conformance target
        has a formal definition, along with a notional description of the characteristics and intent of
        each. These include:</p>

      <listOfSections/>

      <section><title>Reference schema document</title>
        <definition term="reference schema document">
          <p>A <strong>reference schema document</strong> is a <termRef>schema document</termRef> that
            is intended to provide the authoritative definitions of broadly reusable <termRef term="schema
            component">schema components</termRef>.  It is a <termRef>conformance target</termRef> of this
            specification. A reference schema document MUST conform to all rules of this specification
            that apply to this conformance target. An <termRef>XML document</termRef> with a <termRef>conformance
            target identifier</termRef> of <code>MACRO_CT_URI_REF</code> MUST be a conformant reference schema
            document.</p>
        </definition>

        <p>A <termRef>reference schema document</termRef> is a <termRef>schema document</termRef> that
          is intended to be the authoritative definition schema for a namespace. Examples include NIEM Core and
          NIEM domains.</p>

        <p>Some characteristics of a <termRef>reference schema document</termRef>:</p>

        <ul>
          <li><p>It is explicitly designated as a reference schema via the conformance targets attribute, per <ref idref="req-ct-ref"/>.</p></li>
          <li><p>It provides the broadest, most fundamental definitions of components in its namespace.</p></li>
          <li><p>It provides the authoritative definition of business semantics for components in its
              namespace.</p></li>
          <li><p>It is intended to serve as the basis for components in information exchanges and extension
          schema documents.</p></li>
          <li><p>It satisfies all rules specified in the Naming and Design Rules for reference schemas.</p></li>
        </ul>

      <p>Any schema that defines components that are intended to be incorporated into NIEM Core or a NIEM domain
        will be defined as a reference schema.</p>

      <p>The rules for reference schema documents are more stringent than are the rules for other
        classes of NIEM-conformant schemas. Reference schema documents are intended to support the
        broadest reuse. They are very uniform in their structure. As they are the primary definitions for schema
        components, they do not need to restrict other data definitions, and they are not allowed to use XML
        Schema<char name="rsquo" />s restriction mechanism (e.g., <ref idref="ct-cc-is-extension"/>).
        Reference schema documents are intended to be as regular and simple as possible.</p>

      </section>

      <section><title>Extension schema document</title>

        <definition term="extension schema document">
          <p>An <strong>extension schema document</strong> is a <termRef>schema document</termRef> that
            is intended to provide definitions of <termRef term="schema component">schema components</termRef>
            that are intended for reuse within a more narrow scope than those defined by a <termRef>reference schema document</termRef>.  It is a <termRef>conformance target</termRef> of this
            specification. An extension schema document MUST conform to all rules of this specification that
            apply to this conformance target. An XML document with a <termRef>conformance target
            identifier</termRef> of <code>MACRO_CT_URI_EXT</code > MUST be an extension schema
            document.</p>
        </definition>

        <p>Characteristics of an <termRef>extension schema document</termRef> include:</p>

        <ul>
          <li><p>It is explicitly designated as an <termRef>extension schema document</termRef> via
          the conformance targets attribute.</p></li>
          <li><p>It provides the authoritative definition of business semantics for components in its
          namespace.</p></li>
          <li><p>It contains components that, when appropriate, use or are derived from the components
              in <termRef term="reference schema document">reference schema
              documents</termRef>.</p></li>
          <li><p>It is intended to express the additional vocabulary required for an information exchange, above
              and beyond the vocabulary available from reference schemas, and to also support additional XML
              Schema validation requirements for an exchange.</p></li>
          <li><p>It satisfies all rules specified in this document for <termRef term="extension schema
          document" >extension schema documents</termRef>.</p></li>
        </ul>

      <p>An extension schema in an information exchange specification serves several functions. First, it defines
        new content within a new namespace, which may be an exchange-specific namespace or a namespace shared by
        several exchanges. This content is NIEM-conformant but has fewer restrictions on it than
        do <termRef term="reference schema document" >reference schema
        documents</termRef >. Second, the <termRef>extension schema document</termRef> bases its
        content on content from <termRef term="reference schema document">reference
        schema documents</termRef>, where appropriate. Methods of deriving content include using (by reference)
        existing <termRef term="schema component">schema components</termRef>, as well as creating extensions and
        restrictions of existing components.</p>

      <p>For example, an information exchange specification may define a type for an exchange-specific phone
        number and base that type on a type defined by the NIEM Core reference schema document. This
        exchange-specific phone number type may restrict the NIEM Core type to limit those possibilities that are
        permitted of the base type.  Exchange extensions and restrictions must include annotations and
        documentation to be conformant, but they are allowed to use restriction, choice, and some other
        constructs that are not allowed in <termRef term="reference schema document">reference schema documents</termRef>.</p>

      <p>Note that exchange specifications may define schemas that meet the criteria of reference schemas for
        those components that its developers wish to nominate for later inclusion in NIEM Core or in domains.</p>

      </section>

      <section><title>Schema document set</title>

        <p>A <termRef>conformant schema document set</termRef> is a set of schema documents that are capable of
        validating XML documents.</p>

        <definition term="conformant schema document set">
          <p>A <strong>conformant schema document set</strong> is a collection of <termRef term="schema
            document">schema documents</termRef> that together are capable
            of <termRef term="valid">validating</termRef> a
            <termRef>conformant instance XML document</termRef>. It is a <termRef>conformance target</termRef> of
            this specification. A conformant schema document set MUST conform to all rules of this specification
            that apply to this conformance target.</p>
        </definition>
      </section>

      <p>A <termRef>conformant schema document set</termRef> has strong dependencies on <termRef term="reference
      schema document">reference schema documents</termRef> and <termRef term="extension schema
      document">extension schema documents</termRef>. Without the guarantees provided by those conformance
      targets, the rules for a <termRef>conformant schema document set</termRef> would not be helpful. Those
      schemas in a schema set that are marked as reference or extension schemas are required to conform to the
      appropriate conformance targets.</p>

      <ruleSection>
        <title>Schema marked as reference schema document must conform</title>
        <rule applicability="SET" class="Constraint" >
          <p>Any <termRef>schema document</termRef> with an <termRef>effective conformance target
          identifier</termRef> of <code>MACRO_CT_URI_REF</code> MUST be a <termRef>reference schema document</termRef>.</p>
        </rule>
      </ruleSection>

      <ruleSection>
        <title>Schema marked as extension schema document must conform</title>
        <rule applicability="SET" class="Constraint" >
          <p>Any <termRef>schema document</termRef> with an <termRef>effective conformance target
          identifier</termRef> of <code>MACRO_CT_URI_EXT</code> MUST be an <termRef>extension schema document</termRef>.</p>
        </rule>
      </ruleSection>

    <section>
      <title>Instance documents and elements</title>

      <p>This document has specific rules about how NIEM content should be used
      in XML documents. As well as containing rules for XML Schema documents,
      this NDR contains rules for NIEM-conformant XML content at a finer
      granularity than the XML document.</p>

      <definition term="conformant instance XML document">
        <p>A <strong>conformant instance XML document</strong> is an <termRef>XML document</termRef> that
          is <termRef>instance document</termRef> <termRef>valid</termRef> to a <termRef>conformant schema
          document set</termRef>.  It is a <termRef>conformance target</termRef> of this specification. A
          conformant instance XML document MUST conform to all rules of this specification that apply to this
          conformance target.</p>
      </definition>

      <p>Characteristics of a <termRef>conformant instance XML document</termRef> include:</p>
        <ul>
          <li><p>The <termRef>document element</termRef>
              is locally schema-valid.</p></li>

          <li><p>Each element information item within the <termRef>XML document</termRef> that has property
              [namespace name] matching the target namespace of a <termRef>reference schema document</termRef >
              or <termRef >extension schema document</termRef > is a <termRef >conformant element information
              item</termRef >.</p></li>
        </ul>

      <p>Schema-validity may be assessed against a single set of schemas or against multiple sets of
        schemas.</p>

      <p>Assessment against schemas may be directed by a Model Package Description (MPD), by other instructions,
      or by other tools.</p>

      <p>Note that this specification does not require the <termRef>document element</termRef>
        of a <termRef>conformant instance XML
        document</termRef> to be a <termRef>conformant element information item</termRef>. Other specifications,
        such as the MPD specification, may add additional constraints to these in order to specify MPD-specific
        or exchange-specific conformance constraints.</p>

      <definition term="conformant element information item">
        <p>A <em>conformant element information item</em> is an element information item that satisfies all of
        the following criteria:</p>

        <ul>
          <li><p>Its [namespace name] and [local name] matches an element declared by a <termRef>reference schema
                document</termRef> or <termRef>extension schema document</termRef>.</p></li>
          <li><p>It occurs within a <termRef>conformant instance XML document</termRef>.</p></li>
          <li><p>It is locally schema-valid.</p></li>
          <li><p>It satisfies all rules specified in this document applicable to an element in
          a <termRef>conformant instance XML document</termRef>.</p></li>
        </ul>
      </definition>

      <p>Because each NIEM-conformant element information item must be locally schema-valid, each element must
        validate against the schema definition of the element, even if the element information item is allowed
        within the document because of a wildcard that the {process contents} with a value
        of <q>skip</q>. As described by
        MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#process_contents,3.10.1,The Wildcard Schema Component),
        the content of an element introduced by a wildcard with {process contents} set to <q>skip</q> does
        not have any schema validity constraint; it is only required to be well-formed XML.
        Within a NIEM-conformant XML document, each element that is from a NIEM
        namespace conforms to its schema specification.</p>

    </section>
    </section>
    <section>
      <title>Applicability of rules to conformance targets</title>

      <p>Each rule within this document is applicable to one or more of the conformance targets identified by
        <ref idref="SectionConformanceTargetsDefined"/>. Each rule identifies its applicability as described in
        <ref idref="section-rules"/>. The applicability field of each rule will contain one or more code values
        from <ref idref="TableCodesRepresentingConformanceTargets"/>. A rule is applicable to the identified
        conformance targets.</p>

      <table id="TableCodesRepresentingConformanceTargets">
        <title>Codes representing conformance targets</title>
        <theadr>
          <th>Code</th>
          <th>Conformance target</th>
        </theadr>
        <tr>
          <td><conformance-target id="REF">REF</conformance-target></td>
          <td><termRef>reference schema document</termRef></td>
        </tr>
        <tr>
          <td><conformance-target id="EXT">EXT</conformance-target></td>
          <td><termRef>extension schema document</termRef></td>
        </tr>
        <tr>
          <td><conformance-target id="SET">SET</conformance-target></td>
          <td><termRef>conformant schema document set</termRef></td>
        </tr>
        <tr>
          <td><conformance-target id="INS">INS</conformance-target></td>
          <td><termRef>conformant instance XML document</termRef></td>
        </tr>
      </table>
    </section>

    <section><title>Conformance target identifiers</title>

      <p>A conformant schema document claims to be conformant thorough the use of a set
        of <termRef term="conformance target identifier">conformance target identifiers</termRef>.</p>

      <ruleSection><title>Schema is CTAS-conformant</title>
        <rule applicability="REF EXT" id="is-ctas-conformant-document" class="Constraint">
          <p>The schema document MUST be a conformant document as defined by the NIEM Conformance Targets
            Attribute Specification.</p>
        </rule>
        <p>The term <q>conformant document</q> is defined by
          MACRO_REF_EXTERNAL(CTAS,MACRO_HREF_CTAS#section_3.2,3.2,Conformance to this Specification).</p>
      </ruleSection>

      <ruleSection><title>Document element has attribute <qName>ct:conformanceTargets</qName></title>
        <rule applicability="REF EXT" id="req-ct" class="Constraint">
          <pre><xmlBlurb id="xb-req-ct" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="*[. is nf:get-document-element(.)
                       or exists(@ct:conformanceTargets)]">
    <sch:assert test="(. is nf:get-document-element(.)) = exists(@ct:conformanceTargets)"
      >The [document element] of the XML document, and only the [document element], MUST own an attribute {MACRO_NS_CT}conformanceTargets.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

      <ruleSection><title>Schema claims reference schema conformance target</title>
        <rule applicability="REF" id="req-ct-ref" class="Constraint">
          <pre><xmlBlurb id="xb-req-ct-ref" memberOf="ref">
<sch:pattern>
  <sch:rule context="*[. is nf:get-document-element(.)]">
    <sch:assert test="nf:has-effective-conformance-target-identifier(., xs:anyURI('MACRO_CT_URI_REF'))"
      >The document MUST have an effective conformance target identifier of MACRO_CT_URI_REF.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
        <p>This document defines the term <termRef>effective conformance target identifier</termRef>.</p>
      </ruleSection>

      <ruleSection><title>Schema claims extension conformance target</title>
        <rule applicability="EXT" id="req-ct-ext" class="Constraint">
          <pre><xmlBlurb id="xb-req-ct-ext" memberOf="ext">
<sch:pattern>
  <sch:rule context="*[. is nf:get-document-element(.)]">
    <sch:assert test="nf:has-effective-conformance-target-identifier(., xs:anyURI('MACRO_CT_URI_EXT'))"
      >The document MUST have an effective conformance target identifier of MACRO_CT_URI_EXT.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
        <p>This document defines the term <termRef>effective conformance target identifier</termRef>.</p>
      </ruleSection>

    </section>
  </section>

  <section id="section-conceptual-model">
    <title>The NIEM conceptual model</title>

    <p>This section describes aspects of the RDF model, and provides a mapping between NIEM concepts and the RDF
    model.</p>

    <listOfSections/>

    <section><title>Purpose of the NIEM conceptual model</title>

    <p>Each release of NIEM provides a concrete data model, in the form of a set of <termRef term="schema
      document">schema documents</termRef>. These schema documents may be used to build messages and information
      exchanges. The schema documents spell out what kinds of objects exist and how those objects may be
      related. A set of XML data that follows the rules of NIEM implies specific meaning. The varieties
      of <termRef term="schema component">schema components</termRef> used within conformant schema documents are
      selected to clarify the meaning of XML data. That is, schema components that do not have a clear meaning
      have been avoided. NIEM provides a framework within which XML data has a specific meaning.</p>

    <p>One limitation of XML and XML Schema is that they do not describe the meaning of an XML document. The XML
      specification defines XML documents and defines their syntax but does not address the meaning of those
      documents. The XML Schema specification defines the XML Schema definition language, which describes the
      structure and constrains the contents of XML documents through the construction and use of schema
      components.</p>

    <p>In a schema, the meaning of a schema component may be described using the <qName>xs:documentation</qName>
      element, or additional information may be included via use of the <qName>xs:appinfo</qName>
      element. Although this may enable humans to understand XML data, more information is needed to support the
      machine-understandable meaning of XML data. In addition, inconsistency among the ways that schema
      components may be put together may be a source of confusion.</p>

    <p>The RDF Core Working Group of the World Wide Web consortium has developed a simple, consistent conceptual
      model, the RDF model. The RDF model is described and specified through a set of W3C Recommendations, the
      Resource Description Framework (RDF) specifications, making it a very well defined standard. The NIEM model
      and the rules contained in this NDR are based on the RDF model. This provides numerous advantages:</p>

    <ul>
      <li><p>NIEM<char name="rsquo"/>s conceptual model is defined by a recognized standard.</p></li>
      <li><p>NIEM<char name="rsquo"/>s conceptual model is very well defined.</p></li>
      <li><p>NIEM<char name="rsquo"/>s conceptual model provides a consistent basis for relating attributes,
          elements, types, and other XML Schema components.</p></li>
      <li ><p >NIEM<char name="rsquo" />s use of the RDF model defines what a set of NIEM data means. The RDF
          specification provides a detailed description of what a statement means. This meaning is leveraged by
          NIEM.</p></li>
      <li><p>NIEM<char name="rsquo"/>s use of the RDF model provides a basis for inferring and reasoning about
          XML data that uses NIEM. That is, using the rules defined for the RDF model, programs can determine
          implications of relationships between NIEM-defined objects.</p></li>
    </ul>

    <p>With the exception of this section, NIEM rules are explained in this document without reference to RDF or
      RDF concepts. Understanding RDF is not required to understand NIEM-conformant schemas or data based on
      NIEM. However, understanding RDF concepts may deepen understanding of NIEM.</p>

    <p>The goal of this section is to clarify the meaning of XML data that is NIEM-conformant and to outline the
      implications of various modeling constructs in NIEM. The rules for NIEM- conformant schemas and instances
      are in place to ensure that a specific meaning can be derived from data. That is, the data makes specific
      assertions, which are well understood since they are derived from the rules for NIEM.</p>
    </section>

    <section><title>The RDF model</title>
      <p>This section identifies features of RDF and RDFS, in order to establish a mapping between RDF semantics
        and NIEM. A reader should read the referenced source documents to obtain a full understanding of the
        concepts mentioned in this section.</p>

      <p>RDF establishes a graph-based data model, as described by

          MACRO_REF_EXTERNAL(RDFConcepts,MACRO_HREF_RDF_CONCEPTS#data-model,1.1,Graph-based Data Model), which states:</p>

      <blockquote>
        <p>The core structure of the abstract syntax is a set of triples, each consisting of a subject, a
        predicate and an object. A set of such triples is called an RDF graph.</p>
      </blockquote>
      <p><ref idref="RDFConcepts"/> also states:</p>
      <blockquote>
        <p>There can be three kinds of nodes in an RDF graph: IRIs, literals, and blank nodes.</p>
      </blockquote>

      <p>MACRO_REF_EXTERNAL(RDFConcepts,MACRO_HREF_RDF_CONCEPTS#resources-and-statements,1.2,Resources and Statements) describes resources:</p>

      <blockquote>
        <p>Any IRI or literal <strong>denotes</strong> something in the world (the <q>universe of
        discourse</q>). These things are called <strong>resources</strong>. Anything can be a resource, including
        physical things, documents, abstract concepts, numbers and strings; the term is synonymous
        with <q>entity</q> as it is used in the RDF Semantics specification. The resource denoted by an IRI is
        called its referent, and the resource denoted by a literal is called its literal value.</p>
      </blockquote>

      <p><ref idref="RDFConcepts"/> also describes relationships and blank nodes.</p>

      <blockquote>
        <p>Asserting an RDF triple says that some relationship, indicated by the predicate, holds between the
        resources denoted by the subject and object. This statement corresponding to an RDF triple is known as an
        RDF statement. The predicate itself is an IRI and denotes a property, that is, a resource
        that can be thought of as a binary relation. (Relations that involve more than two entities can only be
        indirectly expressed in RDF.)</p>

        <p>Unlike IRIs and literals, blank nodes do not identify specific resources. Statements involving blank
          nodes say that something with the given relationships exists, without explicitly naming it.</p>
      </blockquote>

      <p>MACRO_REF_EXTERNAL(RDFConcepts,MACRO_HREF_RDF_CONCEPTS#dfn-logical-expression,1.7,[[[Equivalence, Entailment and Inconsistency]]]) describes the meaning of an RDF triple:</p>

      <blockquote>
        <p>An RDF triple encodes a statement<char name="mdash"/>a simple logical expression, or claim about the
        world. An RDF graph is the conjunction (logical AND) of its triples.</p>
      </blockquote>

      <p>MACRO_REF_EXTERNAL(RDFConcepts,MACRO_HREF_RDF_CONCEPTS#dfn-rdf-triple,3.1,Triples) defines an RDF triple:</p>

      <blockquote>
        <p>An RDF triple consists of three components:</p>
        <ul>
          <li><p>the subject, which is an IRI or a blank node</p></li>
          <li><p>the predicate, which is an IRI</p></li>
          <li><p>the object, which is an IRI, a literal or a blank node</p></li>
        </ul>

        <p>An RDF triple is conventionally written in the order subject, predicate, object.</p>
      </blockquote>

    </section>

    <section><title>NIEM in terms of RDF</title>

      <p>The RDF view of the meaning of data carries into NIEM: NIEM elements form statements that make claims
        about the world: that a person has a name, a residence location, a spouse, etc. The assertion of one set
        of facts does not necessarily rule out other statements: A person could have multiple names, could have
        moved, or could be divorced. Each statement is a claim asserted to be true by the originator of the
        statement.</p>

      <p>This NDR discusses NIEM data in XML terminology, complex types and elements, rather than using
      RDF terms, resources and properties. NIEM objects and associations coincide with RDF resources; both
      objects and associations correspond to RDF resources with additional constraints:</p>

      <p>NIEM associations are defined as n-ary properties, as described in
        <ref idref="N-ary"/>, <a href="MACRO_HREF_NARY#useCase3"><q>Use Case 3: N-ary relation with no
        distinguished participant</q></a>. NIEM associations are defined in
        <ref idref="section-associations"/>. Assertions are made via NIEM-conformant XML data, described by
        <ref idref="section-xml-instance-document-rules"/>.</p>

      <p>The XML Schema types that define NIEM objects and associations are related to each other via elements
      and attributes. That is, a type contains elements and attributes, and an element or attribute has a value
      that is an instance of an XML Schema type. These elements and attributes are XML Schema representations,
      which correspond to RDF properties. NIEM-conformant XML Schemas describe things and their
      properties. NIEM-conformant data contains elements and attributes. These correspond to RDF resources and
      their properties, which describe their characteristics and relationships.</p>

    </section>

    <section id="section-unique-object-ids">
      <title>Unique identification of data objects</title>

      <p>A NIEM data exchange may be ephemeral and ad hoc. That is, a message may be transmitted without any
        expectation of persistence. Such a message exists only to exchange data and may not have any universal
        meaning beyond that specific exchange. As such, a message may or may not have a URI as an
        identifier. NIEM was designed with the assumption that a given exchange need not have any unique
        identifier; NIEM does not require a unique identifier. NIEM also does not require any object carried by a
        message to be identified by a URI.</p>

      <p>A NIEM-conformant instance XML document may carry any of these attributes to identify objects within
        messages:</p>

      <ul>
        <li>
          <p>Attribute <strong><qName>xml:base</qName></strong> (of type <qName>xs:anyURI</qName>) is defined by
            MACRO_REF_EXTERNAL(XMLBase,MACRO_HREF_XML_BASE#syntax,3,<code>xml:base</code> Attribute), which
            states:</p>
          <blockquote><p>The attribute <code>xml:base</code> may be inserted in XML documents to specify a base
              URI other than the base URI of the document or external entity.</p></blockquote>
          <p>An XML document has an implicit base URI, the identifier of the document itself. This attribute
            allows the base URI to be made explicit within a NIEM XML document.</p>
        </li>
        <li>
          <p>Attribute <strong><qName>structures:uri</qName></strong> (of type <qName>xs:anyURI</qName>) may
            appear within an XML element to define a URI for that element. This may be an absolute URI
            (e.g., <code>http://example.org/incident182#person12</code>), or may be a relative URI
            (e.g., <code>#person12</code>). Relative URIs are resolved against a URI determined by
            the <qName>xml:base</qName> attributes in scope, falling back to the base URI of the containing
            document.</p>
        </li>
        <li><p>Attribute <strong><qName>structures:id</qName></strong> (of type <qName>xs:ID</qName>) provides a
            document-relative identifier for an element. Semantically, <q><code>structures:id="abe92"</code></q>
            is equivalent to
            <q><code>structures:uri="#abe92"</code></q>.</p></li>
        <li><p>Attribute <strong><qName>structures:ref</qName></strong> (of type <qName>xs:IDREF</qName>)
            provides a reference to another element within a document, by providing a value of
            a <qName>structures:id</qName> attribute within the
            document. Semantically, <q><code>structures:ref="abe92"</code></q> is equivalent
            to <q><code>structures:uri="#abe92"</code></q></p></li>
      </ul>

      <p>The values of URIs and IDs within NIEM XML documents are not presumed to have any particular
        significance. XML requires every ID to be unique within its XML document, and for every IDREF to refer to
        an ID within the same document. The mapping of IDs and IDREFs to URIs does not mean that the identifiers
        are persistent or significant.</p>

      <p>These attributes provide the identifiers of objects. The properties of an object may be spread across
        several XML elements that have the same identifier. These properties must be merged together to provide
        all the properties of a single object, as described by
        MACRO_REF_EXTERNAL(JSONLD,MACRO_HREF_JSON_LD#node-objects,8.2,Node Objects):</p>

      <blockquote><p>The properties of a node in a graph may be spread among different node objects within a
          document. When that happens, the keys of the different node objects need to be merged to create the
          properties of the resulting node.</p></blockquote>

      <p>Mapping of NIEM data to RDF frequently involves the use of blank nodes, instead of
        universally-meaningful resource IRIs.</p>

      <p>The identifier of an object is constructed using the above attributes; if the above attributes do not
      appear on an object, then an object may be treated as a blank node, and assigned a blank node
      identifier.</p>

    </section>
    <section>
      <title>NIEM data is explicit, not implicit</title>

      <p>In NIEM data, that which is not stated is not implied. If data says a person<char name="rsquo"/>s name
        is <q>John,</q> it is not implicitly saying that he does not have other names, or that <q>John</q> is his
        legal name, or that he is different from a person known as <q>Bob.</q> The only assertion being made is
        that one of the names by which this person is known is <q>John</q>.</p>

      <p>This is one reason that definitions of NIEM content are so important. The definitions must state exactly
        what any given statement implies. The concept of <q>legal name</q> may be defined that makes additional
        assertions about a name of a person. Such assertions must be made explicit in the definition of the
        relationship.</p>
      </section>

    <section><title>Mapping of NIEM concepts to RDF concepts</title>

      <p>This section provides RDF implementations for many aspects of NIEM-conformant schemas and instance
      documents.</p>

      <section><title>Resource IRIs for XML Schema components and information items</title>
        <p>The term <q>qualified name</q> is defined by
          MACRO_REF_EXTERNAL(XMLNamespaces,MACRO_HREF_XML_NAMESPACES#dt-qualname,2.1,Basic Concepts), which states:</p>

        <blockquote><p>A <strong>qualified name</strong> is a name subject to namespace interpretation.</p></blockquote>

        <p>A QName is used to represent a qualified name, as described by
          MACRO_REF_EXTERNAL(XMLSchema-2,MACRO_HREF_XML_SCHEMA_2#QName,3.2.18,QName), which states:</p>

        <blockquote><p>The value space of QName is the set of tuples {namespace name, local part}, where
            namespace name is an anyURI and local part is an NCName.</p></blockquote>

        <p>Certain components defined by NIEM schemas and instances have corresponding resource IRIs. Each IRI is
          taken from a qualified name, as follows:</p>

        <ul>
          <li><p>If namespace name ends with <q>#</q>: concatenate(namespace name, local part)</p></li>
          <li><p>Otherwise: concatenate(namespace name, <q>#</q>, local part)</p></li>
        </ul>

        <p>Note that this is only meaningful when the namespace name is not empty and is an absolute URI.</p>

        <p>The corresponding RDF resource IRIs for information items and schema components are:</p>

        <ul>
          <li><p>element information item or attribute information item: the resource IRI is built from the
              qualified name constructed from its [namespace name] and [local name] properties.</p></li>
          <li><p>schema component: the resource IRI is built from the qualified name constructed from its {target
              namespace} and {name} properties.</p></li>
        </ul>
      </section>

      <section id="sec-rdf-literals"><title>RDF Literals</title>
        <p>A simple value may be incorporated into a <termRef>conformant instance XML document</termRef> as the
        value of an attribute information item, or as a child of an element information item. This section
        describes how a simple value is mapped to an RDF literal. Note that there is no mapping for the simple
        content of an element that is not a <termRef>conformant element information item</termRef>, nor for
        attributes defined by non-conformant schema documents, so there is no accommodation of mixed content,
        untyped values, or other cases outside of what conformant schema documents define.</p>

        <p>For each occurrence of a simple value, the following may be relevant:</p>
        <ul>
          <li><p>The value of the literal, which is a normalized value of an attribute or element information
              item processed in accordance with

              MACRO_REF_EXTERNAL(XML,MACRO_HREF_XML#sec-white-space,2.10,White Space Handling)

              and

              MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#d0e1654,3.1.4,White Space Normalization during Validation).</p></li>

          <li><p>The occurrence of an attribute <qName>xml:lang</qName> applicable to the value (described by

              MACRO_REF_EXTERNAL(XML,MACRO_HREF_XML#sec-lang-tag,2.12,Language Identification)),

              which may entail a language tag on the literal (described by

              MACRO_REF_EXTERNAL(RDFConcepts,MACRO_HREF_RDF_CONCEPTS#dfn-language-tag,3.3,Literal)).</p></li>

          <li><p>The XML Schema-defined base type of the simple value, which may be an
              attribute<char name="rsquo"/>s {type definition}, or a simple type base type of an
              element<char name="rsquo"/>s {type definition}.</p></li>
        </ul>

        <p>The literal for a simple value <var>$value</var> is:</p>
        <ul>
          <li><p>If <var>$value</var> has a base type definition that is derived from
              type <qName>xs:string</qName> (and not an XML Schema-defined type derived
              from <qName>xs:string</qName>), and a non-empty language specification is applied
              to <var>$value</var> using <qName>xml:lang</qName>, as described by

              MACRO_REF_EXTERNAL(XML,MACRO_HREF_XML#sec-lang-tag,2.12,Language Identification),

              then the literal is a language-tagged string, as described by

              MACRO_REF_EXTERNAL(RDFConcepts,MACRO_HREF_RDF_CONCEPTS#dfn-language-tagged-string,3.3,Literals):</p>

            <sub>
              <pre>&quot;$lexical-form&quot;@$language-tag</pre>
              <p>Where:</p>
              <ul>
                <li><p><var>$lexical-form</var> is a Unicode string for <var>$value</var>.</p></li>
                <li><p><var>$language-tag</var> is the in-scope value of attribute <qName>xml:lang</qName>.</p></li>
              </ul>
            </sub>
          </li>

          <li>
            <p>Otherwise, if <var>$value</var> has a base type definition <var>$base-type</var> that is listed as
              an RDF-compatible XSD type in
              MACRO_REF_EXTERNAL(RDFConcepts,MACRO_HREF_RDF_CONCEPTS#xsd-datatypes,5.1,The XML Schema Built-in
              Datatypes), and <var>$base-type</var> is not <qName>xs:string</qName>, then the literal
              is:</p>
            <sub>
              <pre>&quot;$lexical-form&quot;^^$datatype-IRI</pre>
              <p>Where:</p>
              <ul>
                <li><p><var>$lexical-form</var> is a Unicode string for <var>$value</var>.</p></li>
                <li><p><var>$datatype-IRI</var> is the QName of <var>$base-type</var>.</p></li>
              </ul>
            </sub>
          </li>

          <li>
            <p>Otherwise, the literal is a simple literal, which is:</p>
            <sub>
              <pre>&quot;$lexical-form&quot;</pre>
              <p>Where: <var>$lexical-form</var> is a Unicode string for <var>$value</var>.</p>
            </sub>
          </li>
        </ul>

      </section>

      <section id="section-instance-rdf-mapping"><title>NIEM instance mappings to RDF</title>

        <p>This section has the following subsections:</p>

        <listOfSections/>

        <section><title>XML document mapping</title>
          <p>A <termRef>conformant instance XML document</termRef> entails a corresponding RDF graph, which is a
            set of triples, which are entailed by the mapping of the contents of the XML document to RDF.</p>
        </section>

        <section><title>Element instance</title>

          <p>A <termRef>conformant element information item</termRef> <var>$element</var> that has property [type
            definition] that is an <termRef>object type</termRef> or an <termRef>association type</termRef>,
            entails the RDF:</p>

          <sub>
            <pre>$object rdf:type $type .</pre>
            <p>Where:</p>
            <ul>
              <li><p><var>$object</var> is a node identifier for the object held by <var>$element</var>.</p></li>
              <li><p><var>$type</var> is resource IRI for the value of the [type definition] property
                  of <var>$element</var>.</p></li>
            </ul>
          </sub>

          <p>If <var>$element</var> has a non-empty simple value, then it also entails the RDF:</p>

          <sub>
            <pre>$object rdf:value $literal .</pre>
            <p>Where:</p>
            <ul>
              <li><p><var>$object</var> is as above.</p></li>
              <li><p><var>$literal</var> is the literal value for <var>$element</var>, as described in
                  <ref idref="sec-rdf-literals"/>.</p></li>
            </ul>
          </sub>
        </section>

        <section><title>Element as a property with unknown context </title>

          <p>A <termRef>conformant element information item</termRef> <var>$element</var> that</p>
          <ul>
            <li><p>has [type definition] that is the ur-type, an <termRef>object type</termRef>, or
                an <termRef>association type</termRef>, and that</p></li>
            <li><p>has a [parent] that is not an element information item, or that is an element information item
                that is not a <termRef>conformant element information item</termRef></p></li>
          </ul>
          <p>entails the RDF:</p>

          <sub>
            <pre>$context $predicate $object .</pre>

            <p>Where:</p>
            <ul>
              <li><p><var>$context</var> is a blank node, to represent the unknown context in
                  which <var>$element</var> occurs.</p></li>
              <li><p><var>$predicate</var> is the IRI for element information item <var>$element</var>, to
                  represent the semantics of the relationship.</p></li>
              <li><p><var>$object</var> is a node identifier for the object held by <var>$element</var>.</p></li>
            </ul>
          </sub>

        </section>

        <section><title>Element as a simple property of an object or association</title>

          <p>A <termRef>conformant element information item</termRef> <var>$context</var> that is an instance of
            an <termRef>object type</termRef> or <termRef>association type</termRef>, and that has a
            child <termRef>conformant element information item</termRef> <var>$element</var> that is an instance of
            an <termRef>object type</termRef> or an <termRef>association type</termRef>, entails the RDF:</p>

        <sub>
          <pre>$subject $predicate $object .</pre>
          <p>Where:</p>
          <ul>
            <li><p><var>$subject</var> is a node identifier for the object held by <var>$context</var>.</p></li>
            <li><p><var>$predicate</var> is the IRI for <var>$element</var>.</p></li>
            <li><p><var>$object</var> is a node identifier for the object held by <var>$element</var>.</p></li>
          </ul>
        </sub>

        </section>
        <section><title>Attribute as a simple property of an object or association</title>

          <p>An attribute information item <var>$attribute</var> where:</p>
          <ul>
            <li><p><var>$attribute</var> is owned by a <termRef>conformant element information
                  item</termRef> <var>$context</var> that has property [type definition] that is
                an <termRef>object type</termRef> or an <termRef>association type</termRef>, and</p></li>
            <li><p><var>$attribute</var> has property [attribute declaration]
                that is defined by a <termRef>reference schema document</termRef> or an <termRef>extension schema
                  document</termRef></p></li>
          </ul>
          <p>entails the RDF:</p>
          <sub>
            <pre>$subject $predicate $literal .</pre>
            <p>Where:</p>
            <ul>
              <li><p><var>$subject</var> is a node identifier for the object held by <var>$context</var>.</p></li>
              <li><p><var>$predicate</var> is the resource IRI for <var>$attribute</var>.</p></li>
              <li><p><var>$literal</var> is the literal value for <var>$attribute</var>, as described in <ref idref="sec-rdf-literals"/>.</p></li>
            </ul>
          </sub>

        </section>
        <section><title>Elements via an augmentation type</title>
          <p>An element of an augmentation type contains a set of elements and attributes that are applied to
          some base object or association.</p>

          <p>For each element applied to a type via an augmentation type:</p>
          <ul>
            <li><p>Element information item <var>$base</var> that is an instance of an <termRef>object
                  type</termRef> or <termRef>association type</termRef>,</p></li>
            <li><p>Element information item <var>$augmentation</var> that is a child of <var>$base</var> that
                has [type definition] that is an <termRef>augmentation type</termRef>,</p></li>
            <li><p>Element information item <var>$resolved-augmentation</var> is any augmentation element with an
                object that has the the same node identifier as the object held
                by <var>$augmentation</var>, and</p></li>
            <li><p>Element information item <var>$element</var> that is a child
                of <var>$resolved-augmentation</var>, that has [type definition] that is an <termRef>object
                type</termRef> or an <termRef>association type</termRef>.</p></li>
          </ul>
          <p>entails the RDF:</p>
          <sub>
            <pre>$subject $predicate $object .</pre>
            <p>Where:</p>
            <ul>
              <li><p><var>$subject</var> is the node identifier for the object held by <var>$base</var>.</p></li>
              <li><p><var>$predicate</var> is the resource IRI for [element declaration]
                  of <var>$element</var>.</p></li>
              <li><p><var>$object</var> is the node identifier for the object held by
                  <var>$element</var></p></li>
            </ul>
          </sub>
        </section>
        <section><title>Attributes via an augmentation type</title>
          <p>An element of an augmentation type contains a set of elements and attributes that are applied to
          some base object or association.</p>

          <p>For each attribute applied to a type via an augmentation type:</p>
          <ul>
            <li><p>Element information item <var>$base</var> that is an instance of an <termRef>object
                  type</termRef> or <termRef>association type</termRef>,</p></li>
            <li><p>Element information item <var>$augmentation</var> that is a child of <var>$base</var> that
                has [type definition] that is an <termRef>augmentation type</termRef>,</p></li>
            <li><p>Element information item <var>$resolved-augmentation</var> that is any augmentation element
                with an object that has the same node identifier as the object held
                by <var>$augmentation</var>,</p></li>
            <li><p>Attribute information item <var>$attribute</var> that is owned
                by <var>$resolved-augmentation</var>, that has an [attribute declaration] that is defined by
                a <termRef>reference schema document</termRef> or an <termRef>extension schema
                document</termRef></p></li>
          </ul>
          <p>entails the RDF:</p>
          <sub>
            <pre>$subject $predicate $literal .</pre>
            <p>Where:</p>
            <ul>
              <li><p><var>$subject</var> is a node identifier for the object held by <var>$base</var>.</p></li>
              <li><p><var>$predicate</var> is the resource IRI for <var>$attribute</var>.</p></li>
              <li><p><var>$literal</var> is the literal value for <var>$attribute</var>, as described in
                  <ref idref="sec-rdf-literals"/>.</p></li>
            </ul>
          </sub>
        </section>
      </section>

      <section><title>NIEM complex type definitions to RDF</title>

        <p>The following RDF mappings apply to the content of a <termRef>reference schema document</termRef>
          or <termRef>extension schema document</termRef>.</p>

        <p>An <termRef>object type</termRef> or <termRef>association type</termRef> $type entails the following
          RDF:</p>
        <sub>
          <pre>$resource rdf:type rdf:Class .</pre>
          <p>Where <var>$resource</var> is the resource IRI for <var>$type</var>.</p>
        </sub>

        <p>An <termRef>object type</termRef> or <termRef>association type</termRef> <var>$type</var> that has
        property {base type definition} <var>$base</var> also entails the RDF:</p>
        <sub>
          <pre>$resource rdfs:subClassOf $base-resource</pre>
          <p>Where <var>$base-resource</var> is the resource IRI for <var>$base</var>.</p>
        </sub>

      </section>

      <section><title>NIEM element declaration mappings to RDF</title>

        <p>The following RDF mappings apply to the content of a <termRef>reference schema document</termRef>
          or <termRef>extension schema document</termRef>.</p>

        <p>A top-level element declaration schema component <var>$element-declaration</var> that has property
          {type definition} that is</p>
        <ul>
          <li><p>the ur-type, or</p></li>
          <li><p>is, or is derived from, <qName>structures:ObjectType</qName>, or</p></li>
          <li><p>is, or is derived from, <qName>structures:AssociationType</qName></p></li>
        </ul>
        <p>entails the RDF:</p>
        <sub>
          <pre>$element-resource rdf:type rdf:Property .</pre>
          <p>Where <var>$element-resource</var> is the resource IRI for <var>$element-declaration</var>.</p>
        </sub>

        <p>If <var>$element-declaration</var> has property {substitution group affiliation} with a value
        of element declaration <var>$base</var>, then it entails the RDF:</p>
        <sub>
          <pre>$element-resource rdfs:subPropertyOf $base-resource</pre>
          <p>Where:</p>
          <ul>
            <li><p><var>$element-resource</var> is the resource IRI for <var>$element-declaration</var>.</p></li>
            <li><p><var>$base-resource</var> is the resource IRI for <var>$base</var>.</p></li>
          </ul>
        </sub>

        <p>If <var>$element-declaration</var> has property {type definition} with a value <var>$type</var> that is
          an <termRef>object type</termRef> or <termRef>association type</termRef>, then it entails the RDF:</p>

        <sub>
          <pre>$element-resource rdfs:range $type-resource</pre>
          <p>Where:</p>
          <ul>
            <li><p><var>$element-resource</var> is the resource IRI for <var>$element-declaration</var>.</p></li>
            <li><p><var>$type-resource</var> is the resource IRI for <var>$type</var>.</p></li>
          </ul>
        </sub>
      </section>
      <section><title>NIEM attribute declarations to RDF</title>

        <p>The following RDF mappings apply to the content of a <termRef>reference schema document</termRef>
          or <termRef>extension schema document</termRef>.</p>

        <p>A top-level attribute declaration schema component <var>$attribute-declaration</var> that has property
          {type definition} that is a simple type definition defined within a <termRef>reference schema
          document</termRef> or an <termRef>extension schema document</termRef>, then it entails the RDF:</p>

        <sub>
          <pre>$attribute-resource rdf:type rdf:Property .</pre>
          <p>Where <var>$attribute-resource</var> is the resource IRI for <var>$attribute-declaration</var>.</p>
        </sub>

      </section>
    </section>

  </section>

  <section>
    <title>Guiding principles</title>
    <p>Principles in this specification provide a foundation for the rules. These principles are generally applicable in most cases. They should not be used as a replacement for common sense or appropriate special cases.</p>
    <p>The principles are not operationally enforceable; they do not specify constraints on XML Schema documents and instances. The rules are the normative and enforceable manifestation of the principles.</p>
    <p>The principles discussed in this section are organized as follows:</p>
    <listOfSections/>
    <section>
      <title>Specification guidelines</title>
      <p>The principles in this section address what material should be included in this NDR and how it should be represented.</p>
      <section>
        <title>Keep specification to a minimum</title>
        <p>This specification should state what is required for interoperability, not all that could be specified. Certain decisions (such as normative XML comments) could create roadblocks for interoperability, making heavy demands on systems for very little gain. The goal is not standardization for standardization<char name="rsquo"/>s sake. The goal is to maximize interoperability and reuse.</p>
        <principle>
          <p>This specification SHOULD specify what is necessary for semantic interoperability and no more.</p>
        </principle>
        <p>The term <strong>semantic interoperability</strong> is here defined as <q>the ability of two or more computer systems to exchange information and have the meaning of that information automatically interpreted by the receiving system accurately enough to produce useful results.</q>
        </p>
      </section>
      <section>
        <title>Focus on rules for schemas</title>
        <p>This specification should try, as much as is possible, to specify schema-level content. This is a
        specification for schemas, and so it should specify schemas and their instance documents. It should avoid
        specifying complex data models or data dictionaries.</p>
        <principle>
          <p>This specification SHOULD focus on specifying characteristics of schema documents, their instance
          documents, and their interpretation.</p>
        </principle>
      </section>
      <section>
        <title>Use specific, concise rules</title>
        <p>A rule should be as precise and specific as possible to avoid broad, hard-to-modify rules. Putting multiple clauses in a rule makes it harder to enforce. Using separate rules allows specific conditions to be clearly stated.</p>
        <principle>
          <p>This specification SHOULD feature rules that are specific, precise, and concise.</p>
        </principle>
      </section>
    </section>
    <section>
      <title>XML Schema design guidelines</title>
      <p>The principles in this section address how XML Schema technology should be used in designing NIEM-conformant schemas and instances.</p>
      <section>
        <title>Purpose of XML Schemas</title>
        <principle>
          <p>The specification SHOULD focus on rules for XML Schemas in order to support:</p>
          <ol>
            <li><p>the expression of interface specifications for exchange of information between data producers
                and consumers,</p></li>
            <li><p>validation of XML documents against interface specifications,</p></li>
            <li><p>comprehension and understanding of XML documents, including the use of post-schema-validation
                infoset as defined by
                MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#key-psvi,2.1,Overview of XML Schema), and</p></li>
            <li><p>development of implementations supported by tools that use XML Schemas.</p></li>
          </ol>
        </principle>
      </section>
      <section id="section-principle-no-infoset-mods">
        <title>Prohibit XML parsing from constructing values</title>

        <p>XML Schema has features that can make the data provided by an XML Schema validating parser differ from
          that provided by a non-validating XML parser. For example, if an XML Schema attribute declaration has a
          <local-name>default</local-name> value, and if an XML document omits the attribute where it might
          appear, an XML Schema validating parser will <em>construct</em> the attribute with the default value
          in the infoset that it provides to its caller. Without schema validation, there would be no attribute
          value, but after processing, the attribute value exists in the parsed data provided to the
          caller. <ref idref="sec-no-infoset-mods"/> provides more detail.</p>

        <p>Within NIEM, the purpose of processing instances against schemas is primarily validation: testing that
          data instances match desired constraints and guidelines. It should not be used to alter the content of
          data passing through the parser.</p>

        <principle>

          <p>The data of a NIEM-conformant XML document provided by an XML parser SHOULD NOT be modified by the
            process of validating the data against an XML Schema.</p>

        </principle>

      </section>
      <section>
        <title>Use XML validating parsers for content validation</title>
        <p>NIEM is designed for XML Schema validation. One goal is to maximize the amount of validation that may be performed by XML Schema-validating parsers.</p>
        <p>XML Schema validates content using content models: descriptions of what elements and attributes may be contained within an element, and what values are allowable. It is the XML element hierarchy (elements with attributes and unstructured content, contained by other elements) that the XML Schema definition language specifies and that XML Schema validating parsers can validate.</p>
        <p>Mechanisms involving linking using attribute and element values are useful, but they should only be relied on when absolutely necessary, as XML Schema-validating parsers cannot readily validate them. For example, if a link is established via attribute values, an XML Schema-validating parser cannot determine that participants have appropriate type definitions. Whenever possible, NIEM content should rely on XML syntax that can be validated with XML Schema.</p>
        <principle>
          <p>NIEM-conformant schemas and NIEM-conformant XML documents SHOULD use features supported by XML Schema validating parsers for validation of XML content.</p>
        </principle>
      </section>
      <section>
        <title>Validate for conformance to schema</title>
        <p>Systems that operate on XML data have the opportunity to perform multiple layers of
          processing. Middleware, XML libraries, schemas, and application software may process data. The primary
          purpose of validation against schemas is to restrict processed data to that data that conforms to
          agreed-upon rules. This restriction is achieved by marking as invalid that data that does not conform
          to the rules defined by the schema.</p>
        <principle>
          <p>Systems that use NIEM-conformant data SHOULD mark as invalid data that does not conform to the rules
          defined by applicable XML Schema documents.</p>
        </principle>
      </section>
      <section>
        <title>Allow multiple schemas for XML constraints</title>
        <p>NIEM does not attempt to create a one-size-fits-all schema to perform all validation. Instead, it
          creates a set of reference schemas, on which additional constraints may be placed. Although NIEM is
          principally expressed as a set of reference schemas for a NIEM release, additional validation may be
          conducted through other mechanisms, which may include XML Schemas that express additional constraints,
          and business rules and structure-specifying languages other than the <termRef>XML Schema definition
          language</termRef>.</p>
        <principle>
          <p>Constraints on XML instances MAY be validated by multiple validation passes, using multiple schemas and specifications for different aspects of each namespace.</p>
        </principle>
      </section>
      <section>
        <title>Define one reference schema per namespace</title>
        <p>NIEM uses the concept of a <em>reference schema</em>, which defines the structure and content of a namespace. For each NIEM-conformant namespace, there is exactly one NIEM reference schema. A user may use a subset schema or constraint schema in place of a reference schema, but all NIEM-conformant XML documents must validate against a single reference schema for each namespace.</p>
        <principle id="principle-one-ref-schema-per-namespace">
          <p>Each NIEM-conformant namespace SHOULD be defined by exactly one reference schema.</p>
        </principle>
      </section>
      <section>
        <title>Disallow mixed content</title>
        <p>XML data that use mixed content are difficult to specify and complicate the task of data processing. Much of the payload carried by mixed content is unchecked and does not facilitate data standardization or validation.</p>
        <principle id="principle-no-mixed-content">
          <p>NIEM-conformant schemas SHOULD NOT specify data that uses mixed content.</p>
        </principle>
      </section>
      <section>
        <title>Specify types for all constructs</title>
        <p>Every schema component defined by a NIEM-conformant schema that can have a name has a name. This means
          that there are no anonymous types, elements, or other components defined by NIEM. Once an application
          has determined the name (i.e., namespace and local name) of an attribute or element used in
          NIEM-conformant instances, it will also know the type of that attribute or element.</p>
        <p>There are no local attributes or elements defined by NIEM, only global attributes and elements. This maximizes the ability of application developers to extend, restrict, or otherwise derive definitions of local components from NIEM-conformant components. Using named global components in schemas maximizes the capacity for reuse.</p>
        <principle>
          <p>NIEM-conformant schemas SHOULD NOT use or define local or anonymous components, as they adversely affect reuse.</p>
        </principle>
      </section>
      <section>
        <title>Avoid wildcards in reference schemas</title>
        <p>Wildcards in NIEM-conformant schemas work in opposition to standardization. The goal of creating
          harmonized, standard schemas is to standardize definitions of data. The use of wildcard mechanisms
          (such as <qName>xs:any</qName>, which allows insertion of arbitrary elements) allows unstandardized
          data to be passed via otherwise standardized exchanges.</p>
        <p>Avoidance of wildcards in the standard schemas encourages the separation of standardized and unstandardized data. It encourages users to incorporate their data into NIEM in a standardized way. It also encourages users to extend in a way that may be readily incorporated into NIEM.</p>
        <principle id="principle-avoid-wildcards">
          <p>NIEM-conformant components SHOULD NOT incorporate wildcards unless absolutely necessary, as they hinder standardization by encouraging use of unstandardized data rather than standardized data.</p>
        </principle>
      </section>
      <section id="section-principle-schema-locations-are-hints">
        <title>Schema locations provided in schema documents are hints</title>
        <p><ref idref="XMLSchema-1"/> provides several mechanisms for acquiring components of an <termRef>XML Schema</termRef>
        for the purpose of assessing validity of an instance.
          MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#schema_reference,4.3.2,How schema definitions are located on the Web) includes:</p>
        <ul>
          <li><p>Use schema definitions already known to the processor.</p></li>
          <li><p>Use a location URI or namespace name to identify a schema document from a network location or
          local schema repository.</p></li>
          <li><p>Attempt to resolve a location URI or namespace name to locate a schema document.</p></li>
        </ul>
        <p>In addition, there are several ways for a processor to determine schema locations:</p>
        <ul>
          <li><p>Use schema locations identified by user direction.</p></li>
          <li><p>Use locations provided via <qName>xsi:schemaLocation</qName> or <qName>xsi:noNamespaceSchemaLocation</qName> attributes in an <termRef>XML document</termRef> under assessment.</p></li>
          <li><p>Use schema locations provided by <qName>xs:import</qName> elements.</p></li>
        </ul>

        <p><ref idref="XMLSchema-1"/> characterizes several of these methods as <em>hints</em> of where to acquire a schema document for assessment.
          MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#xsi_schemaLocation,2.6.3,[[[xsi:schemaLocation, xsi:noNamespaceSchemaLocation]]]) states:</p>
        <blockquote>
          <p>The <code>xsi:schemaLocation</code> and <code>xsi:noNamespaceSchemaLocation</code> attributes can be used in a document to provide hints as to the physical location of schema documents which may be used for assessment.</p>
        </blockquote>
        <p>MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#composition-schemaImport,4.2.3,References to schema components across namespaces) states:</p>
        <blockquote>
          <p>The actual value of the <code>schemaLocation</code>, if present, gives a hint as to where a serialization of a schema document with declarations and definitions for that namespace (or none) may be found.</p>
        </blockquote>
        <p>The specification explicitly maintains that schema location provided in schemas or instances may be
          overridden by applications or by user direction.</p>
        <principle>
          <p>Schema locations specified within NIEM-conformant reference schemas SHOULD be interpreted as hints and as default values by processing applications.</p>
        </principle>
        <p>In accordance with <ref idref="section-scope"/>, this document does not provide normative guidance for
          location of <termRef term="schema document">schema documents</termRef> or for schema assembly.</p>
      </section>
      <section>
        <title>Use open standards</title>
        <p>The cooperative efforts of many knowledgeable individuals have resulted in many important published information standards. Where appropriate and applicable, NIEM ought to leverage these standards.</p>
        <principle>
          <p>NIEM standards and schemas SHOULD leverage and enable use of other open standards.</p>
        </principle>
      </section>
    </section>
    <section>
      <title>Modeling design guidelines</title>
      <p>The principles in this section address the design philosophy used in designing the NIEM conceptual model.</p>
      <section>
        <title>Namespaces enhance reuse</title>
        <p>NIEM is designed to maximize reuse of namespaces and the schemas that define them. When referring to a
          concept defined by a NIEM-conformant schema, a user should ensure that instances and schemas refer to
          the namespace defined by NIEM. User-defined namespaces should be used for specializations and extension
          of NIEM constructs but should not be used when the NIEM structures are sufficient.</p>
        <principle>
          <p>NIEM-conformant instances and schemas SHOULD reuse components from NIEM distribution schemas when possible.</p>
        </principle>

        <p>NIEM relies heavily on XML namespaces to prevent naming conflicts and clashes. Reuse of any component
          is always by reference to both its namespace and its local name. All NIEM component names have global
          scope. An instance document or schema should use or reuse a NIEM component by referencing its
          NIEM-defined namespace and local name. An application that validates an instance document that contains
          a component in a NIEM namespace should conduct that validation using NIEM reference schema documents or
          profiles of NIEM reference schema documents, to ensure consistency across exchanges and
          implementations.</p>

        <p>Example:</p>
        <figure><title>Example of the use of a namespace</title>
          <pre><![CDATA[<xs:element ref="nc:BinaryCaptureDate" minOccurs="0" maxOccurs="unbounded"/>]]></pre>
        </figure>
        <p>In this example, <qName>nc:BinaryCaptureDate</qName> is reused by referencing its element declaration through both its namespace (which is bound to the prefix <code>nc:</code>) and its local name (<code>BinaryCaptureDate</code>). If an element named <code>BinaryCaptureDate</code> is declared in another namespace, it is an entirely different element than <qName>nc:BinaryCaptureDate</qName>. There is no implicit relationship to <qName>nc:BinaryCaptureDate</qName>.</p>
        <p>From a business perspective, the two elements are likely to be <em>related</em> in the sense that they may have very similar semantic meanings. They may have essentially the same meaning, but slightly different properties. Such a relationship may commonly exist. However, any relationship between the two elements must be made explicit using methods outlined in this document.</p>
        <principle>
          <p>A component SHOULD be identified by its local name together with its namespace. A namespace SHOULD be a required part of the name of a component. A component<char name="rsquo"/>s local name SHOULD NOT imply a relationship to components with similar names from other namespaces.</p>
        </principle>
      </section>
      <section><title>Design NIEM for extensibility</title>
        <p>NIEM is designed to be extended. Numerous methods are considered acceptable in creating extended and specialized components.</p>
        <principle id="principle-extensible">
          <p>NIEM-conformant schemas and standards SHOULD be designed to encourage and ease extension and augmentation by users and developers outside the NIEM governance process.</p>
        </principle>
      </section>
    </section>
    <section>
      <title>Implementation guidelines</title>
      <p>The principles in this section address issues pertaining to the implementation of applications that use NIEM.</p>
      <section>
        <title>Avoid displaying raw XML data</title>
        <p>XML data should be made human-understandable when possible, but it is not targeted at human
          consumers. HTML is intended for browsers. Browsers and similar technology provide human interfaces to
          XML and other structured content. Structured XML content does not belong in places targeting
          humans. Human-targeted information should be of a form suitable for presentation.</p>
        <principle>
          <p>XML data SHOULD be designed for automatic processing. XML data SHOULD NOT be designed for literal
            presentation to people. NIEM specifications and schemas SHOULD NOT use literal presentation of XML data to people
            as a design criterion.</p>
        </principle>
      </section>
      <section>
        <title>Leave implementation decisions to implementers</title>
        <p>NIEM is intended to be an open specification supported by many diverse implementations. It was designed from data requirements and not from or for any particular system or implementation. Use of NIEM should not depend on specific software, other than XML Schema-validating parsers.</p>
        <principle>
          <p>NIEM SHOULD NOT depend on specific software packages, software frameworks, or software systems for interpretation of XML instances.</p>
        </principle>
        <principle>
          <p>NIEM schemas and standards SHOULD be designed such that software systems that use NIEM may be built with a variety of off-the-shelf and free software products.</p>
        </principle>
      </section>
    </section>
    <section>
      <title>Modeling guidelines</title>
      <p>The NIEM Naming and Design Rules (NDR) specify NIEM-conformant components, schemas, and instances. These guidelines influence and shape the more-specific principles and rules in this document. They are derived from best practices and from discussions within the NIEM Business Architecture Committee (NBAC) and the NIEM Technical Architecture Committee (NTAC). This list may grow and evolve as NIEM matures.</p>
      <p>The principles in this section address decisions that data modelers must face when creating NIEM-conformant schema representations of domain data. These guidelines are not absolute (the key word is SHOULD). It may not be possible to apply all guidelines in every case. However, they should always be considered.</p>
      <section>
        <title>Documentation</title>
        <p>As will be described in later sections of this document, all NIEM components are documented through
        their definitions and names. Although it is often very difficult to apply, a schema
        component<char name="rsquo"/>s <termRef>data definition</termRef> should be drafted before the data
        component name is finalized.</p>
        <p>Drafting the definition for a data component first ensures that the author understands the exact nature of the entity or concept that the data component represents. The component name should subsequently be composed to summarize the definition. Reversing this sequence often results in <termRef term="data definition">data definitions</termRef> that very precisely describe the component name but do not adequately describe the entity or concept that the component is designed to represent. This can lead to the ambiguous use of such components.</p>
        <principle>
          <p>The <termRef>data definition</termRef> of a component SHOULD be drafted before the
          component<char name="rsquo"/>s name is composed.</p>
        </principle>
      </section>
      <section>
        <title>Consistent naming</title>
        <p>Components in NIEM should be given names that are consistent with names of other NIEM components. Having consistent names for components has several advantages:</p>
        <ol>
          <li>
            <p>It is easier to determine the nature of a component when it has a name that conveys the meaning and use of the component.</p>
          </li>
          <li>
            <p>It is easier to find a component when it is named predictably.</p>
          </li>
          <li>
            <p>It is easier to create a name for a component when clear guidelines exist.</p>
          </li>
        </ol>
        <principle>
          <p>Components in NIEM SHOULD be given names that are consistent with names of other NIEM components. Such names SHOULD be based on simple rules.</p>
        </principle>
      </section>
      <section>
        <title>Reflect the real world</title>
        <p>NIEM provides a standard for data exchange. To help facilitate unambiguous understanding of NIEM reusable components, the names and structures should represent and model the informational aspects of objects and concepts that users are most familiar with. Types should not simply model collections of data.</p>
        <principle>
          <p>Component definitions in NIEM-conformant schemas SHOULD reflect real-world concepts.</p>
        </principle>

        <p>Different users often have their own local practices for arranging components together, such as
          grouping components into sets and segments, or building in extra layers to help categorize components
          and make them easier to find when drilling down through an object. Since the broader community may not
          share the same practices, and grouping structures add additional complexity to both schemas and
          instances, NIEM components should model the real world as simply and closely as possible.</p>
        
      </section>
      <section>
        <title>Be consistent</title>
        <p>There should be no conflicts of meaning among types. This holds for types within a namespace, as well as types in different namespaces. A type should be used consistently in similar situations for similar purposes. Types should be defined for clear understanding and ease of intended use.</p>
        <principle>
          <p>Component definitions in NIEM-conformant schemas SHOULD have semantic consistency.</p>
        </principle>
      </section>
      <section>
        <title>Reserve inheritance for specialization</title>
        <p>Specialization should not be applied simply for the sake of achieving property inheritance. Specialization should be applied only where it is meaningful and appropriate to model permanent sibling subclasses of a base class that are mutually exclusive of one another.</p>
        <principle>
          <p>Complex type definitions in NIEM-conformant schemas SHOULD use type inheritance only for specialization.</p>
        </principle>
        <p>Note that the use of <termRef term="augmentation">augmentations</termRef> allows developers to avoid
          type specialization in many cases; see <ref idref="section-augmentations"/>.</p>
      </section>
      <section>
        <title>Do not duplicate definitions</title>
        <p>A real-world entity should be modeled in only one way. The definition of a type or element should appear once and only once. Multiple components of identical or closely similar semantics hinder interoperability because too many valid methods exist for representing the same data. For each data concept that must be represented, there should be only one component (and associated type) to represent it.</p>

        <p>Components with very similar semantics may exist in different contexts. For example, a complex type
          created for a particular exchange may appear to have identical or closely similar semantics to a
          complex type defined in the NIEM Core schema. However, the type defined at the exchange level will have
          much more precise business requirements and syntax, compared with the broad definitions that are
          heavily reused. Specific contextual definitions should be considered semantic changes.</p>

        <p>Two components may have the same definition while having different representations. For example, a string may hold the complete name of a person, or the name may be represented by a structure that separates the components of the name into first, last, etc. The definition of alternative representations should not be considered duplication.</p>
        <principle>
          <p>Multiple components with identical or undifferentiated semantics SHOULD NOT be defined. Component definitions SHOULD have clear, explicit distinctions.</p>
        </principle>
      </section>
      <section>
        <title>Keep it simple</title>
        <p>All NIEM content and structure is fundamentally based on business requirements for information exchange. To encourage adoption and use in practice, NIEM must implement business requirements in simple, consistent, practical ways.</p>
        <principle>
          <p>NIEM-conformant schemas SHOULD have the simplest possible structure, content, and architecture consistent with real business requirements.</p>
        </principle>
      </section>
      <section>
        <title>Be aware of scope</title>
        <p>The scope of components defined in NIEM-conformant schemas should be carefully considered. Some components represent simple data values, while others represent complex objects with many parts and relationships. Components should exist in layers. Components should exist as small, narrowly scoped, atomic entities that are used to consistently construct more broadly scoped, complex components (and so on).</p>
        <principle>
          <p>Components defined by NIEM-conformant schemas SHOULD be defined appropriate for their scope.</p>
        </principle>
      </section>
      <section>
        <title>Be mindful of namespace cohesion</title>
        <p>Namespaces should maximize cohesion. The namespace methodology helps prevent name clashes among communities or domains that have different business perspectives and may choose identical data names to represent different data concepts. A namespace should be designed so that its components are consistent, may be used together, and may be updated at the same time.</p>
        <principle>
          <p>XML namespaces defined by NIEM-conformant schemas SHOULD encapsulate data components that are coherent, consistent, and internally related as a set. A namespace SHOULD encapsulate components that tend to change together.</p>
        </principle>
      </section>
    </section>
  </section>
  <section>
    <title>Conformance to standards</title>

    <p>There are numerous XML standards to which the instance and schema documents that constitute information
    exchanges must conform. This section applies XML specifications to the conformance targets of this
    document.</p>

    <section>
      <title>Conformance to XML</title>

      <p>The XML specification <ref idref="XML"/> defines the term <termRef>XML document</termRef>. NIEM XML
        documents, including instance documents and schema documents, must conform to the definition of this
        term.</p>

      <ruleSection><title>Document is an XML document</title>

      <rule applicability="REF EXT INS" id="well-formed-xml" class="Constraint">
        <p>The document MUST be an XML document.</p>
      </rule>

      <p>This document establishes the term <termRef>XML document</termRef>, by reference to
        <ref idref="XML"/>.</p>

      </ruleSection>
    </section>
    <section>
      <title>Conformance to XML Namespaces</title>

      <p>The XML namespaces specification and errata define correct use of XML namespaces; NIEM-conformant XML
        artifacts (instance documents and schema documents) must use namespaces properly.</p>

      <ruleSection><title>Document uses XML namespaces properly</title>

      <rule applicability="REF EXT INS" id="ns-valid" class="Constraint">
        <p>The document MUST be namespace-well-formed and namespace-valid.</p>
      </rule>

      <p>The terms <em>namespace-well-formed</em> and <em>namespace-valid</em> are normatively defined by
        <ref idref="XMLNamespaces"/> and <ref idref="XMLNamespacesErrata"/>.</p>
      </ruleSection>

    </section>

    <section>
      <title>Conformance to XML Schema</title>

      <p>The XML Schema specification part 1 <ref idref="XMLSchema-1"/> defines the syntax of the
        <termRef>XML Schema definition language</termRef>, and identifies an <termRef>XML document</termRef> that
        follows that syntax as a <termRef>schema document</termRef>. This section requires that NIEM reference
        and extension schema documents be <termRef term="schema document">schema documents</termRef>.</p>

      <ruleSection>
        <title>Document is a schema document</title>
        <rule applicability="REF EXT" id="is-schema-doc" class="Constraint">
          <p>The [XML document] MUST be a [schema document].</p>
        </rule>
        <p>This document establishes the term <termRef>schema document</termRef>, by reference to
          <ref idref="XMLSchema-1"/>.</p>

      </ruleSection>

      <ruleSection><title>Document element is <qName>xs:schema</qName></title>
        <rule applicability="REF EXT" id="rule-doc-element-is-xs-schema" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xb-rule-doc-element-is-xs-schema">
<sch:pattern>
  <sch:rule context="*[. is nf:get-document-element(.)]">
    <sch:assert test="self::xs:schema"
      >The [document element] of the [XML document] MUST have the name xs:schema.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
        <p>This document establishes the terms <termRef>document element</termRef> by reference to
          <ref idref="XMLInfoset"/>, and <termRef>XML document</termRef> by reference to <ref idref="XML"/>.</p>
      </ruleSection>

    </section>

    <section><title>ISO 11179 Part 4</title>

      <p>Good data definitions are fundamental to data interoperability. You
        cannot effectively exchange what you cannot understand. NIEM employs the
        guidance of <ref idref="ISO11179-4"/> as a baseline for its data
        component definitions.</p>

      <p>To advance the goal of creating semantically rich NIEM-conformant
        schemas, it is necessary that data definitions be descriptive,
        meaningful, and precise. <ref idref="ISO11179-4"/> provides standard
        structure and rules for defining data definitions. NIEM uses this
        standard for component definitions.</p>

      <p>Note that the metadata maintained for each NIEM component contains
        additional details, including domain-specific usage examples and
        keywords. Such metadata is used to enhance search and discovery of
        components in a registry, and therefore, is not included in schemas.</p>

      <p>For convenience and reference, the summary requirements and
      recommendations in <ref idref="ISO11179-4"/> are reproduced here:</p>

      <blockquote>
        <p><strong>ISO 11179 Requirements</strong></p>
        <p>A data definition SHALL:</p>
        <ul>
          <li><p>Be stated in the singular.</p></li>
          <li><p>State what the concept is, not only what it is not.</p></li>
          <li><p>Be stated as a descriptive phrase or sentence(s).</p></li>
          <li><p>Contain only commonly understood abbreviations.</p></li>
          <li><p>Be expressed without embedding definitions of other data or underlying concepts.</p></li>
        </ul>
        <p><strong>ISO 11179 Recommendations</strong></p>
        <p>A data definition SHOULD:</p>
        <ul>
          <li><p>State the essential meaning of the concept.</p></li>
          <li><p>Be precise and unambiguous.</p></li>
          <li><p>Be concise.</p></li>
          <li><p>Be able to stand alone.</p></li>
          <li><p>Be expressed without embedding rationale, functional usage, or procedural information.</p></li>
          <li><p>Avoid circular reasoning.</p></li>
          <li><p>Use the same terminology and consistent logical structure for related definitions.</p></li>
          <li><p>Be appropriate for the type of metadata item being defined.</p></li>
        </ul>
      </blockquote>

      <p>In addition to the requirements and recommendations of <ref idref="ISO11179-4"/>, NIEM applies
        additional rules to data definitions. These rules are detailed in <ref idref="SectionHumanReadableDocumentation"/>.</p>

      <p>These definitions leverage the term <q>definition</q> as defined by <ref idref="ISO11179-4"/>:</p>

      <blockquote>
        <p>representation of a concept by a descriptive statement which serves to differentiate it from related
        concepts</p>
      </blockquote>

      <definition term="data definition">

        <p>The <strong>data definition</strong> of a <termRef>schema component</termRef> is the content of the
          first occurrence of the element <qName>xs:documentation</qName> that is an immediate child of an
          occurrence of an element <qName>xs:annotation</qName> that is an immediate child of the element that
          defines the component.</p>

      </definition>

      <definition term="documented component">
        <p>In a NIEM-conformant schema, a <strong>documented component</strong> is <termRef>schema component</termRef> that has an associated <termRef>data definition</termRef>. Each documented
          component has a textual definition, so that the component may be well-understood.</p>
      </definition>

      <p>An example of a data definition is provided in <ref idref="figure-example-data-definition"/>.</p>

      <figure id="figure-example-data-definition">
        <title>Example of data definition of element <qName>nc:Activity</qName></title>
        <pre><xmlBlurb id="fig-example-data-definition-activity">
<xs:element name="Activity" type="nc:ActivityType" nillable="true">
  <xs:annotation>
    <xs:documentation>A single or set of related actions, events, or process steps.</xs:documentation>
  </xs:annotation>
</xs:element>
        </xmlBlurb></pre>
      </figure>

      <p>See <ref idref="def-11179-4-req"/> and <ref idref="def-11179-4-rec"/> for application of
        <ref idref="ISO11179-4"/> to constrain NIEM <termRef term="data definition">data
        definitions</termRef>.</p>

    </section>

    <section>
      <title>ISO 11179 Part 5</title>

      <p>Names are a simple but incomplete means of providing semantics to data components. Data definitions,
        structure, and context help to fill the gap left by the limitations of naming. The goals for data
        component names should be syntactic consistency, semantic precision, and simplicity. In many cases, these
        goals conflict and it is sometimes necessary to compromise or to allow exceptions to ensure clarity and
        understanding. To the extent possible, NIEM applies <ref idref="ISO11179-5"/> to construct NIEM data
        component names.</p>

      <p>The set of NIEM data components is a collection of data representations for real-world objects and
      concepts, along with their associated properties and relationships. Thus, names for these components would
      consist of the terms (words) for object classes or that describe object classes, their characteristic
      properties, subparts, and relationships.</p>

      <ruleSection><title>Component name follows ISO 11179 Part 5 Annex A</title>

        <rule applicability="REF EXT" class="Constraint">
          <p>A NIEM component name SHOULD be formed by applying the informative guidelines and examples detailed
            in Annex A of <ref idref="ISO11179-5"/>, with exceptions as specified in this document.</p>
        </rule>

        <p>The guidelines and examples of <ref idref="ISO11179-5"/> provide a simple, consistent syntax for data
          names that captures context and thereby imparts a reasonable degree of semantic precision.</p>

        <p>NIEM uses the guidelines and examples of <ref idref="ISO11179-5"/> as a baseline for normative naming
          rules. However, some NIEM components require bending of these rules. Special naming rules for these
          classes of components are presented and discussed in the relevant sections. In spite of these
          exceptions, most NIEM component names can be disassembled into their <ref idref="ISO11179-5"/>
          constituent words or terms.</p>

      </ruleSection>

      <p>Example:</p>

      <p>The NIEM component name <code>AircraftFuselageColorCode</code> disassembles as follows:</p>

      <ul>
        <li><p>Object class term = <q><code>Aircraft</code></q></p></li>
        <li><p>Qualifier term = <q><code>Fuselage</code></q></p></li>
        <li><p>Property term = <q><code>Color</code></q></p></li>
        <li><p>Representation term = <q><code>Code</code></q></p></li>
      </ul>

      <p><ref idref="SectionNamingRules"/> details the specific rules for each kind of term and how to construct NIEM
        component names from it.</p>

    </section>
    <section id="section-ism-ntk">
      <title>IC-ISM and IC-NTK</title>

      <p>The Office of the Director of National Intelligence manages and maintains a set of specifications that
        support the requirements of the Intelligence Community (IC) to share and manage data across the IC
        enterprise. These specifications are available at <link>http://purl.org/ic/standards/public</link>. The
        design of NIEM supports the use of NIEM-conformant data across the IC.</p>

      <p>The following features have been provided to support the use of NIEM-conformant data definitions across
        the IC, by supporting the use of IC-ISM and IC-NTK within NIEM-defined data:</p>
      <ul>
        <li><p>NIEM base types defined by the <termRef>structures namespace</termRef>
            incorporate <qName>xs:anyAttribute</qName> declarations, which allow the use of attributes from the
            ISM and NTK namespaces. See <ref idref="section-include-structures-xsd"/> for the reference
            schema.</p></li>
        <li><p><ref idref="rule-known-att-grp-refs"/> allows conformant data types to reference attribute groups
            defined in the ISM and NTK namespaces.</p></li>
        <li><p>Complex types may be constructed that use external attributes, including attributes from the ISM
            and NTK namespaces. Each such attribute use must be a <termRef>documented component</termRef>, as
            specified by <ref idref="ext-attr-use-has-dd"/>.</p></li>
      </ul>

      <p>These features ensure that payloads that correctly use IC-ISM AND IC-NTK are supported by
        NIEM-conformant schema definitions.</p>

    </section>

  </section>

  <section>
    <title>Strategy for a NIEM profile of XML Schema</title>

    <section><title>Wildcards</title>

        <p>There are many constructs within XML Schema that act as
          wildcards. That is, they introduce buckets that may carry arbitrary or
          otherwise not-validated content. Such constructs violate <ref idref="principle-avoid-wildcards"/>, and as such provide implicit
          workarounds for the difficult task of agreeing on the content of data
          models. Such workarounds should be made explicitly, outside the core
          data model.</p>

        <p>The following restrictions help to ban wildcards and arbitrary data:</p>

        <ul>
          <li><p>Use of the type <qName>xs:anyType</qName> is prohibited.</p></li>
          <li><p>Use of the type <qName>xs:anySimpleType</qName> is prohibited in most cases.</p></li>
          <li><p>Use of the element <qName>xs:any</qName> is prohibited in reference schemas.</p></li>
          <li><p>Use of the element <qName>xs:anyAttribute</qName> is prohibited in reference schemas.</p></li>
        </ul>

      </section>

      <section>
        <title>Components are globally reusable</title>

        <p>Each component defined by a NIEM-conformant schema may be reused from outside the schema
          document. Every type definition, element declaration, or attribute declaration schema component that is
          defined by a NIEM-conformant schema is given an explicit name. These schema components are not defined
          as local or anonymous. These components are defined at the top level, as children of
          element <qName>xs:schema</qName>.</p>

        <p>This is supported by the rules:</p>
        <ul>
          <li><p><ref idref="st-top-level"/></p></li>
          <li><p><ref idref="ct-top-level"/></p></li>
          <li><p><ref idref="el-top-level"/></p></li>
          <li><p><ref idref="att-top-level"/></p></li>
        </ul>

        <p>Additional restrictions ensure that NIEM components are also defined such that new components may be
          derived from them and substituted for them. Reference schemas are defined to maximize reuse, while
          extension schemas are defined to enable a developer to customize schema definitions to match her
          exchange needs. In reference schemas, the following restrictions help enforce reusability through
          extension and substitution:</p>

        <ul>
          <li>
            <p>A <termRef>reference schema document</termRef> or <termRef>extension schema document</termRef> may
              not use <local-name>blockDefault</local-name> (per <ref idref="no-blockdefault"/>)
              or <local-name>finalDefault</local-name> (per <ref idref="no-finalDefault"/>).</p>
          </li>
          <li>
            <p>Element declarations and type definitions in a <termRef>reference schema document</termRef> may not
              use <local-name>block</local-name> or <local-name>final</local-name>, per the rules:</p>
            <ul>
              <li><p><ref idref="no-ct-block"/></p></li>
              <li><p><ref idref="no-ct-final"/></p></li>
              <li><p><ref idref="no-el-block"/></p></li>
              <li><p><ref idref="no-el-final"/></p></li>
            </ul>
          </li>
        </ul>
      </section>

      <section>
        <title>Avoid recursive model groups</title>

        <p>XML Schema provides the capability for model groups to be recursively defined. This means that a
          sequence may contain a sequence, and a choice may contain a choice. The rules in this document restrict
          the use of nested model groups, in order to keep content models simple, comprehensive, and
          reusable: The content of an element should boil down to a simple list of elements, defined in as
          straightforward a manner as is possible to meet requirements.</p>

      </section>

      <section id="sec-no-infoset-mods">

        <title>Ensure XML parsing does not construct values</title>

        <p>An XML document expresses an infoset (see <ref idref="XMLInfoset"/>); the infoset is the data carried
          by the XML document, and is expressed as a set of information items (e.g., element information items,
          attribute information items, etc.).
          MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#d0e504,2.1,Overview of XML Schema) describes the
          process followed by an XML Schema validating parser. Beyond the actions of a plain XML parser, which
          provides the data from an XML document to its caller in a structured way, an XML Schema validating
          parser does the following:</p>

        <blockquote>
          <ol>
            <li><p>Determining local schema-validity, that is whether an element or attribute information item
                satisfies the constraints embodied in the relevant components of an XML Schema;</p></li>
            <li><p>Synthesizing an overall validation outcome for the item, combining local schema-validity with
                the results of schema-validity assessments of its descendants, if any, and adding appropriate
                augmentations to the infoset to record this outcome.</p></li>
          </ol>
        </blockquote>

        <p>In short, not only does an XML Schema validating parser yield data from an XML document to its caller,
          it determines whether the XML document is valid against an XML Schema, and also provides
          an <strong>augmented infoset</strong> to the caller, constructed to reflect information implied by the
          schema, which may not appear in the original XML document.</p>

        <p>XML Schema allows element and attribute declarations to provide default values. When an XML
          document does not contain a value for a component that has a default, the XML Schema validating parser
          will <em>construct</em> a value for the component. This is done through the use of the
          attributes <local-name>default</local-name> and <local-name>fixed</local-name>, both of which provide
          default values to attributes and element content. An XML Schema validating parser that validates an XML
          document against a schema that uses <local-name>default</local-name> or <local-name>fixed</local-name>
          may yield an infoset that is augmented, constructing values in the provided XML infoset where none
          existed in the original XML document.</p>

        <p>NIEM schemas should not produce constructed values in the infoset. The process of XML
          Schema validation against NIEM schemas should provide for marking data as valid or invalid, but should
          not modify original infoset data with constructed values. The XML infoset yielded by a non-validating
          XML parser should be the same as that yielded by an XML Schema validating parser. Turning on schema
          validation should not alter the data received by the caller of the parser.</p>

         <p>The prohibition of constructed values is supported by
           <ref idref="section-principle-no-infoset-mods"/>.  It is also supported through a
           prohibition on all uses of <local-name>default</local-name>, and most uses
           of <local-name>fixed</local-name> on attributes and elements defined by NIEM-conformant schema
           documents.</p>

      </section>
      <section><title>Use namespaces rigorously</title>

        <p>Every component defined by or used in a NIEM schema has a target namespace.</p>

        <p>XML Schema requires that namespaces used in external references be
          imported using the <qName>xs:import</qName>
          element. The <qName>xs:import</qName> element appears as an immediate
          child of the <qName>xs:schema</qName> element. A schema must import any
          namespace which is not the local namespace, and which is referenced from the
          schema.</p>

        <p>The behavior of import statements is not necessarily intuitive. In
          short, the import introduces a namespace into the schema document in which the
          import appears; it has no transitive effect. If the namespace introduced by an
          import statement are not referenced from that schema document, then the import
          statement has no effect. </p>

        <p>Certain tools have been seen introducing transitive behavior on
          imports, which is not portable across XML Schema validating
          parsers. If namespace 1 imports namespace 2 which imports namespace 3,
          a reference from namespace 1 to namespace 3 is not legal; namespace 1
          must explicitly import namespace 3. A tool that imports transitively
          may allow schema 1 to reference 3 without a direct import of namespace
          3. This is prohibited by rules which require imports of namespaces of
          referenced components.</p>

      </section>
      <section>
        <title>Documentation is for people; appinfo is for machines</title>

        <p>The XML Schema specification defines two types of annotations: <em>user information</em>
          and <em>application information</em>. It defines that user information is for human consumption, while
          application information is for automatic processing. </p>

        <p>MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#cAnnotations,3.13,Annotations) states:</p>

        <blockquote>
          <p>Annotations provide for human- and machine-targeted annotations of schema components.</p>
        </blockquote>

        <p>MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#Annotation_details,3.13.1,The Annotation Schema Component) states:</p>

        <blockquote>
          <p>{user information} is intended for human consumption, {application information} for automatic
            processing.</p>
        </blockquote>

        <p>The two types: human-targeted and machine-targeted, are kept separate by the use of two separate
          container elements defined by XML Schema: <qName>xs:documentation</qName>
          and <qName>xs:appinfo</qName>.</p>

        <p><qName>xs:documentation</qName> elements express <q>user information</q>. This information is targeted
          for reading by humans. The XML Schema specification does not say what form human-targeted information
          should take. Since it is intended for human consumption, <qName>xs:documentation</qName> elements in
          conformant schemas do not contain structured XML data. As such, any XML content appearing within a
          documentation element should be human-targeted examples, and should be escaped (e.g.,
          using <code>&amp;lt;</code> and <code>&amp;gt;</code>, or using CDATA blocks). Documentation within
          conformant schemas should be plain text; whitespace formatting may not be preserved across
          processing.</p>

        <p><qName>xs:appinfo</qName> elements express <q>application information</q>. This is generally
          information supporting automatic processing of schemas. Application information is addressed in
          <ref idref="section-machine-readable-annotations"/>.</p>

        <p><xe>XML comment</xe>s are not XML Schema constructs and are not specifically associated with any
          schema-based component; they are not considered semantically meaningful by NIEM and may not be retained
          through processing of NIEM schemas.</p>

      </section>
    </section>

  <section id="section-profile-of-xml-schema">
    <title>Rules for a NIEM profile of XML Schema</title>

    <p>NIEM-conformant schemas use a profile of XML Schema.
      The W3C XML Schema Language provides many features that allow a developer
      to represent a data model many different ways. A number of XML Schema
      constructs are not used within NIEM-conformant schemas. Many of these
      constructs provide capability that is not currently needed within
      NIEM. Some of these constructs create problems for interoperability, with
      tool support, or with clarity or precision of data model definition.</p>

    <p>This section establishes a profile of XML Schema for NIEM-conformant
      schemas. Because the XML Schema specifications are flexible, comprehensive
      rules are needed to achieve a balance between establishing uniform schema
      design and providing developers flexibility to solve novel data modeling
      problems.</p>

    <p>Note that external schema documents (i.e., non-NIEM-conformant schema documents) do not
      need to obey the rules set forth in this section. So long as schema
      components from external schema documents are adapted for use with NIEM according
      to the modeling rules in <ref idref="section-external-adapter-types"/>, they may be used as they appear in the
      external standard, even if the schema components themselves violate the rules for
      NIEM-conformant schemas.</p>

    <p>The following sections are broken down in the order provided by
      MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#concepts-data-model,2.2,XML Schema Abstract Data Model),
      followed by a section on a schema document as a whole and a section on schema namespaces and assembly:</p>

    <listOfSections/>

    <section><title>Type definition components</title>

      <section><title>Type definition hierarchy</title>

        <section><title>Types prohibited as base types</title>

          <ruleSection><title>No base type in the XML namespace</title>
            <p>Although the XML namespace is to be imported as if it is conformant, types from that namespace may
            not be the <termRef>base type definition</termRef> of any type.</p>

            <rule applicability="REF EXT" id="rule-base-type-not-xml-ns" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-rule-base-type-not-xml-ns">
<sch:pattern>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="namespace-uri-from-QName(resolve-QName(@base, .)) != xs:anyURI('MACRO_NS_XML')"
                >A schema component must not have a base type definition with a {target namespace} that is the XML namespace.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
            <p>The term <termRef>base type definition</termRef> has a normative definition.</p>
          </ruleSection>

          <ruleSection><title>No base type of <qName>xs:ID</qName></title>
            <rule applicability="REF EXT" id="no-base-xs-id" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-base-xs-id">
<sch:pattern>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:ID')"
      >A schema component MUST NOT have an attribute {}base with a value of xs:ID.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No base type of <qName>xs:IDREF</qName></title>

            <rule applicability="REF EXT" id="no-base-xs-idref" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-base-xs-idref">
<sch:pattern>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:IDREF')"
      >A schema component MUST NOT have an attribute {}base with a value of xs:IDREF.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No base type of <qName>xs:IDREFS</qName></title>

            <rule applicability="REF EXT" id="no-base-xs-idrefs" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-base-xs-idrefs">
<sch:pattern>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:IDREFS')"
      >A schema component MUST NOT have an attribute {}base with a value of xs:IDREFS.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No base type of <qName>xs:anyType</qName></title>

            <rule applicability="REF EXT" id="no-base-xs-anyType" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-base-xs-anyType">
<sch:pattern>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:anyType')"
      >A schema component MUST NOT have an attribute {}base with a value of xs:anyType.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>

            <p>XML Schema has the concept of the <q>ur-type,</q> a type that is
              the root of all other types. This type is realized in schemas
              as <qName>xs:anyType</qName>.</p>

            <p>NIEM-conformant schemas must not use <qName>xs:anyType</qName>,
              because this feature permits the introduction of arbitrary content
              (i.e., untyped and unconstrained data) into an XML instance. NIEM
              intends that the schemas describing that instance describe all
              constructs within the instance.</p>

          </ruleSection>

          <ruleSection>
            <title>No base type of <qName>xs:anySimpleType</qName></title>

            <rule applicability="REF EXT" id="no-base-xs-anySimpleType" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-base-xs-anySimpleType">
<sch:pattern>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:anySimpleType')"
      >A schema component MUST NOT have an attribute {}base with a value of xs:anySimpleType.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>

            <p>XML Schema provides a restriction of the <q>ur-type</q> that
              contains only simple content. This provides a wildcard for
              arbitrary text. It is realized in XML Schema
              as <qName>xs:anySimpleType</qName>.</p>

            <p>NIEM-conformant schemas must not
              use <qName>xs:anySimpleType</qName> because this feature is
              insufficiently constrained to provide a meaningful starting point
              for content definitions. Instead, content should be based on one
              of the more specifically defined simple types defined by XML
              Schema.</p>

          </ruleSection>

          <ruleSection id="rule-section-no-base-xs-NOTATION">
            <title>No base type of <qName>xs:NOTATION</qName></title>

            <rule applicability="REF EXT" id="no-base-xs-NOTATION" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-base-xs-NOTATION">
<sch:pattern>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:NOTATION')"
      >A schema component MUST NOT have an attribute {}base with a value of xs:NOTATION.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
            <p>XML Schema notations allow the attachment of system and public
              identifiers on fields of data. The notation mechanism does not
              play a part in validation of instances and is not supported by
              NIEM.</p>
          </ruleSection>

          <ruleSection id="rule-section-no-base-xs-ENTITY">
            <title>No base type of <qName>xs:ENTITY</qName></title>

            <rule applicability="REF EXT" id="no-base-xs-ENTITY" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-base-xs-ENTITY">
<sch:pattern>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:ENTITY')"
      >A schema component MUST NOT have an attribute {}base with a value of xs:ENTITY.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection id="rule-section-no-base-xs-ENTITIES">
            <title>No base type of <qName>xs:ENTITIES</qName></title>

            <rule applicability="REF EXT" id="no-base-xs-ENTITIES" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-base-xs-ENTITIES">
<sch:pattern>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:ENTITIES')"
      >A schema component MUST NOT have an attribute {}base with a value of xs:ENTITIES.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>


        </section>
      </section>

      <section>
        <title>Simple type definition</title>

        <ruleSection>
          <title>Simple type definition is top-level</title>
          <rule applicability="REF EXT" id="st-top-level" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="simple-type-defn-must-be-top-level">
<sch:pattern>
  <sch:rule context="xs:simpleType">
    <sch:assert test="exists(parent::xs:schema)"
      >A simple type definition MUST be top-level.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>NIEM does not support anonymous types in NIEM-conformant
            schemas. All XML Schema <q>top-level</q> types (children of the
            document element) are required by XML Schema to be named. By
            requiring NIEM type definitions to be top level, they are forced to
            be named and are globally reusable.</p>

        </ruleSection>

        <ruleSection>
          <title>No simple type disallowed derivation</title>
          <rule applicability="REF" id="no-st-final" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-no-st-final">
<sch:pattern>
  <sch:rule context="xs:simpleType">
    <sch:assert test="empty(@final)"
      >An element xs:simpleType MUST NOT have an attribute {}final.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        MACRO_HAS_DATA_DEFINITION(Simple type, st, xs:simpleType, A simple type)

        <ruleSection>
          <title>No use of <q>fixed</q> on simple type facets</title>

          <p>An attribute <local-name>fixed</local-name> on a constraining facet
            (e.g., <qName>xs:maxInclusive</qName>) of a simple type <var>$base</var> prevents a simple type
            derived from <var>$base</var> from further restricting that facet. For example, if
            simpleType <qName>nc:LatitudeDegreeSimpleType</qName> uses an <qName>xs:maxInclusive</qName> facet
            that limits the maximum value to 90, a simple type derived from that type could not further restrict
            the type to limit the maximum value to 45.</p>

          <p>The use of <local-name>fixed</local-name> on simple type facets violates
            <ref idref="principle-extensible"/>, since it prevents an extension schema from constraining a base
            type. As a result, the <local-name>fixed</local-name> on simple type facets in reference schemas is
            prohibited.</p>

          <rule applicability="REF" id="no-facet-fixed" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-no-facet-fixed">
<sch:pattern>
  <sch:rule context="xs:*[self::xs:length or self::xs:minLength or self::xs:maxLength or self::xs:whiteSpace
      or self::xs:maxInclusive or self::xs:maxExclusive or self::xs:minExclusive or self::xs:minInclusive
      or self::xs:totalDigits or self::xs:fractionDigits]">
    <sch:assert test="empty(@fixed)"
      >A simple type constraining facet MUST NOT have an attribute {}fixed.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        MACRO_HAS_DATA_DEFINITION(Enumeration, enum, xs:enumeration, An enumeration facet)

        <section>
          <title>Simple types prohibited as list item types</title>

          <p>There is no explicit prohibition on the use of xs:NOTATION as list item
            type, because it is prohibited by <ref idref="XMLSchema-2"/>.</p>

          <p>There is no prohibition on <qName>xs:anyType</qName> as a list item
            type, because xs:anyType is not a simple type.</p>

          <ruleSection>
            <title>No list item type of <qName>xs:ID</qName></title>

            <rule applicability="REF EXT" id="no-itemType-xs-id" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-itemType-xs-id">
<sch:pattern>
  <sch:rule context="xs:*[exists(@itemType)]">
    <sch:assert test="resolve-QName(@itemType, .) != xs:QName('xs:ID')"
      >A schema component MUST NOT have an attribute {}itemType with a value of xs:ID.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No list item type of <qName>xs:IDREF</qName></title>

            <rule applicability="REF EXT" id="no-itemType-xs-idref" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-itemType-xs-idref">
<sch:pattern>
  <sch:rule context="xs:*[exists(@itemType)]">
    <sch:assert test="resolve-QName(@itemType, .) != xs:QName('xs:IDREF')"
      >A schema component MUST NOT have an attribute {}itemType with a value of xs:IDREF.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No list item type of <qName>xs:anySimpleType</qName></title>

            <rule applicability="REF EXT" id="no-itemType-xs-anySimpleType" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-itemType-xs-anySimpleType">
<sch:pattern>
  <sch:rule context="xs:*[exists(@itemType)]">
    <sch:assert test="resolve-QName(@itemType, .) != xs:QName('xs:anySimpleType')"
      >A schema component MUST NOT have an attribute {}itemType with a value of xs:anySimpleType.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No list item type of <qName>xs:ENTITY</qName></title>

            <rule applicability="REF EXT" id="no-itemType-xs-entity" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-itemType-xs-entity">
<sch:pattern>
  <sch:rule context="xs:*[exists(@itemType)]">
    <sch:assert test="resolve-QName(@itemType, .) != xs:QName('xs:ENTITY')"
      >A schema component MUST NOT have an attribute {}itemType with a value of xs:ENTITY.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

        </section>

        <section>
          <title>Simple types prohibited as union member types</title>

          <p>There is no explicit prohibition on the use of xs:NOTATION as a union member
            type, because it is prohibited by <ref idref="XMLSchema-2"/>.</p>

          <p>There is no prohibition on <qName>xs:anyType</qName> as a union
            member type, because xs:anyType is not a simple type.</p>

          <ruleSection>
            <title>No union member types of <qName>xs:ID</qName></title>

            <rule applicability="REF EXT" id="no-memberTypes-xs-id" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-memberTypes-xs-id">
<sch:pattern>
  <sch:rule context="xs:*[exists(@memberTypes)]">
    <sch:assert test="every $type-qname
                      in tokenize(normalize-space(@memberTypes), ' ')
                      satisfies resolve-QName($type-qname, .) != xs:QName('xs:ID')"
      >A schema component MUST NOT have an attribute {}memberTypes that includes a value of xs:ID.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No union member types of <qName>xs:IDREF</qName></title>

            <rule applicability="REF EXT" id="no-memberTypes-xs-idref" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-memberTypes-xs-idref">
<sch:pattern>
  <sch:rule context="xs:*[exists(@memberTypes)]">
    <sch:assert test="every $type-qname
                      in tokenize(normalize-space(@memberTypes), ' ')
                      satisfies resolve-QName($type-qname, .) != xs:QName('xs:IDREF')"
      >A schema component MUST NOT have an attribute {}memberTypes that includes a value of xs:IDREF.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No union member types of <qName>xs:IDREFS</qName></title>

            <rule applicability="REF EXT" id="no-memberTypes-xs-idrefs" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-memberTypes-xs-idrefs">
<sch:pattern>
  <sch:rule context="xs:*[exists(@memberTypes)]">
    <sch:assert test="every $type-qname
                      in tokenize(normalize-space(@memberTypes), ' ')
                      satisfies resolve-QName($type-qname, .) != xs:QName('xs:IDREFS')"
      >A schema component MUST NOT have an attribute {}memberTypes that includes a value of xs:IDREFS.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No union member types of <qName>xs:anySimpleType</qName></title>

            <rule applicability="REF EXT" id="no-memberTypes-xs-anySimpleType" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-memberTypes-xs-anySimpleType">
<sch:pattern>
  <sch:rule context="xs:*[exists(@memberTypes)]">
    <sch:assert test="every $type-qname
                      in tokenize(normalize-space(@memberTypes), ' ')
                      satisfies resolve-QName($type-qname, .) != xs:QName('xs:anySimpleType')"
      >A schema component MUST NOT have an attribute {}memberTypes that includes a value of xs:anySimpleType.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No union member types of <qName>xs:ENTITY</qName></title>

            <rule applicability="REF EXT" id="no-memberTypes-xs-entity" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-memberTypes-xs-entity">
<sch:pattern>
  <sch:rule context="xs:*[exists(@memberTypes)]">
    <sch:assert test="every $type-qname
                      in tokenize(normalize-space(@memberTypes), ' ')
                      satisfies resolve-QName($type-qname, .) != xs:QName('xs:ENTITY')"
      >A schema component MUST NOT have an attribute {}memberTypes that includes a value of xs:ENTITY.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No union member types of <qName>xs:ENTITIES</qName></title>

            <rule applicability="REF EXT" id="no-memberTypes-xs-entities" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-memberTypes-xs-entities">
<sch:pattern>
  <sch:rule context="xs:*[exists(@memberTypes)]">
    <sch:assert test="every $type-qname
                      in tokenize(normalize-space(@memberTypes), ' ')
                      satisfies resolve-QName($type-qname, .) != xs:QName('xs:ENTITIES')"
      >A schema component MUST NOT have an attribute {}memberTypes that includes a value of xs:ENTITIES.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>


        </section>

      </section>
      <section>
        <title>Complex type definition</title>

        <ruleSection>
          <title>Complex type definition is top-level</title>
          <rule applicability="REF EXT" id="ct-top-level" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-ct-top-level">
<sch:pattern>
  <sch:rule context="xs:complexType">
    <sch:assert test="exists(parent::xs:schema)"
      >A complex type definition MUST be top-level.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>Note that this implies that every <qName>xs:complexType</qName>
            element has a <local-name>name</local-name> attribute.</p>
        </ruleSection>

        MACRO_HAS_DATA_DEFINITION(Complex type, ct, xs:complexType, A complex type)

        <section>
          <title>No mixed content</title>
          <ruleSection>
            <title>No mixed content on complex type</title>
            <rule applicability="REF EXT" id="ct-not-mixed" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-ct-not-mixed">
<sch:pattern>
  <sch:rule context="xs:complexType[exists(@mixed)]">
    <sch:assert test="xs:boolean(@mixed) = false()"
      >A complex type definition MUST NOT have mixed content.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>

            <p>Mixed content allows the mixing of data tags with text. Languages
              such as XHTML use this syntax for markup of text. NIEM-conformant
              schemas define XML that is for data exchange, not text markup. Mixed
              content creates complexity in processing, defining, and constraining
              content.</p>

            <p>Well-defined markup languages exist outside NIEM and may be used with NIEM data. External schema documents
              may include mixed content and may be used with NIEM. However, mixed content must not be defined by
              NIEM-conformant schemas in keeping with <ref idref="principle-no-mixed-content"/>.</p>

          </ruleSection>

          <ruleSection>
            <title>No mixed content on complex content</title>
            <rule applicability="REF EXT" id="cc-not-mixed" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-cc-not-mixed">
<sch:pattern>
  <sch:rule context="xs:complexContent[exists(@mixed)]">
    <sch:assert test="xs:boolean(@mixed) = false()"
      >A complex type definition with complex content MUST NOT have mixed content.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
            <p>See <ref idref="ct-not-mixed"/> for the rationale for this rule.</p>
          </ruleSection>
        </section>

        <ruleSection>
          <title>Complex type content is explicitly simple or complex</title>
          <rule applicability="REF EXT" id="ct-has-content-type" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-ct-has-content-type">
<sch:pattern>
  <sch:rule context="xs:complexType">
    <sch:assert test="exists(xs:simpleContent) or exists(xs:complexContent)"
      >An element xs:complexType MUST have a child element xs:simpleContent or xs:complexContent.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>XML Schema provides shorthand to defining complex content of a
            complex type, which is to define the complex type with immediate
            children that specify elements, or other groups, and attributes. In
            the desire to normalize schema representation of types and to be
            explicit, NIEM forbids the use of that shorthand.</p>
        </ruleSection>

        <section>
          <title>Complex content</title>

          <ruleSection>
            <title>Complex content uses extension</title>
            <rule applicability="REF" id="ct-cc-is-extension" class="Constraint">
              <pre><xmlBlurb memberOf="ref" id="xb-ct-cc-is-extension">
<sch:pattern>
  <sch:rule context="xs:complexContent">
    <sch:assert test="exists(xs:extension)"
      >An element xs:complexContent MUST have a child xs:extension.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

        <p>NIEM does not support the use of complex type restriction in reference schemas. The use of restriction
          in a reference schema would reduce the ability for that schema to be reused. Restriction may be used in
          extension schemas.</p>

        </ruleSection>

          <section>
            <title>Base type of complex type with complex content has complex content</title>

          <p>These two rules addresses a peculiarity of the <termRef>XML Schema definition language</termRef>,
            which allows a complex type to be constructed using <qName>xs:complexContent</qName>, and yet is
            derived from a complex type that uses <qName>xs:simpleContent</qName>. These rules ensure that each
            type has the content style indicated by the schema. An example is included in the following
            figure. Note that type <qName>niem-xs:integer</qName> is a complex type with simple content.</p>

<figure id="figure-ccc-has-sc">
  <title>Example of complex type with simple content that claims to have complex content</title>
  <pre><xmlBlurb id="xb-figure-ccc-has-sc">
<xs:complexType name="TreeCountType">
  <xs:annotation>
    <xs:documentation>A data type for a number of trees</xs:documentation>
  </xs:annotation>
  <xs:complexContent>
    <xs:extension base="niem-xs:integer"/>
  </xs:complexContent>
</xs:complexType>
  </xmlBlurb></pre>
</figure>

          <p>The first rule handles cases that can be determined within a single schema document, while the SET
            version handles cases that require cross-schema resolution.</p>

        <ruleSection>
          <title>Base type of complex type with complex content must have complex content</title>

          <rule applicability="REF EXT" id="rule-ref-ccc-base-has-cc" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-ref-ccc-base-has-cc">
<sch:pattern>
  <sch:rule context="xs:complexType/xs:complexContent/xs:*[
                       (self::xs:extension or self::xs:restriction)
                       and (some $base-qname in resolve-QName(@base, .) satisfies
                              namespace-uri-from-QName($base-qname) = nf:get-target-namespace(.))]">
    <sch:assert test="some $base-type in nf:resolve-type(., resolve-QName(@base, .)) satisfies
                        empty($base-type/self::xs:complexType/xs:simpleContent)"
      >The base type of complex type that has complex content MUST be a complex type with complex content.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Base type of complex type with complex content must have complex content</title>

          <rule applicability="SET" id="rule-set-ccc-base-has-cc" class="Constraint">
            <pre><xmlBlurb memberOf="set" id="xb-rule-set-ccc-base-has-cc">
<sch:pattern>
  <sch:rule context="xs:complexType[
        nf:has-effective-conformance-target-identifier(., xs:anyURI('MACRO_CT_URI_REF'))
        or nf:has-effective-conformance-target-identifier(., xs:anyURI('MACRO_CT_URI_EXT'))
      ]/xs:complexContent">
    <sch:assert test="some $derivation in xs:*[self::xs:extension or self::xs:restriction],
                           $base-qname in resolve-QName($derivation/@base, $derivation),
                           $base-type in nf:resolve-type($derivation, $base-qname) satisfies
                         empty($base-type/self::xs:complexType/xs:simpleContent)"
      >The base type of complex type that has complex content MUST have complex content.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

          </section>


        </section>
        <section><title>Simple content</title>
          <ruleSection><title>Simple content uses extension</title>

            <rule applicability="REF" id="ct-sc-has-extension" class="Constraint">
              <pre><xmlBlurb memberOf="ref" id="xb-ct-sc-has-extension">
<sch:pattern>
  <sch:rule context="xs:simpleContent">
    <sch:assert test="exists(xs:extension)"
      >A complex type definition with simple content schema component MUST have a derivation method of extension.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>

            <p>This rule ensures that the definition of a complex type with simple content will use XML Schema
            extension. Under this rule, the structure of these types will be more uniform, as alternate formats
            are prohibited. The above rule allows for use of <qName>xs:restriction</qName>
            within <qName>xs:simpleContent</qName> in extension schemas.</p>
          </ruleSection>
        </section>

        <ruleSection>
          <title>No complex type disallowed substitutions</title>
          <rule applicability="REF" id="no-ct-block" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-no-ct-block">
<sch:pattern>
  <sch:rule context="xs:complexType">
    <sch:assert test="empty(@block)"
      >An element xs:complexType MUST NOT have an attribute {}block.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>No complex type disallowed derivation</title>
          <rule applicability="REF" id="no-ct-final" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-no-ct-final">
<sch:pattern>
  <sch:rule context="xs:complexType">
    <sch:assert test="empty(@final)"
      >An element xs:complexType MUST NOT have an attribute {}final.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

    </section>
    </section>
    <section><title>Declaration components</title>
      <section><title>Element declaration</title>

        <p>Every element declaration in a NIEM-conformant schema document is a top-level element; rules prohibit
        the declaration of local elements.</p>

        <p>Within a NIEM-conformant schema document, an element may be declared as abstract. Elements may be
          defined without a type, but any element declaration that has no type must be declared abstract, as
          specified by <ref idref="el-with-no-type-is-abstract"/>.</p>

        <p>Within an element declaration, the
          attributes <local-name>fixed</local-name>, <local-name>nillable</local-name>,
          and <local-name>substitutionGroup</local-name> may be used as per the XML Schema
          specification. The attribute <local-name>form</local-name> is irrelevant to NIEM, as
          NIEM-conformant schemas may not contain local element declarations, as specified by
          <ref idref="el-top-level"/>.</p>

        <ruleSection><title>Element declaration is top-level</title>
          <rule applicability="REF EXT" id="el-top-level" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-el-top-level">
<sch:pattern>
  <sch:rule context="xs:element[exists(@name)]">
    <sch:assert test="exists(parent::xs:schema)"
      >An element declaration MUST be top-level.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>All schema components defined by NIEM-conformant schemas must be
            named, accessible from outside the defining schema, and reusable
            across schemas. Local element declarations provide named elements
            that are not reusable outside the context in which they are
            defined. Requiring named NIEM elements to be top level ensures that
            they are globally reusable.</p>
        </ruleSection>

        MACRO_HAS_DATA_DEFINITION(Element declaration, el, xs:element[exists(@name)], An element declaration)

        <ruleSection>
          <title>Untyped element is abstract</title>

          <rule applicability="REF EXT" id="el-with-no-type-is-abstract" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-el-with-no-type-is-abstract">
<sch:pattern>
  <sch:rule context="xs:schema/xs:element[empty(@type)]">
    <sch:assert test="exists(@abstract)
                      and xs:boolean(@abstract) = true()"
      >A top-level element declaration that does not set the {type definition} property via the attribute "type" MUST have the {abstract} property with a value of "true".</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>Untyped element declarations act as wildcards that may carry
            arbitrary data. By declaring such types abstract, NIEM allows the
            creation of type independent semantics without allowing arbitrary
            content to appear in XML instances.</p>
        </ruleSection>

        <ruleSection>
          <title>Element of type <qName>xs:anySimpleType</qName> is abstract</title>

          <p>The type <qName>xs:anySimpleType</qName> does not have any concrete semantics; The
            use of <qName>xs:anySimpleType</qName> is limited to the case where an abstract
            element is of type <qName>xs:anySimpleType</qName>, to act as a base for concrete
            implementations of the element.</p>

          <rule applicability="REF EXT" id="el-with-type-xs-anysimpletype-is-abstract" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-el-with-type-xs-anysimpletype-is-abstract">
<sch:pattern>
  <sch:rule context="xs:element[exists(@type)
                                and resolve-QName(@type, .) = xs:QName('xs:anySimpleType')]">
    <sch:assert test="exists(@abstract)
                      and xs:boolean(@abstract) = true()"
                >An element declaration that has a type xs:anySimpleType MUST have the {abstract} property with a value of "true".</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Element type not in the XML Schema namespace</title>
          <rule applicability="REF EXT" id="el-type-not-xs" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-el-type-not-xs">
<sch:pattern>
  <sch:rule context="xs:element[exists(@type)]">
    <sch:assert test="for $type-qname in resolve-QName(@type, .) return
                        $type-qname = xs:QName('xs:anySimpleType')
                        or namespace-uri-from-QName($type-qname) != xs:anyURI('MACRO_NS_XS')"
      >An element type that is not xs:anySimpleType MUST NOT have a namespace name <namespace-uri-for-prefix>xs</namespace-uri-for-prefix>.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>The prohibition of element types having the XML Schema namespace
            subsumes a prohibition of the type <qName>xs:anyType</qName>.</p>

        </ruleSection>

        <ruleSection>
          <title>Element type not in the XML namespace</title>

          <p>The XML namespace may be imported into a conformant schema document as if it were conformant. This
          specification does not enable a reference to any types that may be defined by any implementation of a
          schema for that namespace.</p>

          <rule applicability="REF EXT" id="el-type-ns-not-special" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-el-type-ns-not-xml-ns">
<sch:pattern>
  <sch:rule context="xs:element[exists(@type)]">
    <sch:assert test="namespace-uri-from-QName(resolve-QName(@type, .)) != 'MACRO_NS_XML'"
      >An element type MUST NOT have a namespace name that is in the XML namespace.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Element type is not simple type</title>
          <rule applicability="REF EXT" id="el-type-not-st" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-el-type-not-st">
<sch:pattern>
  <sch:rule context="xs:element[@type]">
    <sch:assert test="every $type-qname in resolve-QName(@type, .),
                            $type-ns in namespace-uri-from-QName($type-qname),
                            $type-local-name in local-name-from-QName($type-qname) satisfies (
                        $type-qname = xs:QName('xs:anySimpleType')
                        or (($type-ns = nf:get-target-namespace(.)
                             or exists(nf:get-document-element(.)/xs:import[
                                         xs:anyURI(@namespace) = $type-ns
                                         and empty(@appinfo:externalImportIndicator)]))
                            and not(ends-with($type-local-name, 'SimpleType'))))"
      >An element type that is not xs:anySimpleType MUST NOT be a simple type.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>No element disallowed substitutions </title>
          <rule applicability="REF" id="no-el-block" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-no-el-block">
<sch:pattern>
  <sch:rule context="xs:element">
    <sch:assert test="empty(@block)"
      >An element xs:element MUST NOT have an attribute {}block.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>
        <ruleSection>
          <title>No element disallowed derivation</title>
          <rule applicability="REF" id="no-el-final" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-no-el-final">
<sch:pattern>
  <sch:rule context="xs:element">
    <sch:assert test="empty(@final)"
      >An element xs:element MUST NOT have an attribute {}final.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>
        <section>
          <title>No element value constraints</title>
          <ruleSection>
            <title>No element default value</title>
            <rule applicability="REF EXT" id="no-el-default" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-el-default">
<sch:pattern>
  <sch:rule context="xs:element">
    <sch:assert test="empty(@default)"
      >An element xs:element MUST NOT have an attribute {}default.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>
          <ruleSection>
            <title>No element fixed value</title>
            <rule applicability="REF EXT" id="no-el-fixed" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-el-fixed">
<sch:pattern>
  <sch:rule context="xs:element">
    <sch:assert test="empty(@fixed)"
      >An element xs:element MUST NOT have an attribute {}fixed.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>
        </section>
        <ruleSection><title>Element declaration is nillable</title>

          <p>All elements declared by reference schemas allow a nil value. This enables the ID/IDREF mechanism
            linking <qName>structures:ref</qName> and <qName>structures:id</qName>, as described by <ref idref="section-id-and-ref"/>.</p>

            <p>A developer may constrain the use of <code>nil</code> in an instance by
              setting <code>nillable</code> to false in subset schemas, or by use of non-XML Schema mechanisms,
              such as Schematron.</p>

          <rule applicability="REF" id="el-is-nillable" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-el-is-nillable">
<sch:pattern>
  <sch:rule context="xs:element[@name and (empty(@abstract)
                                           or xs:boolean(@abstract) = false())]">
    <sch:assert test="exists(@nillable)
                      and xs:boolean(@nillable) = true()"
      >An element declaration MUST have the {nillable} property with a value of true.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>This document defines the term <termRef>element declaration</termRef>.</p>
        </ruleSection>
      </section>
      <section><title>Element substitution group</title>
        <p>This section is intentionally blank. It is present in order to ensure that section numbers correspond
          to

          MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#concepts-data-model,2.2,XML Schema Abstract Data Model),

          as described by <ref idref="section-profile-of-xml-schema"/>.</p>
      </section>
      <section>
        <title>Attribute declaration</title>

        <p>Within an attribute declaration, the
          attribute <local-name>form</local-name> is irrelevant to NIEM, as NIEM-conformant schemas may not
        contain local attribute declarations.</p>

        <ruleSection>
          <title>Attribute declaration is top-level</title>
          <rule applicability="REF EXT" id="att-top-level" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-att-top-level">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@name)]">
    <sch:assert test="exists(parent::xs:schema)"
      >An attribute declaration MUST be top-level.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>All schema components defined by NIEM-conformant schemas are named,
            accessible from outside the defining schema, and reusable across
            schemas. Local attribute declarations provide named attributes that
            are not reusable outside the context in which they are
            defined. Requiring named NIEM attributes to be top level ensures
            that they are globally reusable.</p>
        </ruleSection>

        MACRO_HAS_DATA_DEFINITION(Attribute declaration, at, xs:attribute[exists(@name)], An attribute declaration)

        <ruleSection>
          <title>Attribute declaration has type</title>

          <rule applicability="REF EXT" id="attr-has-type" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-attr-has-type">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@name)]">
    <sch:assert test="exists(@type)"
      >A top-level attribute declaration MUST have a type.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>Untyped XML Schema attributes allow arbitrary content, with no
            semantics. Attributes must have a type so that specific syntax and
            semantics will be provided.</p>

        </ruleSection>
        <section>
          <title>Prohibited attribute types</title>

          <p>There is no explicit prohibition on the use of xs:NOTATION as an
            attribute type, because it is prohibited by
            <ref idref="XMLSchema-2"/>.</p>

          <p>These types are only explicitly prohibited from attributes, not elements,
            because the case is covered by a general prohibition against elements
            having simple types.</p>

          <ruleSection>
            <title>No attribute type of <qName>xs:ID</qName></title>

            <rule applicability="REF EXT" id="no-type-xs-id" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-type-xs-id">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@type)]">
    <sch:assert test="resolve-QName(@type, .) != xs:QName('xs:ID')"
      >A schema component MUST NOT have an attribute {}type with a value of xs:ID.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No attribute type of <qName>xs:IDREF</qName></title>
            <rule applicability="REF EXT" id="no-type-xs-idref" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-type-xs-idref">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@type)]">
    <sch:assert test="resolve-QName(@type, .) != xs:QName('xs:IDREF')"
      >A schema component MUST NOT have an attribute {}type with a value of xs:IDREF.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No attribute type of <qName>xs:IDREFS</qName></title>
            <rule applicability="REF EXT" id="no-type-xs-idrefs" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-type-xs-idrefs">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@type)]">
    <sch:assert test="resolve-QName(@type, .) != xs:QName('xs:IDREFS')"
      >A schema component MUST NOT have an attribute {}type with a value of xs:IDREFS.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No attribute type of <qName>xs:ENTITY</qName></title>
            <rule applicability="REF EXT" id="no-type-xs-entity" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-type-xs-entity">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@type)]">
    <sch:assert test="resolve-QName(@type, .) != xs:QName('xs:ENTITY')"
      >A schema component MUST NOT have an attribute {}type with a value of xs:ENTITY.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No attribute type of <qName>xs:ENTITIES</qName></title>
            <rule applicability="REF EXT" id="no-type-xs-entities" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-type-xs-entities">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@type)]">
    <sch:assert test="resolve-QName(@type, .) != xs:QName('xs:ENTITIES')"
      >A schema component MUST NOT have an attribute {}type with a value of xs:ENTITIES.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>No attribute type of <qName>xs:anySimpleType</qName></title>
            <rule applicability="REF EXT" id="no-type-xs-anySimpleType" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-type-xs-anySimpleType">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@type)]">
    <sch:assert test="resolve-QName(@type, .) != xs:QName('xs:anySimpleType')"
      >A schema component MUST NOT have an attribute {}type with a value of xs:anySimpleType.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

        </section>
        <section>
          <title>No attribute value constraints</title>
          <ruleSection>
            <title>No attribute default values</title>
            <rule applicability="REF EXT" id="no-at-default" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-at-default">
<sch:pattern>
  <sch:rule context="xs:attribute">
    <sch:assert test="empty(@default)"
      >An element xs:attribute MUST NOT have an attribute {}default.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
            <p>This rule helps to ensure that schema processing does not alter processed data, as described in
              <ref idref="sec-no-infoset-mods"/>.</p>
          </ruleSection>
          <ruleSection>
            <title>No fixed values for optional attributes</title>

            <p>The <local-name>fixed</local-name> attribute is described by
              MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#Attribute_Declaration_details,3.2.1,The Attribute Declaration Schema Component):</p>

            <blockquote>

              <p><em>default</em> specifies that the attribute is to appear unconditionally in the
                post-schema-validation infoset, with the supplied value used whenever the attribute is not
                actually present; <em>fixed</em> indicates that the attribute value if present must equal the
                supplied constraint value, and if absent receives the supplied value as
                for <em>default</em>.</p>

            </blockquote>

            <rule applicability="REF EXT" id="no-at-fixed" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-no-at-fixed">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@ref) and @use eq 'required']">
    <sch:report test="false()" role="warning">This rule does not constrain attribute uses that are required</sch:report>
  </sch:rule>
  <sch:rule context="xs:attribute">
    <sch:assert test="empty(@fixed)"
      >An element xs:attribute that is not a required attribute use MUST NOT have an attribute {}fixed.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
            <p>This rule helps to ensure that schema processing does not alter processed data, as described in
              <ref idref="sec-no-infoset-mods"/>.
              The use of the <code>fixed</code> attribute may result in alteration of the post-schema-validation
              infoset, like the use of <code>default</code> does. This behavior is described by
              MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#Attribute_Declaration_details,3.2.1,The Attribute Declaration Schema Component).</p>
          </ruleSection>
        </section>
      </section>
      <section id="section-profile-notation-declaration">
        <title>Notation declaration</title>

        <ruleSection>
          <title>No use of element <qName>xs:notation</qName></title>
          <rule applicability="REF EXT" id="no-el-notation" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-no-el-notation">
<sch:pattern>
  <sch:rule context="xs:notation">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:notation.</sch:assert>
  </sch:rule>
</sch:pattern>
  </xmlBlurb></pre>
          </rule>
          <p>See <ref idref="rule-section-no-base-xs-NOTATION"/> for comments
            about the use of notations.</p>
        </ruleSection>
      </section>

    </section>
    <section>
      <title>Model group components</title>

      <section id="section-profile-model-group">
        <title>Model group</title>

        <p>Complex content definitions in XML Schema use model group schema
          components. These schema
          components, <qName>xs:all</qName>, <qName>xs:choice</qName>
          and <qName>xs:sequence</qName>, also called compositors, provide for
          ordering and selection of particles within a model group.</p>

        <p>XML Schema defines a <strong>particle</strong> as an occurrence
          of <qName>xs:element</qName>, <qName>xs:sequence</qName>, <qName>xs:choice</qName>, <qName>xs:any</qName>
          (wildcard) and <qName>xs:group</qName> (model group) within a content
          model. For example, an <qName>xs:sequence</qName> within an XML Schema
          complex type is a particle. An <qName>xs:element</qName> occurring
          within an <qName>xs:sequence</qName> is also a particle.</p>

        <ruleSection>
          <title>Model group does not affect meaning</title>
          <rule applicability="EXT" class="Interpretation">
            <p>The use of model groups <qName>xs:all</qName>, <qName>xs:sequence</qName>,
              and <qName>xs:choice</qName> MUST NOT define the semantics of an instance. The meaning of an
              element occurrence within an element occurrence MUST be identical, regardless of the model group
              used to define a <termRef>schema component</termRef>.</p>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>No <qName>xs:all</qName></title>
          <rule applicability="REF EXT" id="no-all" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-no-all">
<sch:pattern>
  <sch:rule context="xs:all">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:all</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>The element <qName>xs:all</qName> provides a set of particles (e.g., elements) that may be included
            in an instance, in no particular order. This compositor does not support a variety of cardinalities,
            has shown to be confusing in practice, and has functionality that overlaps with
            NIEM<char name="rsquo"/>s use of substitution groups. Use of substitution groups is the preferred
            method in NIEM schemas for obtaining flexible content models.</p>

        </ruleSection>

        <section>
          <title>Sequence</title>
          <ruleSection>
            <title><qName>xs:sequence</qName> must be child of <qName>xs:extension</qName></title>
            <rule applicability="REF" id="seq-in-ext" class="Constraint">
              <pre><xmlBlurb memberOf="ref" id="xb-seq-in-ext">
<sch:pattern>
  <sch:rule context="xs:sequence">
    <sch:assert test="exists(parent::xs:extension)"
      >An element xs:sequence MUST be a child of element xs:extension.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>
          <ruleSection><title><qName>xs:sequence</qName> must be child of <qName>xs:extension</qName>
              or <qName>xs:restriction</qName></title>
            <rule applicability="EXT" id="seq-in-restr" class="Constraint">
              <pre><xmlBlurb memberOf="ext" id="xb-seq-in-restr">
<sch:pattern>
  <sch:rule context="xs:sequence">
    <sch:assert test="exists(parent::xs:extension) or exists(parent::xs:restriction)"
      >An element xs:sequence MUST be a child of element xs:extension or xs:restriction.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>
        </section>

        <section>
          <title>Choice</title>

          <ruleSection>
            <title>No <qName>xs:choice</qName></title>
            <rule applicability="REF" id="no-choice" class="Constraint">
              <pre><xmlBlurb memberOf="ref" id="xb-no-choice">
<sch:pattern>
  <sch:rule context="xs:choice">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:choice</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>

          <p>The element <qName>xs:choice</qName> provides an exclusive set of particles, one of which may appear
            in an instance. This can greatly complicate processing and may be difficult to comprehend, satisfy,
            and reuse.</p>
          <p>The element <qName>xs:choice</qName> may be used in extension schemas, as it presents a simple way
            for a schema writer to represent a set of optional content.</p>
          </ruleSection>

          <ruleSection>
            <title><qName>xs:choice</qName> must be child of <qName>xs:sequence</qName></title>
            <rule applicability="EXT" id="req-seq-choice" class="Constraint">
              <pre><xmlBlurb memberOf="ext" id="xb-req-seq-choice">
<sch:pattern>
  <sch:rule context="xs:choice">
    <sch:assert test="exists(parent::xs:sequence)"
      >An element xs:choice MUST be a child of element xs:sequence.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>
        </section>
      </section>

      <section>
        <title>Particle</title>

        <p>In NIEM schemas, an element use is an element declaration acting as a particle within a content
          model. Each such element declaration must reference a top-level named element declaration.</p>

          <p>Element declarations acting as a particle (particles formed by <qName>xs:element</qName>) may have
            any cardinality. NIEM does not provide additional constraints on the values of the XML Schema
            properties {min occurs} and {max occurs} on element uses. These properties are described by

            MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#Particle_details,3.9.1,The Particle Schema Component).</p>

        <section>
          <title>Sequence cardinality</title>

          <p>XML Schema allows each particle to specify cardinality (how many
            times the particle may appear in an instance). NIEM restricts the
            cardinality of <qName>xs:sequence</qName> particles to exactly one,
            to ensure that content model definitions are defined in as
            straightforward a manner as possible.</p>

            <p>A schema developer who requires the instance syntax that would be obtained from the use of
              specific cardinality on sequences should define cardinality on individual element uses.</p>

          <ruleSection>
            <title>Sequence has minimum cardinality 1</title>
            <rule applicability="REF EXT" id="seq-minOccurs" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-seq-minOccurs">
<sch:pattern>
  <sch:rule context="xs:sequence">
    <sch:assert test="empty(@minOccurs) or xs:integer(@minOccurs) = 1"
      >An element xs:sequence MUST either not have the attribute {}minOccurs, or that attribute MUST have a value of 1.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>
          <ruleSection>
            <title>Sequence has maximum cardinality 1</title>
            <rule applicability="REF EXT" id="seq-maxOccurs" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-seq-maxOccurs">
<sch:pattern>
  <sch:rule context="xs:sequence">
    <sch:assert test="empty(@maxOccurs) or (@maxOccurs instance of xs:integer
                                            and 1 = xs:integer(@maxOccurs))"
      >An element xs:sequence MUST either not have the attribute {}maxOccurs, or that attribute MUST have a value of 1.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>
        </section>

        <section>
          <title>Choice cardinality</title>

          <ruleSection>
            <title>Choice has minimum cardinality 1</title>
            <rule applicability="EXT" id="choice-minOccurs" class="Constraint">
              <pre><xmlBlurb memberOf="ext" id="xb-choice-minOccurs">
<sch:pattern>
  <sch:rule context="xs:choice">
    <sch:assert test="empty(@minOccurs) or 1 = xs:integer(@minOccurs)"
      >An element xs:choice MUST either not have the attribute {}minOccurs, or that attribute MUST have a value of 1.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>Choice has maximum cardinality 1</title>
            <rule applicability="EXT" id="choice-maxOccurs" class="Constraint">
              <pre><xmlBlurb memberOf="ext" id="xb-choice-maxOccurs">
<sch:pattern>
  <sch:rule context="xs:choice">
    <sch:assert test="empty(@maxOccurs) or (@maxOccurs instance of xs:integer
                                            and 1 = xs:integer(@maxOccurs))"
      >An element xs:choice MUST either not have the attribute {}maxOccurs, or that attribute MUST have a value of 1.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>
        </section>

      </section>
      <section>
        <title>Attribute use</title>

        <p>An attribute use has an {attribute declaration} property that is a top-level, named attribute
        declaration. NIEM-conformant schemas do not define local named attributes within type definitions. Within
          an attribute use, the attribute <local-name>use</local-name> may be used as per the XML Schema
        specification.</p>

      </section>

      <section id="section-profile-wildcard">
        <title>Wildcard</title>
        <ruleSection>
          <title>No use of <qName>xs:any</qName></title>
          <rule applicability="REF" id="no-xs-any" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-no-xs-any">
<sch:pattern>
  <sch:rule context="xs:any">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:any.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>The <qName>xs:any</qName> particle (see Model Group Restrictions for
            an informative definition of particle) provides a wildcard that may
            carry arbitrary content. The particle <qName>xs:any</qName> may appear
            within an <termRef>extension schema document</termRef>.</p>

        </ruleSection>

        <ruleSection>
          <title>No use of <qName>xs:anyAttribute</qName></title>
          <rule applicability="REF" id="no-anyattribute" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-no-xs-anyattribute">
<sch:pattern>
  <sch:rule context="xs:anyAttribute">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:anyAttribute.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>The <qName>xs:anyAttribute</qName> element provides a wildcard, where
            arbitrary attributes may appear.</p>

        </ruleSection>

      </section>
    </section>
    <section id="section-profile-identity-constraint">
      <title>Identity-constraint definition components</title>

      <p>XML Schema provides NIEM with the ability to apply uniqueness
        constraints to schema-validated content. These mechanisms, however,
        establish relationships in a way that is very difficult to understand,
        extend, and keep consistent through schema reuse.</p>

      <p>Note that there is no prohibition on the use of <qName>xs:selector</qName> and <qName>xs:field</qName>,
        since according to the rules of the <termRef>XML Schema definition language</termRef>, they can only
        appear within <qName>xs:key</qName>, <qName>xs:keyref</qName>, and <qName>xs:unique</qName>, which are
        themselves prohibited.</p>

      <ruleSection>
        <title>No use of <qName>xs:unique</qName></title>
        <rule applicability="REF EXT" id="no-xs-unique" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xb-no-xs-unique">
<sch:pattern>
  <sch:rule context="xs:unique">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:unique.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

      <ruleSection>
        <title>No use of <qName>xs:key</qName></title>
        <rule applicability="REF EXT" id="no-xs-key" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xb-no-xs-key">
<sch:pattern>
  <sch:rule context="xs:key">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:key.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

      <ruleSection>
        <title>No use of <qName>xs:keyref</qName></title>
        <rule applicability="REF EXT" id="no-xs-keyref" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xb-no-xs-keyref">
<sch:pattern>
  <sch:rule context="xs:keyref">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:keyref.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

    </section>
    <section><title>Group definition components</title>
      <section id="section-profile-model-group-definitions">
        <title>Model group definition</title>
        <ruleSection>
          <title>No use of <qName>xs:group</qName></title>
          <rule applicability="REF EXT" id="no-xs-group" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-no-xs-group">
<sch:pattern>
  <sch:rule context="xs:group">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:group.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>NIEM does not allow groups of elements to be named other than as
            named complex types. A group in XML Schema creates a named entity
            that may be included in multiple types, and which consists of a
            sequence of or choice between element particles. NIEM has not
            developed a semantic model for these components, and they are not
            integrated into NIEM<char name="rsquo"/>s design.</p>

        </ruleSection>
      </section>

      <section id="section-profile-attribute-group-definition">
        <title>Attribute group definition</title>

        <ruleSection>
          <title>No definition of attribute groups</title>

          <p>Per <ref idref="rule-known-att-grp-refs"/>, the only attribute groups used in NIEM-conformant schemas
            are <qName>structures:SimpleObjectAttributeGroup</qName> and attribute groups defined by the IC-ISM
            and IC-NTK schemas. Therefore, NIEM-conformant schemas do not define additional attribute groups.</p>

          <rule applicability="REF EXT" id="no-def-attr-grp" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-no-def-attr-grp">
<sch:pattern>
  <sch:rule context="xs:attributeGroup[@name]">
    <sch:assert test="false()"
      >The schema MUST NOT contain an attribute group definition schema component.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

        </ruleSection>
      </section>
    </section>
    <section>
      <title>Annotation components</title>
      <ruleSection>
        <title>Comment is not recommended</title>

        <p>Note that this rule is written with a context that is not as precise as it could be. Its context is
        the parent node of the comment node, in order to avoid error messages when executed with common
        Schematron implementations.</p>

        <rule applicability="REF EXT" id="no-comments" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xb-no-comments">
<sch:pattern>
  <sch:rule context="node()[comment()]">
    <sch:report test="true()" role="warning"
      >An XML Comment is not an XML Schema annotation component; an XML comment SHOULD NOT appear in the schema.</sch:report>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
        <p>Since <xe>XML comment</xe>s are not associated with any specific XML Schema
          construct, there is no standard way to interpret comments. XML Schema
          annotations should be preferred for meaningful information about
          components. NIEM specifically defines how information should be
          encapsulated in NIEM-conformant schemas via <qName>xs:annotation</qName>
          elements.</p>
      </ruleSection>
      <ruleSection>
        <title>Documentation element has no element children</title>
        <rule applicability="REF EXT" id="doc-has-no-els" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xb-doc-dd-has-no-els">
<sch:pattern>
  <sch:rule context="xs:documentation/node()">
    <sch:assert test="self::text() or self::comment()"
      >A child of element xs:documentation MUST be text or an XML comment.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>
      <section>
        <title>Application information annotation</title>
        <p>XML Schema provides special annotations for support of automatic processing. The XML Schema specification provides the element <qName>xs:appinfo</qName> to carry such content and does not specify what style of content they should carry. In NIEM, <qName>xs:appinfo</qName> elements carry structured XML content.</p>
        <ruleSection>
          <title><qName>xs:appinfo</qName> children are comments, elements, or whitespace</title>
          <rule applicability="REF EXT" id="appinfo-has-els" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-appinfo-has-els">
<sch:pattern>
  <sch:rule context="xs:appinfo/node()">
    <sch:assert test="self::comment()
                      or self::element()
                      or self::text()[string-length(normalize-space(.)) = 0]"
      >A child of element xs:appinfo MUST be an element, a comment, or whitespace text.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>Application information elements are intended for automatic
            processing; the meaning of an appinfo annotation is provided via
            elements.</p>
        </ruleSection>
        <ruleSection>
          <title>Appinfo child elements have namespaces</title>
          <rule applicability="REF EXT" id="appinfo-el-has-ns" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-appinfo-el-has-ns">
<sch:pattern>
  <sch:rule context="xs:appinfo/*">
    <sch:assert test="namespace-uri() != xs:anyURI('')"
      >An element that is a child of xs:appinfo MUST have a namespace name.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>The XML namespaces specification includes the concept of content not
            in a namespace. Use of elements without namespaces can lead to
            conflicting data definitions, and makes it difficult to identify
            relevant data definitions.</p>
        </ruleSection>
        <ruleSection>
          <title>Appinfo descendants are not XML Schema elements</title>
          <rule applicability="REF EXT" id="no-xs-in-appinfo" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-no-xs-in-appinfo">
<sch:pattern>
  <sch:rule context="xs:appinfo//xs:*">
    <sch:assert test="false()"
      >An element with a namespace name of xs: MUST NOT have an ancestor element xs:appinfo.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>NIEM-conformant schemas are designed to be very easily
            processed. Although uses of XML Schema elements as content
            of <qName>xs:appinfo</qName> elements could be contrived, it is not
            current practice and complicates the processing of XML elements by
            their namespaces and names. Forbidding the use of XML Schema elements
            outside valid uses of schema simplifies such processing.</p>
        </ruleSection>
      </section>
    </section>
    <section>
      <title>Schema as a whole</title>

      <p>The XML Schema language defines that the document element <qName>xs:schema</qName> may contain the
        optional attributes <local-name>attributeFormDefault</local-name>
        and <local-name>elementFormDefault</local-name>. The values of these attributes are not material to a
        conformant schema, as each attribute and element defined by a conformant schema is defined as a top-level
        component, and so each is qualified by its target namespace.</p>

m4_dnl copied in from the production of the M4 macro, before I tweaked the macro:
m4_dnl   MACRO_HAS_DATA_DEFINITION(Schema, sch, xs:schema, A schema document element)

      <ruleSection>
        <title>Schema has data definition</title>
        <rule applicability="REF EXT" class="Constraint" id="rule-schema-has-dd">
          <pre><xmlBlurb id="xb-rule-schema-has-dd" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:schema">
    <sch:assert test="some $definition in (xs:annotation/xs:documentation)[1] satisfies
                        string-length(normalize-space(string($definition))) &gt; 0"
      >An element xs:schema MUST have a data definition.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

      <ruleSection>
        <title>Schema document defines target namespace</title>
        <rule applicability="REF EXT" id="req-target-ns" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="require-target-namespace">
<sch:pattern>
  <sch:rule context="xs:schema">
    <sch:assert test="exists(@targetNamespace)"
      >The schema MUST define a target namespace.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>

        <p>Schemas without defined namespaces provide definitions that are
          ambiguous, in that they are not universally identifiable.</p>

      </ruleSection>

      <ruleSection>
        <title>Target namespace is absolute URI</title>

        <rule applicability="REF EXT" id="target-ns-is-rfc3986" class="Constraint">
          <p><![CDATA[The value of the attribute targetNamespace MUST match the production <absolute-URI> as
               defined by RFC 3986.]]></p>
        </rule>

        <p>Absolute URIs are the only universally meaningful URIs. URIs include
          both URLs and URNs. Finding the target namespace using standard XML
          Base technology is complicated and not specified by XML
          Schema. Relative URIs are not universally identifiable, as they are
          context-specific. <code>&lt;absolute-URI&gt;</code> is a grammar production defined by
          MACRO_REF_EXTERNAL(RFC3986,MACRO_HREF_RFC_3986[[[]]]#section-4.3,4.3,Absolute URI). </p>
      </ruleSection>

      <ruleSection>
        <title>Schema has version</title>

      <p>It is very useful to be able to tell one version of a schema from
      another. Apart from the use of namespaces for versioning, it is sometimes
      necessary to release multiple versions of schema documents. Such use might
      include:</p>

      <ul>
        <li><p>Subset schemas and constraint schemas</p></li>
        <li><p>Error corrections or bug fixes</p></li>
        <li><p>Documentation changes</p></li>
        <li><p>Contact information updates</p></li>
      </ul>

      <p>In such cases, a different value for the <local-name>version</local-name> attribute
        implies a different version of the schema. No specific meaning is
        assigned to specific version identifiers.</p>

      <p>An author of an application schema or exchange may use the <local-name>version</local-name> attribute
        for these purposes within their schemas.</p>

        <rule applicability="REF EXT" id="has-version" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xb-has-version">
<sch:pattern>
  <sch:rule context="xs:schema">
    <sch:assert test="some $version in @version satisfies
                      string-length(normalize-space(@version)) &gt; 0"
        >An element xs:schema MUST have an attribute {}version that MUST NOT be empty.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

      <ruleSection>
        <title>No disallowed substitutions</title>
        <rule applicability="REF" id="no-blockdefault" class="Constraint">
          <pre><xmlBlurb memberOf="ref" id="xb-no-blockdefault">
<sch:pattern>
  <sch:rule context="xs:schema">
    <sch:assert test="empty(@blockDefault)"
      >An element xs:schema MUST NOT have an attribute {}blockDefault.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

      <ruleSection>
        <title>No disallowed derivations</title>
        <rule applicability="REF" id="no-finalDefault" class="Constraint">
          <pre><xmlBlurb memberOf="ref" id="xb-no-finalDefault">
<sch:pattern>
  <sch:rule context="xs:schema">
    <sch:assert test="empty(@finalDefault)"
      >An element xs:schema MUST NOT have an attribute {}finalDefault.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

    </section>
    <section><title>Schema assembly</title>
      <ruleSection>
        <title>No use of <qName>xs:redefine</qName></title>
        <rule applicability="REF EXT" id="no-redefine" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xb-no-xs-redefine">
<sch:pattern>
  <sch:rule context="xs:redefine">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:redefine.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
        <p>The <qName>xs:redefine</qName> element allows an XML Schema document to restrict and extend components
          from a namespace, in a separate schema document from the one that initially defined that
          namespace. Such redefinition introduces duplication of definitions, allowing multiple definitions to
          exist for components from a single namespace. This violates
          <ref idref="principle-one-ref-schema-per-namespace"/>, that a single reference schema defines a
          NIEM-conformant namespace.</p>

      </ruleSection>

      <ruleSection>
        <title>No use of <qName>xs:include</qName></title>
        <rule applicability="REF EXT" id="no-include" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xb-no-xs-include">
<sch:pattern>
  <sch:rule context="xs:include">
    <sch:assert test="false()"
      >The schema MUST NOT contain the element xs:include.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>

        <p>Element <qName>xs:include</qName> brings schemas defined in separate
          files into the current namespace. It breaks a namespace up into
          arbitrary partial schemas, which needlessly complicates the schema
          structure, making it harder to reuse and process, and also increases
          the likelihood of conflicting definitions.</p>

        <p>Inclusion of schemas that do not have namespaces also complicates
          schema understanding. This inclusion makes it difficult to find the
          realization of a specific schema artifact and create aliases for
          schema components that should be reused. Inclusion of schemas also
          violates <ref idref="principle-one-ref-schema-per-namespace"/>, as it uses
          multiple schemas to construct a namespace.</p>

      </ruleSection>

      <ruleSection>
        <title><qName>xs:import</qName> must have namespace</title>
        <rule applicability="REF EXT" id="xs-import-has-ns" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xs-import-must-have-namespace">
<sch:pattern>
  <sch:rule context="xs:import">
    <sch:assert test="exists(@namespace)"
      >An element xs:import MUST have an attribute {}namespace.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
        <p>An import that does not specify a namespace is enabling references to
          components without namespaces. NIEM requires that all components have a
          defined namespace. It is important that the namespace declared by a
          schema be universally defined and unambiguous.</p>
      </ruleSection>
      <ruleSection>
        <title>XML Schema document set must be complete</title>
        <p>An <termRef>XML Schema document set</termRef> defines an <termRef>XML Schema</termRef> that may be
        used to validate an <termRef>XML document</termRef>. This rule ensures that a schema document set under
        consideration contains definitions for everything that it references; it has everything necessary to do a
        complete validation of XML documents, without any unresolved references. Note that some tools may allow
        validation of documents using partial schemas, when components that are not present are not exercised by
        the XML document under validation. Such a schema does not meet qualify as a <termRef>conformant schema
        document set</termRef>.</p>

        <rule applicability="SET" id="rule-set-is-closed" class="Constraint">
          <p>The schema document set must constitute a complete XML Schema; it must contain the definition of
            every schema component referenced by any component defined by the schema set.</p>
        </rule>

      </ruleSection>
      <section>
        <title>Namespaces for referenced components are imported</title>
        <p>The <termRef>XML Schema definition language</termRef> requires that, when a <termRef>schema
            document</termRef> references a component in some other namespace, it must
            use <qName>xs:import</qName> to import the namespace of the referenced component. The use
            of <qName>xs:import</qName> is described by

            MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#nsi-schema_components,4.2.3,References to schema components across namespaces).</p>

        <p>Some tools do not enforce this constraint; one such tool carries imports from a <termRef>schema
            document</termRef> into <termRef term="schema document">schema documents</termRef> that it
            imports. This has the potential to introduce incompatibility into schema documents and schema
            document sets that exercise this bug. To maintain compatibility across tool sets, this requirement is
            an explicit rule for NIEM-conformant schemas.</p>

        <ruleSection>
          <title>Namespace referenced by attribute <local-name>type</local-name> is imported</title>
          <rule applicability="REF EXT" id="xs-import-referenced-namespaces-type" class="Constraint" >
            <pre><xmlBlurb memberOf="ref ext" id="xb-xs-import-referenced-namespaces-type">
<sch:pattern>
  <sch:rule context="xs:*[@type]">
    <sch:assert test="every $namespace in namespace-uri-from-QName(resolve-QName(@type, .)) satisfies (
                        $namespace = nf:get-target-namespace(.)
                        or $namespace = xs:anyURI('MACRO_NS_XS')
                        or nf:get-document-element(.)/xs:import[xs:anyURI(@namespace) = $namespace])"
                >The namespace of a type referenced by @type MUST be the target namespace, the XML Schema namespace, or be imported.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>


        <ruleSection>
          <title>Namespace referenced by attribute <local-name>base</local-name> is imported</title>
          <rule applicability="REF EXT" id="xs-import-referenced-namespaces-base" class="Constraint" >
            <pre><xmlBlurb memberOf="ref ext" id="xb-xs-import-referenced-namespaces-base">
<sch:pattern>
  <sch:rule context="xs:*[@base]">
    <sch:assert test="every $namespace in namespace-uri-from-QName(resolve-QName(@base, .)) satisfies (
                        $namespace = nf:get-target-namespace(.)
                        or $namespace = xs:anyURI('MACRO_NS_XS')
                        or nf:get-document-element(.)/xs:import[xs:anyURI(@namespace) = $namespace])"
                >The namespace of a type referenced by @base MUST be the target namespace, the XML Schema namespace, or be imported.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Namespace referenced by attribute <local-name>itemType</local-name> is imported</title>
          <rule applicability="REF EXT" id="xs-import-referenced-namespaces-itemType" class="Constraint" >
            <pre><xmlBlurb memberOf="ref ext" id="xb-xs-import-referenced-namespaces-itemType">
<sch:pattern>
  <sch:rule context="xs:*[@itemType]">
    <sch:assert test="every $namespace in namespace-uri-from-QName(resolve-QName(@itemType, .)) satisfies (
                        $namespace = nf:get-target-namespace(.)
                        or $namespace = xs:anyURI('MACRO_NS_XS')
                        or nf:get-document-element(.)/xs:import[xs:anyURI(@namespace) = $namespace])"
                >The namespace of a type referenced by @itemType MUST be the target namespace, the XML Schema namespace, or be imported.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Namespaces referenced by attribute <local-name>memberTypes</local-name> is imported</title>
          <rule applicability="REF EXT" id="xs-import-referenced-namespaces-memberTypes" class="Constraint" >
            <pre><xmlBlurb memberOf="ref ext" id="xb-xs-import-referenced-namespaces-memberTypes">
<sch:pattern>
  <sch:rule context="xs:*[@memberTypes]">
    <sch:assert test="every $type in tokenize(normalize-space(@memberTypes), ' '),
                            $namespace in namespace-uri-from-QName(resolve-QName($type, .)) satisfies (
                        $namespace = nf:get-target-namespace(.)
                        or $namespace = xs:anyURI('MACRO_NS_XS')
                        or nf:get-document-element(.)/xs:import[xs:anyURI(@namespace) = $namespace])"
                >The namespace of a type referenced by @memberTypes MUST be the target namespace, the XML Schema namespace, or be imported.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Namespace referenced by attribute <local-name>ref</local-name> is imported</title>
          <rule applicability="REF EXT" id="xs-import-referenced-namespaces-ref" class="Constraint" >
            <pre><xmlBlurb memberOf="ref ext" id="xb-xs-import-referenced-namespaces-ref">
<sch:pattern>
  <sch:rule context="xs:*[@ref]">
    <sch:assert test="every $namespace in namespace-uri-from-QName(resolve-QName(@ref, .)) satisfies
                        $namespace = nf:get-target-namespace(.)
                        or nf:get-document-element(.)/xs:import[xs:anyURI(@namespace) = $namespace]"
                >The namespace of a component referenced by @ref MUST be the target namespace or be imported.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Namespace referenced by attribute <local-name>substitutionGroup</local-name> is imported</title>
          <rule applicability="REF EXT" id="xs-import-referenced-namespaces-sg" class="Constraint" >
            <pre><xmlBlurb memberOf="ref ext" id="xb-xs-import-referenced-namespaces-sg">
<sch:pattern>
  <sch:rule context="xs:*[@substitutionGroup]">
    <sch:assert test="every $namespace in namespace-uri-from-QName(resolve-QName(@substitutionGroup, .)) satisfies
                        $namespace = nf:get-target-namespace(.)
                        or nf:get-document-element(.)/xs:import[xs:anyURI(@namespace) = $namespace]"
                >The namespace of a component referenced by @substitutionGroup MUST be the target namespace or be imported.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

      </section>
    </section>
  </section>

  <section>
    <title>Rules for NIEM modeling, by NIEM concept</title>

    <p>This section focuses on building NIEM data models using the <termRef>XML Schema definition language</termRef>. Whereas
      <ref idref="section-profile-of-xml-schema"/> addressed shrinking the XML Schema definition language to a
      smaller set of features, this section constructs new NIEM-specific features to address modeling and
      interoperability problems. This includes naming rules, categories of types, and augmentations.</p>

    <p>NIEM provides a framework for modeling concepts and relationships as XML artifacts. The data model is
      implemented via XML Schema. However, XML Schema does not provide sufficient structure and constraint to
      enable translating from a conceptual model to a schema and then to instances of the concepts. NIEM provides
      additional support for modeling concepts as schemas and provides rules for creating and connecting data
      that realizes those concepts.</p>

    <p>Underlying the NIEM data model are two namespaces: the <termRef>structures namespace</termRef> and
      the <termRef>appinfo namespace</termRef>. These two namespaces provide schema components that serve two
      functions:</p>

    <ol>
      <li><p>They provide support for connecting structural definitions to concepts.</p></li>
      <li><p>They provide base components from which to derive structural definitions.</p></li>
    </ol>

    <p>These namespaces are distributed with the NIEM data model content but are not themselves considered to be
      <em>content</em> of the data model. They are, instead, part of the <em>structure</em> on which the data
      model is built.</p>

    <p>This section is organized by concept, rather than component type. This section is integrated with the
      following sections:</p>

    <ul>
      <li><p><ref idref="section-niem-schema-modeling-rules" /> is organized by component type, and provides a
      majority of the constraint rules for schemas that define NIEM models.</p></li>
      <li><p><ref idref="section-xml-instance-document-rules" /> provides rules for XML documents that are
      instances of NIEM models.</p></li>
    </ul>

    <p>Concepts covered by this section include:</p>

    <listOfSections/>


    <section><title>Categories of NIEM type definitions</title>

      <p>The rules in this document use the name of a type as the key indicator of the type<char name="rsquo" />s
      category. This makes the rules much simpler than doing a deep examination of each type (and its base types)
      to identify its category. For example, for complex types, the names follow a pattern:</p>

      <ul>
        <li><p>Name ends with <q>AssociationType</q> <char name="rarr"/> type is an association type.</p></li>
        <li><p>Name ends with <q>MetadataType</q> <char name="rarr"/> type is a metadata type.</p></li>
        <li><p>Name ends with <q>AugmentationType</q> <char name="rarr"/> type is an augmentation type.</p></li>
        <li><p>Otherwise <char name="rarr"/> type is an object type.</p></li>
      </ul>

      <ruleSection>
        <title>Complex type has a category</title>
          <rule applicability="REF EXT" id="code-classes" class="Constraint">
            <p>Within the schema, a complex type definition MUST be one of the following:</p>
            <ol>
              <li><p>An object type.</p></li>
              <li><p>An association type.</p></li>
              <li><p>A metadata type.</p></li>
              <li><p>An augmentation type.</p></li>
            </ol>
          </rule>
          <p>This rule establishes the categories of NIEM complex types. It is a limited set, and each category
            has distinct semantics, as described by following sections.</p>
      </ruleSection>
    </section>

      <section><title>Object</title>

        <p>The categories of objects are covered by the following sections:</p>

        <listOfSections/>

        <section><title>General object types</title>

          <definition term="object type">
            <p>In a NIEM-conformant schema, an <strong>object type</strong> is a
              complex type definition, an instance of which asserts the
              existence of an object. An object type represents some kind of
              object: a thing with its own lifespan that has some existence. The
              object may or may not be a physical object. It may be a conceptual
              object.</p>
          </definition>

          <section><title>Object types with complex content</title>

            <ruleSection><title>Object type with complex content is derived from <qName>structures:ObjectType</qName></title>

              <rule applicability="REF EXT" id="object-with-cc-derived-from-object" class="Constraint">
                <pre><xmlBlurb memberOf="ref ext" id="xb-object-with-cc-derived-from-object">
<sch:pattern>
  <sch:rule context="xs:complexType[exists(xs:complexContent)
                                    and MACRO_COMPLEX_TYPE_LOCAL_NAME_IS_OBJECT_TYPE_NAME(@name,[[[                                    ]]])]">
    <sch:assert test="
        every $derivation-method in (xs:complexContent/xs:extension, xs:complexContent/xs:restriction),
              $base in $derivation-method/@base,
              $base-qname in resolve-QName($base, $derivation-method),
              $base-local-name in local-name-from-QName($base-qname) satisfies (
          $base-qname = xs:QName('structures:ObjectType')
          or MACRO_COMPLEX_TYPE_LOCAL_NAME_IS_OBJECT_TYPE_NAME($base-local-name,[[[             ]]]))"
      >An object type with complex content MUST be derived from structures:ObjectType or from another object type.</sch:assert>
  </sch:rule>
</sch:pattern>
                </xmlBlurb></pre>
              </rule>

              <p>A <termRef>base type definition</termRef> with a {target namespace} that is the XML namespace is
                prohibited by <ref idref="rule-base-type-not-xml-ns"/>. A <termRef>base type definition</termRef>
                with a {target namespace} that is not imported as conformant is prohibited by
                <ref idref="type-base-from-ns"/>.</p>

            </ruleSection>
          </section>

        </section>

        <section><title>Role types and roles</title>

            <p>NIEM differentiates between an object and a role of the object. The term <q>role</q> is used here
              to mean a function or part played by some object. The simplest way to represent a role of an object
              is to use an element. The following element declaration models the role of a person who undergoes
              an assessment:</p>

            <figure>
              <title>An element declaration that constitutes a role without the use of a role type</title>
              <pre><xmlBlurb id="xb-figure-example-of-element-as-role">
<xs:element name="AssessmentPerson" type="nc:PersonType" nillable="true">
  <xs:annotation>
    <xs:documentation>A person who undergoes an assessment.</xs:documentation>
  </xs:annotation>
</xs:element>
              </xmlBlurb></pre>
            </figure>

            <p>In many cases, there is a further need to represent characteristics and additional information
              associated with a role of an object. In such cases, the above element is insufficient. When a role
              must be modeled with additional information, a <termRef>role type</termRef> is called for.</p>

            <p>For example, when a person is a driver involved in an automotive crash, that person has a
              particular role in the crash, which is modeled by the element <qName>j:CrashDriver</qName>.</p>

            <figure><title>Element <qName>j:CrashDriver</qName>, modeling the role of a driver in a crash</title>
              <pre><xmlBlurb id="xb-figure-role-element-j-CrashDriver">
<xs:element name="CrashDriver" type="j:CrashDriverType" nillable="true">
  <xs:annotation>
    <xs:documentation>A motor vehicle driver involved into a traffic accident.</xs:documentation>
  </xs:annotation>
</xs:element>
              </xmlBlurb></pre>
            </figure>

            <p>There is more information associated with this role of the driver than just his identity as a
              person. Information associated with this role include the drivers license, contributing
              circumstances, distractions, and other properties. These characteristics are modeled as shown in
              the following figure. The role is modeled as a <termRef>role type</termRef>:</p>

            <figure id="figure-role-type-j-crash-driver-type">
              <title >Role type <qName >j:CrashDriverType</qName >,
                modeling a driver involved in a crash</title>
              <pre><xmlBlurb id="xb-figure-role-type-j-CrashDriverType">
<xs:complexType name="CrashDriverType">
  <xs:annotation>
    <xs:documentation>A data type for a motor vehicle driver involved in a traffic accident.</xs:documentation>
  </xs:annotation>
  <xs:complexContent>
    <xs:extension base="structures:ObjectType">
      <xs:sequence>
        <xs:element ref="nc:RoleOfPerson" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="j:DriverLicense" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="j:CrashDriverContributingCircumstances" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="j:CrashDriverDistraction" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="j:CrashDriverViolation" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="j:CrashDrivingViolation" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="j:CrashDriverAugmentationPoint" minOccurs="0" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
              </xmlBlurb></pre>
            </figure>

            <p>Role types were introduced into NIEM after XML Schema extension proved to be insufficient in
              certain situations. An object may have multiple functions in the same instance document, each with
              associated data.  For example, a person might be both a <qName>j:CrashDriver</qName> and
              a <qName>j:ArrestSubject</qName>. Without roles, information about the person would be duplicated
              in extensions, or would be left ambiguously blank in some places.</p>

            <p>Role types and RoleOf elements enable more precise semantics. With roles, a single base object
              (e.g., a person) can have multiple roles or functions within a message (e.g., a victim, a witness,
              and a subject). A role type can reference a base object, rather than duplicate it. Role types allow
              function information to be defined once for multiple base objects, such as a
              single <qName>j:VictimType</qName>, which represents victim information for persons, organizations,
              and items (e.g., via <qName>nc:RoleOfPerson</qName>, <qName>nc:RoleOfOrganization</qName>, and
              <qName>nc:RoleOfItem</qName>).</p>

            <p>The term <termRef>role type</termRef> has a normative definition:</p>

            <definition term="role type">
              <p>A <strong>role type</strong> is an <termRef>object type</termRef> that represents a particular
                function, purpose, usage, or role of one or more objects of its base type.</p>
            </definition>

            <p>A <termRef>role type</termRef> describes a role of a thing. A role is a function or position
              played by something in a particular situation or context. A <termRef>role type</termRef> holds
              information that is specific to the role, but that is not specific to the context, and is not
              specific to thing that plays the role.</p>

            <p>In the example (<ref idref="fig-role-instance"/>), a person (John Doe) has the role of being a
              driver in a crash. Associated with this role are descriptions of a law violation related to him and
              a law violation related to his driving behavior. These are properties of his role as a driver in a
              crash.</p>

            <p>This data is described by a <termRef>role type</termRef>, <qName>j:CrashDriverType</qName>
              (described by <ref idref="figure-role-type-j-crash-driver-type"/>), which carries elements and
              attributes that are properties of the role. The role type also carries a <termRef>RoleOf
              element</termRef>, which indicates the base type for the role. The <termRef>role type</termRef>
              describes a role of the base type, which in this case is <qName>nc:PersonType</qName>, as
              identified by the type of <qName>nc:RoleOfPerson</qName> defined by
              <ref idref="figure-decl-of-nc-roleofperson"/>.</p>

            <p>Developers of NIEM-conformant schemas and exchanges should create and use role types whenever they
              have information specific to a base object<char name="rsquo" />s function. Such information is a
              characteristic of the role, and not of the base object. Information that is a characteristic of a
              base object probably does not belong in a role type.</p>

            <definition term="RoleOf element">
              <p>A <strong>RoleOf element</strong> is an <termRef >element declaration</termRef >
                that</p>
              <ul>
                <li><p>is defined by a <termRef >reference schema document</termRef > or
                    an <termRef >extension schema document</termRef >, and</p></li>
                <li><p>has a {name} that begins with <q>RoleOf</q>.</p></li>
              </ul>
              <p>A RoleOf element represents a base type for a <termRef>role type</termRef>.</p>
            </definition>

            <p>We saw the use of <termRef>RoleOf element</termRef> <qName>nc:RoleOfPerson</qName> in
            <ref idref="figure-role-type-j-crash-driver-type"/>. Its definition is the following figure:</p>

            <figure id="figure-decl-of-nc-roleofperson">
              <title >Declaration of RoleOf element <qName >nc:RoleOfPerson</qName ></title >
              <pre><xmlBlurb id="xb_figure-roleof-element-nc-RoleOfPerson">
<xs:element name="RoleOfPerson" type="nc:PersonType" substitutionGroup="nc:RoleOf" nillable="true">
  <xs:annotation>
    <xs:documentation>A person of whom the role object is a function.</xs:documentation>
  </xs:annotation>
</xs:element>
              </xmlBlurb></pre>
            </figure>

            <p>Here is an example of the <qName>j:CrashDriver</qName> role type used in an instance:</p>

            <figure id="fig-role-instance">
              <title>An XML instance of a role type</title>
              <pre><xmlBlurb id="xb-role-instance-j-CrashDriver">
<j:CrashDriver>
  <nc:RoleOfPerson structures:ref="BRAVO" xsi:nil="true"/>
  <j:CrashDriverViolationCode>A10</j:CrashDriverViolationCode>
  <j:CrashDrivingViolationCode>S16</j:CrashDrivingViolationCode>
</j:CrashDriver>
<nc:Person structures:id="BRAVO">
  <nc:PersonBirthDate>
    <nc:Date>1966-06-06</nc:Date>
  </nc:PersonBirthDate>
  <nc:PersonName>
    <nc:PersonFullName>John Doe</nc:PersonFullName>
  </nc:PersonName>
</nc:Person>
              </xmlBlurb></pre>
            </figure>

            <p>Note that the value of the <qName>j:CrashPerson</qName> element was indicated above using a
              reference; it could have been shown as a content element, instead.</p>

            <ruleSection><title>RoleOf element type is an object type</title>
              <rule applicability="REF EXT" id="rule-roleOf-is-object-type" class="Constraint">
                <pre><xmlBlurb id="xb-rule-roleOf-is-object-type" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:element[@name[starts-with(., 'RoleOf')]]">
    <sch:assert test="every $type in @type,
                            $type-local-name in local-name-from-QName(resolve-QName($type, .)) satisfies
                        MACRO_COMPLEX_TYPE_LOCAL_NAME_IS_OBJECT_TYPE_NAME($type-local-name,[[[                        ]]])"
      >The type definition of a RoleOf element MUST be an object type.</sch:assert>
  </sch:rule>
</sch:pattern>
                </xmlBlurb></pre>
              </rule>
              <p>Note that by <ref idref="el-type-conformant-ns"/>, the element<char name="rsquo"/>s type must be from a conformant namespace.</p>
            </ruleSection>

            <ruleSection><title>Only object type has RoleOf element</title>
              <rule applicability="REF EXT" id="rule-ct-has-roleOf-is-object-type" class="Constraint">
		<pre><xmlBlurb id="xb-rule-ct-has-roleOf-is-object-type" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:complexType[
      MACRO_IS_NOT_ADAPTER_TYPE
      and exists(descendant::xs:element[
            exists(@ref[
              starts-with(local-name-from-QName(resolve-QName(., ..)), 'RoleOf')])])]">
    <sch:assert test="MACRO_COMPLEX_TYPE_LOCAL_NAME_IS_OBJECT_TYPE_NAME(@name,[[[                      ]]])"
      >A complex type that includes a RoleOf element in its content model MUST be an object type.</sch:assert>
  </sch:rule>
</sch:pattern>
                </xmlBlurb></pre>
              </rule>
              <p>Note that <termRef>RoleOf element</termRef> and <termRef>object type</termRef> are defined
                terms.</p>
            </ruleSection>

            <ruleSection ><title >RoleOf elements indicate the base types of a role type</title >
              <rule applicability="REF EXT INS" class="Interpretation">
		<p >An <termRef>element declaration</termRef> that has a local name
                  that begins with the string <q >RoleOf</q > MUST represent a base type, of which the
                  containing element instance represents a role.</p >
              </rule >
	    </ruleSection>

            <ruleSection ><title >Instance of RoleOf element indicates a role object</title>
              <rule applicability="INS" class="Interpretation">
				<p>When a parent element has a child element valid to
				  an <termRef>element declaration</termRef> that is a <termRef>RoleOf
				  element</termRef>,</p>
				<ul>
				  <li><p>The value of the parent element is a role object.</p></li>
				  <li><p>The value of the child element is a base object of the role object.</p></li>
				</ul>
              </rule>
				
				<p>An instance of a <termRef>RoleOf element</termRef> indicates the base object of a role. The
                prefix <q>RoleOf</q> on the element ensures that a role object may be distinguished from other
                objects and that its link to the base object is also distinguishable from the additional
                properties that are characteristics or other data of the role.</p>
				
	    </ruleSection>

            <p>NIEM does not require that there be only one <termRef>RoleOf element</termRef> within a single
              type, nor does it require that a particular role object have only a single occurrence of
              a <termRef>RoleOf element</termRef>. However, the use of multiple <termRef term="RoleOf element"
              >RoleOf elements</termRef > may not make sense in all cases. An exchange specification may
              restrict <termRef term="RoleOf element" >RoleOf elements</termRef > to a single occurrence within a
              type.</p>

            <p>This specification does not require that a <termRef>RoleOf element</termRef> occur in an instance
              of a <termRef>role type</termRef>. In such a case, the instance of the role type behaves like any
              other type; it simply does not have a reference to its base object. For example, we may talk about
              a weapon<char name="rsquo"/>s use in an incident without referring to the car that acted as the
              weapon.</p>

        </section>
        <section id="section-external-adapter-types"><title>External adapter types and external components</title>

          <p>There are a variety of commonly used standards that are represented in XML Schema. Such schemas are
          generally not NIEM-conformant. NIEM-conformant schemas may reference components defined by these
          external schema documents. This section provides rules under which NIEM-conformant components may be constructed
          from schema components that are not NIEM-conformant.</p>

          <definition term="external schema document">
            <p>An <strong>external schema document</strong> is any <termRef>schema document</termRef> that is not
            one of</p>
            <ul>
              <li><p>a <termRef>reference schema document</termRef>,</p></li>
              <li><p>an <termRef>extension schema document</termRef>, or</p></li>
              <li><p>a <termRef>schema document</termRef> that has the <termRef>structures namespace</termRef> as its target namespace.</p></li>
            </ul>
          </definition>

          <p>Note that, although the schema document for the <termRef>structures namespace</termRef> is not
            conformant, it is not considered an external schema document because it defines the fundamental
            framework on which NIEM is built; it is considered a supporting namespace. It is not considered an
            external schema document because of its supporting nature and is thus a special case of this
            definition.</p>

          <p>A <termRef>schema component</termRef> defined by an <termRef>external schema document</termRef> may
            be called an <em>external component</em>. A NIEM-conformant type may use external components in its
            definition. There are two ways to integrate external components into a NIEM-conformant schema:</p>

          <ol>
            <li><p>An external adapter type may be constructed from externally-defined elements and attributes. A goal
                of this method is to represent, as a single unit, a set of data that embodies a single concept
                from an external standard. This is an <termRef>external adapter type</termRef>.</p></li>

            <li><p>A type that is not an external adapter type, and which is defined by an extension schema
                document, may incorporate externally-defined attributes.</p></li>

          </ol>

          <figure id="figure-use-of-externals-diagram">
            <title>Use of external components to create a NIEM-conformant type</title>
            <image src="img/use-of-externals.png"/>
          </figure>

          <p>For example, a NIEM-conformant type may be created to represent a bibliographic reference from an
            external standard. Such an object may be composed of multiple elements (of multiple types) from the
            external standard. These pieces are put together to form a single NIEM-conformant <termRef>external
            adapter type</termRef>. For example, an author element, a book element, and a publisher element may
            be used to define a single bibliographic entry type.</p>

          <p>A NIEM-conformant type built from these components may be used as any other NIEM-conformant
            type. That is, elements may be constructed from such a type, and those elements are fully
            NIEM-conformant.</p>

          <p>To construct such a component, a NIEM-conformant schema must import the namespace defined by
            the <termRef>external schema document</termRef>.</p>

      <p><ref idref="xs-import-consistent-with-schema"/> and <ref idref="rule-ext-imports-ext"/> require
        that <qName>xs:import</qName> elements be consistent with an importing <termRef>schema
          document</termRef>.</p>


      <p>A NIEM-conformant schema has well-known documentation points. Therefore, a schema that imports a
        NIEM-conformant namespace need not provide additional documentation for the imported namespace.  However,
        when an external schema document is imported, appropriate documentation must be provided on
        the <qName>xs:import</qName> element. This ensures that documentation for all external schema documents
        will be both available and accessible in a consistent manner.</p>

      <section><title>Import of external namespace</title>
      <ruleSection>
        <title>Import of external namespace has data definition</title>
        <rule applicability="REF EXT" class="Constraint" id="rule-external-import-has-dd">
          <pre><xmlBlurb id="xb-rule-external-import-has-dd" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:import[@appinfo:externalImportIndicator]">
    <sch:assert test="some $definition in xs:annotation/xs:documentation[1] satisfies
                        string-length(normalize-space(string($definition))) &gt; 0"
      >An element xs:import that is annotated as importing an external schema document MUST be a documented component.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

      </section>

            <section><title>External adapter types</title>

      <definition term="external adapter type">
        <p>An <strong>external adapter type</strong> is a NIEM-conformant type that adapts external components for use within NIEM. An external adapter type creates a new class of object that embodies a single concept composed of external components. A NIEM-conformant schema defines an external adapter type.</p>
      </definition>

      <ruleSection>
        <title>External adapter type has indicator</title>
        <rule applicability="REF EXT" class="Interpretation">
          <p>A type is an <termRef>external adapter type</termRef> if and only if it is a complex type with
          application information of attribute <qName>appinfo:externalAdapterTypeIndicator</qName> with a value
          of <code>true</code>.</p>
        </rule>
      </ruleSection>

      <p>An external adapter type should contain the information from an external standard to express a complete
      concept. This expression should be composed of content entirely from an external schema document. Most
      likely, the external schema document will be based on an external standard with its own legacy support.</p>

      <p>In the case of an external expression that is in the form of model groups, attribute groups, or types,
      additional elements and type components may be created in an external schema document, and the external
      adapter type may use those components.</p>

      <p>In normal (conformant) type definition, a reference to an attribute or element is a reference to a
      documented component. Within an external adapter type, the references to the attributes and elements being
      adapted are references to undocumented components. These components must be documented to provide
      comprehensibility and interoperability. Since documentation made available by nonconformant schemas is
      undefined and variable, documentation of these components is required at their point of use, within the
      conformant schema.</p>

      <ruleSection>
        <title>Structure of external adapter type definition follows pattern</title>
        <rule applicability="REF EXT" id="rule-adapter-type-structure" class="Constraint">
          <pre><xmlBlurb id="xb-rule-adapter-type-structure" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:complexType[@appinfo:externalAdapterTypeIndicator]">
    <sch:assert test="xs:complexContent/xs:extension[
                        resolve-QName(@base, .) = xs:QName('structures:ObjectType')
                      ]/xs:sequence"
      >An external adapter type definition MUST be a complex type definition with complex content that extends structures:ObjectType, and that uses xs:sequence as its top-level compositor.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

          <ruleSection>
            <title>Element use from external adapter type defined by external schema documents</title>
            <rule applicability="REF EXT" id="el-ref-from-external" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-el-ref-from-external">
<sch:pattern>
  <sch:rule context="xs:element[@ref
                                and MACRO_IN_ADAPTER_TYPE]">
    <sch:assert test="some $ref-namespace in namespace-uri-from-QName(resolve-QName(@ref, .)) satisfies
                        nf:get-document-element(.)/xs:import[
                          $ref-namespace = xs:anyURI(@namespace)
                          and @appinfo:externalImportIndicator]"
      >An element reference that appears within an external adapter type MUST have a target namespace that is imported as external.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection><title>External adapter type not a base type</title>
            <rule applicability="REF EXT" class="Constraint" id="rule-ref-extadapt-not-base">
              <pre><xmlBlurb memberOf="ref ext" id="xb-rule-ref-extadapt-not-base">
<sch:pattern>
  <sch:rule context="xs:*[(self::xs:extension or self::xs:restriction)
                          and (some $base-qname in resolve-QName(@base, .),
                                    $base-namespace in namespace-uri-from-QName($base-qname) satisfies
                                 nf:get-target-namespace(.) = $base-namespace)]">
    <sch:assert test="nf:resolve-type(., resolve-QName(@base, .))[
                        empty(@appinfo:externalAdapterTypeIndicator)]"
       >An external adapter type definition MUST NOT be a base type definition.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection><title>External adapter type not a base type</title>
            <rule applicability="SET" class="Constraint" id="rule-set-extadapt-not-base">
              <pre><xmlBlurb memberOf="set" id="xb-rule-set-extadapt-not-base">
<sch:pattern>
  <sch:rule context="xs:*[(self::xs:extension or self::xs:restriction)
                          and (nf:has-effective-conformance-target-identifier(., xs:anyURI('MACRO_CT_URI_REF'))
                               or nf:has-effective-conformance-target-identifier(., xs:anyURI('MACRO_CT_URI_EXT')))
                          and (some $base-qname in resolve-QName(@base, .),
                                    $base-namespace in namespace-uri-from-QName($base-qname) satisfies
                                 not($base-namespace = (nf:get-target-namespace(.), xs:anyURI('MACRO_NS_XS'))))]">
    <sch:assert test="nf:resolve-type(., resolve-QName(@base, .))[
                        empty(@appinfo:externalAdapterTypeIndicator)]"
       >An external adapter type definition MUST NOT be a base type definition.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>

            <p>Each external adapter type is meant to stand alone; each type expresses a single concept, and is
              built from schema components from one or more external schema documents.</p>

          </ruleSection>

            </section>

            <section><title>External attribute use</title>

        <ruleSection><title>External attribute use only in external adapter type</title>

          <p>A complex type that is defined by a <termRef>reference schema document</termRef> is permitted to
            contain an attribute use schema component only if it is an <termRef>external adapter
            type</termRef>. This does not apply to a complex type defined by an <termRef>extension schema
            document</termRef>, which is permitted to use external attributes, as long as each attribute use is
            a <termRef>documented component</termRef>, per <ref idref="ext-attr-use-has-dd"/>.</p>

          <rule applicability="REF" id="rule-ext-attr-use-in-eat" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-rule-ext-attr-use-in-eat">
<sch:pattern>
  <sch:rule context="xs:attribute[some $ref-namespace in namespace-uri-from-QName(resolve-QName(@ref, .)),
                                       $import in ancestor::xs:schema[1]/xs:import satisfies (
                                    xs:anyURI($import/@namespace) = $ref-namespace
                                    and exists($import/@appinfo:externalImportIndicator))]">
    <sch:assert test="exists(ancestor::xs:complexType[1]/@appinfo:externalAdapterTypeIndicator)"
      >An external attribute use MUST be in an external adapter type.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>This document defines the term <termRef>external adapter type</termRef>.</p>
        </ruleSection>


        <ruleSection><title>External attribute use has data definition</title>
          <rule applicability="REF EXT" id="ext-attr-use-has-dd" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-ext-attr-use-has-dd">
<sch:pattern>
  <sch:rule context="xs:attribute[some $ref-namespace in namespace-uri-from-QName(resolve-QName(@ref, .)),
                                       $import in ancestor::xs:schema[1]/xs:import satisfies (
                                    xs:anyURI($import/@namespace) = $ref-namespace
                                    and exists(@appinfo:externalImportIndicator))]">
    <sch:assert test="some $documentation in xs:annotation/xs:documentation[1] satisfies
                        string-length(normalize-space(string($documentation))) &gt; 0"
      >An external attribute use MUST be a documented component with a non-empty data definition.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>The terms <termRef>documented component</termRef> and <termRef>data definition</termRef> are defined.</p>
        </ruleSection>


        <ruleSection><title>External attribute use not an ID</title>
          <p>NIEM schemas use <qName>structures:id</qName> to enable references between components. Each
          NIEM-defined complex type must incorporate a definition
          for <qName>structures:id</qName>. MACRO_REF_EXTERNAL(XML,MACRO_HREF_XML#one-id-per-el,3.3.1,Attribute Types) entails that a complex type may have no more than one ID attribute. This means that an external
          attribute use must not be an ID attribute.</p>
          <rule applicability="SET" id="ext-attr-not-id" class="Constraint">
            <p>An attribute use schema component MUST NOT have an {attribute declaration} with an ID type.</p>
          </rule>
          <p>The term <q>attribute use schema component</q> is defined by
            MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#AU_details,3.5.1,The Attribute Use Schema Component).
            Attribute type ID is defined by
            MACRO_REF_EXTERNAL(XML,MACRO_HREF_XML#sec-attribute-types,3.3.1,Attribute Types).</p>
        </ruleSection>


            </section>

            <section><title>External element use</title>

        <ruleSection><title>External element use has data definition</title>
          <rule applicability="REF EXT" id="rule-ext-element-use-has-dd" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-ext-attr-use-has-dd">
<sch:pattern>
  <sch:rule context="xs:element[
      some $ref-namespace in namespace-uri-from-QName(resolve-QName(@ref, .)) satisfies
        nf:get-document-element(.)/self::xs:schema//xs:import[
          xs:anyURI(@namespace) = $ref-namespace
          and @appinfo:externalImportIndicator]]">
    <sch:assert test="some $documentation in xs:annotation/xs:documentation[1] satisfies
                        string-length(normalize-space(string($documentation))) &gt; 0"
      >An external attribute use MUST be a documented component with a non-empty data definition.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>The terms <termRef>documented component</termRef> and <termRef>data definition</termRef> are defined.</p>
        </ruleSection>

            </section>

        </section>
        <section><title>Code types</title>

            <definition term="code type">
              <p>A <strong>code type</strong> is a NIEM object type for which each simple value carried by the
              type corresponds to an entry in a list of distinct conceptual entities.</p>
            </definition>

            <p>These types represent lists of values, each of which has a known
              meaning beyond the text representation. These values may be
              meaningful text or may be a string of alphanumeric identifiers
              that represent abbreviations for literals.</p>

            <p>Many code types have simple content composed of <qName>xs:enumeration</qName> values. Code types
              may also be constructed using the <em><a href="MACRO_HREF_CODE_LISTS">NIEM Code Lists
              Specification</a></em> <ref idref="code-lists-spec"/>, which supports code lists defined using a
              variety of methods, including CSV spreadsheets.</p>

            <ruleSection><title>Name of code type ends in <q>CodeType</q></title>
              <rule applicability="REF EXT" id="rule-code-type-name-suffix" class="Constraint">
                <pre><xmlBlurb id="xb-rule-code-type-name-suffix" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:complexType[exists(xs:simpleContent[
                       exists(xs:*[local-name() = ('extension', 'restriction')
                                   and (ends-with(@base, 'CodeSimpleType')
                                   or ends-with(@base, 'CodeType'))])])]">
    <sch:report role="warning"
        test="not(ends-with(@name, 'CodeType'))"
      >A complex type definition with a {base type definition} of a code type or code simple type SHOULD have a {name} that ends in 'CodeType'.</sch:report>
  </sch:rule>
</sch:pattern>
                </xmlBlurb></pre>
              </rule>

              <p>See <ref idref="section-code-simple-type"/> for the definition of <termRef>code simple
              type</termRef>.</p>

            </ruleSection>

            <ruleSection>
              <title>Code type corresponds to a code list</title>

              <rule applicability="REF EXT" id="code-type-has-list" class="Constraint">
                <p>A complex type SHOULD have a name ending in <q>CodeType</q> if and only if it has a
                  correspondence to a list of distinct conceptual entities.</p>
              </rule>
            </ruleSection>

            <ruleSection>
              <title>Element of code type has code representation term</title>
              <rule applicability="REF EXT" id="rule-element-of-code-type-has-code-rep-term" class="Constraint">
                <pre><xmlBlurb id="xb-rule-element-of-code-type-has-code-rep-term" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:element[exists(@name) and exists(@type) and ends-with(@type, 'CodeType')]">
    <sch:report role="warning"
        test="not(ends-with(@name, 'Code'))"
      >An element with a type that is a code type SHOULD have a name with representation term "Code"</sch:report>
  </sch:rule>
</sch:pattern>
                </xmlBlurb></pre>
              </rule>
            </ruleSection>

            <p>Using the qualifier <code>Code</code>
              (e.g. <code>CodeType</code>, <code>CodeSimpleType</code>)
              immediately identifies that a data component may carry values from a fixed list of
              codes. These types may be handled in specific ways, as lists of
              codes are expected to have their own lifecycles, including
              versions and periodic updates. Codes may also have responsible
              authorities behind them who provide concrete semantic bindings for
              the code values.</p>

        </section>
        <section id="section-proxy-types"><title>Proxy types</title>

            <p>The NIEM 4.0 release schema <code>niem/proxy/xsd/4.0/xs.xsd</code> provides complex type bases for
              some of the simple types in the XML Schema namespace. The complex types in this schema reuse the
              local names of the XML Schema simple types they extend, even though those names
              don<char name="rsquo"/>t follow the naming structure of most conformant complex types. There is a
              special exception to naming rules to allow the reuse of the XML Schema simple type names in
              conformant schemas. This is done to make conformant schemas more understandable to people that are
              familiar with the names of the XML Schema namespace simple types.</p>

            <p>A complex type that is a direct extension of a simple type from the XML Schema namespace (e.g.,
              <qName>xs:string</qName>, <qName>xs:integer</qName>, <qName>xs:boolean</qName>) is allowed to have
              the same local name as the XML Schema simple type, if and only if the extension adds no content
              other than the attribute group <qName>structures:SimpleObjectAttributeGroup</qName>. This allows
              for an intuitive name when using an XML Schema simple type in a conformant schema.</p>

          <ruleSection>
            <title>Proxy type has designated structure</title>

            <rule applicability="REF EXT" class="Constraint" id="proxy-type-structure">
              <pre><xmlBlurb memberOf="ref ext" id="xb-proxy-type-structure">
<sch:pattern>
  <sch:rule context="MACRO_MATCH_PROXY_TYPE([[[                     ]]])">
    <sch:assert test="xs:simpleContent[
                        xs:extension[
                          empty(xs:attribute)
                          and count(xs:attributeGroup) = 1
                          and xs:attributeGroup[
                                resolve-QName(@ref, .) = xs:QName('structures:SimpleObjectAttributeGroup')]]]"
      >A proxy type MUST have the designated structure. It MUST use xs:extension. It MUST NOT use xs:attribute. It MUST include exactly one xs:attributeGroup reference, which must be to structures:SimpleObjectAttributeGroup.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

        </section>
      </section>
      <section id="section-associations"><title>Associations</title>

        <p>Within NIEM data, an <termRef>association</termRef> is a specific relationship between
          objects. Associations are used when a simple NIEM property is insufficient to model the relationship
          clearly, or when you want to model properties of the relationship itself.</p>

        <p>Here is an example of an association in an XML instance:</p>

        <figure>
          <title>An association in an instance</title>
<pre><xmlBlurb id="xml-association-instance">
<scr:PersonPhoneAssociation>
  <nc:Person>
    <nc:PersonName>
      <nc:PersonFullName>John Doe</nc:PersonFullName>
    </nc:PersonName>
  </nc:Person>
  <nc:TelephoneNumber>
    <nc:FullTelephoneNumber>
      <nc:TelephoneNumberFullID>(212)555-1212</nc:TelephoneNumberFullID>
    </nc:FullTelephoneNumber>
  </nc:TelephoneNumber>
</scr:PersonPhoneAssociation>
</xmlBlurb></pre>
        </figure>
        <p>This example shows an association between a person and a phone number. This relationship is defined by
          the <termRef>association element declaration</termRef>
          <qName>scr:PersonPhoneAssociation</qName>, the structure of which is defined by the
          <termRef>association type</termRef> <qName>scr:PersonPhoneAssociationType</qName>. In practice,
          an <termRef>association type</termRef> usually defines what kinds of things the association relates,
          while the association element may refine the meaning of the association.</p>

        <p>An example of an association type defined by an XML Schema document follows, in
          <ref idref="figure-defn-of-assn-type"/>.</p>

        <p>Note that the NIEM Core schema in NIEM 4.0 defines a type <qName>nc:AssociationType</qName>, which
          acts as the base type for all of the other association types defined within NIEM Core. This is a
          convention adopted by that version of NIEM Core namespace, but is not a requirement of this
          document. An implementer of a NIEM-conformant schema is not required by this specification to base a
          new association type on <qName>nc:AssociationType</qName>.</p>

        <figure id="figure-defn-of-assn-type">
          <title>A definition of an association type</title>
<pre><xmlBlurb id="xml-defn-of-assn-type">
  <xs:complexType name="PersonPhoneAssociationType">
    <xs:annotation>
      <xs:documentation>A data type for a relationship between a PERSON and a PHONE.</xs:documentation>
    </xs:annotation>
    <xs:complexContent>
      <xs:extension base="nc:AssociationType">
        <xs:sequence>
          <xs:element ref="nc:Person" minOccurs="0" maxOccurs="unbounded"/>
          <xs:element ref="nc:TelephoneNumber" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:element name="PersonPhoneAssociation" type="scr:PersonPhoneAssociationType" nillable="true">
    <xs:annotation>
      <xs:documentation>An association between a PERSON and a PHONE.</xs:documentation>
    </xs:annotation>
  </xs:element>
</xmlBlurb></pre>
        </figure>

        <p>This schema fragment shows the definition of an association type that defines a relationship between a
          person and a telephone number. This is followed by the definition of an association element declaration
          that uses the association type.</p>

        <definition term="association">
          <p>An <em>association</em> is a <termRef>conformant element information item</termRef> that establishes
            a relationship between two or more objects, optionally including properties of that relationship. An
            association is an instance of an <termRef>association element declaration</termRef>, and has a type
            that is an <termRef>association type</termRef>.
          </p>
        </definition>

        <definition term="association element declaration">
          <p>An <strong>association element declaration</strong> is an <termRef>element declaration</termRef>
            declared in a <termRef>reference schema document</termRef> or <termRef>extension schema
            document</termRef> that describes a relationship between two or more objects, optionally including
            properties of that relationship.</p>
        </definition>

        <definition term="association type">
          <p>In a NIEM-conformant schema, an <strong>association type</strong> is a <termRef>complex type
              definition</termRef> defined in a <termRef>reference schema document</termRef>
              or <termRef>extension schema document</termRef> that establishes a relationship between two or more
              objects, optionally including the properties of that relationship.</p>
        </definition>

        <section><title>Association types</title>
          <ruleSection><title>Association type derived from <qName>structures:AssociationType</qName></title>
            <rule applicability="REF EXT" id="rule-association-type-derived-from-association-type" class="Constraint">
              <pre><xmlBlurb id="xb-rule-association-type-derived-from-association-type" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:complexType">
    <sch:let name="is-association-type" value="exists(@name[MACRO_NAME_IS_ASSOCIATION_TYPE_NAME(.)])"/>
    <sch:let name="has-association-base-type" value="
      exists(xs:complexContent[
        exists(xs:*[local-name() = ('extension', 'restriction')
                    and exists(@base[MACRO_NAME_IS_ASSOCIATION_TYPE_NAME(.)])])])"/>
    <sch:assert test="$is-association-type = $has-association-base-type"
      >A type MUST have an association type name if and only if it is derived from an association type.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
            <p>Associations types are easily identifiable as such and have a common base
              type, <qName>structures:AssociationType</qName>. Using the qualifier <code>Association</code>
              immediately identifies a type as an <termRef>association type</termRef>.</p>
          </ruleSection>
        </section>
        <section><title>Association element declarations</title>
          <ruleSection><title>Association element type is an association type</title>
            <rule applicability="REF EXT" id="rule-association-el-type-is-association-type" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-rule-association-el-type-is-association-type">
<sch:pattern>
  <sch:rule context="xs:element[exists(@name)]">
    <sch:assert test="exists(@type[MACRO_NAME_IS_ASSOCIATION_TYPE_NAME(.)])
                      = exists(@name[MACRO_ELEMENT_LOCAL_NAME_IS_ASSOCIATION_ELEMENT_NAME(.)])"
      >An element MUST have a name that ends in 'Association' if and only if it has a type that is an association type.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
            <p>Using the qualifier <code>Association</code> immediately identifies an element as representing an
              association. This document defines the term <termRef>association type</termRef>.</p>
          </ruleSection>
        </section>

      </section>
      <section id="section-augmentations"
         xmlns:a="http://example.org/a/"
         xmlns:b="http://example.org/b/"
         xmlns:my-iepd="http://example.org/my-iepd/"
         ><title>Augmentations</title>

        <p>Developers of domain schemas and other schemas that build on and extend the NIEM release schemas need
          to be able to define additional characteristics of common types. For example, the JXDM domain, which
          addresses justice and public safety concerns, considers the following elements to be characteristics of
          a person, as defined by <qName>nc:PersonType</qName>:</p>

        <ul>
          <li><p><qName>j:PersonMedicalInsuranceIndicator</qName></p></li>
          <li><p><qName>j:PersonProfessionalCertificateText</qName></p></li>
          <li><p><qName>j:PersonSightedIndicator</qName></p></li>
          <li><p><qName>j:PersonFBIIdentification</qName></p></li>
        </ul>

        <p>There are several approaches that could be used to by a domain to add elements to a common type. One
          method is to have each domain create an extension of <qName>nc:PersonType</qName>
          (using <qName>xs:extension</qName>) that adds elements and attributes for the needed content. Some of
          the problems with this approach include:</p>

        <ul>
          <li><p>It results in numerous, domain-specific specializations of <qName>nc:PersonType</qName>, each
              with common content and extension-specific content.</p></li>

          <li><p>There is no method for the developer of an information exchange package description (IEPD) to bring
              these types back together into a single type that carries the attributes desired for the IEPD. XML
              Schema does not support multiple inheritance, so there would be no way to join
              together <code>nc:PersonType</code>, <code>j:PersonType</code>,
              and <code>im:PersonType</code>.</p></li>

          <li><p>There is no standard or easy way for the developer to express that the various element instances
              of the various person types represent the same person, or which parts of those instances are
              required to be populated; does each person restate the name and birth-date, or is that handled by
              just one instance?</p></li>

        </ul>

        <p>This approach turns into a morass that is difficult to use and maintain, and which does
          not scale to support the breadth of the NIEM community.</p>

        <p>To handle this need, NIEM has adopted augmentations. There are several parts that fit together for the
          definition and use of augmentations:</p>

        <ul>
          <li><p>Each object type and association type carries an augmentation point element, which provides a
              place for domain- and extension-specific content in the type. Augmentation points are optional in
              extension schema documents, but must appear in reference schema documents. Augmentation points are
              also defined for the base types for <termRef term="object type">object types</termRef>
              and <termRef term="association type">association types</termRef>:</p>
            <ul>
              <li><p><qName>structures:ObjectType</qName> has augmentation
                  point <qName>structures:ObjectAugmentationPoint</qName>.</p></li>
              <li><p><qName>structures:AssociationType</qName> has augmentation
                  point <qName>structures:AssociationAugmentationPoint</qName>.</p></li>
            </ul>
          </li>
          <li><p>A developer of a domain or other schema that extends common types may define elements that are
              substitutable for an augmentation point. Each of these elements expresses an additional
              characteristic or relationship of the base type.</p></li>
          <li><p>A developer may also define an augmentation type, and a corresponding augmentation element of
              that type, which acts as a container of elements that apply to the base type. An augmentation
              element is defined to be substitutable for an augmentation point, which enables it to appear in
              instances of that base type.</p></li>
          <li><p>A developer of an information exchange may choose, through selection and subsetting reference
              schemas:</p>
            <ul>
              <li><p>Which types will carry augmentation point elements, and the cardinality (i.e. minOccurs,
                  maxOccurs) of those augmentation point elements</p></li>
              <li><p>Which elements will be included that substitute for an augmentation point. Some of these may
                  be direct elements, while others may have an augmentation type, and carry multiple elements for
                  the base type.</p></li>
              <li><p>Which elements will be carried within the augmentation types; each of these will apply to
                  its base type.</p></li>
            </ul>
          </li>
          <li><p>Augmentation point elements also appear on <qName>structures:ObjectType</qName>
          and <qName>structures:AssociationType</qName>. This allows schema developers to define elements that
          may be applied to <em>any</em> object or association.</p></li>
        </ul>

        <p>In addition, a developer may create an extension of a base type and have it carry augmentation
          elements, in order to avoid element substitution and flexible content models; whether to substitute or
          concretely use the elements is at the discretion of the developers and implementers of an information
          exchange.</p>

        <p>The term <termRef>augmentation</termRef> describes any element in a NIEM-conformant instance XML
          document that appears as a result of being substituted for an augmentation point element. Such an
          element may have a type that is an <termRef>augmentation type</termRef>, or it may be a direct element
          that represents a property.</p>

        <definition term="augmentation">
          <p>An <strong>augmentation</strong> is a <termRef>conformant element information item</termRef>
          that:</p>
          <ol>
            <li><p>is an instance of an <termRef>augmentation element declaration</termRef>,</p></li>
            <li><p>is a child of a <termRef>conformant element information item</termRef> that is an instance of
                  an <termRef>augmentable type</termRef>, and</p></li>
            <li><p>appears in the instance as a substitution for an augmentation point element.</p></li>
          </ol>
        </definition>

        <p>As an example, here is a definition for <qName>nc:PersonType</qName>, which includes its augmentation
        point element:</p>

        <figure>
          <title>Definition of augmentable type <qName>nc:PersonType</qName></title>
          <pre><xmlBlurb id="xb-fig-augmentable-type">
<xs:complexType name="PersonType">
  <xs:annotation>
    <xs:documentation>A data type for a human being.</xs:documentation>
  </xs:annotation>
  <xs:complexContent>
    <xs:extension base="structures:ObjectType">
      <xs:sequence>
        <xs:element ref="nc:PersonBirthDate" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="nc:PersonName" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="nc:PersonAugmentationPoint" minOccurs="0" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
          </xmlBlurb></pre>
        </figure>

        <p>Note that the augmentation point element has the same namespace and name as the type, with the
          suffix <q>Type</q> replaced by <q>AugmentationPoint</q>. The augmentation point is also defined with
          cardinality (minOccurs 0, maxOccurs unbounded) to ensure that it can support an arbitrary number of
          augmentations, and can be subset or constrained as needed. The augmentation point is the last element
          used by its type; it is always last in the sequence. The definition of the augmentation point is pretty
          simple:</p>

        <figure><title>Declaration of augmentation point element <qName>nc:PersonAugmentationPoint</qName></title>
          <pre><xmlBlurb id="xb-fig-decl-of-augmentation-point-element">
<xs:element name="PersonAugmentationPoint" abstract="true">
  <xs:annotation>
    <xs:documentation>An augmentation point for PersonType.</xs:documentation>
  </xs:annotation>
</xs:element>
          </xmlBlurb></pre>
        </figure>

        <p>The augmentation point element is abstract and typeless. This enables the substitution of elements
        that have simple content, elements that have complex content, or elements that are of an augmentation
        type. The JXDM domain defines an augmentation type and a corresponding augmentation element that
        substitutes for this augmentation point:</p>

        <figure><title>Declaration of augmentation type and element</title>
          <pre><xmlBlurb id="xb-fig-def-of-augmentation-type">
<xs:complexType name="PersonAugmentationType">
  <xs:annotation>
    <xs:documentation>A data type for additional information about a person.</xs:documentation>
  </xs:annotation>
  <xs:complexContent>
    <xs:extension base="structures:AugmentationType">
      <xs:sequence>
        <xs:element ref="j:PersonMedicalInsuranceIndicator" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="j:PersonProfessionalCertificateText" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="j:PersonSightedIndicator" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="j:PersonFBIIdentification" minOccurs="0" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>

<xs:element name="PersonAugmentation" type="j:PersonAugmentationType"
            substitutionGroup="nc:PersonAugmentationPoint">
  <xs:annotation>
    <xs:documentation>Additional information about a person.</xs:documentation>
  </xs:annotation>
</xs:element>
          </xmlBlurb></pre>
        </figure>

        <p>The augmentation type is derived from <qName>structures:AugmentationType</qName> and has a name ending
          in <q>AugmentationType</q>. The augmentation element uses the type, and has a name ending
          in <q>Augmentation</q>. Note that the thing that binds the augmentation type to the augmentation point
          is the augmentation element<char name="rsquo"/>s use of the augmentation point element as its substitution group. This
          means that an augmentation type can be reused for multiple types, by creating more augmentation
          elements that have that type, each with its own substitution group for a different augmentation
          point.</p>

        <p>In addition to defining elements that use an augmentation type, a schema document may define an
          element that substitutes for an augmentation point element, but does not use an augmentation type. For
          example, the following CBRN namespace defines an augmentation to <qName>nc:ScheduleType</qName>. While
          an element of an augmentation type acts as a container, holding elements that apply to an augmented
          object, this element is a direct property of a schedule, providing a meaningful characteristic (hours
          of operation) for a schedule. The resulting syntax is briefer than it would be using an augmentation
          type; the resulting instance looks similar to how it might look if the schedule type had been extended,
          rather than augmented.</p>

        <figure>
          <title>An augmentation that is not an augmentation type</title>
          <pre><xmlBlurb id="xb-fig-augmentation-not-augmentation-type">
<xs:element name="OperatingSchedule" type="cbrn:OperatingScheduleType"
            substitutionGroup="nc:ScheduleAugmentationPoint">
  <xs:annotation>
    <xs:documentation>A schedule providing the beginning and ending hours of operation by weekday, for a designated time period.</xs:documentation>
  </xs:annotation>
</xs:element>
          </xmlBlurb></pre>
        </figure>

        <p>The type of this element is not an augmentation type. Instead, it is its own object, not meant to just
          add to another type:</p>

        <figure>
          <title>A type used for an augmentation</title>
          <pre><xmlBlurb id="xb-fig-type-for-augmentation">
<xs:complexType name="OperatingScheduleType">
  <xs:annotation>
    <xs:documentation>A data type for a schedule providing the beginning and ending hours of operation by weekday, for a designated time period.</xs:documentation>
  </xs:annotation>
  <xs:complexContent>
    <xs:extension base="structures:ObjectType">
      <xs:sequence>
        <xs:element ref="cbrn:ScheduleStartDateTime" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="cbrn:ScheduleEndDateTime" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="cbrn:OperatingScheduleAugmentationPoint" minOccurs="0" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
          </xmlBlurb></pre>
        </figure>

        <p>This method can be used by an information exchange developer to define individual attributes that can
          be applied to any augmentable type.</p>

        <p>Note that the augmentation method can introduce an additional element into every <termRef>object
        type</termRef> or <termRef>association type</termRef> in an exchange, which provides opportunity for some
        errors in schema development. It is important that developers of exchanges not introduce elements
        substitutable for an augmentation point into complex types multiple ways, as it can introduce XML
        Schema<char name="rsquo"/>s Unique Particle Attribution errors. A single complex type should not introduce an element via
        both element substitution and element reference. This constraint is also supported by
        <ref idref="rule-decl-introduced-once"/>.</p>

      <section><title>Augmentable types</title>
        <definition term="augmentable type">
          <p>An <em>augmentable type</em> is <termRef>complex type definition</termRef> that</p>
          <ul>
            <li><p>is defined by either a <termRef>reference schema document</termRef> or by an <termRef>extension schema document</termRef>, and</p></li>
            <li><p>is either</p>
              <ul>
                <li><p>an <termRef>association type</termRef>, or</p></li>
                <li><p>an <termRef>object type</termRef> that has complex content and is not an external adapter type.</p></li>
              </ul>
            </li>
          </ul>
        </definition>

        <ruleSection>
          <title>Augmentable type has augmentation point element</title>
          <rule applicability="REF" id="augmentable-type-has-aug-point" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-augmentable-type-has-aug-point">
<sch:pattern>
  <sch:rule context="MACRO_MATCH_AUGMENTABLE_TYPE([[[                     ]]])">
    <sch:let name="augmentation-point-qname"
             value="MACRO_COMPLEX_TYPE_GET_AUGMENTATION_POINT_QNAME(.,[[[                        ]]])"/>
    <sch:assert test="xs:complexContent/xs:extension/xs:sequence/xs:element[
                        @ref[resolve-QName(., ..) = $augmentation-point-qname]]"
      >An augmentable type MUST contain an element use of its corresponding augmentation point element.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Augmentable type has at most one augmentation point element</title>
          <rule applicability="REF EXT" id="augmentable-type-has-at-most-one-aug-point" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-augmentable-type-has-at-most-one-aug-point">
<sch:pattern>
  <sch:rule context="MACRO_MATCH_AUGMENTABLE_TYPE([[[                     ]]])">
    <sch:let name="augmentation-point-qname"
             value="MACRO_COMPLEX_TYPE_GET_AUGMENTATION_POINT_QNAME(.,[[[                        ]]])"/>
    <sch:assert test="count(xs:complexContent/xs:extension/xs:sequence/xs:element[
                              @ref[resolve-QName(., ..) = $augmentation-point-qname]]) le 1"
      >An augmentable type MUST contain no more than one element use of its corresponding augmentation point element.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

      </section>
      <section><title>Augmentation point element declarations</title>
        <ruleSection><title>Augmentation point element corresponds to its base type</title>
          <rule applicability="REF EXT" id="aug-el-matches-aug-type" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-aug-el-matches-aug-type">
<sch:pattern>
  <sch:rule context="xs:element[MACRO_ELEMENT_IS_AUGMENTATION_POINT_DECL_EXPR([[[                               ]]])]">
    <sch:let name="element-name" value="@name"/>
    <sch:assert test="exists(
                        parent::xs:schema/xs:complexType[
                          @name = MACRO_GET_AUGMENTATION_TYPE_LOCAL_NAME($element-name)
                          and MACRO_COMPLEX_TYPE_IS_AUGMENTABLE_TYPE_EXPR([[[                              ]]])])"
      >A schema document containing an element declaration for an augmentation point element MUST also contain a type definition for its base type, a corresponding augmentable type.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>This document defines the terms <termRef>schema document</termRef>, <termRef>element declaration</termRef>, and <termRef>augmentable type</termRef>.</p>
        </ruleSection>

        <ruleSection>
          <title>An augmentation point element has no type</title>
          <rule applicability="REF EXT" id="aug-pt-untyped" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-aug-pt-untyped">
<sch:pattern>
  <sch:rule context="xs:element[MACRO_ELEMENT_IS_AUGMENTATION_POINT_DECL_EXPR([[[                               ]]])]">
    <sch:assert test="empty(@type)"
        >An augmentation point element MUST have no type.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>Because an augmentation point element has no type, it will be abstract, per
            <ref idref="el-with-no-type-is-abstract"/></p>

        </ruleSection>
        <ruleSection><title>An augmentation point element has no substitution group</title>
          <rule applicability="REF EXT" id="aug-pt-no-subst-grp" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-aug-pt-no-subst-grp">
<sch:pattern>
  <sch:rule context="xs:element[MACRO_ELEMENT_IS_AUGMENTATION_POINT_DECL_EXPR([[[                               ]]])]">
    <sch:assert test="empty(@substitutionGroup)"
        >An augmentation point element MUST have no substitution group.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>
      </section>
      <section><title>Augmentation point element use</title>
        <ruleSection>
          <title>Augmentation point element is only referenced by its base type</title>
          <rule applicability="REF EXT" id="aug-el-in-type" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-aug-el-in-type">
<sch:pattern>
  <sch:rule context="xs:complexType//xs:element[MACRO_ELEMENT_IS_AUGMENTATION_POINT_REF_EXPR([[[                     ]]])]">
    <sch:assert test="MACRO_GET_COMPONENT_QNAME(ancestor::xs:complexType[1])
                      = MACRO_GET_AUGMENTATION_TYPE_QNAME(resolve-QName(@ref, .), [[[                        ]]])"
      >An augmentation point element MUST only be referenced by its base type.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Augmentation point element use is optional</title>
          <rule applicability="REF" id="aug-el-is-optional" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-aug-el-is-optional">
<sch:pattern>
  <sch:rule context="xs:complexType//xs:element[MACRO_ELEMENT_IS_AUGMENTATION_POINT_REF_EXPR([[[                         ]]])]">
    <sch:assert test="exists(@minOccurs) and xs:integer(@minOccurs) = 0"
        >An augmentation point element particle MUST have attribute minOccurs equal to 0.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Augmentation point element use is unbounded</title>
          <rule applicability="REF" id="aug-el-is-unbounded" class="Constraint">
            <pre><xmlBlurb memberOf="ref" id="xb-aug-el-is-unbounded">
<sch:pattern>
  <sch:rule context="xs:complexType//xs:element[MACRO_ELEMENT_IS_AUGMENTATION_POINT_REF_EXPR([[[                         ]]])]">
    <sch:assert test="exists(@maxOccurs) and string(@maxOccurs) = 'unbounded'"
       >An augmentation point element particle MUST have attribute maxOccurs set to unbounded.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Augmentation point element use must be last element in its base type</title>
          <rule applicability="REF EXT" id="aug-ref-is-last" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-aug-ref-is-last">
<sch:pattern>
  <sch:rule context="xs:complexType//xs:element[MACRO_ELEMENT_IS_AUGMENTATION_POINT_REF_EXPR([[[                         ]]])]">
    <sch:assert test="empty(following-sibling::*)"
       >An augmentation point element particle MUST be the last element occurrence in its content model.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

      </section>
      <section>
        <title>Augmentation types</title>
        <definition term="augmentation type">
          <p>An <strong>augmentation type</strong> is a <termRef>complex type definition</termRef> that</p>
          <ol>
            <li><p>provides elements that establish relationships to a base object or association, rather than to
                the instance of the augmentation type itself, and</p></li>
            <li><p>is designed to be the type of an <termRef>augmentation element declaration</termRef>.</p></li>
          </ol>
        </definition>

        <definition term="augmentation element declaration">
          <p>An <em>augmentation element declaration</em> is an <termRef>element declaration</termRef> that</p>
          <ol>
            <li><p>has a type that is an <termRef>augmentation type</termRef>, and</p></li>
            <li><p>carries elements that establish a relationship to its parent object or association</p></li>
            <li><p>is designed to be used as an <termRef>augmentation</termRef> of its parent object or
                association</p></li>
          </ol>
        </definition>

        <p>This term may be mistaken for the term <termRef>augmentation</termRef>. An <termRef>augmentation
          element declaration</termRef> is an element declaration defined by a schemas, while an
          <termRef>augmentation</termRef> is an element information item within an XML document that appears as
          the result of being substituted for an augmentation point.</p>

        <ruleSection>
          <title>Element within instance of augmentation type modifies base</title>
        <rule applicability="INS" class="Interpretation">
          <p>Given:</p>
          <ol>
            <li><p>Some element has a value <var>$base-value</var>.</p></li>
            <li><p>Value <var>$base-value</var> contains element <var>$augmentation</var>.</p></li>
            <li><p>Element <var>$augmentation</var> has property [element declaration] with a value that is
                  an <termRef>augmentation element declaration</termRef>.</p></li>
            <li><p>Element <var>$augmentation</var> has a value, by reference or by content.</p></li>
            <li><p>The value of <var>$augmentation</var> contains element <var>$relationship</var>.</p></li>
            <li><p>Element <var>$relationship</var> has a value, by reference or by content.</p></li>
          </ol>
          <p>Element <var>$relationship</var> establishes a relationship between <var>$base-value</var> and
            the value of <var>$relationship</var>.</p>
        </rule>
        </ruleSection>

        <ruleSection>
          <title>Only an augmentation type name ends in <q>AugmentationType</q></title>
          <rule applicability="REF EXT" id="aug-type-name" class="Interpretation">
            <p>A <termRef>schema component</termRef> that has a name that ends in <q>AugmentationType</q> MUST be
              an <termRef>augmentation type</termRef>.</p>
          </rule>
          <p>The primary indicator that a complex type is an <termRef>augmentation type</termRef> is its
            name. Using the qualifier <code>Augmentation</code> immediately identifies a type as an
            augmentation type.</p>
        </ruleSection>

        <ruleSection>
          <title>Schema component with name ending in <q>AugmentationType</q> is an augmentation type</title>
          <rule applicability="REF EXT" id="rule-augmentation-type-structure" class="Constraint">
            <pre><xmlBlurb id="xb-rule-augmentation-type-structure" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:*[MACRO_NAME_IS_AUGMENTATION_TYPE_NAME(@name)]">
    <sch:assert test="self::xs:complexType/xs:complexContent/xs:*[
                        (self::xs:extension or self::xs:restriction)
                        and MACRO_NAME_IS_AUGMENTATION_TYPE_NAME(@base)]"
       >An augmentation type definition schema component with {name} ending in 'AugmentationType' MUST be an augmentation type definition that is a complex type definition with complex content that extends or restricts an augmentation type.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          <p>The <termRef>base type definition</termRef> of an augmentation type is required to be from a
            conformant namespace by <ref idref="type-base-from-ns"/>.</p>
        </ruleSection>

        <ruleSection>
          <title>Type derived from <qName>structures:AugmentationType</qName> is an augmentation type</title>
          
          <rule applicability="REF EXT" id="rule-type-derived-from-augmentation-type" class="Constraint">
            <pre><xmlBlurb id="xb-rule-type-derived-from-augmentation-type" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:*[(self::xs:restriction or self::xs:extension)
                          and MACRO_NAME_IS_AUGMENTATION_TYPE_NAME(@base)]">
    <sch:assert test="ancestor::xs:complexType[MACRO_NAME_IS_AUGMENTATION_TYPE_NAME(@name)]"
                >A type definition derived from an augmentation type MUST be an augmentation type definition</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>This rule ensures that any type that is derived from an augmentation type,
          including <qName>structures:AugmentationType</qName>, is itself an augmentation type.</p>

        </ruleSection>
        </section>

        <section><title>Augmentation element declarations</title>
          <ruleSection><title>Augmentation element type is an augmentation type</title>
            <rule applicability="REF EXT" id="rule-augmentation-el-type-is-augmentation-type" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-rule-augmentation-el-type-is-augmentation-type">
<sch:pattern>
  <sch:rule context="xs:element[exists(@name)]">
    <sch:assert test="exists(@type[MACRO_NAME_IS_AUGMENTATION_TYPE_NAME(.)])
                      = exists(@name[MACRO_ELEMENT_LOCAL_NAME_IS_AUGMENTATION_ELEMENT_NAME(.)])"
      >An element declaration MUST have a name that ends in "Augmentation" if and only if it has a type that is an augmentation type.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
            <p>Using the qualifier <code>Augmentation</code> immediately
              identifies an element as representing an augmentation.</p>
          </ruleSection>

          <ruleSection><title>Augmentation elements are not used directly</title>
            <rule applicability="REF SET" id="rule-aug-el-not-used" class="Constraint">
              <p>Within a <termRef>reference schema document</termRef>, a complex type definition MUST NOT
                have an element use of</p>
              <ul>
                <li><p>an <termRef>augmentation element declaration</termRef>, or</p></li>
                <li><p>an element declaration that is in the substitution group of an augmentation point element
                    declaration.</p></li>
              </ul>
            </rule>
          </ruleSection>
        </section>
      </section>
      <section>
        <title>Metadata</title>

        <p>There are rules for the use of metadata in instance in <ref idref="section-instance-metadata"/>.</p>

      <section>
        <title>Metadata types</title>
        <p>Within NIEM, metadata is defined as <q>data about data.</q> This may include information such as the security of a piece of data or the source of the data. These pieces of metadata may be composed into a metadata type. The types of data to which metadata may be applied may be constrained.</p>

        <definition term="metadata type">
          <p>A <strong>metadata type</strong> describes data about data, that is, information that is not descriptive of objects and their relationships, but is descriptive of the data itself. It is useful to provide a general mechanism for data about data. This provides required flexibility to precisely represent information.</p>
        </definition>

        <ruleSection><title>Metadata type has data about data</title>
          <rule applicability="REF EXT" class="Constraint">
            <p>Within the schema, a metadata type MUST contain elements appropriate for a specific class of data
              about data.</p>
          </rule>
        </ruleSection>

        <p>A metadata type establishes a specific, named aggregation of data about data. Any type transitively
          derived from <qName>structures:MetadataType</qName> is a metadata type. Such metadata types should be
          used as is and additional metadata types defined for additional content.</p>

        <ruleSection><title>Metadata types are derived from <qName>structures:MetadataType</qName></title>
          <rule applicability="REF EXT" id="rule-metadata-type-derived-from-metadata-type" class="Constraint">
            <pre><xmlBlurb id="xb-rule-metadata-type-derived-from-metadata-type" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:complexType">
    <sch:let name="is-metadata-type" value="exists(@name[MACRO_NAME_IS_METADATA_TYPE_NAME(.)])"/>
    <sch:let name="has-metadata-base-type" value="exists(xs:complexContent[
        exists(xs:*[local-name() = ('extension', 'restriction')
                    and exists(@base[MACRO_NAME_IS_METADATA_TYPE_NAME(.)])])])"/>
    <sch:assert test="$is-metadata-type = $has-metadata-base-type"
      >A type MUST be a metadata type if and only if it is derived from a metadata type.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>A metadata type is derived from another metadata type, terminating in the base
            type <qName>structures:MetadataType</qName>.  A type is easily identified as a metadata type by its
            name, qualified with the term <code>Metadata</code>.</p>
        </ruleSection>

      </section>
      <section><title>Metadata element declarations</title>
          <definition term="metadata element declaration">
            <p>A <em>metadata element declaration</em> is an element declaration defined by a <termRef>reference
              schema document</termRef> or an <termRef>extension schema document</termRef> that defines a
              metadata object. A metadata element declaration has a name ending in <q>Metadata</q>, and a {type
              definition} that is a <termRef>metadata type</termRef>.</p>
          </definition>

          <p> There are limitations on the meaning of a metadata element in an instance; it does not establish
            existence of an object, nor is it a property of its containing object.</p>

          <ruleSection><title>Metadata element declaration type is a metadata type</title>
            <rule applicability="REF EXT" id="rule-metadata-el-type-is-metadata-type" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-rule-metadata-el-type-is-metadata-type">
<sch:pattern>
  <sch:rule context="xs:element[exists(@name)]">
    <sch:assert test="exists(@type[MACRO_NAME_IS_METADATA_TYPE_NAME(.)])
                      = exists(@name[MACRO_ELEMENT_LOCAL_NAME_IS_METADATA_ELEMENT_NAME(.)])"
      >An element MUST have a name that ends in 'Metadata' if and only if it has a type that is a metadata type.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>

            <p>Using the qualifier <code>Metadata</code> immediately identifies an element as representing
              metadata. This document defines the term <termRef>metadata type</termRef>.</p>
          </ruleSection>

          <ruleSection>
            <title>Metadata element has applicable elements</title>

            <p>Each metadata element declaration may be applied to a set of elements. Any element to which a
              metadata element may be validly applied is called an <q>applicable element</q> for the metadata
              element. A metadata element that does not explicitly specify applicability information may be
              applied to any NIEM-conformant element.</p>

            <rule applicability="REF EXT SET" class="Interpretation" id="rule-metadata-applicable-elements">

              <p>The set of applicable elements for a metadata element declaration are as follows:</p>
              <ul>
                <li><p>A metadata element declaration that has neither an
                    attribute <qName>appinfo:appliesToTypes</qName> nor an
                    attribute <qName>appinfo:appliesToElements</qName> may be applied to any element.</p></li>

                <li><p>A metadata element declaration that has either an
                attribute <qName>appinfo:appliesToTypes</qName> or an
                attribute <qName>appinfo:appliesToElements</qName> may be applied to</p>

              <ul>
                <li><p>any element whose qualified name is in the value
                    of <qName>appinfo:appliesToElements</qName>, or any element with a declaration that is in the
                    substitution group of the declaration of such an element, and to</p></li>
                <li><p>any element with a type with a qualified name that is in the value
                    of <qName>appinfo:appliesToTypes</qName>, or any element with a type that is validly derived
                    from such a type.</p></li>
              </ul></li>
              </ul>
            </rule>
          </ruleSection>

          <p><ref idref="figure-sample-applies-to-types"/> shows an example
            of <qName>appinfo:appliesToTypes</qName>, defining a metadata element that is applicable to all
            objects and all associations.</p>

      <figure id="figure-sample-applies-to-types">
        <title>Sample use of <qName>appinfo:appliesToTypes</qName></title>
        <pre><xmlBlurb id="xb-figure-sample-applies-to-types">
<xs:element name="Metadata" type="nc:MetadataType" nillable="true"
    appinfo:appliesToTypes="structures:ObjectType structures:AssociationType">
  <xs:annotation>
    <xs:documentation>Information that further qualifies primary data; data about data.</xs:documentation>
  </xs:annotation>
</xs:element>
        </xmlBlurb></pre>
      </figure>

        </section>
        </section>


    <section>
      <title>Container elements</title>
      <p>All NIEM properties establish a relationship between the object holding the property and the value of the property. For example, an activity object of type <qName>nc:ActivityType</qName> may have an element <qName>nc:ActivityDescriptionText</qName>. This element will be of type <qName>nc:TextType</qName> and represents a NIEM property owned by that activity object. An occurrence of this element within an activity object establishes a relationship between the activity object and the text: the text is the description of the activity.</p>
      <p>In a NIEM-conformant instance, an element establishes a relationship between the object that contains it and the element<char name="rsquo"/>s value. This relationship between the object and the element may be semantically strong, such as the text description of an activity in the previous example, or it may be semantically weak, with its exact meaning left unstated. In NIEM, the contained element involved in a weakly defined semantic relationship is commonly referred to as a <strong>container element</strong>.</p>
      <p>A container element establishes a weakly defined relationship with its containing element. For example, an object of type <qName>nc:ItemDispositionType</qName> may have a container element <qName>nc:Item</qName> of type <qName>nc:ItemType</qName>. The container element <qName>nc:Item</qName> does not establish what relationship exists between the object of <qName>nc:ItemDispositionType</qName> and itself. There could be any of a number of possible semantics between an object and the value of a container element. It could be a contained object, a subpart, a characteristic, or some other relationship. The appearance of this container element inside the <qName>nc:ItemDispositionType</qName> merely establishes that the disposition has an item.</p>
      <p>The name of the container element is usually based on the NIEM type that defines it: <qName>nc:PersonType</qName> uses a container element <qName>nc:Person</qName>, while <qName>nc:ActivityType</qName> uses a container element <qName>nc:Activity</qName>. The concept of an element as a container element is a notional one.</p>
      <p>There are no formalized rules addressing what makes up a container element. A container element is vaguely defined and carries very little semantics about its context and its contents. Accordingly, there is no formal definition of container elements in NIEM: There are no specific artifacts that define a container element; there are no <code>appinfo</code> or other labels for container elements.</p>
      <p>The appearance of a container element within a NIEM type carries no additional semantics about the relationship between the property and the containing type. The use of container elements indicates only that there is a relationship; it does not provide any semantics for interpreting that relationship.</p>
      <p>For example, a NIEM container element <qName>nc:Person</qName> would be associated with the NIEM type <qName>nc:PersonType</qName>. The use of the NIEM container element <qName>nc:Person</qName> in a containing NIEM type indicates that a person has some association with the instances of the containing NIEM type. But because the <qName>nc:Person</qName> container element is used, there is no additional meaning about the association of the person and the instance containing it. While there is a person associated with the instance, nothing is known about the relationship except its existence.</p>
      <p>The use of the Person container element is in contrast to a NIEM property named <qName>nc:AssessmentPerson</qName>, also of NIEM type <qName>nc:PersonType</qName>. When the NIEM property <qName>nc:AssessmentPerson</qName> is contained within an instance of a NIEM type, it is clear that the person referenced by this property was responsible for an assessment of some type, relevant to the exchange being modeled. The more descriptive name, <qName>nc:AssessmentPerson</qName>, gives more information about the relationship of the person with the containing instance, as compared with the semantic-free implications associated with the use of the <qName>nc:Person</qName> container element.</p>

      <p>When a NIEM-conformant schema requires a new container element, it may define a new element with a
        concrete type and a general name, with general semantics. Any schema may define a container element when
        it requires one.</p>

    </section>

    <section>
      <title>The <q>Representation</q> pattern</title>

      <p>One need frequently faced by schema developers is for multiple representations for a single concept. For
        example, for a general concept of <em>a point in time</em>, there are numerous base representations, and
        innumerable ways to combine them. For example, the <termRef>XML Schema definition language</termRef>
        defines the types <qName>xs:dateTime</qName>,
        <qName>xs:time</qName>,
        <qName>xs:date</qName>,
        <qName>xs:gYearMonth</qName>,
        <qName>xs:gYear</qName>,
        <qName>xs:gMonthDay</qName>,
        <qName>xs:gDay</qName>, and
        <qName>xs:gMonth</qName>, each representing a point in time, or perhaps a span of time. There is a need
        in XML Schema to be able to represent a general concept like <em>a point in time</em>, along with a
        variety of representations for the concept.</p>

      <p>Note that this need is a bit different than specialization of relationships (e.g.,
      <qName>rdfs:subPropertyOf</qName>), in that it specifically is to be used to describe and carry the variety
      of representations for a particular concept. The need is to be able to represent an abstract point in
      time using a single type, and then to add a set of specific representations for that basic
      concept.</p>

      <p>There are a variety of methods that could be used to satisfy this need. A method could be devised that
      uses an abstract type, along with a set of concrete extensions of that abstract type. However, there would
      still be a need for a set of concrete elements to carry the types, as type substitution (distinct
      from <em>element substitution</em>) is not widely adopted across the NIEM community. As well, it is difficult
      to create a network of complex types with complex content and complex types with simple content that all
      substitute for a base type; the XML Schema syntax is complicated. Other alternatives each have their pros and cons.</p>

      <p>To handle this need, NIEM has adopted the <q>Representation</q> pattern, in which a type contains a
        representation element, and the various representations for that type are in the substitution group for
        that representation element.</p>

      <p>For example, the definition of <qName>nc:DateType</qName> uses this pattern:</p>

      <figure>
        <title>A type definition that uses the <q>Representation</q> pattern</title>
        <pre><xmlBlurb id="xb-figure-date-type">
<xs:complexType name="DateType">
  <xs:annotation>
    <xs:documentation>A data type for a calendar date.</xs:documentation>
  </xs:annotation>
  <xs:complexContent>
    <xs:extension base="structures:ObjectType">
      <xs:sequence>
        <xs:element ref="nc:DateRepresentation" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="nc:DateAccuracy" minOccurs="0" maxOccurs="1"/>
        <xs:element ref="nc:DateMarginOfErrorDuration" minOccurs="0" maxOccurs="1"/>
        <xs:element ref="nc:DateAugmentationPoint" minOccurs="0" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
        </xmlBlurb></pre>
      </figure>

      <p>The type has elements that represent accuracy and margin of error, as well as an augmentation point. The
      actual date value, however, is carried by an element that substitutes
      for <qName>nc:DateRepresentation</qName>.  That base element, and several substitutions are defined by the
      NIEM Core namespace:</p>

      <figure>
        <title>Element declarations that implement representations</title>
        <pre><xmlBlurb id="xb-figure-date-representations">
<xs:element name="DateRepresentation" abstract="true">
  <xs:annotation>
    <xs:documentation>A data concept for a representation of a date.</xs:documentation>
  </xs:annotation>
</xs:element>

<xs:element name="Date" type="niem-xs:date" substitutionGroup="nc:DateRepresentation" nillable="true">
  <xs:annotation>
    <xs:documentation>A full date.</xs:documentation>
  </xs:annotation>
</xs:element>

<xs:element name="DateTime" type="niem-xs:dateTime" substitutionGroup="nc:DateRepresentation">
  <xs:annotation>
    <xs:documentation>A full date and time.</xs:documentation>
  </xs:annotation>
</xs:element>

<xs:element name="YearDate" type="niem-xs:gYear" substitutionGroup="nc:DateRepresentation">
  <xs:annotation>
    <xs:documentation>A year.</xs:documentation>
  </xs:annotation>
</xs:element>

<xs:element name="YearMonthDate" type="niem-xs:gYearMonth" substitutionGroup="nc:DateRepresentation">
  <xs:annotation>
    <xs:documentation>A year and month.</xs:documentation>
  </xs:annotation>
</xs:element>
        </xmlBlurb></pre>
      </figure>

      <p>This method has several benefits:</p>

      <ul>
        <li><p>Its implementation requires a minimum number of additional schema components. There is only the
            one abstract representation element; all other elements are concrete and needed to carry strongly
            typed values.</p></li>
        <li><p>It is simple to implement. The method requires only elements, and the definition of each element
            is quite simple.</p></li>
        <li><p>It is straightforward to use, as its implementation is based on element substitution, which is
            already widely used by NIEM.</p></li>
        <li><p>It is highly extensible. Any domain or exchange specification may define additional
            representations for any concept, by defining new elements substitutable for the representation
            element.</p></li>
      </ul>

      <definition term="representation element declaration">
        <p>A <strong>representation element declaration</strong> is an <termRef>element declaration</termRef>
          that is abstract, and that has a {name} that ends in <q>Representation</q>.</p>
      </definition>

      <ruleSection><title>Name of element that ends in <q>Representation</q> is abstract</title>
	<rule applicability="REF EXT" id="el-representation-is-abstract" class="Constraint">
	  <pre><xmlBlurb memberOf="ref ext" id="xb-el-representation-is-abstract">
<sch:pattern>
  <sch:rule context="xs:element[@name[ends-with(., 'Representation')]]">
    <sch:report role="warning"
        test="empty(@abstract) or xs:boolean(@abstract) = false()"
      >An element declaration with a name that ends in 'Representation' SHOULD have the {abstract} property with a value of "true".</sch:report>
  </sch:rule>
</sch:pattern>
	  </xmlBlurb></pre>
	</rule>
      </ruleSection>
    </section>

    <ruleSection><title>A substitution for a representation element declaration is a value for a type</title>
      <rule applicability="REF EXT" class="Interpretation">
        <p>Any element declaration that is substitutable for a representation element declaration represents an
          optional representation of a value of a type that carries the representation element.</p>
      </rule>
    </ruleSection>

    <section id="SectionNamingRules"><title>Naming rules</title>

      <p>This section outlines the rules used to create names for NIEM data components previously discussed in
        this document. Data component names must be understood easily both by humans and by machine
        processes. These rules improve name consistency by restricting characters, terms, and syntax that could
        otherwise allow too much variety and potential ambiguity. These rules also improve readability of names
        for humans, facilitate parsing of individual terms that compose names, and support various automated
        tasks associated with dictionary and controlled vocabulary maintenance.</p>

    <ruleSection>
      <title>Schema component name composed of English words</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>The name of any XML Schema component defined by the schema SHOULD be composed of words from the English
          language, using the prevalent U.S. spelling, as provided by <ref idref="OED"/>.</p>
      </rule>
      <p>The English language has many spelling variations for the same word. For example, American
        English <q>program</q> has a corresponding British spelling <q>programme.</q> This variation has the
        potential to cause interoperability problems when XML components are exchanged because of the different
        names used by the same elements. Providing users with a dictionary standard for spelling will mitigate
        this potential interoperability issue.</p>
    </ruleSection>

    <ruleSection>
      <title>Schema component names have only specific characters</title>
      <rule applicability="REF EXT" id="rule-names-have-specific-characters" class="Constraint">
        <pre><xmlBlurb id="xb-rule-names-have-specific-characters" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:*[exists(@name)]">
    <sch:assert test="matches(@name, '^[A-Za-z0-9\-_\.]*$')"
      >The name of an XML Schema component defined by the schema must be composed of only the characters uppercase 'A' through 'Z', lowercase 'a' through 'z', numbers '0' through '9', underscore, hyphen, and period.</sch:assert>
  </sch:rule>
</sch:pattern>
        </xmlBlurb></pre>
      </rule>

      <p>Only the following characters are allowed in the name of an XML Schema component defined by the
        schema:</p>
        <ul>
          <li><p>Upper-case letters (<q><code>A</code></q><char name="ndash"/><q><code>Z</code></q>).</p></li>
          <li><p>Lower-case letters (<q><code>a</code></q><char name="ndash"/><q><code>z</code></q>).</p></li>
          <li><p>Digits (<q><code>0</code></q><char name="ndash"/><q><code>9</code></q>).</p></li>
          <li><p>Underscore (<q><code>_</code></q>).</p></li>
          <li><p>Hyphen (<q><code>-</code></q>).</p></li>
          <li><p>Period (<q><code>.</code></q>).</p></li>
        </ul>

        <p>Other characters, such as unicode characters outside the ASCII character set, are explicitly prohibited
          from the name of an XML Schema component defined by the schema.</p>

    </ruleSection>

    <ruleSection>
      <title>Punctuation in component name is a separator</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>The characters hyphen (<q><code>-</code></q>), underscore (<q><code>_</code></q>) MAY appear in a
          component name only when used as a separator between parts of a word, phrase, or value, which would
          otherwise be incomprehensible without the use of a separator. The period character
          (<q><code>.</code></q>) MAY appear in component names only when appearing as a separator (as above) or
          as a decimal within a numeric value. A punctuation character MUST NOT be used as a substitute for camel
          case in component names, or as a method to avoid camel case in component names.</p>
      </rule>
    </ruleSection>

      <p>Names of standards and specifications, in particular, tend to consist of series of discrete
        numbers. Such names require some explicit separator to keep the values from running together.</p>

      <p>Names of NIEM components follow the rules of XML Schema, by <ref idref="is-schema-doc"/>. NIEM
        components also follow the rules specified herein for each type of XML Schema component.</p>

    <section>
      <title>Character case</title>

      <p>Names of conformant components use <em>camel case</em> formatting. Camel case is the convention of
        writing compound words or phrases with no spaces and an initial lowercase or uppercase letter, with each
        remaining word element beginning with an uppercase letter. <em>UpperCamelCase</em> is written with an
        initial uppercase letter, and <em>lowerCamelCase</em> is written with an initial lowercase letter.</p>

      <ruleSection><title>Names use camel case</title>
        <rule applicability="REF EXT" class="Constraint">
          <p>The name of any XML Schema component defined by the schema MUST use the camel case formatting
            convention.</p>
        </rule>
      </ruleSection>

      <ruleSection>
        <title>Attribute name begins with lower case letter</title>
        <rule applicability="REF EXT" id="rule-attribute-names-start-lower-case" class="Constraint">
          <pre><xmlBlurb id="xb-rule-attribute-names-start-lower-case" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@name)]">
    <sch:assert test="matches(@name, '^[a-z]')"
      >Within the schema, any attribute declaration MUST have a name that begins with a lowercase letter
      ('a'-'z').</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

      <ruleSection>
        <title>Name of schema component other than attribute and proxy type begins with upper case letter</title>
        <rule applicability="REF EXT" id="rule-names-start-upper-case" class="Constraint">
          <pre><xmlBlurb id="xb-rule-names-start-upper-case" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:attribute">
    <sch:report test="false()" role="warning">This rule does not apply to an attribute.</sch:report>
  </sch:rule>
  <sch:rule context="MACRO_MATCH_PROXY_TYPE([[[                     ]]])">
    <sch:report test="false()" role="warning">This rule does not apply to a proxy types.</sch:report>
  </sch:rule>
  <sch:rule context="xs:*[exists(@name)]">
    <sch:assert test="matches(@name, '^[A-Z]')"
      >Within the schema, an XML Schema component that is not an attribute declaration or proxy type MUST have a name that begins with an upper-case letter ('A'-'Z').</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

      <p>The preceding rules establish <em>lowerCamelCase</em> for NIEM attributes, and <em>UpperCamelCase</em>
      for all other NIEM components, except proxy types, defined by <ref idref="section-proxy-types"/>.</p>

    </section>

    <section><title>Use of acronyms and abbreviations</title>

      <p>Acronyms and abbreviations have the ability to improve readability and comprehensibility of large,
      complex, or frequently used terms. They also obscure meaning and impair understanding when their
      definitions are not clear or when they are used injudiciously. They should be used with great
      care. Acronyms and abbreviations that are used must be documented and used consistently.</p>

      <ruleSection><title>Names use common abbreviations</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>The schema SHOULD use, in defined names, the abbreviations identified by <ref idref="table-abbrevs"/>,
rather than their full meanings.</p>
      </rule>

      <table id="table-abbrevs">
        <title>Abbreviations used in schema component names</title>
        <theadr>
          <th>Abbreviation</th>
          <th>Full Meaning</th>
        </theadr>
        <tr>
          <td>ID</td>
          <td>Identifier</td>
        </tr>
        <tr>
          <td>URI</td>
          <td>Uniform Resource Identifier</td>
        </tr>
      </table>

      <p>Consistent, controlled, and documented abridged terms that are commonly used in place of full terms can
        support readability, clarity, and reduction of name length.</p>
      
      </ruleSection>

      <section><title>Use of Acronyms, Initialisms, Abbreviations, and Jargon</title>

        <p>The NDR establishes appinfo for local terminology that introduces such terms into the schema document
          in which the appinfo appears.</p>

        <definition term="local term">

          <p>In a conformant schema document, a local term is a word, phrase, acronym, or other string of
            characters for which all of the following are true:</p>

          <ol>
            <li><p>It is not a term defined in the <ref idref="OED"/>, or it has a non-OED definition, or its
                word sense may not be clear.</p></li>

            <li><p>It is introduced into the schema document via an appinfo
                element <qName>appinfo:LocalTerm</qName>.</p></li>

            <li><p>It may be used in the local name of a schema component within the schema document.</p></li>
          </ol>
        </definition>

        <p>Local terminology is introduced into a schema document by the use of <qName>appinfo:LocalTerm</qName>
          within the schema.</p>

        <p>See additional rules constraining the use of local terminology in <ref idref="sec-local-term"/>.</p>

        <ruleSection>
          <title>Local term declaration is local to its schema document</title>
          <rule applicability="REF EXT" id="rule-lt-single-doc" class="Interpretation">
            <p>An element <qName>appinfo:LocalTerm</qName> MUST establish the meaning of a <termRef>local
              term</termRef> only within the XML Schema document in which it occurs. There MUST NOT be any
              transitive inheritance of local terminology within schema documents that import the containing
              schema document.</p>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>Local terminology interpretation</title>
        <rule applicability="REF EXT" id="rule-lt-meaning" class="Interpretation">
          <p>An element information item <qName>appinfo:LocalTerm</qName> MUST establish a term as follows:</p>

          <ol>

            <li><p>The value of the attribute <local-name>term</local-name> is the <termRef>local term</termRef>;
                it may occur as a term within the name of a schema component within the schema document.</p></li>

            <li><p>The value of the attribute <local-name>literal</local-name> is the meaning of the local term,
                provided as a full, plain-text form of the term. This may be useful when a local term is an
                abbreviation, acronym, or diminutive form of a longer term.</p></li>

            <li><p>The value of the attribute <local-name>definition</local-name> is a dictionary-style
                description of the meaning of the local term.</p></li>

            <li><p>The value of the attribute <local-name>sourceURIs</local-name> is a list of URIs, each of
                which is an identifier or locator for an originating or authoritative document defining the
                term.</p></li>

            <li><p>Each child element information item <qName>appinfo:SourceText</qName> is a plain text citation
                of, reference to, or bibliographic entry for an originating or authoritative document defining
                the term.</p></li>

          </ol>
        </rule>
        </ruleSection>
      </section>

    </section>
    <section>
      <title>Word forms</title>

      <ruleSection>
        <title>Singular form is preferred in name</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>A noun used as a term in the name of an XML Schema component MUST be in singular form unless the concept itself is plural.</p>
      </rule>
      </ruleSection>

      <ruleSection>
        <title>Present tense is preferred in name</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>A verb used as a term in the name of an XML Schema component MUST be used in the present tense unless the concept itself is past tense.</p>
      </rule>
      </ruleSection>

      <ruleSection>
        <title>Name does not have nonessential words</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>Articles, conjunctions, and prepositions MUST NOT be used in NIEM component names except where they
          are required for clarity or by standard convention.</p>
      </rule>
      </ruleSection>

      <p>Articles (e.g., a, an, the), conjunctions (e.g., and, or, but), and prepositions (e.g., at, by, for, from, in, of, to) are all disallowed in NIEM component names, unless they are required. For example, <code>PowerOfAttorneyCode</code> requires the preposition. These rules constrain slight variations in word forms and types to improve consistency and reduce potentially ambiguous or confusing component names.</p>
    </section>
    <ruleSection><title>Element or attribute name follows pattern</title>

      <p>Elements and attributes in NIEM-conformant schemas are given names that follow a specific pattern. This
        pattern comes from <ref idref="ISO11179-5"/>.</p>

      <rule applicability="REF EXT" class="Constraint">
        <p>Except as specified elsewhere in this document, any element or attribute defined within the schema SHOULD have a name that takes the form:</p>
        <ul>
          <li><p>Object-class qualifier terms (0 or more).</p></li>
          <li><p>An object class term (1).</p></li>
          <li><p>Property qualifier terms (0 or more).</p></li>
          <li><p>A property term (1).</p></li>
          <li><p>Representation qualifier terms (0 or more).</p></li>
          <li><p>A representation term (0 or 1).</p></li>
        </ul>
      </rule>

      <p>Consistent naming rules are helpful for users who wish to understand components with which they are unfamiliar, as well as for users to find components with known semantics. This rule establishes the basic structure for an element or attribute name, in line with the rules for names under <ref idref="ISO11179-5"/>. Note that many elements with complex type should not have a representation term.</p>

    </ruleSection>
    <section>
      <title>Object-class term</title>
      <p>NIEM adopts an object-oriented approach to representation of data. Object classes represent what <ref idref="ISO11179-5"/> refers to as <q>things of interest in a universe of discourse that may be found in a model of that universe.</q> An object class or object term is a word that represents a class of real-world entities or concepts. An object-class term describes the applicable context for a NIEM component.</p>

      <ruleSection>
        <title>Object-class term identifies concrete category</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>The object-class term of a NIEM component MUST consist of a term identifying a category of concrete concepts or entities.</p>
      </rule>
      <p>The object-class term indicates the object category that this data component describes or
        represents. This term provides valuable context and narrows the scope of the component to an actual class
        of things or concepts.</p>
      </ruleSection>

      <p>Example:</p>
      <sub>
        <p>Concept term: Activity</p>
        <p>Entity term: Vehicle</p>
      </sub>
    </section>
    <section>
      <title>Property term</title>
      <p>Objects or concepts are usually described in terms of their characteristic properties, data attributes, or constituent subparts. Most objects can be described by several characteristics. Therefore, a property term in the name of a data component represents a characteristic or subpart of an object class and generally describes the essence of that data component.</p>

      <ruleSection>
        <title>Property term describes characteristic or subpart</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>A property term MUST describe or represent a characteristic or subpart of an entity or concept.</p>
      </rule>
      <p>The property term describes the central meaning of the data component.</p>
      </ruleSection>

    </section>
    <section>
      <title>Qualifier terms</title>
      <p>Qualifier terms modify object, property, representation, or other qualifier terms to increase semantic precision and reduce ambiguity. Qualifier terms may precede or succeed the terms they modify. The goal for the placement of qualifier terms is to generally follow the rules of ordinary English while maintaining clarity.</p>

      <ruleSection>
        <title>Name may have multiple qualifier terms</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>Multiple qualifier terms MAY be used within a component name as necessary to ensure clarity and uniqueness within its namespace and usage context.</p>
      </rule>
      </ruleSection>

      <ruleSection>
        <title>Name has minimum necessary number of qualifier terms</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>The number of qualifier terms SHOULD be limited to the absolute minimum required to make the component name unique and understandable.</p>
      </rule>
      </ruleSection>

      <ruleSection>
        <title>Order of qualifiers is not significant</title>
        <rule applicability="REF EXT" class="Constraint">
          <p>The order of qualifiers MUST NOT be used to differentiate names.</p>
        </rule>
        <p>Very large vocabularies may have many similar and closely related properties and concepts. The use of
          object, property, and representation terms alone is often not sufficient to construct meaningful names
          that can uniquely distinguish such components. Qualifier terms provide additional context to resolve
          these subtleties. However, swapping the order of qualifiers rarely (if ever) changes meaning; qualifier
          ordering is no substitute for meaningful terms.</p>
      </ruleSection>

    </section>
    <section>
      <title>Representation terms</title>
      <p>The representation terms for a component name serve several purposes in NIEM:</p>
      <ol>
        <li><p>It can indicate the style of component. For example, types are clearly labeled with the
representation term <code>Type</code>.</p></li>
        <li><p>It helps prevent name conflicts and confusion. For example, elements and types may
not be given the same name.</p></li>
        <li><p>It indicates the nature of the value carried by element. Labeling elements and attributes with a notional indicator of the content eases discovery and comprehension.</p></li>
      </ol>

      <ruleSection>
        <title>Redundant term in name is omitted</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>If any word in the representation term is redundant with any word in the property term, one occurrence SHOULD be deleted.</p>
      </rule>
      <p>This rule, carried over from 11179, is designed to prevent repeating terms unnecessarily within component names. For example, this rule allows designers to avoid naming an element <q>PersonFirstNameName.</q></p>
      </ruleSection>

      <p>The valid value set of a data element or value domain is described by the representation term. NIEM uses
      a standard set of representation terms in the representation portion of a NIEM-conformant component
      name. <ref idref="table-representation-terms" /> lists the primary representation terms and a definition
      for the concept associated with the use of that term. The table also lists secondary representation terms
      that may represent more specific uses of the concept associated with the primary representation term.</p>

          <table id="table-representation-terms">
            <title>Representation terms</title>
            <theadr>
              <th>Primary Representation Term</th>
              <th>Secondary Representation Term</th>
              <th>Definition</th>
            </theadr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_AMOUNT</td>
              <td>-</td>
              <td>A number of monetary units specified in a currency where the unit of currency is explicit or implied.</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_BINARYOBJECT</td>
              <td>-</td>
              <td>A set of finite-length sequences of binary octets.</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_GRAPHIC</td>
              <td>A diagram, graph, mathematical curves, or similar representation</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_PICTURE</td>
              <td>A visual representation of a person, object, or scene</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_SOUND</td>
              <td>A representation for audio</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_VIDEO</td>
              <td>A motion picture representation; may include audio encoded within</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_CODE</td>
              <td></td>
              <td>A character string (i.e., letters, figures, and symbols) that for brevity, language independence, or precision represents a definitive value of an attribute.</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_DATETIME</td>
              <td></td>
              <td>A particular point in the progression of time together with relevant supplementary information.</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_DATE</td>
              <td>A particular day, month, and year in the Gregorian calendar.</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_TIME</td>
              <td>A particular point in the progression of time within an unspecified 24-hour day.</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_DURATION</td>
              <td>An amount of time; the length of a time span.</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_ID</td>
              <td></td>
              <td>A character string to identify and distinguish uniquely one instance of an object in an identification scheme from all other objects in the same scheme together with relevant supplementary information.</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_URI</td>
              <td>A string of characters used to identify (or name) a resource. The main purpose of this identifier is to enable interaction with representations of the resource over a network, typically the World Wide Web, using specific protocols. A URI is either a Uniform Resource Locator (URL) or a Uniform Resource Name (URN). The specific syntax for each is defined by <ref idref="RFC3986"/>.</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_INDICATOR</td>
              <td></td>
              <td>A list of two mutually exclusive Boolean values that express the only possible states of a property.</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_MEASURE</td>
              <td></td>
              <td>A numeric value determined by measuring an object along with the specified unit of measure.</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_NUMERIC</td>
              <td></td>
              <td>Numeric information that is assigned or is determined by calculation, counting, or sequencing. It does not require a unit of quantity or unit of measure.</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_VALUE</td>
              <td>A result of a calculation.</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_RATE</td>
              <td>A representation of a ratio where the two units are not included.</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_PERCENT</td>
              <td>A representation of a ratio in which the two units are the same.</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_QUANTITY</td>
              <td></td>
              <td>A counted number of non-monetary units possibly including fractions.</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_TEXT</td>
              <td>-</td>
              <td>A character string (i.e., a finite sequence of characters) generally in the form of words of a language.</td>
            </tr>
            <tr>
              <td></td>
              <td>MACRO_REPRESENTATION_TERM_NAME</td>
              <td>A word or phrase that constitutes the distinctive designation of a person, place, thing, or concept.</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_LIST</td>
              <td></td>
              <td>A sequence of values. This representation term is used in tandem with another of the listed representation terms.</td>
            </tr>
            <tr>
              <td>MACRO_REPRESENTATION_TERM_ABSTRACT</td>
              <td></td>
              <td>An element that may represent a concept, rather than a concrete property. This representation term may be used in tandem with another of the listed representation terms.</td>
            </tr>
          </table>

      <ruleSection><title>Element with simple content has representation term</title>
      <rule applicability="REF EXT" class="Constraint" id="rule-csc-has-rep-term">
        <p>Within the schema, the name of an element declaration that is of simple content SHOULD use an appropriate representation term as found in <ref idref="table-representation-terms"/>.</p>
      </rule>
      <p>This rule is also supported by <ref idref="rule-ref-el-csc-uses-rep-term"/> and <ref idref="rule-set-el-csc-uses-rep-term"/>, which provide tests that a top-level declaration has a representation term.</p>
      </ruleSection>

      <ruleSection><title>Element with complex content has representation term when appropriate</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>Within the schema, the name of an element declaration that is of complex content, and that corresponds to a concept listed in <ref idref="table-representation-terms"/>, SHOULD use a representation term from that table.</p>
      </rule>

      <p>An element that represents a value listed in the table should have a representation term. It should do
        so even if its type is complex with multiple parts. For example, a type with multiple fields may
        represent an audio binary, a date, or a name.</p>

      </ruleSection>

      <ruleSection><title>Element with complex content has representation term only when appropriate</title>
      <rule applicability="REF EXT" class="Constraint">
        <p>Within the schema, the name of an element declaration that is of complex content and that does not correspond to a concept listed in <ref idref="table-representation-terms"/> SHOULD NOT use a representation term.</p>
      </rule>
      </ruleSection>


    </section>

  </section>

    <section id="section-machine-readable-annotations"><title>Machine-readable annotations</title>

      <p>XML Schema provides <em>application information</em> schema components to provide for automatic
        processing and machine-readable content for schemas, as described by

        MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#application_information,3.13.2,XML Representation of Annotation Schema Components).

        XML Schema also allows the use of attributes (with namespaces other than the XML Schema namespace) to
        carry additional information in schemas. NIEM uses these machine-readable annotations convey information
        that is outside schema definition and outside human-readable text definitions.</p>

      <p>XML elements, attributes, and text content may appear as machine-readable annotations within an XML
        Schema document. The methods provided by XML Schema for machine-readable annotations are:</p>

        <ol>
          <li>
            <p>An element in the XML Schema namespace
              (e.g., <qName >xs:schema</qName >, <qName >xs:complexType</qName >, <char name="hellip" />) may
              carry attributes from namespaces other than the XML Schema namespace. By the rules of XML Schema,
              any XML Schema element may have attributes that are from other namespaces. These attributes do not
              participate in XML Schema validation, but may carry information useful to tools that process
              schemas. In <ref idref="XMLSchema-1"/>, these attributes are described in the XML Representation
              summary of XML Schema elements as <q>{any attributes with non-schema namespace . . .}</q>, for
              example in

              MACRO_REF_EXTERNAL([[[]]],MACRO_HREF_XML_SCHEMA_1[[[]]]#element-attribute,3.2.2,[[[XML Representation of Attribute Declaration Schema Components]]]).</p>
          </li>

          <li>
            <p>XML Schemas may include <qName>xs:appinfo</qName> elements, which may include arbitrary XML
              content. This XML does not participate in XML Schema validation, but may communicate useful
              information to schema readers or processors. These are described by <ref idref="XMLSchema-1"/> in
              MACRO_REF_EXTERNAL([[[]]],MACRO_HREF_XML_SCHEMA_1[[[]]]#application_information,3.13.1,[[[The Annotation Schema Component]]])
              and
              MACRO_REF_EXTERNAL([[[]]],MACRO_HREF_XML_SCHEMA_1[[[]]]#element-appinfo,3.13.2,[[[XML Representation of Annotation Schema Components]]]).</p>
          </li>
        </ol>

        <p>This document defines the term <termRef>machine-readable annotation</termRef> to normatively refer to
          such annotations within XML Schema documents:</p>

        <definition term="machine-readable annotation">
          <p>An information item within a schema is defined to be a machine-readable annotation when all of the following are true:</p>
          <ol>
            <li>
              <p>It is one of the following:</p>
              <ol>
                <li><p>It is an element information item that is a child of an <qName>xs:appinfo</qName> element.</p></li>
                <li><p>It is an attribute information item that satisfies the <q>{any attributes with non- schema namespace . . .}</q> clause within the declaration of an XML Schema element.</p></li>
              </ol>
            </li>
            <li><p>The namespace name property of the item is not the XML namespace, XML Schema namespace, or the
                XSI namespace.</p></li>
          </ol>
        </definition>

        <p>Attributes from the XML namespace, the XML Schema namespace, and the XML Schema instance namespace
        have special meanings within XML Schema, and may have effects on validation, and so are not considered
        machine-readable annotations.</p>

        <definition term="application information">
          <p>A component is said to
              have <strong>application information</strong> of some element <var>$element</var> when the
              XML Schema element that defines the component has an immediate child
              element <qName>xs:annotation</qName>, which has an immediate child
              element <qName>xs:appinfo</qName>, which has as an immediate child the
              element <var>$element</var>.</p>
        </definition>

        <p>If a component is described as having some <termRef>application information</termRef>, this means that
          the elements in question appear in an <qName>xs:appinfo</qName> annotation of the element that defines
          the component.</p>

        <p>The majority of uses of <termRef>application information</termRef> from the <termRef>appinfo namespace</termRef> are
          described in the modeling rules for the specific component.</p>

        <ruleSection><title>Machine-readable annotations are valid</title>
          <rule applicability="REF EXT" class="Constraint">
            <p>Every element information item or attribute information item that appears as a machine-readable
              annotation in a schema MUST be a valid instance, according to its specification.</p>
          </rule>

          <p>The specification for an element or attribute may be via an XML Schema, a Schematron schema, via a
            DTD, by some other specification, or by other means. This rule is intended to allow NIEM schema
            developers to leverage relevant vocabularies without being limited by the
            vocabulary<char name="rsquo"/>s method of specification, while ensuring that developers do not
            subvert or misuse those vocabularies.</p>
        </ruleSection>

        <section><title>The NIEM appinfo namespace</title>

          <p>NIEM defines a single namespace that holds components for use in NIEM-conformant schema application
            information. This namespace is referred to as the <termRef>appinfo namespace</termRef>.</p>

          <definition term="appinfo namespace">
            <p>The <strong>appinfo namespace</strong> is the namespace represented by the URI <q><namespace-uri-for-prefix>appinfo</namespace-uri-for-prefix></q>.</p>
          </definition>

          <p>The <termRef>appinfo namespace</termRef> defines attributes which provide additional semantics for
            components built by NIEM-conformant schemas.  The XML Schema document for the appinfo namespace
            appears in <ref idref="section-appinfo-xsd"/>.</p>
        <section>
          <title>Deprecation</title>
          <p>The <code>appinfo</code> schema provides a construct for indicating that a construct is
          deprecated. A deprecated component is one whose use is not recommended. A deprecated component may be
          kept in a schema for support of older versions but should not be used in new efforts. A deprecated
          component may be removed, replaced, or renamed in a later version of a namespace.</p>

          <definition term="deprecated component">
            <p>A <strong>deprecated component</strong> is one that developers are discouraged from using,
              typically because a better alternative exists, yet which is maintained in the schema for
              compatibility with previous versions of the namespace.</p>
          </definition>

          <p>The definition for <termRef>deprecated component</termRef> is adapted from
          MACRO_REF_EXTERNAL(JLS,MACRO_HREF_JAVA_LANG_SPEC_SEC_DEPRECATED,9.6.4.6,@Deprecated).</p>

          <ruleSection><title>Component marked as deprecated is deprecated component</title>
            <rule applicability="REF EXT" class="Interpretation">
              <p>A <termRef>schema component</termRef> that has an attribute <qName >appinfo:deprecated</qName >
                with a value of <q >true</q > MUST be a <termRef >deprecated component</termRef >.</p>
            </rule>

            <p>Deprecation can allow version management to be more consistent; versions of schema may be
              incrementally improved without introducing validation problems and incompatibility. As XML Schema
              lacks a deprecation mechanism, NIEM defines such a mechanism.</p>
          </ruleSection>

      <ruleSection><title>Deprecated annotates schema component</title>
        <rule applicability="REF EXT" id="rule-use-of-deprecated" class="Constraint">
          <pre><xmlBlurb id="blurb-use-of-deprecated" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="*[exists(@appinfo:deprecated)]">
    <sch:assert test="namespace-uri-from-QName(node-name(.)) = xs:anyURI('MACRO_NS_XS')"
            >The attribute appinfo:deprecated MUST be owned by an element with a namespace name <namespace-uri-for-prefix>xs</namespace-uri-for-prefix>.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>
        </section>
        <section>
          <title>External adapters</title>

          <p>The annotation attributes <qName>appinfo:externalImportIndicator</qName>
            and <qName>appinfo:externalAdapterTypeIndicator</qName> document, in a machine-readable way, which
            components are external (i.e., defined by schemas that are not NIEM-conformant), and which support
            the use of external components.</p>
          
      <ruleSection>
        <title>External import indicator annotates import</title>
        <rule applicability="REF EXT" id="rule-owner-of-appinfo-conformantindicator" class="Constraint">
          <pre><xmlBlurb id="blurb-owner-of-appinfo-conformantindicator" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="*[exists(@appinfo:externalImportIndicator)]">
    <sch:assert test="exists(self::xs:import)"
        >The attribute {MACRO_NS_APPINFO}externalImportIndicator MUST be owned by an element xs:import.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>
      
      <ruleSection>
        <title>External adapter type indicator annotates complex type</title>
        <rule applicability="REF EXT" id="rule-owner-of-appinfo-externaladaptertypeindicator" class="Constraint">
          <pre><xmlBlurb id="blurb-owner-of-appinfo-externaladaptertypeindicator" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="*[exists(@appinfo:externalAdapterTypeIndicator)]">
    <sch:assert test="exists(self::xs:complexType)"
            >The attribute appinfo:externalAdapterTypeIndicator MUST be owned by an element xs:complexType.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>
</section>

      <section><title><qName>appinfo:appliesToTypes</qName> annotation</title>
        <ruleSection><title><qName>appinfo:appliesToTypes</qName> annotates metadata element</title>
          <rule applicability="REF EXT" id="rule-owner-of-appinfo-appliestotypes" class="Constraint">
            <pre><xmlBlurb id="blurb-owner-of-appinfo-appliestotypes" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="*[exists(@appinfo:appliesToTypes)]">
    <sch:assert test="exists(self::xs:element[exists(@name)
                               and ends-with(@name, 'Metadata')])"
      >The attribute appinfo:appliesToTypes MUST be owned by a metadata element.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>
        <ruleSection><title><qName>appinfo:appliesToTypes</qName> references types</title>
          <rule applicability="SET" id="appliestotypes-refs-types" class="Constraint">
            <pre><xmlBlurb id="xb-appliestotypes-refs-types" memberOf="set">
<sch:pattern>
  <sch:rule context="*[exists(@appinfo:appliesToTypes)]">
    <sch:assert test="every $item in tokenize(normalize-space(@appinfo:appliesToTypes), ' ') satisfies
                        exists(nf:resolve-type(., resolve-QName($item, .)))"
      >Every item in @appinfo:appliesToTypes MUST resolve to a type.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>
      </section>
      <section>
        <title><qName>appinfo:appliesToElements</qName> annotation</title>
        <ruleSection>
          <title><qName>appinfo:appliesToElements</qName> annotates metadata element</title>
          <rule applicability="REF EXT" id="rule-owner-of-appinfo-appliestoelements" class="Constraint">
            <pre><xmlBlurb id="blurb-owner-of-appinfo-appliestoelements" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="*[exists(@appinfo:appliesToElements)]">
    <sch:assert test="exists(self::xs:element[
                          exists(@name)
                          and ends-with(@name, 'Metadata')])"
            >The attribute appinfo:appliesToElements MUST be owned by a metadata element.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>
        <ruleSection>
          <title><qName>appinfo:appliesToElements</qName> references elements</title>

          <rule applicability="SET" id="appliestoelements-refs-elements" class="Constraint">
            <pre><xmlBlurb id="xb-appliestoelements-refs-elements" memberOf="set">
<sch:pattern>
  <sch:rule context="*[exists(@appinfo:appliesToElements)]">
    <sch:assert test="every $item in tokenize(normalize-space(@appinfo:appliesToElements), ' ') satisfies
                        count(nf:resolve-element(., resolve-QName($item, .))) = 1"
      >Every item in @appinfo:appliesToElements MUST resolve to an element.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

      </section>
    </section>
    <section id="sec-local-term"><title>Local terminology</title>

      <ruleSection>
        <title><qName>appinfo:LocalTerm</qName> annotates schema</title>
        <rule applicability="REF EXT" id="lt-schema" class="Constraint">
          <pre><xmlBlurb id="xb-lt-schema" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="appinfo:LocalTerm">
    <sch:assert test="parent::xs:appinfo[parent::xs:annotation[parent::xs:schema]]"
      >The element appinfo:LocalTerm MUST be application information on an element xs:schema.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
        <p>This document defines the term <termRef>application information</termRef>.</p>
      </ruleSection>

      <ruleSection>
        <title><qName>appinfo:LocalTerm</qName> has literal or definition</title>
        <rule applicability="REF EXT" id="lt-has-defn" class="Constraint">
          <pre><xmlBlurb id="xb-lt-has-defn" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="appinfo:LocalTerm">
    <sch:assert test="exists(@literal) or exists(@definition)"
            >The element {MACRO_NS_APPINFO}LocalTerm MUST have a literal or definition.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

    </section>
    </section>

    <section>
      <title>NIEM structural facilities</title>

      <p>NIEM provides the structures schema that contains base types for types defined in NIEM- conformant
        schemas. It provides base elements to act as heads for substitution groups. It also provides attributes
        that provide facilities not otherwise provided by XML Schema. These structures should be used to augment
        XML data. The structures provided are not meant to replace fundamental XML organization methods; they are
        intended to assist them.</p>

      <definition term="structures namespace">
        <p>The <strong>structures namespace</strong> is the namespace represented by the
        URI <q><namespace-uri-for-prefix>structures</namespace-uri-for-prefix></q>.</p>
      </definition>

      <p>The structures namespace is a single namespace, separate from namespaces that define NIEM-conformant
      data. This document refers to this content via the prefix <code>structures</code>.</p>

      <ruleSection><title>Use structures consistent with specification</title>

      <rule applicability="REF EXT INS SET" class="Constraint">
        <p>Any schema or instance MUST use the NIEM <termRef>structures namespace</termRef> consistent with the
          schema as it is defined in <ref idref="section-include-structures-xsd"/>.</p>
      </rule>

      <p>This rule further enforces uniform and consistent use of the NIEM <code>structures</code> namespace,
        without addition. Users are not allowed to insert types, attributes, etc. that are not specified by this
        document. However, users may profile the structures namespace, as needed.</p>

      </ruleSection>
    </section>
  </section>

  <section id="section-niem-schema-modeling-rules">
    <title>Rules for NIEM modeling, by XML Schema component</title>
    <p>This section focuses on building NIEM data models using XML schema. Whereas
      <ref idref="section-profile-of-xml-schema"/> addressed shrinking the XML Schema definition language to a
      smaller set of features, this section constructs new NIEM-specific features to address modeling and
      interoperability problems. This includes naming rules, categories of types, and augmentations.</p>

    <section><title>Type definition components</title>

      <ruleSection><title>Name of type ends in <q>Type</q></title>
        <rule applicability="REF EXT" id="type-name-suffix" class="Constraint">
          <pre><xmlBlurb memberOf="ref ext" id="xb-type-name-suffix">
<sch:pattern>
  <sch:rule context="MACRO_MATCH_PROXY_TYPE([[[                     ]]])">
    <sch:report test="false()" role="warning">The name of a proxy type does not end in "Type".</sch:report>
  </sch:rule>
  <sch:rule context="xs:*[(self::xs:simpleType or self::xs:complexType) and exists(@name)]">
    <sch:assert test="ends-with(@name, 'Type')"
      >A type definition schema component that does not define a proxy type MUST have a name that ends in "Type".</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>

        <p>Use of the representation term <q>Type</q> immediately identifies XML
        types in a NIEM-conformant schema and prevents naming collisions with
        corresponding XML elements and attributes. The exception for proxy types
        ensures that simple NIEM-compatible uses of base XML Schema types are
        familiar to people with XML Schema experience.</p>

        <p>Note that the first <qName>sch:rule</qName> and
        subsequent <qName>sch:report</qName> serve to provide an exception to the
        rule for proxy types. It does not establish a constraint on the
        data.</p>

      </ruleSection>

      <section><title>Type definition hierarchy</title>
        <ruleSection>
          <title>Base type definition defined by conformant schema</title>
          <rule applicability="REF EXT" id="type-base-from-ns" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-type-base-from-ns">
<sch:pattern>
  <sch:rule context="xs:*[exists(@base)]">
    <sch:assert test="some $base-namespace in namespace-uri-from-QName(resolve-QName(@base, .)) satisfies (
                        $base-namespace = (nf:get-target-namespace(.), xs:anyURI('MACRO_NS_XS'))
                        or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)
                                                                   and $base-namespace = xs:anyURI(@namespace)
                                                                   and empty(@appinfo:externalImportIndicator)]))"
      >The {base type definition} of a type definition MUST have the target namespace or the XML Schema namespace or a namespace that is imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>
      </section>



      <section><title>Simple type definition</title>
        <ruleSection><title>Name of simple type ends in <q>SimpleType</q></title>

          <rule applicability="REF EXT" id="st-name-ends-in-simpletype" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-st-name-ends-in-simpletype">
<sch:pattern>
  <sch:rule context="xs:simpleType[@name]">
    <sch:assert test="ends-with(@name, 'SimpleType')"
      >A simple type definition schema component MUST have a name that ends in "SimpleType".</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>

          <p>Specific uses of type definitions have similar syntax but very
            different effects on data definitions. Schemas that clearly identify
            complex and simple type definitions are easier to understand without
            tool support. This rule ensures that names of simple types end
            in <code>SimpleType</code>.</p>

        </ruleSection>

        <section><title>Derivation by list</title>

          <ruleSection><title>Use lists only when data is uniform</title>
          <rule applicability="REF EXT" class="Constraint">
            <p>Within the schema, a simple type definition that uses <qName>xs:list</qName> SHOULD NOT be defined
            if any member of the list requires a property or metadata that is different than other members of the
            list. All members of the list SHOULD have the same metadata, and should be related via the same
            properties.</p>
          </rule>

          <p>The use of lists should be reserved for cases where the data is fairly uniform.</p>

          <p>Items in a list are not individually addressable by NIEM metadata techniques. The items may not be
            individually referenced by elements or attributes; one will have a value of the entire list,
            including all the items in the list. NIEM provides no method for individually addressing an item in a
            list. If an individual item in a list needs to be marked up in a manner different than other items in
            the list, the use of individual elements may be preferred to the definition of a list simple
            type.</p>
          </ruleSection>

          <ruleSection>
            <title>List item type defined by conformant schemas</title>
            <rule applicability="REF EXT" id="list-item-type-ns" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-list-item-type-ns">
<sch:pattern>
  <sch:rule context="xs:list[exists(@itemType)]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@itemType, .))"/>
    <sch:assert test="$namespace = (nf:get-target-namespace(.), xs:anyURI('MACRO_NS_XS'))
                      or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)
                                    and $namespace = xs:anyURI(@namespace)
                                    and empty(@appinfo:externalImportIndicator)])"
      >The item type of a list simple type definition MUST have a target namespace equal to the target namespace of the XML Schema document within which it is defined, or a namespace that is imported as conformant by the schema document within which it is defined.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>
        </section>
        <section><title>Derivation by union</title>

          <ruleSection>
            <title>Union member types defined by conformant schemas</title>
            <rule applicability="REF EXT" id="union-member-type-ns" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-union-member-type-ns">
<sch:pattern>
  <sch:rule context="xs:union[exists(@memberTypes)]">
    <sch:assert test="every $qname in tokenize(normalize-space(@memberTypes), ' '),
                            $namespace in namespace-uri-from-QName(resolve-QName($qname, .))
                      satisfies ($namespace = nf:get-target-namespace(.)
                                 or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)
                                           and $namespace = xs:anyURI(@namespace)
                                           and empty(@appinfo:externalImportIndicator)]))"
                >Every member type of a union simple type definition MUST have a target namespace that is equal to either the target namespace of the XML Schema document within which it is defined or a namespace that is imported as conformant by the schema document within which it is defined.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>
        </section>
        <section id="section-code-simple-type">
          <title>Code simple types</title>

          <definition term="code simple type">
            <p>A <strong>code simple type</strong> is a simple type definition schema component for which each
              value carried by the type corresponds to an entry in a list of distinct conceptual entities.</p>
        </definition>

          <p>These types represent lists of values, each of which has a known
            meaning beyond the text representation. These values may be
            meaningful text or may be a string of alphanumeric identifiers that
            represent abbreviations for literals.</p>

          <p>Many code simple types are composed of <qName>xs:enumeration</qName> values. Code simple types may
            also be constructed using the <em><a href="MACRO_HREF_CODE_LISTS">NIEM Code Lists
            Specification</a></em> <ref idref="code-lists-spec"/>, which supports code lists defined using a
            variety of methods, including CSV spreadsheets.</p>

          <ruleSection>
            <title>Name of a code simple type ends in <q>CodeSimpleType</q></title>

            <rule applicability="REF EXT" id="code-st-name" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-code-st-name">
<sch:pattern>
  <sch:rule context="xs:simpleType[exists(@name)
      and (xs:restriction/xs:enumeration
           or xs:restriction[ends-with(local-name-from-QName(resolve-QName(@base, .)), 'CodeSimpleType')])]">
    <sch:report test="not(ends-with(@name, 'CodeSimpleType'))" role="warning"
      >A simple type definition schema component that has an enumeration facet or that is derived from a code simple type SHOULD have a name that ends in "CodeSimpleType".</sch:report>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>Code simple type corresponds to a code list</title>

            <rule applicability="REF EXT" id="code-st-has-list" class="Constraint">
              <p>A simple type SHOULD have a name ending in <q>CodeSimpleType</q> if and only if it has a
              correspondence to a list of distinct conceptual entities.</p>
            </rule>
          </ruleSection>

          <ruleSection>
            <title>Attribute of code simple type has code representation term</title>
            <rule applicability="REF EXT" id="rule-attribute-of-code-simple-type-has-code-rep-term" class="Constraint">
              <pre><xmlBlurb id="xb-rule-attribute-of-code-simple-type-has-code-rep-term" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@name) and exists(@type) and ends-with(@type, 'CodeSimpleType')]">
    <sch:report test="not(ends-with(@name, 'Code'))" role="warning"
      >An attribute with a type that is a code simple type SHOULD have a name with representation term "Code"</sch:report>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
          </ruleSection>

          <p>Using the qualifier <code>Code</code>
          (e.g. <code>CodeType</code>, <code>CodeSimpleType</code>) immediately
          identifies that a data component may carry values from a fixed list of codes. Such a component
          may be handled in specific ways, as lists of codes are expected to
          have their own lifecycles, including versions and periodic
          updates. Codes may also have responsible authorities behind them who
          provide concrete semantic bindings for the code values.</p>

        </section>

      </section>

      <section><title>Complex type definition</title>
          <ruleSection>
            <title>Complex type with simple content has <qName>structures:SimpleObjectAttributeGroup</qName></title>

            <p>Within a <termRef>reference schema document</termRef>, a complex type with simple
              content can be created in one of two ways:</p>

            <ol>
              <li><p>By extension of an existing complex type with simple content.</p></li>
              <li><p>By extension of an existing simple type.</p></li>
            </ol>

            <p>Both of these methods use the element <qName>xs:extension</qName>. Although these two methods have
              similar syntax, there are subtle differences. NIEM<char name="rsquo"/>s conformance rules ensure
              that any complex type has the necessary attributes for representing IDs, references, metadata, and
              relationship metadata. Case 1 does not require adding these attributes, as they are guaranteed to
              occur in the base type. However, in case 2, in which a new complex type is created from a simple
              type, the attributes for complex types must be added. This is done by reference to the attribute
              group <qName>structures:SimpleObjectAttributeGroup</qName>.</p>

            <rule applicability="REF EXT" id="rule-ct-sc-has-soag" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-rule-ct-sc-has-soag">
<sch:pattern>
  <sch:rule context="xs:simpleContent/xs:extension[
      some $base-qname in resolve-QName(@base, .) satisfies
        namespace-uri-from-QName($base-qname) = xs:anyURI('MACRO_NS_XS')
        or ends-with(local-name-from-QName($base-qname), 'SimpleType')]">
    <sch:assert test="xs:attributeGroup[
                        resolve-QName(@ref, .) = xs:QName('structures:SimpleObjectAttributeGroup')]"
      >A complex type definition with simple content schema component with a derivation method of extension that has a base type definition that is a simple type MUST incorporate the attribute group {MACRO_NS_STRUCTURES}SimpleObjectAttributeGroup.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>

            <p>This rule ensures that a complex type with simple content that is created as an immediate
              extension of a simple type adds the attributes required for specific NIEM linking mechanisms.</p>

            <p>This creates a pattern for complex type with simple content definition as follows:</p>

            <figure>
              <title>Example of complex type with simple content derived from a simple type</title>
              <pre><xmlBlurb id="xb-example-csc-st">
  <xs:complexType name="PassportCategoryCodeType">
    <xs:annotation>
      <xs:documentation>A data type for a kind of passport.</xs:documentation>
    </xs:annotation>
    <xs:simpleContent>
      <xs:extension base="nc:PassportCategoryCodeSimpleType">
        <xs:attributeGroup ref="structures:SimpleObjectAttributeGroup"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
              </xmlBlurb></pre>
            </figure>

          </ruleSection>

    </section>
      </section>
    <section><title>Declaration components</title>
      <section><title>Element declaration</title>

        <ruleSection><title>Element type does not have a simple type name</title>

          <p>This rule ensures that all conformant elements will have complex types that contain attributes from
            the structures namespace, enabling a consistent approach for using IDs, references, metadata,
            relationship metadata, and security markup data.</p>

          <rule applicability="REF EXT" id="el-type-name-not-simple-type" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-el-type-name-not-simple-type">
<sch:pattern>
  <sch:rule context="xs:element[exists(@type)]">
    <sch:assert test="not(ends-with(@type, 'SimpleType'))"
                >The {type definition} of an element declaration MUST NOT have a {name} that ends in 'SimpleType'.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>This document defines the term <termRef>element declaration</termRef>.</p>
        </ruleSection>

        <ruleSection><title>Element type is from conformant namespace</title>
          <rule applicability="REF EXT" id="el-type-conformant-ns" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-el-type-conformant-ns">
<sch:pattern>
  <sch:rule context="xs:element[exists(@type)]">
    <sch:assert test="for $type-qname in resolve-QName(@type, .),
                          $type-namespace in namespace-uri-from-QName($type-qname) return
                        $type-namespace = nf:get-target-namespace(.)
                        or exists(nf:get-document-element(.)/xs:import[
                                    xs:anyURI(@namespace) = $type-namespace
                                    and empty(@appinfo:externalImportIndicator)])"
                >The {type definition} of an element declaration MUST have a {target namespace} that is the target namespace, or one that is imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
          <p>This document defines the term <termRef>element declaration</termRef>.</p>
        </ruleSection>

        <p>Additional prohibitions on element types are defined by
          <ref idref="el-type-ns-not-special" /> and
          <ref idref="el-type-not-st" />.</p>



        <ruleSection><title>Name of element that ends in <q>Abstract</q> is abstract</title>
	  <rule applicability="REF EXT" id="el-abstract-is-abstract" class="Constraint">
	    <pre><xmlBlurb memberOf="ref ext" id="xb-el-abstract-is-abstract">
<sch:pattern>
  <sch:rule context="xs:element[@name]">
    <sch:report role="warning"
        test="not(exists(@abstract[xs:boolean(.) = true()])
                  eq (ends-with(@name, 'Abstract')
                      or ends-with(@name, 'AugmentationPoint')
                      or ends-with(@name, 'Representation')))"
      >An element declaration SHOULD have a name that ends in 'Abstract', 'AugmentationPoint', or 'Representation' if and only if it has the {abstract} property with a value of "true".</sch:report>
  </sch:rule>
</sch:pattern>
	    </xmlBlurb></pre>
	  </rule>
        </ruleSection>

        <section><title>Object element declarations</title>

          <p>This rule checks all cases that are testable in a single schema document.</p>

          <ruleSection><title>Name of element declaration with simple content has representation term</title>
            <rule applicability="REF EXT" id="rule-ref-el-csc-uses-rep-term" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-rule-ref-el-csc-uses-rep-term">
<sch:pattern>
  <sch:rule context="xs:element[@name and @type
                                and (some $type-qname in resolve-QName(@type, .) satisfies (
                                       nf:get-target-namespace(.) = namespace-uri-from-QName($type-qname)
                                       and nf:resolve-type(., $type-qname)/xs:simpleContent))]">
    <sch:report role="warning"
        test="every $representation-term
              in (MACRO_LIST_OF_REPRESENTATION_TERMS, 'MACRO_REPRESENTATION_TERM_LIST')
              satisfies not(ends-with(@name, $representation-term))"
      >The name of an element declaration that is of simple content SHOULD use a representation term.</sch:report>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>

            <p>Representation terms are defined by <ref idref="table-representation-terms"/>. This Schematron rule supports <ref idref="rule-csc-has-rep-term"/>.</p>
          </ruleSection>


          <ruleSection><title>Name of element declaration with simple content has representation term</title>

            <p>This rule only checks the cases not testable in the (REF, EXT) version.</p>

            <rule applicability="SET" id="rule-set-el-csc-uses-rep-term" class="Constraint">
              <pre><xmlBlurb memberOf="set" id="xb-rule-set-el-csc-uses-rep-term">
<sch:pattern>
  <sch:rule context="xs:element[@name and @type
       and (nf:has-effective-conformance-target-identifier(., xs:anyURI('MACRO_CT_URI_REF'))
            or nf:has-effective-conformance-target-identifier(., xs:anyURI('MACRO_CT_URI_EXT')))
       and (some $type-qname in resolve-QName(@type, .) satisfies (
              nf:get-target-namespace(.) != namespace-uri-from-QName($type-qname)
              and nf:resolve-type(., $type-qname)/xs:simpleContent))]">
    <sch:report role="warning"
        test="every $representation-term
              in (MACRO_LIST_OF_REPRESENTATION_TERMS, 'MACRO_REPRESENTATION_TERM_LIST')
              satisfies not(ends-with(@name, $representation-term))"
      >the name of an element declaration that is of simple content SHOULD use a representation term.</sch:report>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>

            <p>Representation terms are defined by <ref idref="table-representation-terms"/>. This rule supports <ref idref="rule-csc-has-rep-term"/>.</p>
          </ruleSection>

        </section>
      </section>
      <section><title>Element substitution group</title>

        <ruleSection><title>Element substitution group defined by conformant schema</title>
          <rule applicability="REF EXT" id="el-sg-from-ns" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-el-sg-from-ns">
<sch:pattern>
  <sch:rule context="xs:element[exists(@substitutionGroup)]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@substitutionGroup, .))"/>
    <sch:assert test="$namespace = nf:get-target-namespace(.)
                      or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)
                                    and $namespace = xs:anyURI(@namespace)
                                    and empty(@appinfo:externalImportIndicator)])"
      >An element substitution group MUST have either the target namespace or a namespace that is imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

      </section>
      <section><title>Attribute declaration</title>
        <ruleSection><title>Attribute type defined by conformant schema</title>
          <rule applicability="REF EXT" id="att-type-from-ns" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-att-type-from-ns">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@type)]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@type, .))"/>
    <sch:assert test="$namespace = (nf:get-target-namespace(.), xs:anyURI('MACRO_NS_XS'))
                      or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)
                                    and $namespace = xs:anyURI(@namespace)
                                    and empty(@appinfo:externalImportIndicator)])"
      >The type of an attribute declaration MUST have the target namespace or the XML Schema namespace or a namespace that is imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Attribute name uses representation term</title>
          <rule applicability="REF EXT" id="att-name-uses-rep-term" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-att-name-uses-rep-term">
<sch:pattern>
  <sch:rule context="xs:attribute[exists(@name)]">
    <sch:report role="warning"
        test="every $representation-term
              in (MACRO_LIST_OF_REPRESENTATION_TERMS, 'MACRO_REPRESENTATION_TERM_LIST')
              satisfies not(ends-with(@name, $representation-term))"
      >An attribute name SHOULD end with a representation term.</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

      </section>
      <section>
        <title>Notation declaration</title>

        <p>NIEM does not define any additional features relating to notation declarations. This section is present
          to maintain with MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#concepts-data-model,2.2,XML
          Schema Abstract Data Model), See <ref idref="section-profile-notation-declaration"/> for rules related
          to notation declarations.</p>
        
      </section>
    </section>

    <section>
      <title>Model group components</title>
      
      <section>
        <title>Model group</title>

        <p>NIEM does not define any additional features relating to model groups. This section is present to
          maintain with MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#concepts-data-model,2.2,XML Schema
          Abstract Data Model), See <ref idref="section-profile-model-group"/> for rules related to model
          groups.</p>

      </section>
      
      <section><title>Particle</title>
        <section><title>Element use</title>

          <ruleSection><title>Element or attribute declaration introduced only once into a type</title>
            <rule id="rule-decl-introduced-once" applicability="REF EXT" class="Constraint">
              <p>Within the schema, an element declaration or attribute declaration MUST NOT be introduced more
              than once into a type definition. This applies to content acquired by a type by any means,
              including from a base type definition, via element substitution groups, or through the use of
              attribute groups.</p>
      </rule>

      <p>This rule ensures that a type definition does not incorporate a component multiple times. As information
      exchange specifications often contain multiple versions of schemas, including reference schemas as well as
      subset and constraint schemas, it may be easy to omit an element or attribute in one version of the schema,
      only to reincorporate it via an extension. This can cause difficulties in integrating such schemas, as it
      may be impossible to use a reference schema if an attribute is added twice, in both a base type and an
      extension type, since that would make it an invalid schema.</p>

      <p>Incorporating a component multiple times can also make it difficult to avoid violating XML
        Schema<char name="rsquo"/>s unique particle attribution constraint, which is described by

        MACRO_REF_EXTERNAL(XMLSchema-1,http://www.w3.org/TR/2004/REC-xmlschema-1-20041028/#cos-nonambig,3.8.6,Constraints on Model Group Schema Components).

        This can create difficulty if an element is added both directly, and via a substitution group head. In
        such a case, a parser may not be able to determine which element use is responsible for an element in an
        instance, which is a violation of the UPA constraint.</p>

      <p>This rule is also intended to prevent developers from creating complicated sequences of recurring
        elements. Such definitions are difficult for developers to satisfy in code, and can cause havoc with XML
        Schema language binding tools. If an element is needed more than once, or if a particular sequence of
        elements is needed, a developer should consider the use of flexible content models (via substitution
        groups) along with additional rules.</p>

      </ruleSection>

          <ruleSection><title>Element reference defined by conformant schema</title>
            <rule applicability="REF EXT" id="el-ref-from-ns" class="Constraint">
              <pre><xmlBlurb memberOf="ref ext" id="xb-el-ref-from-ns">
<sch:pattern>
  <sch:rule context="xs:element[MACRO_NOT_IN_ADAPTER_TYPE and @ref]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@ref, .))"/>
    <sch:assert test="$namespace = nf:get-target-namespace(.)
                      or exists(ancestor::xs:schema[1]/xs:import[exists(@namespace)
                                    and $namespace = xs:anyURI(@namespace)
                                    and empty(@appinfo:externalImportIndicator)])"
      >An element reference MUST be to a component that has a namespace that is either the target namespace of the schema document in which it appears, or which is imported as conformant by that schema document.</sch:assert>
  </sch:rule>
</sch:pattern>
              </xmlBlurb></pre>
            </rule>
            <p>The term <termRef>schema document</termRef> is a defined term.</p>
          </ruleSection>

        </section>
      </section>
      <section><title>Attribute use</title>
        <ruleSection>
          <title>Referenced attribute defined by conformant schemas</title>
          <rule applicability="REF EXT" id="att-ref-from-ns" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-att-ref-from-ns">
<sch:pattern>
  <sch:rule context="xs:attribute[@ref]">
    <sch:let name="namespace" value="namespace-uri-from-QName(resolve-QName(@ref, .))"/>
    <sch:assert test="some $namespace in namespace-uri-from-QName(resolve-QName(@ref, .)) satisfies (
                        $namespace = nf:get-target-namespace(.)
                        or ancestor::xs:schema[1]/xs:import[
                             @namespace
                             and $namespace = xs:anyURI(@namespace)
                             and empty(@appinfo:externalImportIndicator)])"
      >An attribute {}ref MUST have the target namespace or a namespace that is imported as conformant.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

      <section><title>Attribute group use</title>
        <ruleSection>
          <title>Schema uses only known attribute groups</title>

          <p>In conformant schemas, use of attribute groups is restricted. The only attribute group defined by
            NIEM for use in conformant schemas is <qName>structures:SimpleObjectAttributeGroup</qName>. This
            attribute group provides the attributes necessary for IDs, references, metadata, and relationship
            metadata. In addition, there are attributes defined by ISM and NTK namespaces, which may be used in
            conformant schemas. Rationale for this use is provided in <ref idref="section-ism-ntk"/>.</p>

          <rule applicability="REF EXT" id="rule-known-att-grp-refs" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-known-att-grp-ref">
<sch:pattern>
  <sch:rule context="xs:attributeGroup[@ref]">
    <sch:assert test="some $ref in resolve-QName(@ref, .) satisfies (
                        $ref = xs:QName('structures:SimpleObjectAttributeGroup')
                        or namespace-uri-from-QName($ref) = (xs:anyURI('MACRO_NS_IC_ISM'),
                                                             xs:anyURI('MACRO_NS_IC_NTK')))"
      >An attribute group reference MUST be structures:SimpleObjectAttributeGroup or have the IC-ISM or IC-NTK namespace.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>
      </section>

      </section>
      <section>
        <title>Wildcard</title>
        
        <p>NIEM does not define any additional features relating to wildcards. This section is present to
          maintain with MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#concepts-data-model,2.2,XML Schema
          Abstract Data Model), See <ref idref="section-profile-wildcard"/> for rules related to wildcards.</p>

      </section>
    </section>
    <section>
      <title>Identity-constraint definition components</title>

        <p>NIEM does not define any additional features relating to identity-constraint definition components. This section
          is present to maintain with
          MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#concepts-data-model,2.2,XML Schema Abstract Data
          Model), See <ref idref="section-profile-identity-constraint"/> for rules related to identity-constraint
          definition components.</p>
      
    </section>
    <section><title>Group definition components</title>
      <section>
        <title>Model group definition</title>

        <p>NIEM does not define any additional features relating to model group definitions. This section is
          present to maintain with
          MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#concepts-data-model,2.2,XML Schema Abstract Data
          Model), See <ref idref="section-profile-model-group-definitions"/> for rules related to model group
          definitions.</p>
        
      </section>
      <section>
        <title>Attribute group definition</title>

        <p>NIEM does not define any additional features relating to attribute group definitions. This section is
          present to maintain with
          MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#concepts-data-model,2.2,XML Schema Abstract Data
          Model), See <ref idref="section-profile-attribute-group-definition"/> for rules related to attribute
          group definitions.</p>

      </section>
    </section>

    <section><title>Annotation components</title>

      <p>NIEM-conformant schemas define data models for the purpose of information exchange. A major part of defining data models is the proper definition of the contents of the model. What does a component mean, and what might it contain? How should it be used? NIEM- conformant schemas contain the invariant part of the definitions for the data model. The set of definitions includes:</p>
      <ol>
        <li><p>A text definition of each component. This describes what the component means. The term used in this specification for such a text definition is <em>data definition</em>.</p></li>
        <li><p>The structural definition of each component. This is made up of XML Schema component definitions,
            along with certain <termRef>application information</termRef>
            (via <qName>xs:appinfo</qName>).</p></li>
      </ol>
      <p>When possible, meaning is expressed via XML Schema mechanisms: type derivation, element substitution, specific types and structures, as well as names that may be easily parsed. Beyond that, NIEM-specific syntax must be used, as discussed in this section.</p>

      <section id="SectionHumanReadableDocumentation">

        <title>Human-readable documentation</title>
        <p>Note that <ref idref="def-11179-4-req"/> and <ref idref="def-11179-4-rec"/> apply <ref idref="ISO11179-4"/> definition rules to documented components.</p>

        <ruleSection><title>Data definition does not introduce ambiguity</title>
        <rule applicability="REF EXT" class="Constraint">
          <p>Words or synonyms for the words within a data definition MUST NOT be reused as terms in the corresponding component name if those words dilute the semantics and understanding of, or impart ambiguity to, the entity or concept that the component represents.</p>
        </rule>
        <p>This document defines the term <termRef>data definition</termRef>.</p>
        </ruleSection>

        <ruleSection><title>Object class has only one meaning</title>
        <rule applicability="REF EXT" class="Constraint">
          <p>An object class MUST have one and only one associated semantic meaning (i.e., a single word sense) as described in the definition of the component that represents that object class.</p>
        </rule>
        </ruleSection>

        <ruleSection><title>Data definition of a part does not redefine the whole</title>
        <rule applicability="REF EXT" class="Constraint">
          <p>An object class MUST NOT be redefined within the definitions of the components that represent properties or subparts of that entity or class.</p>
        </rule>
        <p>Data definitions should be concise, precise, and unambiguous without embedding additional definitions
          of data elements that have already been defined once elsewhere (such as object
          classes). <ref idref="ISO11179-4"/> says that definitions should not be nested inside other
          definitions. Furthermore, a data dictionary is not a language dictionary. It is acceptable to reuse
          terms (object class, property term, and qualifier terms) from a component name within its corresponding
          definition to enhance clarity, as long as the requirements and recommendations of
          <ref idref="ISO11179-4"/> are not violated. This further enhances brevity and precision.</p>
        </ruleSection>

        <ruleSection><title>Do not leak representation into data definition</title>
        <rule applicability="REF EXT" class="Constraint">
          <p>A data definition SHOULD NOT contain explicit representational or data typing information such as
          number of characters, classes of characters, range of mathematical values, etc., unless the very nature
          of the component can be described only by such information.</p>
        </rule>
        <p>A component definition is intended to describe semantic meaning only, not representation or
          structure. How a component with simple content is represented is indicated through the representation
          term, but the primary source of representational information should come from the XML Schema definition
          of the types themselves. A developer should try to keep a component<char name="rsquo"/>s data definition decoupled from
          its representation.</p>
        </ruleSection>

      <ruleSection>
        <title>Data definition follows 11179-4 requirements</title>
        <rule applicability="REF EXT" id="def-11179-4-req" class="Constraint">
          <p>Each <termRef>data definition</termRef> MUST conform to the requirements for data definitions
            provided by MACRO_REF_EXTERNAL(ISO11179-4,,5.2,Requirements).</p>
        </rule>
      </ruleSection>

      <ruleSection>
        <title>Data definition follows 11179-4 recommendations</title>
        <rule applicability="REF EXT" id="def-11179-4-rec" class="Constraint">
          <p>Each <termRef>data definition</termRef> SHOULD conform to the recommendations for data definitions
            provided by MACRO_REF_EXTERNAL(ISO11179-4,,5.3,Recommendations).</p>
        </rule>
      </ruleSection>

      <section><title>Data definition opening phrases</title>

        <p>In order to provide a more consistent voice across NIEM, a model built from requirements from many
          different sources, component data definitions should begin with a standard opening phrase, as defined
          below.</p>

        <section><title>Element and attribute opening phrases</title>

        <ruleSection><title>Standard opening phrase for augmentation point element data definition</title>
          <rule applicability="REF EXT" id="rule-sop-augmentation-point" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-augmentation-point">
<sch:pattern>
  <sch:rule context="xs:element[ends-with(@name, 'AugmentationPoint')]/xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(starts-with(lower-case(normalize-space(.)), 'an augmentation point '))"
      >The data definition for an augmentation point element SHOULD begin with standard opening phrase "An augmentation point...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for augmentation element data definition</title>
          <rule applicability="REF EXT" id="rule-sop-augmentation" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-augmentation">
<sch:pattern>
  <sch:rule context="xs:element[ends-with(@name, 'Augmentation')]/xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="every $phrase
              in ('supplements ', 'additional information about ')
              satisfies not(starts-with(lower-case(normalize-space(.)), $phrase))"
      >The data definition for an augmentation element SHOULD begin with the standard opening phrase "Supplements..." or "Additional information about...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for metadata element data definition</title>
          <rule applicability="REF EXT" id="rule-sop-metadata" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-metadata">
<sch:pattern>
  <sch:rule context="xs:element[ends-with(@name, 'Metadata')
                                and not(xs:boolean(@abstract) eq true())]/xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '(metadata about|information that further qualifies)'))"
      >The data definition for a metadata element SHOULD begin with the standard opening phrase "Metadata about..." or "Information that further qualifies...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for association element data definition</title>
          <rule applicability="REF EXT" id="rule-sop-association" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-association">
<sch:pattern>
  <sch:rule context="xs:element[ends-with(@name, 'Association')
                                and not(xs:boolean(@abstract) eq true())]/xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^an?( .*)? (relationship|association)'))"
      >The data definition for an association element that is not abstract SHOULD begin with the standard opening phrase "An (optional adjectives) (relationship|association)...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for abstract element data definition</title>
          <rule applicability="REF EXT" id="rule-sop-abstract" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-abstract">
<sch:pattern>
  <sch:rule context="xs:element[xs:boolean(@abstract) = true()
                       and not(ends-with(@name, 'AugmentationPoint'))]/xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(starts-with(lower-case(normalize-space(.)), 'a data concept'))"
      >The data definition for an abstract element SHOULD begin with the standard opening phrase "A data concept...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for date element or attribute data definition</title>
          <rule applicability="REF EXT" id="rule-sop-date" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-date">
<sch:pattern>
  <sch:rule context="*[(self::xs:element or self::xs:attribute)
                       and ends-with(@name, 'Date') and not(xs:boolean(@abstract) eq true())]
                      /xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^an?( .*)? (date|month|year)'))"
      >The data definition for an element or attribute with a date representation term SHOULD begin with the standard opening phrase "(A|An) (optional adjectives) (date|month|year)...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for quantity element or attribute data definition</title>
          <rule applicability="REF EXT" id="rule-sop-quantity" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-quantity">
<sch:pattern>
  <sch:rule context="*[(self::xs:element or self::xs:attribute)
                       and ends-with(@name, 'Quantity') and not(xs:boolean(@abstract) eq true())]
                      /xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^an?( .*)? (count|number)'))"
      >The data definition for an element or attribute with a quantity representation term SHOULD begin with the standard opening phrase "An (optional adjectives) (count|number)...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for picture element or attribute data definition</title>
          <rule applicability="REF EXT" id="rule-sop-picture" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-picture">
<sch:pattern>
  <sch:rule context="*[(self::xs:element or self::xs:attribute)
                       and ends-with(@name, 'Picture') and not(xs:boolean(@abstract) eq true())]
                      /xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^an?( .*)? (image|picture|photograph)'))"
      >The data definition for an element or attribute with a picture representation term SHOULD begin with the standard opening phrase "An (optional adjectives) (image|picture|photograph)".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for indicator element or attribute data definition</title>
          <rule applicability="REF EXT" id="rule-sop-indicator" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-indicator">
<sch:pattern>
  <sch:rule context="*[(self::xs:element or self::xs:attribute)
                       and ends-with(@name, 'Indicator') and not(xs:boolean(@abstract) eq true())]
                      /xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^true if .*; false (otherwise|if)'))"
      >The data definition for an element or attribute with an indicator representation term SHOULD begin with the standard opening phrase "True if ...; false (otherwise|if)...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for identification element or attribute data definition</title>
          <rule applicability="REF EXT" id="rule-sop-identification" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-identification">
<sch:pattern>
  <sch:rule context="*[(self::xs:element or self::xs:attribute)
                       and ends-with(@name, 'Identification') and not(xs:boolean(@abstract) eq true())]
                      /xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^an?( .*)? identification'))"
      >The data definition for an element or attribute with an identification representation term SHOULD begin with the standard opening phrase "(A|An) (optional adjectives) identification...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for name element or attribute data definition</title>
          <rule applicability="REF EXT" id="rule-sop-name" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-name">
<sch:pattern>
  <sch:rule context="*[(self::xs:element or self::xs:attribute)
                       and ends-with(@name, 'Name') and not(xs:boolean(@abstract) eq true())]
                      /xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^(a|an)( .*)? name'))"
      >The data definition for an element or attribute with a name representation term SHOULD begin with the standard opening phrase "(A|An) (optional adjectives) name...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for element or attribute data definition</title>
          <rule applicability="REF EXT" id="rule-sop-element" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-element">
<sch:pattern>
  <sch:rule context="*[(self::xs:element or self::xs:attribute)
                       and @name
                       and not(ends-with(@name, 'Indicator'))
                       and not(ends-with(@name, 'Augmentation'))
                       and not(ends-with(@name, 'Metadata'))
                       and not(xs:boolean(@abstract) eq true())]
                      /xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^an? '))"
      >The data definition for an element or attribute declaration SHOULD begin with the standard opening phrase "(A|An)".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        </section>
        <section><title>Complex type opening phrases</title>

        <ruleSection><title>Standard opening phrase for association type data definition</title>
          <rule applicability="REF EXT" id="rule-sop-association-type" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-association-type">
<sch:pattern>
  <sch:rule context="xs:complexType[ends-with(@name, 'AssociationType')]/xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^a data type for (a relationship|an association)'))"
      >The data definition for an association type SHOULD begin with the standard opening phrase "A data type for (a relationship|an association)...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for augmentation type data definition</title>
          <rule applicability="REF EXT" id="rule-sop-augmentation-type" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-augmentation-type">
<sch:pattern>
  <sch:rule context="xs:complexType[ends-with(@name, 'AugmentationType')]/xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)),
                          '^a data type (that supplements|for additional information about)'))"
      >The data definition for an augmentation type SHOULD begin with the standard opening phrase "A data type (that supplements|for additional information about)...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for metadata type data definition</title>
          <rule applicability="REF EXT" id="rule-sop-metadata-type" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-metadata-type">
<sch:pattern>
  <sch:rule context="xs:complexType[ends-with(@name, 'MetadataType')]/xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)),
                          '^a data type for (metadata about|information that further qualifies)'))"
      >The data definition for a metadata type SHOULD begin with the standard opening phrase "A data type for (metadata about|information that further qualifies)...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection><title>Standard opening phrase for complex type data definition</title>
          <rule applicability="REF EXT" id="rule-sop-complex-type" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-complex-type">
<sch:pattern>
  <sch:rule context="xs:complexType/xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^a data type'))"
      >The data definition for a complex type SHOULD begin with the standard opening phrase "A data type...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        </section>

        <ruleSection><title>Standard opening phrase for simple type data definition</title>
          <rule applicability="REF EXT" id="rule-sop-simple-type" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-rule-sop-simple-type">
<sch:pattern>
  <sch:rule context="xs:simpleType/xs:annotation/xs:documentation[1]">
    <sch:report role="warning"
        test="not(matches(lower-case(normalize-space(.)), '^a data type'))"
      >The data definition for a simple type SHOULD begin with a standard opening phrase "A data type...".</sch:report>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

      </section>
      </section>
    </section>

    <section><title>Schema as a whole</title>
      <section>
        <title><qName>xs:schema</qName> document element restrictions</title>

        <ruleSection><title>Same namespace means same components</title>
        <rule applicability="REF EXT" class="Interpretation">
          <p>Two XML Schema documents MUST have the same value for
            attribute <local-name>targetNamespace</local-name> carried by the element <qName>xs:schema</qName>,
            if and only if they represent the same set of components.</p>
        </rule>
        </ruleSection>

        <ruleSection><title>Different version means different view</title>
        <rule applicability="REF EXT" class="Interpretation">
          <p>Two XML Schema documents MUST have the same value for
            attribute <local-name>targetNamespace</local-name> carried by the element <qName>xs:schema</qName>,
            and different values for attribute <local-name>version</local-name> carried by the
            element <qName>xs:schema</qName> if and only if they are profiles of the same set of
            components.</p>
        </rule>
        </ruleSection>

        <p>These rules embody the basic philosophy behind NIEM<char name="rsquo"/>s use of components with namespaces:
        A component is uniquely identified by its class (e.g. element, attribute, type), its namespace (a URI),
        and its local name (an unqualified string). Any two matching component identifiers refer to the same
        component, even if the versions of the schemas containing each are different.</p>
      </section>
    </section>

    <section><title>Schema assembly</title>
      <ruleSection><title>Reference schema document imports reference schema document</title>
        <rule applicability="SET" id="xs-import-consistent-with-schema" class="Constraint">
          <pre><xmlBlurb memberOf="set" id="xb-xs-import-consistent-with-schema">
<sch:pattern>
  <sch:rule context="xs:import[
                         nf:has-effective-conformance-target-identifier(., xs:anyURI('MACRO_CT_URI_REF'))
                         and exists(@namespace)
                         and empty(@appinfo:externalImportIndicator)
                         and not(xs:anyURI(@namespace) = (xs:anyURI('MACRO_NS_STRUCTURES'),
                                                          xs:anyURI('MACRO_NS_XML')))]">
    <sch:assert test="some $schema in nf:resolve-namespace(., @namespace) satisfies
                        nf:has-effective-conformance-target-identifier($schema, xs:anyURI('MACRO_CT_URI_REF'))"
      >A namespace imported as conformant from a reference schema document MUST identify a namespace defined by a reference schema document.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>

        <p>This document defines the term <termRef>reference schema document</termRef>.</p>

      </ruleSection>

      <ruleSection><title>Extension schema document imports reference or extension schema document</title>
        <rule applicability="SET" id="rule-ext-imports-ext" class="Constraint">
          <pre><xmlBlurb memberOf="set" id="xb-rule-ext-imports-ext">
<sch:pattern>
  <sch:rule context="xs:import[
                         nf:has-effective-conformance-target-identifier(., xs:anyURI('MACRO_CT_URI_EXT'))
                         and exists(@namespace)
                         and empty(@appinfo:externalImportIndicator)
                         and not(xs:anyURI(@namespace) = (xs:anyURI('MACRO_NS_STRUCTURES'),
                                                          xs:anyURI('MACRO_NS_XML')))]">
    <sch:assert test="some $schema in nf:resolve-namespace(., @namespace) satisfies (
                        nf:has-effective-conformance-target-identifier($schema, xs:anyURI('MACRO_CT_URI_REF'))
                        or nf:has-effective-conformance-target-identifier($schema, xs:anyURI('MACRO_CT_URI_EXT')))"
      >A namespace imported as conformant from an extension schema document MUST identify a namespace defined by a reference schema document or an extension schema document.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>

        <p>This document defines the terms <termRef>extension schema document</termRef>
        and <termRef>reference schema document</termRef>.</p>

      </ruleSection>

      <section><title>Supporting namespaces are imported as conformant</title>

        <p>There are several namespaces that are treated specially by the NIEM NDR. When the following namespaces
          are imported into a conformant schema document, they must be imported as if they are conformant. That
          is, the <qName>xs:import</qName> element must not have an
          attribute <qName>appinfo:externalImportIndicator</qName> with a value of <q>true</q>.</p>

        <ruleSection><title>Structures imported as conformant</title>
          <rule applicability="REF EXT" id="structures-imported-conformant" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-structures-imported-conformant">
<sch:pattern>
  <sch:rule context="xs:import[exists(@namespace)
                               and xs:anyURI(@namespace) = xs:anyURI('MACRO_NS_STRUCTURES')]">
    <sch:assert test="empty(@appinfo:externalImportIndicator)"
      >An import of the structures namespace MUST NOT be labeled as an external import.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <ruleSection>
          <title>XML namespace imported as conformant</title>
          <rule applicability="REF EXT" id="schema-for-xml-imported-conformant" class="Constraint">
            <pre><xmlBlurb memberOf="ref ext" id="xb-schema-for-xml-imported-conformant">
<sch:pattern>
  <sch:rule context="xs:import[exists(@namespace)
                               and xs:anyURI(@namespace) = xs:anyURI('MACRO_NS_XML')]">
    <sch:assert test="empty(@appinfo:externalImportIndicator)"
      >An import of the XML namespace MUST NOT be labeled as an external import.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>
      </section>

      <ruleSection><title>Each namespace may have only a single root schema in a schema set</title>
        <rule applicability="SET" id="namespace-appears-once" class="Constraint">
          <pre><xmlBlurb memberOf="set" id="xb-namespace-appears-once">
<sch:pattern>
  <sch:rule context="xs:schema[exists(@targetNamespace)
                               and (some $element
                                   in nf:resolve-namespace(., xs:anyURI(@targetNamespace))
                                   satisfies $element is .)]">
    <sch:assert test="count(nf:resolve-namespace(., xs:anyURI(@targetNamespace))) = 1"
                >A namespace may appear as a root schema in a schema set only once.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

      <ruleSection><title>Consistently marked namespace imports</title>
        <p>XML Schemas allows multiple xs:import elements for the same
          namespace, which allows for multiple sets of annotations and schema
          locations. </p>
        <rule applicability="REF EXT" id="rule-import-is-consistent" class="Constraint">
          <pre><xmlBlurb id="xb-rule-import-is-consistent" memberOf="ref ext">
<sch:pattern>
  <sch:rule context="xs:import">
    <sch:let name="namespace" value="@namespace"/>
    <sch:let name="is-conformant" value="empty(@appinfo:externalImportIndicator)"/>
    <sch:let name="first" value="exactly-one(parent::xs:schema/xs:import[@namespace = $namespace][1])"/>
    <sch:assert test=". is $first
                      or $is-conformant = empty($first/@appinfo:externalImportIndicator)"
            >All xs:import elements that have the same namespace MUST have the same conformance marking via appinfo:externalImportIndicator.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>
      </ruleSection>

    </section>

  </section>

  <section id="section-xml-instance-document-rules">
    <title>XML instance document rules</title>

    <p>This specification attempts to restrict XML instance data as little as possible while still maintaining
      interoperability.</p>

    <p>NIEM does not require a specific encoding or specific requirements for the XML prologue, except as
      specified by <ref idref="XML"/>.</p>

    <ruleSection>
      <title>Instance must be schema-valid</title>

      <rule applicability="INS" class="Constraint">
        <p>The XML document MUST be schema-valid, as assessed against a <termRef>conformant schema document
          set</termRef>, composed of authoritative, comprehensive schema documents for the relevant
          namespaces.</p>
      </rule>

      <p>The schemas that define the exchange must be authoritative. Each is the reference schema or extension
      schema for the namespace it defines. Application developers may use other schemas for various purposes, but
      for the purposes of determining conformance, the authoritative schemas are relevant.</p>

      <p>This rule should not be construed to mean that XML validation must be performed on all XML instances as
        they are served or consumed; only that the XML instances validate if XML validation is performed. The XML
        Schema component definitions specify XML documents and element information items, and the instances
        should follow the rules given by the schemas, even when validation is not performed.</p>

      <p>NIEM embraces the use of XML Schema instance attributes,
        including <qName>xsi:type</qName>, <qName>xsi:nil</qName>, and <qName>xsi:schemaLocation</qName>, as
        specified by <ref idref="XMLSchema-1"/>.</p>
    </ruleSection>

    <section><title>The meaning of NIEM data</title>

      <p>The main way that NIEM XML data represents relationships and values is via the hierarchy of XML elements
        in an XML document. For example, the following fragment of an XML document:</p>

      <figure>
        <title>Example of content elements</title>
        <pre><xmlBlurb id="xb-example-content-element">
<nc:Person>
  <nc:PersonName>
    <nc:PersonFullName>John Doe</nc:PersonFullName>
  </nc:PersonName>
</nc:Person>
        </xmlBlurb></pre>
      </figure>

      <p>In this instance, the XML elements describe relationships between data objects:</p>

      <table id="table-meaning-of-xml">
        <title>Meaning of NIEM XML</title>
        <theadr>
          <th>XML description</th>
          <th>The Meaning of the data</th>
        </theadr>
        <tr>
          <td>The top element occurs within some context, about which we do not know anything.</td>
          <td>There is some object, representing whatever is outside the outer element.</td>
        </tr>
        <tr>
          <td>The top element is <qName>nc:Person</qName>. The NIEM reference schema defines the type
            of the element as <qName>nc:PersonType</qName>.</td>
          <td>There is a relationship, called <qName>nc:Person</qName>, between the unknown context object and an
            object of type <qName>nc:PersonType</qName>.</td>
        </tr>
        <tr>
          <td>The next element is <qName>nc:PersonName</qName>. The schema indicates that element is of
            type <qName>nc:PersonNameType</qName>.</td>
          <td>There is a relationship called <qName>nc:PersonName</qName> between the object of
            type <qName>nc:PersonType</qName> and an object of type <qName>nc:PersonNameType</qName>.</td>
        </tr>
        <tr>
          <td>The next element is <qName>nc:PersonFullName</qName>. The schema shows that the element is of
            type <qName>nc:PersonNameTextType</qName>.</td>
          <td>There is a relationship, called <qName>nc:PersonFullName</qName> from the object of
            type <qName>nc:PersonNameType</qName> and an object of
            type <qName>nc:PersonNameTextType</qName>.</td>
        </tr>
        <tr>
          <td>Within that element is the simple value <q>John Doe</q>. The schema tells us the content of that
            element is of simple type <qName>xs:string</qName>.</td>
          <td>The object of type <qName>nc:PersonNameTextType</qName> has a value that is the literal <q>John
              Doe</q>.</td>
        </tr>
      </table>

      <p>To summarize:</p>

      <ol>
        <li><p>Data objects and literal values are expressed in XML as the values of elements and
            attributes.</p></li>
        <li><p>The names of the XML elements and attributes identify and describe the relationships between the
            objects and literals.</p></li>
        <li><p>The names of the XML Schema complex types and simple types describe the data objects.</p></li>
      </ol>

      <p>NIEM is designed so that NIEM XML data is a form of RDF data. This is described in some detail by
        <ref idref="section-conceptual-model"/>, in particular <ref idref="section-instance-rdf-mapping"/>. The
        XML data, above, corresponds to the following graph. Here, the circles are data objects, and the arrows
        show relationships, between the objects, and between the objects and their types:</p>

      <figure id="figure-instance-rdf-diagram">
        <title>Diagram showing the meaning of XML data</title>
        <image src="img/instance-rdf.png"/>
      </figure>

    <ruleSection><title>Empty content has no meaning</title>
      <rule applicability="INS" class="Interpretation">

        <p>Within the instance, the meaning of an element with no content is that additional properties are not
          asserted. There MUST NOT be additional meaning interpreted for an element with no content.</p>

      </rule>

      <p>Elements without content only show a lack of asserted information. That is, all that is asserted is what
        is explicitly stated, through a combination of XML instance data and its schema. Data that is not present
        makes no claims. It may be absent due to lack of availability, lack of knowledge, or deliberate
        withholding of information. These cases should be modeled explicitly, if they are required.</p>
    </ruleSection>

    </section>

    <section id="section-id-and-ref">
      <title>Identifiers and references</title>

      <p>Nested elements, shown above, are sufficient to represent simple data that takes the form of a
        tree. However, the use of nested elements has limitations; expression of all relationships via nested
        elements is not always possible. Situations that cause problems include:</p>

        <ul>
          <li>
            <p>Cycles: some object has a relationship that, when followed, eventually circles back to itself. For
              example, suppose that <em>Bob</em> has a <em>sister</em> relationship to <em>Sue</em>, who has
              a <em>brother</em> relationship back to <em>Bob</em>. This is not a tree, and so needs some
              representation other than just nested elements.</p>
          </li>

          <li>
            <p>Reuse: multiple objects have a relationship to a common object. For example, suppose
              <em>Bob</em> and <em>Sue</em> both have a <em>mother</em> relationship to <em>Sally</em>. Expressed
              via nested elements, this would result in a duplicate representation of <em>Sally</em>.</p>
          </li>
        </ul>

        <p>NIEM provides two different ways to solve this problem: the use of local references pointing to local
          identifiers, and the use of uniform resource identifiers (URIs). These two methods are similar, and can
          interoperate, but have distinctions, as described by <ref idref="compare-contrast-id-ref-uri"/>.</p>

        <ruleSection>
          <title>Element has only one resource identifying attribute</title>
          <rule applicability="INS" class="Constraint" id="rule-only-one-id">
            <pre><xmlBlurb id="xb-rule-only-one-id" memberOf="ins">
<sch:pattern>
  <sch:rule context="*[exists(@structures:id) or exists(@structures:ref) or exists(@structures:uri)]">
    <sch:assert test="count(@structures:id | @structures:ref | @structures:uri) le 1"
      >An element MUST NOT have more than one attribute that is structures:id, structures:ref, or structures:uri.</sch:assert>
  </sch:rule>
</sch:pattern>
            </xmlBlurb></pre>
          </rule>
        </ruleSection>

        <section>
          <title>Local identifiers and references</title>

          <p>The XML specifications define ID and IDREF attributes, which act as references in XML data. This is
          supported by XML Schema, and NIEM uses ID and IDREF as one way to reference data across data
            objects. Under this framework:</p>

          <ul>
            <li><p>Within an XML document, each value of any attribute of type <qName>xs:ID</qName> must be
                unique. For example, if an element has an attribute of type <qName>xs:ID</qName> with the value
                of <q>Bob</q>, then there may not be any other attribute in the document that is of
                type <qName>xs:ID</qName> that also has the value <q>Bob</q>. NIEM provides
                attribute <qName>structures:id</qName> of type <qName>xs:ID</qName> to act as a standard local
                identifier.</p></li>

            <li><p>Within an XML document, the value of any attribute of type <qName>xs:IDREF</qName> must appear
                somewhere within the document as the value of some attribute of type <qName>xs:ID</qName>. For
                example, if an attribute of type <qName>xs:IDREF</qName> has the value <q>Bob</q>, then somewhere
                within that XML document there must be an attribute of type <qName>xs:ID</qName> with the
                value <q>Bob</q>. NIEM provides attribute <qName>structures:ref</qName> of
                type <qName>xs:IDREF</qName> as a standard local reference.</p></li>
            
            <li><p>These constraints, that IDs must be unique, and that IDREFs must refer to IDs, are XML
                constraints, not unique to NIEM.</p>
            </li>
            <li><p>There are additional constraints placed on XML documents and XML schemas regarding the use of
                ID and IDREF attributes. For example, an element may not have two attributes of type ID.</p></li>
          </ul>

          <p>In short, within a NIEM-conformant XML document, an attribute <qName>structures:ref</qName> refers
            to an attribute <qName>structures:id</qName>. These attributes may appear in an XML document to
            express that an object that is the value of an element is the same as some other object within the
            document. For example, in the following example, the user of the weapon (Bart) is the same person
            that is the subject of the arrest:</p>

          <figure id="figure-id-ref-example">
            <title>Example of <qName>structures:id</qName> and <qName>structures:ref</qName></title>
            <pre><xmlBlurb id="xb-id-ref-example">
<j:Arrest>
  <j:ArrestInvolvedWeapon>
    <nc:WeaponUser structures:id="bart">
      <nc:PersonName>
        <nc:PersonGivenName>Bart</nc:PersonGivenName>
      </nc:PersonName>
    </nc:WeaponUser>
  </j:ArrestInvolvedWeapon>
  <j:ArrestSubject>
    <nc:RoleOfPerson structures:ref="bart" xsi:nil="true"/>
  </j:ArrestSubject>
</j:Arrest>
            </xmlBlurb></pre>
          </figure>

          <p>Note that rules below establish that relationships established using <qName>structures:id</qName>
            and <qName>structures:ref</qName> have the exact same meaning as relationships established using
            nested elements. An information exchange specification may constrain them differently, or prefer one
            over the other, but from a NIEM perspective, they have the same meaning.</p>

      <ruleSection>
        <title>Attribute <qName>structures:ref</qName> must reference <qName>structures:id</qName></title>

        <p>Although many attributes with ID and IDREF semantics are defined by many vocabularies, for
          consistency, within a NIEM XML document any attribute <qName>structures:ref</qName> must refer to an
          attribute <qName>structures:id</qName>, and not any other attribute.</p>

        <rule applicability="INS" class="Constraint" id="rule-ref-refs-id">
          <pre><xmlBlurb id="xb-rule-ref-refs-id" memberOf="ins">
<sch:pattern>
  <sch:rule context="*[@structures:ref]">
    <sch:let name="ref" value="@structures:ref"/>
    <sch:assert test="exists(//*[@structures:id = $ref])"
      >The value of an attribute structures:ref MUST match the value of an attribute structures:id of some element in the XML document.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>

        <p>This mirrors the terminology in
          MACRO_REF_EXTERNAL(XML,MACRO_HREF_XML#idref,[[[]]],Validity
          constraint: IDREF) within
          MACRO_REF_EXTERNAL([[[]]],MACRO_HREF_XML#sec-attribute-types,3.3.1,Attribute Types),
          except it requires the target attribute to
          be <qName >structures:id</qName >, rather than any attribute of type <code >ID</code >.</p >

      </ruleSection>

      <ruleSection>
        <title>Linked elements have same validation root</title>

        <p>NIEM supports type-safe references: references using <qName>structures:ref</qName>
          and <qName>structures:id</qName> must preserve the type constraints that would apply if nested elements
          were used instead of a reference. For example, an element of type <qName>nc:PersonType</qName> must
          always refer to another element of type <qName>nc:PersonType</qName>, or a type derived
          from <qName>nc:PersonType</qName>, when using <qName>structures:ref</qName> to establish the
          relationship.</p>

        <rule applicability="INS" class="Constraint" id="rule-ref-and-id-have-same-validation-root">
          <p>Given that:</p>
          <ul>
            <li ><p ><var>$element</var> is an <a href="MACRO_HREF_XML_INFOSET#infoitem.element" >element information
                  item</a ></p ></li >
            <li ><p ><var>$element</var> has attribute <qName >structures:ref</qName > with value <var>$ref</var></p ></li >
            <li ><p ><var>$element</var> has <a href="MACRO_HREF_XML_SCHEMA_1#e-validation_context" >property [validation
                context]</a > with value called the <em>referencing element validation root</em></p ></li >

            <li ><p ><var>$target</var> is an <a href="MACRO_HREF_XML_INFOSET#infoitem.element" >element information
                  item</a ></p ></li >
            <li ><p ><var>$target</var> has attribute <qName >structures:id</qName > with value <var>$ref</var></p ></li >
            <li ><p ><var>$target</var> has <a href="MACRO_HREF_XML_SCHEMA_1#e-validation_context" >property [validation
                context]</a > with value called the <em>referenced element validation root</em></p ></li >
          </ul>
          <p>Every element that has an attribute <qName>structures:ref</qName> MUST have a referencing element
          validation root that is equal to the referenced element validation root.</p>
        </rule>

        <p>The term <q>validation root</q> is defined by
          MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#key-vr,5.2,Assessing Schema-Validity).
          It is established as a part of validity assessment of an XML document. It is required because
          relationships between the types of elements cannot be established if those elements were not assessed
          together.</p>

      </ruleSection>

      <ruleSection>
        <title>Attribute <qName>structures:ref</qName> references element of correct type</title>
        <rule applicability="INS" class="Constraint">
          <p>Given that:</p>
          <ul>
            <li ><p ><var>$element</var> is an <a href="MACRO_HREF_XML_INFOSET#infoitem.element" >element
                  information item</a ></p ></li >
            <li ><p ><var>$element</var> has attribute <qName >structures:ref</qName > with
                value <var>$ref</var></p ></li >
            <li ><p ><var >$element</var> has <a href="MACRO_HREF_XML_SCHEMA_1#e-type_definition" >property [type
                  definition]</a> with value called the <em >referencing element type definition</em>.</p></li>
            <li ><p ><var>$target</var> is an <a href="MACRO_HREF_XML_INFOSET#infoitem.element" >element
                  information item</a ></p ></li >
            <li ><p ><var>$target</var> has attribute <qName >structures:id</qName > with
                value <var>$ref</var></p ></li >
            <li ><p ><var>$target</var> has <a href="MACRO_HREF_XML_SCHEMA_1#e-type_definition" >property [type
                  definition]</a > with value called the <em >referenced element type
                  definition</em ></p ></li >
          </ul>
          <p >Every element that has an attribute <qName >structures:ref</qName > MUST have a <em >referenced
              element type definition</em > that is validly derived from the <em >referencing element type
              definition</em >.</p >
        </rule>

        <p>The term <strong>validly derived</strong> is as established by
          MACRO_REF_EXTERNAL(XMLSchema-1,MACRO_HREF_XML_SCHEMA_1#cos-ct-derived-ok,,Schema Component Constraint: Type Derivation OK (Complex))
          within
          MACRO_REF_EXTERNAL(,MACRO_HREF_XML_SCHEMA_1#coss-ct,3.4.6,Constraints on Complex Type Definition Schema Components).</p>

        <p>This rule requires that the type of the element pointed to by a <qName >structures:ref</qName >
          attribute must be of (or derived from) the type of the reference element.</p>

      </ruleSection>

        </section>

        <section>
          <title>Uniform resource identifiers in NIEM data</title>

          <p>NIEM supports the linked data methodology through the use of uniform resource identifiers (URIs),
            expressed through the attribute <qName>structures:uri</qName> in XML documents . This attribute works
            much like <qName>structures:ref</qName> and <qName>structures:id</qName>, and overlaps
            somewhat. Linked data introduces key terminology:</p>

          <ul>
            <li><p>Anything modeled or addressed by an information system may be called a <em>resource</em>:
                people, vehicles, reports, documents, relationships, ideas: anything that is talked about and
                modeled in an information system is a resource.</p></li>
            <li><p>Every resource may have a name, called a uniform resource identifier (URI).</p></li>
          </ul>

          <p>As described in
            <ref idref="section-unique-object-ids"/>, <qName>structures:uri</qName>, <qName>structures:id</qName>,
            and <qName>structures:ref</qName> each denote a resource identifier. Although
            a <qName>structures:ref</qName> must always refer to a <qName>structures:id</qName>, and a value
            of <qName>structures:id</qName> must be unique within its document, a <qName>structures:uri</qName>
            may refer to any of <qName>structures:uri</qName>, <qName>structures:ref</qName>,
            or <qName>structures:id</qName>.</p>

          <ruleSection>
            <title><qName>structures:uri</qName> denotes resource identifier</title>
            <rule applicability="INS" id="rule-uri-base" class="Interpretation">
              <p>The value of an attribute <qName>structures:uri</qName> is a URI-reference, as defined by
                <ref idref="RFC3986"/>, which denotes a resource identifier on the element holding the
                attribute, in accordance with evaluation consistent with <ref idref="RFC3986"/> and
                <ref idref="XMLBase"/>.</p>
            </rule>
          </ruleSection>

          <p>The following example shows a reference to an absolute URI, using the URN namespace for UUIDs:</p>
          
          <figure id="figure-example-structures-uri-absolute">
            <title>Example of <qName>structures:uri</qName> holding an absolute URI</title>
            <pre><xmlBlurb id="xb-example-structures-uri-absolute">
<example:ArrestMessage>
  <j:Arrest xsi:nil="true"
    structures:uri="urn:uuid:f81d4fae-7dec-11d0-a765-00a0c91e6bf6"/>
</example:ArrestMessage>
            </xmlBlurb></pre>
          </figure>
          
          <p>The following example shows a relative URI, using <qName>xml:base</qName> to carry the base URI for
            the document. The person object identified by the <qName>structures:uri</qName> attribute has the URI
            <code>http://state.example/scmods/B263-1655-2187</code>.</p>
            
          <figure id="figure-example-structures-uri-rel-with-base">
            <title>Example of <qName>structures:uri</qName> holding a relative URI, with
              an <qName>xml:base</qName></title>
            <pre><xmlBlurb id="xb-example-structures-uri-rel-with-base">
<example:ArrestMessage xml:base="http://state.example/scmods/">
  <j:Arrest>
    <j:ArrestSubject>
      <nc:RoleOfPerson structures:uri="B263-1655-2187"/>
    </j:ArrestSubject>
  </j:Arrest>
</example:ArrestMessage>
            </xmlBlurb></pre>
          </figure>
          
          <p>The following example shows a URI fragment. The example has no <qName>xml:base</qName>, so supposing
            the example was from file <code>https://example.org/path/to/file.xml</code>, the person object has
            the identifier <code>https://example.org/path/to/file.xml#first</code>.</p>
            
          <figure id="figure-example-structures-uri-fragment">
            <title>Example of <qName>structures:uri</qName> holding a fragment</title>
            <pre><xmlBlurb id="xb-example-structures-uri-fragment">
<example:ArrestMessage>
  <j:Arrest>
    <j:ArrestSubject>
      <nc:RoleOfPerson structures:uri="#first"/>
    </j:ArrestSubject>
  </j:Arrest>
</example:ArrestMessage>
            </xmlBlurb></pre>
          </figure>

          <p>The attributes <qName>structures:id</qName> and <qName>structures:ref</qName> each have a mapping to
            equivalent values of <qName>structures:uri</qName>.</p>

          <ruleSection>
            <title><qName>structures:id</qName> and <qName>structures:id</qName> denote resource
              identifier</title>
            <rule applicability="INS" id="rule-id-ref-is-uri" class="Interpretation">
              <p>The value of an attribute <qName>structures:id</qName> with a value of <var>$value</var>, or an
                attribute <qName>structures:ref</qName> with a value of <var>$value</var>, denotes a resource
                identifier on the element holding the attribute, as would be denoted by an
                attribute <qName>structures:uri</qName> with a value
                of <q><code>#</code></q><var>$value</var>.</p>
            </rule>
          </ruleSection>
          
          <p>For example, <code>structures:id="hello"</code>
            and <code>structures:ref="hello"</code> each denote the same resource identifier for
            an element as if it held an attribute <code>structures:uri="#hello"</code>.</p>

          <p>Consistent with <ref idref="section-unique-object-ids"/>, a set of elements that each have the same
            resource identifier denote the same object, which has that given identifier. This means that, in an
            XML representation, the properties of an object may be spread across a set of elements that share an
            identifier.</p>

          <p>The following example contains four references to the same object, which has the identifier
            <code>https://state.example/98723987/results.xml#delta</code>.</p>

          <figure id="figure-example-id-ref-uri">
            <title>Example of <qName>structures:uri</qName>, <qName>structures:id</qName>, and <qName>structures:ref</qName> identifying the same object.</title>
            <pre><xmlBlurb id="xb-example-structures-uri-id-ref-fragment">
<example:ArrestMessage xml:base="https://state.example/98723987/results.xml">
  <j:Arrest>
    <j:ArrestSubject>
      <nc:RoleOfPerson structures:id="delta"/>
    </j:ArrestSubject>
  </j:Arrest>
  <j:Arrest>
    <j:ArrestSubject>
      <nc:RoleOfPerson structures:ref="delta"/>
    </j:ArrestSubject>
  </j:Arrest>
  <j:Arrest>
    <j:ArrestSubject>
      <nc:RoleOfPerson structures:uri="#delta"/>
    </j:ArrestSubject>
  </j:Arrest>
  <j:Arrest>
    <j:ArrestSubject>
      <nc:RoleOfPerson structures:uri="https://state.example/98723987/results.xml#delta"/>
    </j:ArrestSubject>
  </j:Arrest>
</example:ArrestMessage>
            </xmlBlurb></pre>
          </figure>

        </section>

        <section id="compare-contrast-id-ref-uri">
          <title>Differentiating reference-to-identifier links and use of URIs</title>

          <p>These two methods are similar, and can interoperate, but have distinctions:</p>

          <ul>

            <li><p>With ref-to-id links, both <qName>structures:ref</qName> and
                <qName>structures:id</qName> are required to be within the same document.</p></li>

            <li><p>With ref-to-id links, both <qName>structures:id</qName> and <qName>structures:ref</qName>
                are required to be validated against the same schema.</p></li>

            <li><p>Ref-to-id links provide and require type safety, in that the type of an object pointed to by
                <qName>structures:ref</qName> must be consistent with the referencing
                element<char name="rsquo"/>s type declaration.</p></li>

            <li><p>The value of <qName>structures:id</qName> must be unique for IDs within the
                document.</p></li>

            <li><p>The value of <qName>structures:ref</qName> must appear within the document as the value of
                an attribute <qName>structures:id</qName>.</p></li>

            <li><p>An attribute <qName>structures:uri</qName> is a URI-reference that can reference any resource,
                inside or outside the document.</p></li>

            <li><p>A <qName>structures:uri</qName> can reference any <qName>structures:id</qName> within the same
                document, or in another conformant document.</p></li>

            <li><p>A <qName>structures:uri</qName> can reference any <qName>structures:ref</qName> within the
                same document, or in another conformant document.</p></li>

            <li><p>Any <qName>structures:uri</qName> may reference any other <qName>structures:uri</qName>,
                within the same document, or in another conformant document.</p></li>

          </ul>
        </section>
      <section>
        <title>Reference and content elements have same meaning</title>

        <p>An important aspect of the use of nested elements, ref-to-id references, and URI references, is that
          they all have the same meaning. Expressing a relationship as a nested element, versus as a ref-to-id
          reference is merely for convenience and ease of serialization. There is no change in meaning or
          semantics between relationships expressed by sub-elements versus relationships expressed
          by <qName>structures:ref</qName> or <qName>structures:uri</qName>.</p>

        <p>Any claim that nested elements represent composition, while references represent aggregation is
          incorrect. No life cycle dependency is implied by either method. Similarly, any claim that
          <em>included</em> data is intrinsic (i.e., a property inherent to an object), while <em>referenced</em>
          data is extrinsic (i.e., a property derived from a relationship to other things), is false. A property
          represented as a nested element has the exact same meaning as that property represented by a
          reference.</p>

        <ruleSection><title>Nested elements and references have the same meaning.</title>
        <rule applicability="INS" class="Interpretation">
          <p>There MUST NOT be any difference in meaning between a relationship established via an element
          declaration instantiated by a nested element, and that element declaration instantiated via
          reference.</p>
        </rule>
        </ruleSection>

        <p>There is no difference in meaning between relationships established by sub-elements and those
          established by references. They are simply two mechanisms for expressing connections between
          objects. Neither mechanism implies that properties are intrinsic or extrinsic; such characteristics
          must be explicitly stated in property definitions.</p>

        <p>Being of type <qName>xs:ID</qName> and <qName>xs:IDREF</qName>, validating schema parsers will perform
          certain checks on the values of <qName>structures:id</qName >
          and <qName >structures:ref</qName >. Specifically, no two IDs may have the same value. This
          includes <qName >structures:id</qName > and other IDs that may be used within an XML document. Also,
          any value of <qName>structures:ref</qName> must also appear as the value of an ID.</p>

        <p>By this rule, the following three XML fragments have a very similar meaning.  First,
          <ref idref="figure-example-no-ref"/> shows a witness that is a role of a person.</p>

        <figure id="figure-example-no-ref">
          <title>Example with no reference</title>
          <pre><xmlBlurb id="xb-example-no-ref">
<j:Witness>
  <nc:RoleOfPerson>
    <nc:PersonName>
      <nc:PersonFullName>John Doe</nc:PersonFullName>
    </nc:PersonName>
  </nc:RoleOfPerson>
</j:Witness>              
          </xmlBlurb></pre>
        </figure>

        <p><ref idref="figure-example-ref-backward"/> also expresses a witness object that is a role of a
          person. It first expresses the person object, then the witness object as a role of a that person,
          expressed as a reference back to the person.</p>

        <figure id="figure-example-ref-backward">
          <title>Example with a backward reference</title>
          <pre><xmlBlurb id="xb-example-ref-backward">
<nc:Person structures:id="c58">
  <nc:PersonName>
    <nc:PersonFullName>John Doe</nc:PersonFullName>
  </nc:PersonName>
</nc:Person>
<j:Witness>
  <nc:RoleOfPerson structures:ref="c58" xsi:nil="true"/>
</j:Witness>
          </xmlBlurb></pre>
        </figure>

        <p><ref idref="figure-example-ref-forward"/> shows a witness as a role of a person, with a separate
          person object expressed as a forward reference to the person object that is expressed later, within the
          definition of the witness.</p>

        <figure id="figure-example-ref-forward">
          <title>Example with a forward reference</title>
          <pre><xmlBlurb id="xb-example-ref-forward">
<nc:Person structures:ref="t85" xsi:nil="true"/>
<j:Witness>
  <nc:RoleOfPerson structures:id="t85">
    <nc:PersonName>
      <nc:PersonFullName>John Doe</nc:PersonFullName>
    </nc:PersonName>
  </nc:RoleOfPerson>
</j:Witness>
          </xmlBlurb></pre>
        </figure>

        <p>NIEM-conformant data instances may use either representation as needed, to represent the meaning of
        the fundamental data. There is no difference in meaning between reference and content data
        representations. The two different methods are available for ease of representation. No difference
        in <em>meaning</em> should be implied by the use of one method or the other.</p>

      </section>

    </section>

    <section id="section-instance-metadata">
      <title>Instance metadata</title>

      <p>NIEM provides the metadata mechanism for giving information about object assertions. An object may have
      an attribute that refers to one or more metadata objects. A <qName>structures:metadata</qName> attribute
      indicates that a data item has the given metadata. A <qName>structures:relationshipMetadata</qName>
      attribute asserts that the link (or relationship) established by an element has the given metadata.</p>

      <figure>
        <title>Example of metadata used in an instance</title>
        <pre><xmlBlurb id="xb-figure-metadata-in-use">
<nc:Person>
  <nc:PersonBirthDate structures:metadata="j86">
    <nc:Date>1945-12-01</nc:Date>
  </nc:PersonBirthDate>
  <nc:PersonName structures:metadata="s22 j86" structures:relationshipMetadata="k25">
    <nc:PersonFullName>John Doe</nc:PersonFullName>
  </nc:PersonName>
</nc:Person>
<nc:Metadata structures:id="s22">
  <nc:SourceText>Adam Barber</nc:SourceText>
</nc:Metadata>
<nc:Metadata structures:id="j86">
  <nc:ReportedDate>
    <nc:Date>2005-04-26</nc:Date>
  </nc:ReportedDate>
</nc:Metadata>
<nc:Metadata structures:id="k25">
  <nc:ProbabilityPercent>25</nc:ProbabilityPercent>
</nc:Metadata>
          </xmlBlurb></pre>

      </figure>
      <p>This example shows a person named John Doe, born 12/1/1945. This data has several pieces of metadata on it:</p>
      <ul>
        <li><p>Metadata <code>s22</code> asserts Adam Barber gave the name.</p></li>
        <li><p>Metadata <code>j86</code> asserts the name and the birth date were reported on 4/26/2005.</p></li>
        <li><p>Relationship metadata <code>k25</code> asserts a 25% probability that the name goes with the person.</p></li>
      </ul>
      <p>This shows several characteristics of metadata:</p>
      <ul>
        <li><p>Metadata objects may appear outside the data they describe.</p></li>
        <li><p>Metadata objects may be reused.</p></li>
        <li><p>Data may refer to more than one metadata object.</p></li>
        <li><p>Metadata pertains to an object or simple content, while relationship metadata pertains to the relationship between objects.</p></li>
      </ul>
      <p>An instance would not be valid XML if the <qName>structures:metadata</qName> or <qName>structures:relationshipMetadata</qName> attributes contained references for which there were no defined IDs. The instance would not be NIEM-conformant if the references were not to IDs defined with the <qName>structures:id</qName> attribute.</p>

      <p>Application of metadata to a type or element to which it is not applicable is not NIEM-conformant. A
        metadata element may be labeled as applicable to multiple elements via
        attribute <qName>appinfo:appliesToElements</qName>, or to multiple types via
        attribute <qName>appinfo:appliesToTypes</qName>. In either case it may apply to an instance of any of the
        listed elements or types. For an example, see <ref idref="figure-sample-applies-to-types"/>. A metadata
        element with neither attribute <qName>appinfo:appliesToElements</qName> nor
        attribute <qName>appinfo:appliesToTypes</qName> may be applied to any element of any type.</p>

      <ruleSection><title>Metadata applies to referring entity</title>
        <rule applicability="INS" class="Interpretation">
          <p>Within an element instance, when an object <var>$O</var> links to a metadata object via an
          attribute <qName>structures:metadata</qName>, the information in the metadata object MUST be applied to
          the object <var>$O</var>.</p>
        </rule>

        <p><qName>structures:metadata</qName> applies metadata to an object.</p>
      </ruleSection>

      <ruleSection><title>Referent of <qName>structures:relationshipMetadata</qName> annotates relationship</title>
        <rule applicability="INS" class="Interpretation">
          <p>Within an element instance, when an object <var>$O1</var> contains an element <var>$E</var>, with
          content object <var>$O2</var> or with a reference to object <var>$O2</var>, and <var>$O2</var> links to
          a metadata object via an attribute <qName>structures:relationshipMetadata</qName>, the information in
          the metadata object MUST be applied to the relationship <var>$E</var> between <var>$O1</var> and <var>$O2</var>.</p>
        </rule>

        <p><qName>structures:relationshipMetadata</qName> applies metadata to a relationship between two objects.</p>

      </ruleSection>

      <ruleSection><title>Values of <qName>structures:metadata</qName> refer to values of <qName>structures:id</qName></title>
        <rule applicability="INS" class="Constraint">
          <p>Given that each IDREF in the value of an attribute <qName>structures:metadata</qName> must match the
          value of an ID attribute on some element in the XML document, that ID attribute MUST be an occurrence
          of the attribute <qName>structures:id</qName>.</p>
        </rule>
      </ruleSection>


      <ruleSection>
        <title>Values of <qName>structures:relationshipMetadata</qName> refer to values of <qName>structures:id</qName></title>
        <rule applicability="INS" class="Constraint">
          <p>Given that each IDREF in the value of an attribute <qName>structures:relationshipMetadata</qName>
            must match the value of an ID attribute on some element in the XML document, that ID attribute MUST
            be an occurrence of the attribute <qName>structures:id</qName>.</p>
        </rule>
      </ruleSection>

      <ruleSection>
        <title><qName>structures:metadata</qName> and <qName>structures:relationshipMetadata</qName> refer to
          metadata elements</title>

        <rule applicability="INS" class="Constraint">
          <p>Each element referenced by an attribute <qName>structures:metadata</qName> or an
            attribute <qName>structures:relationshipMetadata</qName> MUST have [element declaration] that is
            a <termRef>metadata element declaration</termRef>.</p>
        </rule>

        <p>Although not implemented in Schematron, this rule covers the cases not covered by
          <ref idref="rule-attr-metadata-refs-metadata"/>.</p>
      </ruleSection>

      <ruleSection>
        <title>Attribute <qName>structures:metadata</qName> references metadata element</title>

        <rule applicability="INS" id="rule-attr-metadata-refs-metadata" class="Constraint">
          <pre><xmlBlurb id="xb-rule-attr-metadata-refs-metadata" memberOf="ins">
<sch:pattern>
  <sch:rule context="*[exists(@structures:metadata)]">
    <sch:assert test="every $metadata-ref in tokenize(normalize-space(@structures:metadata), ' ') satisfies
                        exists(//*[exists(@structures:id[. = $metadata-ref])
                                   and ends-with(local-name(), 'Metadata')])"
      >Each item in the value of an attribute structures:metadata MUST appear as the value of an attribute structures:id with an owner element that is a metadata element.</sch:assert>
  </sch:rule>
</sch:pattern>
          </xmlBlurb></pre>
        </rule>

        <p>Note that this will NOT diagnose a scenario in which the element with a name ending in <q>Metadata</q>
          is an external element; additional tests would be required to catch that.</p>

      </ruleSection>

      <ruleSection>
        <title>Attribute <qName>structures:relationshipMetadata</qName> references metadata element</title>
      <rule applicability="INS" id="rule-attr-rel-metadata-refs-metadata" class="Constraint">
        <pre><xmlBlurb id="xb-rule-attr-rel-metadata-refs-metadata" memberOf="ins">
<sch:pattern>
  <sch:rule context="*[exists(@structures:relationshipMetadata)]">
    <sch:assert test="every $metadata-ref in tokenize(normalize-space(@structures:relationshipMetadata), ' ') satisfies
                        exists(//*[exists(@structures:id[. = $metadata-ref])
                                   and ends-with(local-name(), 'Metadata')])"
      >Each item in the value of an attribute structures:relationshipMetadata MUST appear as the value of an attribute structures:id with an owner element that is a metadata element.</sch:assert>
  </sch:rule>
</sch:pattern>
        </xmlBlurb></pre>
      </rule>

      <p>Note that this will NOT diagnose a scenario in which the element with a name ending in <q>Metadata</q>
        is an external element; additional tests would be required to catch that.</p>

    </ruleSection>

      <ruleSection>
        <title>Metadata is applicable to element</title>
        <rule applicability="INS" class="Constraint">
          <p>Given that an element <var>$SUBJECT-ELEMENT</var> uses a metadata
          element <var>$METADATA-ELEMENT</var> through a value in either an
          attribute <qName>structures:metadata</qName> or an
          attribute <qName>structures:relationshipMetadata</qName>, the element <var>$SUBJECT-ELEMENT</var> MUST
          be an applicable element for <var>$METADATA-ELEMENT</var>.</p>
        </rule>
        <p>The applicable elements for a metadata element are identified by
        <ref idref="rule-metadata-applicable-elements"/>.</p>
      </ruleSection>

    </section>




  </section>

  <section id="AppendixReferences" isAppendix="true">
    <!-- not sure what Zotero export I originally used, maybe none. -->
    <!-- use Zotero:
           "create bibliography from item
           citation style "Chicago Manual of Style 16th ed (full note)"
           output mode: bibliography
           Output method: Copy to Clipboard -->
    <title>References</title>
    <reference id="BCP14" label="BCP 14">
      <p>Internet Engineering Task Force Best Current Practice 14. Available
        from <link>https://www.ietf.org/rfc/bcp/bcp14.txt</link>. BCP 14 is composed of:</p>
      <sub>
        <reference id="RFC2119" label="RFC 2119">
          <p>Bradner, S., <q>Key words for use in RFCs to Indicate Requirement Levels</q>, BCP 14, RFC 2119,
            March 1997. Available from <link>http://www.ietf.org/rfc/rfc2119.txt</link>.</p>
        </reference>
        <reference id="RFC8174" label="RFC 8174">
          <p>Leiba, B., <q>Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words</q>, BCP 14, RFC 8174, May
            2017. Available from <link>https://www.ietf.org/rfc/rfc8174.txt</link>.</p>
        </reference>
      </sub>
    </reference>
    <reference id="ClarkNS">
      <p>Clark, J. <q>XML Namespaces</q>, 4 February 1999. Available from <link>http://www.jclark.com/xml/xmlns.htm</link>.</p>
    </reference>
    <reference id="ConfReq">
      <p>Lynne Rosenthal, and Mark Skall, eds. <q>Conformance Requirements for Specifications v1.0.</q> The Organization for the Advancement of Structured Information Standards (OASIS), March 15, 2002. <link>https://www.oasis-open.org/committees/download.php/305/conformance_requirements-v1.pdf</link>.</p>
    </reference>
    <reference id="CTAS">
      <p>Roberts, Webb. <q>NIEM Conformance Targets Attribute Specification, Version 3.0.</q> NIEM Technical Architecture Committee, July 31, 2014. <link>MACRO_HREF_CTAS</link>.</p>
    </reference>
    <reference id="ISO11179-4" label="ISO 11179-4">
      <p><q>ISO/IEC 11179-4 Information Technology <char name="mdash"/> Metadata Registries (MDR) <char name="mdash"/> Part 4: Formulation of Data Definitions Second Edition</q>, 15 July 2004. Available from <link>http://standards.iso.org/ittf/PubliclyAvailableStandards/c035346_ISO_IEC_11179-4_2004(E).zip</link>.</p>
    </reference>
    <reference id="ISO11179-5" label="ISO 11179-5">
      <p><q>ISO/IEC 11179-5:2005, Information technology <char name="mdash"/> Metadata registries (MDR) <char name="mdash"/> Part 5: Naming and identification principles</q>. Available from <link>http://standards.iso.org/ittf/PubliclyAvailableStandards/c035347_ISO_IEC_11179-5_2005(E).zip</link>.</p>
    </reference>
    <reference id="JSONLD" label="JSON LD">
      <p>Manu Sporny, Dave Longley, Gregg Kellogg, Markus Lanthaler, and Niklas Lindstrom. <q>JSON-LD 1.0, A JSON-Based Serialization for Linked Data, W3C Recommendation.</q> Edited by Manu Sporny, Gregg Kellogg, and Markus Lanthaler. W3C, January 16, 2014. <link></link>MACRO_HREF_JSON_LD.</p>
    </reference>
    <reference id="JLS">
      <p>James Gosling, Bill Joy, Guy Steele, Gilad Bracha, and Alex Buckley. <q>The Java Language Specification, Java SE 8 Edition.</q> Oracle Corp, March 3, 2014. <link>http://docs.oracle.com/javase/specs/jls/se8/html/</link>.</p>
    </reference>
    <reference id="N-ary">
      <p><q>Defining N-ary Relations on the Semantic Web</q>, W3C Working Group Note, 12 April 2006. Available from <link>MACRO_HREF_NARY/</link>.</p>
    </reference>
    <reference id="code-lists-spec" label="Code Lists">
      <p>Webb Roberts. <q>NIEM Code Lists Specification.</q> NIEM Technical Architecture Committee (NTAC), June
      20, 2016. Available from <link>MACRO_HREF_CODE_LISTS</link>.
</p>
    </reference>
    <reference id="OED">
      <p><q>Oxford English Dictionary, Third Edition</q>, Oxford University Press, November 2010. <link>http://dictionary.oed.com/</link>.</p>
    </reference>
    <reference id="RDFConcepts" label="RDF Concepts">
      <p>Richard Cyganiak, David Wood, and Markus Lanthaler, eds. <q>RDF 1.1 Concepts and Abstract Syntax.</q> The World Wide Web Consortium (W3C), February 25, 2014. <link>MACRO_HREF_RDF_CONCEPTS</link>.</p>
    </reference>
    <!--
    <reference id="RDFPrimer" label="RDF Primer">
      <p>Guus Schreiber, and Yves Raimond, eds. <q>RDF 1.1 Primer.</q> W3C, February 25, 2014. <link>MACRO_HREF_RDF_PRIMER</link>.</p>
    </reference>
    <reference id="RDFSchema" label="RDF Schema">
      <p>Dan Brickley, and R.V. Guha, eds. <q>RDF Schema 1.1.</q> The World Wide Web Consortium (W3C), February 25, 2014. <link>MACRO_HREF_RDF_SCHEMA</link>.</p>
    </reference>
    <reference id="RDFSemantics" label="RDF Semantics">
      <p>Patrick J. Hayes, and Peter F. Patel-Schneider, eds. <q>RDF 1.1 Semantics.</q> The World Wide Web Consortium (W3C), February 25, 2014. <link>MACRO_HREF_RDF_SEMANTICS</link>.</p>
    </reference>
-->
    <reference id="RFC3986" label="RFC 3986">
      <p>Berners-Lee, T., et al. <q>Uniform Resource Identifier (URI): Generic Syntax</q>, Request for Comments 3986, January 2005. Available from <link>MACRO_HREF_RFC_3986</link>.</p>
    </reference>
    <reference id="XML">
      <p><q>Extensible Markup Language (XML) 1.0 (Fourth Edition)</q>, W3C Recommendation, 16 August 2006. Available from <link>MACRO_HREF_XML</link>.</p>
    </reference>
    <reference id="XMLBase" label="XML Base">
      <p>Jonathan Marsh, and Richard Tobin, eds. <q>XML Base (Second Edition), W3C Recommendation.</q> W3C, January 28, 2009. Available from <link>MACRO_HREF_XML_BASE</link>.</p>
    </reference>
    <reference id="XMLInfoset" label="XML Infoset">
      <p>Cowan, John, and Richard Tobin. <q>XML Information Set (Second Edition)</q>, 4 February 2004. <link>MACRO_HREF_XML_INFOSET</link>.</p>
    </reference>
    <reference id="XMLNamespaces" label="XML Namespaces">
      <p><q>Namespaces in XML 1.0 (Third Edition)</q>, W3C Recommendation, 8 December 2009. Available from <link>MACRO_HREF_XML_NAMESPACES</link>.</p>
    </reference>
    <reference id="XMLNamespacesErrata" label="XML Namespaces Errata">
      <p><q>Namespaces in XML Errata</q>, 6 December 2002. Available from <link>http://www.w3.org/XML/xml-names-19990114-errata</link>.</p>
    </reference>
    <reference id="XMLSchema-1" label="XML Schema Structures">
      <p><q>XML Schema Part 1: Structures Second Edition</q>, W3C Recommendation, 28 October 2004. Available from <link>MACRO_HREF_XML_SCHEMA_1</link>.</p>
    </reference>
    <reference id="XMLSchema-2" label="XML Schema Datatypes">
      <p><q>XML Schema Part 2: Datatypes Second Edition</q>, W3C Recommendation, 28 October 2004. Available at <link>MACRO_HREF_XML_SCHEMA_2</link>.</p>
    </reference>
    <reference id="Schematron">
      <p><q>ISO/IEC STANDARD 19757-3: Information technology <char name="mdash"/> Document Schema Definition Languages (DSDL) Part 3: Rule-based validation <char name="mdash"/> Schematron</q>, ISO/IEC, 1 June 2006. Retrieved from <link>http://standards.iso.org/ittf/PubliclyAvailableStandards/c040833_ISO_IEC_19757-3_2006(E).zip</link>.</p>
    </reference>
    <reference id="XPath2" label="XPath 2">
      <p>Berglund, Anders, Scott Boag, Don Chamberlin, Mary F. Fern<char name="aacute"/>ndez, Michael Kay, Jonathan Robie, and J<char name="eacute"/>r<char name="ocirc"/>me Sim<char name="eacute"/>on. <q>XML Path Language (XPath) 2.0 (Second Edition)</q>, W3C Recommendation, 3 January 2011. <link>http://www.w3.org/TR/2010/REC-xpath20-20101214/</link>.</p>
    </reference>
  </section>
  <section id="section-include-structures-xsd"><title>Structures namespace</title>
    <pre><include-text href="structures.xsd"/></pre>
  </section>
  <section id="section-appinfo-xsd"><title>Appinfo namespace</title>
    <pre><include-text href="appinfo.xsd"/></pre>
  </section>
  <section id="index-of-defns"><title>Index of definitions</title>
    <indexOfDefinitions/>
  </section>
  <section id="index-of-rules"><title>Index of rules</title>
    <indexOfRules/>
  </section>
  <section id="index"><title>General index</title>
    <index/>
  </section>
</document>
m4_dnl Local Variables:
m4_dnl mode: sgml
m4_dnl indent-tabs-mode: nil
m4_dnl fill-column: 113
m4_dnl End:
