
CHECK_DOC_COMMAND_FLAGS += --catalog=xsd/ndr-examples/xml-catalog.xml
PROCESS_DOC_COMMAND_FLAGS += --catalog=xsd/ndr-examples/xml-catalog.xml

# generated dependencies for things derived from the NDR doc
dependencies_mk := ${tmp_dir}/dependencies.mk

# valid token
NDR_DOC_XML_VALID_T := ${tokens_dir}/ndr-doc-xml-valid

# The NDR document rendered in HTML
NDR_DOC_HTML := ${dest_dir}/ndr-doc.html

# The NDR document rendered in Text
NDR_DOC_TEXT := ${dest_dir}/ndr-doc.txt
STRUCTURES_XSD := ${dest_dir}/structures.xsd
APPINFO_XSD := ${dest_dir}/appinfo.xsd

#############################################################################
# TOOLS stuff
#

# Schematron schema for rules about the NDR doc file
RULES_ABOUT_NDR_SCH := src/ndr-rules.sch

#schematron rules about XML catalogs
RULES_ABOUT_XML_CATALOG_SCH_SRC := src/xml-catalog.sch.m4
RULES_ABOUT_XML_CATALOG_SCH := $(patsubst src/%.m4,${dest_dir}/%,$(RULES_ABOUT_XML_CATALOG_SCH_SRC))

CTAS_RULES_SCH_SOURCE := src/ctas-conformant-document.sch
CTAS_RULES_SCH := ${dest_dir}/ctas-conformant-document.sch

# Schematron rules for various Conformance Targets
NDR_RULES_CT_REF_SCH := ${dest_dir}/ndr-rules-conformance-target-ref.sch
NDR_RULES_CT_EXT_SCH := ${dest_dir}/ndr-rules-conformance-target-ext.sch
NDR_RULES_CT_INS_SCH := ${dest_dir}/ndr-rules-conformance-target-ins.sch
NDR_RULES_CT_SET_SCH := ${dest_dir}/ndr-rules-conformance-target-set.sch
NDR_RULES_SCH := $(NDR_RULES_CT_REF_SCH) $(NDR_RULES_CT_EXT_SCH) $(NDR_RULES_CT_INS_SCH) $(NDR_RULES_CT_SET_SCH)

NIEM_RELEASE_QC_RULES_SCH := ${tmp_dir}/niem-release-qc-rules.sch

BASE_CATALOG := xsd/catalog.xml
STRICT_CATALOG := xsd/catalog-xmlschema-strict.xml 

LIST_OF_RULES_TXT := ${dest_dir}/list-of-rules.txt
LIST_OF_RULES_AS_JAVA_PROPERTIES := ${dest_dir}/list-of-rules-as-java-properties.txt

NDR_ID_MAP_XML = ${dest_dir}/ndr-id-map.xml

IMAGES_SRC = $(wildcard src/img/*)
IMAGES_TMP = $(patsubst src/%,${tmp_dir}/%,$(IMAGES_SRC))


.PHONY: html
html: $(NDR_DOC_HTML)

.PHONY: text
text: $(NDR_DOC_TEXT)



$(NDR_DOC_XML_VALID_T): ${ndr_doc_xml}
	'/Users/wr/working/tools/bin/check-doc' $(CHECK_DOC_COMMAND_FLAGS) $<
	mkdir -p $(dir $@)
	touch $@

${tmp_dir}/xsd/%: src/xsd/%
	mkdir -p $(dir $@)
	cp $< $@

.PHONY: docs
docs: $(NDR_DOC_HTML) $(NDR_RULES_SCH) $(LIST_OF_RULES_TXT) $(CTAS_RULES_SCH) $(NDR_DOC_TEXT) $(LIST_OF_RULES_AS_JAVA_PROPERTIES) $(NDR_ID_MAP_XML) $(RULES_ABOUT_XML_CATALOG_SCH) $(STRUCTURES_XSD) $(APPINFO_XSD)

.PHONY: all
all: docs valid 

#############################################################################
# HTML doc

$(NDR_DOC_HTML): ${ndr_doc_xml} $(NDR_DOC_XML_VALID_T) $(IMAGES_TMP) $(DOC_HTML_REQUIRED_FILES)
	@ mkdir -p $(dir $@)
	'/Users/wr/working/tools/bin/process-doc' $(PROCESS_DOC_COMMAND_FLAGS) -html -in $< -out $@

${tmp_dir}/img/%: src/img/%
	'/opt/local/bin/grm' -f $@
	mkdir -p $(dir $@)
	cp $< $@

${tmp_dir}/img/%.png.width.txt: ${tmp_dir}/img/%.png
	identify -format '%w' $< > $@

##################################################################
# TEXT doc

$(NDR_DOC_TEXT): ${ndr_doc_xml} $(NDR_DOC_XML_VALID_T) $(DOC_TEXT_REQUIRED_FILES)
	@mkdir -p $(dir $@)
	'/Users/wr/working/tools/bin/process-doc' $(PROCESS_DOC_COMMAND_FLAGS) -plaintext -in $< -out $@

#############################################################################
# Schematron rules generated off of the doc
#

.PHONY: rules
rules: \
	$(NDR_RULES_CT_REF_SCH) \
	$(NDR_RULES_CT_EXT_SCH) \
	$(NDR_RULES_CT_SET_SCH) \
	$(NDR_RULES_CT_INS_SCH) \
	$(RULES_ABOUT_XML_CATALOG_SCH)

rules-ref ref: $(NDR_RULES_CT_REF_SCH)
rules-ext ext: $(NDR_RULES_CT_EXT_SCH)
rules-ins ins: $(NDR_RULES_CT_INS_SCH)
rules-set set: $(NDR_RULES_CT_SET_SCH)

DOC_TO_SCHEMATRON_XSL_SRC := src/doc-to-schematron.xsl.m4
DOC_TO_SCHEMATRON_XSL := $(DOC_TO_SCHEMATRON_XSL_SRC:src/%.m4=${tmp_dir}/%)
DOC_TO_SCHEMATRON_XSL_DEPENDENCIES := /Users/wr/working/tools/share/doc-processing/common.xsl

$(DOC_TO_SCHEMATRON_XSL) : src/ndr-macros.m4 $(DOC_TO_SCHEMATRON_XSL_SRC) 
	@ mkdir -p $(dir $@)
	${m4} ${m4_flags} $^ > $@

$(NDR_RULES_CT_REF_SCH): ${ndr_doc_xml} $(DOC_TO_SCHEMATRON_XSL) $(DOC_TO_SCHEMATRON_XSL_DEPENDENCIES)
	@ mkdir -p $(dir $@)
	'/Users/wr/working/tools/bin/saxon' $(SAXON_COMMAND_FLAGS) -xsl $(DOC_TO_SCHEMATRON_XSL) -in $< -out $@ - blurb-set=ref title='Rules for reference XML Schema documents'

$(NDR_RULES_CT_EXT_SCH): ${ndr_doc_xml} $(DOC_TO_SCHEMATRON_XSL) $(DOC_TO_SCHEMATRON_XSL_DEPENDENCIES)
	@ mkdir -p $(dir $@)
	'/Users/wr/working/tools/bin/saxon' $(SAXON_COMMAND_FLAGS) -xsl $(DOC_TO_SCHEMATRON_XSL) -in $< -out $@ - blurb-set=ext title='Rules for extension XML Schema documents'

$(NDR_RULES_CT_SET_SCH): ${ndr_doc_xml} $(DOC_TO_SCHEMATRON_XSL) $(DOC_TO_SCHEMATRON_XSL_DEPENDENCIES)
	@ mkdir -p $(dir $@)
	'/Users/wr/working/tools/bin/saxon' $(SAXON_COMMAND_FLAGS) -xsl $(DOC_TO_SCHEMATRON_XSL) -in $< -out $@ - blurb-set=set title='Rules for XML Schema document sets'

$(NDR_RULES_CT_INS_SCH): ${ndr_doc_xml} $(DOC_TO_SCHEMATRON_XSL) $(DOC_TO_SCHEMATRON_XSL_DEPENDENCIES)
	@ mkdir -p $(dir $@)
	'/Users/wr/working/tools/bin/saxon' $(SAXON_COMMAND_FLAGS) -xsl $(DOC_TO_SCHEMATRON_XSL) -in $< -out $@ - blurb-set=ins title='Rules for instance XML documents'

######################################################################
# support files

$(RULES_ABOUT_XML_CATALOG_SCH): ${ndr_macros_m4} $(RULES_ABOUT_XML_CATALOG_SCH_SRC)
	mkdir -p $(@D)
	if test -f $@; then chmod 644 $@; fi
	${m4} ${m4_flags} $^ > $@
	chmod 444 $@

$(APPINFO_XSD): src/xsd/niem/appinfo/4.0/appinfo.xsd
	rm -f $@
	mkdir -p ${dir $@}
	install -m 444 -T $< $@

$(STRUCTURES_XSD): src/xsd/niem/structures/4.0/structures.xsd
	rm -f $@
	mkdir -p ${dir $@}
	install -m 444 -T $< $@

#############################################################################
# NDR ID Map: map of IDs in the NDR; useful for transforming into stable formats
GET_NDR_ID_MAP_XSL_SRC := src/get-ndr-id-map.xsl.m4
GET_NDR_ID_MAP_XSL := $(GET_NDR_ID_MAP_XSL_SRC:src/%.m4=${tmp_dir}/%)
GET_NDR_ID_MAP_XSL_DEPENDENCIES := /Users/wr/working/tools/share/doc-processing/common.xsl 

# order of dependencies is important here, since that's the order that things to to M4.
$(GET_NDR_ID_MAP_XSL): src/ndr-macros.m4 $(GET_NDR_ID_MAP_XSL_SRC) 
	@ mkdir -p $(dir $@)
	${m4} ${m4_flags} $^ > $@

.PHONY: map
map: $(NDR_ID_MAP_XML)
$(NDR_ID_MAP_XML):  ${ndr_doc_xml} $(NDR_DOC_XML_VALID_T) $(GET_NDR_ID_MAP_XSL)
	'/Users/wr/working/tools/bin/saxon' $(SAXON_COMMAND_FLAGS) -xsl $(GET_NDR_ID_MAP_XSL) -in $< -out $@

#############################################################################
# list of rules

GET_LIST_OF_RULES_FROM_NDR_XSL_SRC := src/get-list-of-rules-from-ndr.xsl.m4
GET_LIST_OF_RULES_FROM_NDR_XSL := $(GET_LIST_OF_RULES_FROM_NDR_XSL_SRC:src/%.m4=${tmp_dir}/%)
GET_LIST_OF_RULES_FROM_NDR_XSL_DEPENDENCIES := /Users/wr/working/tools/share/doc-processing/common.xsl 

# order of dependencies is important here, since that's the order that things to to M4.
$(GET_LIST_OF_RULES_FROM_NDR_XSL) : src/ndr-macros.m4 $(GET_LIST_OF_RULES_FROM_NDR_XSL_SRC) 
	@ mkdir -p $(dir $@)
	${m4} ${m4_flags} $^ > $@

.PHONY: list
list: $(LIST_OF_RULES_TXT)
$(LIST_OF_RULES_TXT): ${ndr_doc_xml} $(NDR_DOC_XML_VALID_T) $(GET_LIST_OF_RULES_FROM_NDR_XSL)
	'/Users/wr/working/tools/bin/saxon' $(SAXON_COMMAND_FLAGS) -xsl $(GET_LIST_OF_RULES_FROM_NDR_XSL) -in $< -out $@

.PHONY: jp
jp: $(LIST_OF_RULES_AS_JAVA_PROPERTIES)

$(LIST_OF_RULES_AS_JAVA_PROPERTIES): $(LIST_OF_RULES_TXT) bin/convert-rules-list-to-java-properties
	bin/convert-rules-list-to-java-properties < $< > $@


# list looks good formatted with:
#     expand -t 51,64 < dest/list-of-rules.txt 


#############################################################################
# Quality Control rules

$(NIEM_RELEASE_QC_RULES_SCH) : ${ndr_macros_m4} src/niem-release-qc-rules.sch 
	${m4} ${m4_flags} $^ > $@

#############################################################################
# run M4 on NDR functions

$(CTAS_RULES_SCH): ${ndr_macros_m4} $(CTAS_RULES_SCH_SOURCE) 
	mkdir -p $(dir $@)
	${m4} ${m4_flags} $^ > $@

#############################################################################
# Validations
#############################################################################

# ensure the NDR doc xml is valid against a set of schematron rules for the NDR doc
# the validation works in a temp dir, because it generates tons of intermediate files
V1 := ndr_doc_xml-valid-against-ndr_rules_sch
V1_D := ${tmp_dir}/$(V1).d
V1_T := ${tokens_dir}/$(V1)
$(V1_T): ${ndr_doc_xml} $(NDR_DOC_XML_VALID_T) $(RULES_ABOUT_NDR_SCH)
	mkdir -p $(V1_D)
	cp $(RULES_ABOUT_NDR_SCH) $(V1_D)/ndr-rules.sch
	'/Users/wr/working/tools/bin/schematron' -ee -schema $(V1_D)/ndr-rules.sch ${ndr_doc_xml}
	mkdir -p $(dir $@)
	touch $@

.PHONY: v1
v1: $(V1_T)

# V2 is dead.

# ensure the NDR doc xml is valid as a doc
V3 := ndr_doc_xml-valid-as-doc
V3_D := ${tmp_dir}/$(V3).d
V3_T := ${tokens_dir}/$(V3)
$(V3_T): ${ndr_doc_xml} $(NDR_DOC_XML_VALID_T)
	mkdir -p $(V3_D)
	'/Users/wr/working/tools/bin/check-doc' $(CHECK_DOC_COMMAND_FLAGS) -t $(V3_D) $<
	mkdir -p $(dir $@)
	touch $@

.PHONY: v3
v3: $(V3_T)

# validate that all generated NDR rules files are schematron
V4 := ndr_rules_sch-valid-as-schematron
V4_D := ${tokens_dir}/$(V4).d
V4_T := $(patsubst ${dest_dir}/%,$(V4_D)/%,$(NDR_RULES_SCH))
$(V4_D)/%: ${dest_dir}/%
	'/Users/wr/working/tools/bin/check-schematron' $<
	mkdir -p $(dir $@)
	touch $@
.PHONY: v4
v4: $(V4_T)

# validate that catalog files are valid against the catalog XSD
V5 := v5_catalogs-valid-against-catalog-xsd
V5_D := ${tokens_dir}/$(V5).d
CATALOGS := $(BASE_CATALOG) $(STRICT_CATALOG)
V5_T := $(patsubst %,$(V5_D)/%,$(CATALOGS))
CATALOG_XSD := xsd/xml-catalog/xml-catalog-1.1.xsd
$(V5_D)/%: % $(CATALOG_XSD) xsd/xml-catalog/catalog.xml
	'/Users/wr/working/tools/bin/xsdvalid' -catalog xsd/xml-catalog/catalog.xml $<
	mkdir -p $(dir $@)
	touch $@
.PHONY: v5
v5: $(V5_T)

info:
	printf 'V5_T: "%s"\n' $(V5_T)
	printf $(V5_D)/%: % $(CATALOG_XSD) xsd/catalog-for-catalog.xml



.PHONY: valid
valid: $(V3_T) $(V1_T) $(V4_T) $(V5_T)

#############################################################################
# Misc conveniences

ARCHIVE_NAME := NIEM-NDR-4.0beta1-2017-03-31
archive: tmp/$(ARCHIVE_NAME).html
	'/opt/local/bin/grm' -rf tmp/$(ARCHIVE_NAME)
	'/opt/local/bin/grm' -f tmp/$(ARCHIVE_NAME).zip
	'/opt/local/bin/gmkdir' tmp/$(ARCHIVE_NAME)
	'/usr/bin/rsync' -Parv ${dest_dir}/ tmp/$(ARCHIVE_NAME)/
	'/opt/local/bin/grm' -f tmp/$(ARCHIVE_NAME)/xml-catalog.sch
	'/opt/local/bin/grm' -f tmp/$(ARCHIVE_NAME)/list-of-rules.txt
	cd tmp; '/usr/bin/zip' -r -9 $(ARCHIVE_NAME).zip $(ARCHIVE_NAME)

tmp/$(ARCHIVE_NAME).html: ${dest_dir}/ndr-doc.html
	cp $< $@



