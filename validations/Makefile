
DISTRO_ROOT := niem-3.0

HTML := $(DISTRO_ROOT).html

XML_DOCS := $(shell find -L $(DISTRO_ROOT) -type f \( -name '*.xsd' -o -name '*.xml' \) -print)
XSD_DOCS := $(shell find -L $(DISTRO_ROOT) -type f -name '*.xsd' -print)
REF_XSD_DOCS := $(shell find -L $(DISTRO_ROOT) -type f -name '*.xsd' \
	! -path '$(DISTRO_ROOT)/niem/appinfo/*' \
	! -path '$(DISTRO_ROOT)/niem/structures/*' \
	! -path '$(DISTRO_ROOT)/niem/external/*' \
	! -path '$(DISTRO_ROOT)/niem/localTerminology/*' \
	! -path '$(DISTRO_ROOT)/niem/conformanceTargets/*' \
	-print )
SUPPORT_XSD_DOCS := $(shell find -L $(DISTRO_ROOT) \( -name 'appinfo.xsd' -o -name 'structures.xsd' \) -print)
CATALOG_XML_DOCS := $(shell find -L $(DISTRO_ROOT) -name 'catalog.xml' -print)
NOT_INCLUDED_XSD_DOCS := \
	$(DISTRO_ROOT)/niem/external/have/1.0/gml-oasis.xsd \
	$(DISTRO_ROOT)/niem/external/have/1.0/xAL.xsd \
	$(DISTRO_ROOT)/niem/external/have/1.0/xlink-2003-12-31.xsd \
	$(DISTRO_ROOT)/niem/external/have/1.0/CommonTypes.xsd \
	$(DISTRO_ROOT)/niem/external/have/1.0/xNL.xsd \
	$(DISTRO_ROOT)/niem/external/have/1.0/have.xsd \
	$(DISTRO_ROOT)/niem/external/have/1.0/xPIL.xsd \
	$(DISTRO_ROOT)/niem/external/have/1.0/geo-oasis.xsd \
	$(DISTRO_ROOT)/niem/external/ogc/iso/19139/20070417/gss/gss.xsd	\
	$(DISTRO_ROOT)/niem/external/ogc/iso/19139/20070417/gsr/gsr.xsd \
	$(DISTRO_ROOT)/niem/external/ogc/iso/19139/20070417/gts/gts.xsd \
	$(DISTRO_ROOT)/niem/external/ogc/iso/19139/20070417/gco/gco.xsd \
	$(DISTRO_ROOT)/niem/external/ogc/iso/19139/20070417/gmd/gmd.xsd \
	$(REF_XSD_DOCS) \
	$(DISTRO_ROOT)/niem/external/cap/1.1/cap.xsd \
	$(DISTRO_ROOT)/niem/external/de/1.0/de.xsd \
	$(DISTRO_ROOT)/niem/external/ogc/gml/3.2.1/gml.xsd \
	$(DISTRO_ROOT)/niem/external/ogc/ols/1.1.0/dhs-gmo/2.1.0/ols.xsd \
	$(DISTRO_ROOT)/niem/external/ogc/xlink/1.0.0/xlinks.xsd \
	$(DISTRO_ROOT)/niem/structures/3.0/structures.xsd \
	$(DISTRO_ROOT)/niem/appinfo/3.0/appinfo.xsd \
	$(DISTRO_ROOT)/niem/conformanceTargets/3.0/conformanceTargets.xsd \

NDR_ROOT_DIR := ..
BIN_DIR := $(HOME)/working/tools/bin

TMP_DIR := tmp
VALID_TOKENS_DIR := $(TMP_DIR)/valid-tokens
SANDBOX_DIR := $(TMP_DIR)/sandbox

XSD_CONSOLIDATED_XML := $(TMP_DIR)/xsd-consolidated.xml

CATALOG_CATALOG_XML := $(NDR_ROOT_DIR)/xsd/xml-catalog/catalog.xml
XSD_STRICT_CATALOG_XML := $(NDR_ROOT_DIR)/xsd/catalog-xmlschema-strict.xml
XSD_CATALOG_XML := $(NDR_ROOT_DIR)/xsd/catalog.xml

XSDVALID := $(BIN_DIR)/xsdvalid
CHECK_XML := $(BIN_DIR)/check-xml
SCHEMATRON := $(BIN_DIR)/schematron
INSTALL := install
CONSOLIDATE_SCHEMAS := $(BIN_DIR)/consolidate-schemas
CHECK_SCHEMA_DOCUMENT := $(NDR_ROOT_DIR)/src/check-schema-document

NDR_FUNCTIONS_XSL := $(NDR_ROOT_DIR)/dest/ndr-functions.xsl
NDR_REF_SCH := $(NDR_ROOT_DIR)/dest/ndr-rules-conformance-target-ref.sch
NDR_SET_SCH := $(NDR_ROOT_DIR)/dest/ndr-rules-conformance-target-set.sch
CTAS_RULES_SCH := $(NDR_ROOT_DIR)/dest/ctas-conformant-document.sch

default:
	@echo Bravely doing nothing.
	@echo Make target \"help\" for more info.

help:
	@echo "Targets:"
	@echo "\tvalid\tValidate the distribution."
	@echo "\t\tAdd variable IGNORE=\"true\" to ignore validation errors"
	@echo "\tclean\tRemove traces of previous runs"

show:
	@ printf 'XML_DOCS : %s\n' $(XML_DOCS)
	@ printf 'XSD_DOCS : %s\n' $(XSD_DOCS)
	@ printf 'REF_XSD_DOCS : %s\n' $(REF_XSD_DOCS)
	@ printf 'CATALOG_XML_DOCS : %s\n' $(CATALOG_XML_DOCS)
	@ printf 'CATALOG_CATALOG_XML : %s\n' $(CATALOG_CATALOG_XML)
	@ printf 'XSD_CATALOG_XML : %s\n' $(XSD_CATALOG_XML)
	@ printf 'XSD_STRICT_CATALOG_XML : %s\n' $(XSD_STRICT_CATALOG_XML)
	@ printf 'SUPPORT_XSD_DOCS : %s\n' $(SUPPORT_XSD_DOCS)
#	@ printf 'ZZZ : %s\n' $(ZZZ)

$(XSD_CONSOLIDATED_XML): $(XSD_DOCS)
	mkdir -p $(dir $@)
	mkdir -p tmp/consolidate-schemas.d
	$(CONSOLIDATE_SCHEMAS) -tmp tmp/consolidate-schemas.d $(NOT_INCLUDED_XSD_DOCS) > $@

# validate that XML files are OK
V1 := v1-xml-docs-check
V1_D := $(VALID_TOKENS_DIR)/$(V1).d
V1_T := $(patsubst $(DISTRO_ROOT)/%,$(V1_D)/%,$(XML_DOCS))
$(V1_D)/%: $(DISTRO_ROOT)/%
	$(CHECK_XML) $<
	mkdir -p $(dir $@)
	touch $@
.PHONY: v1
v1: $(V1_T)

# validate that catalog files are valid against the catalog XSD
V2 := v2-catalogs-valid-against-catalog-xsd
# v2 directory
V2_D := $(VALID_TOKENS_DIR)/$(V2).d
# v2 tokens
V2_T := $(patsubst $(DISTRO_ROOT)/%,$(V2_D)/%,$(CATALOG_XML_DOCS))
$(V2_D)/%: $(DISTRO_ROOT)/% $(CATALOG_CATALOG_XML)
	$(XSDVALID) -catalog $(CATALOG_CATALOG_XML) $<
	mkdir -p $(dir $@)
	touch $@
.PHONY: v2
v2: $(V2_T)

# validate that NIEM schema documents are valid against the STRICT schema for schemas
V3 := v3-schemas-valid-against-strict-schema
V3_D := $(VALID_TOKENS_DIR)/$(V3).d
V3_T := $(patsubst $(DISTRO_ROOT)/%,$(V3_D)/%,$(REF_XSD_DOCS))
$(V3_D)/%: $(DISTRO_ROOT)/% $(XSD_CATALOG_XML) $(XSD_STRICT_CATALOG_XML)
	$(XSDVALID) -catalog $(XSD_STRICT_CATALOG_XML) -catalog $(XSD_CATALOG_XML) $<
	mkdir -p $(dir $@)
	touch $@
.PHONY: v3
v3: $(V3_T)

# validate that all schema documents are valid against the schema for XSD
V4 := v4-schemas-valid-against-schema
V4_D := $(VALID_TOKENS_DIR)/$(V4).d
V4_T := $(patsubst $(DISTRO_ROOT)/%,$(V4_D)/%,$(XSD_DOCS))
$(V4_D)/%: $(DISTRO_ROOT)/% $(XSD_CATALOG_XML)
	$(XSDVALID) -catalog $(XSD_CATALOG_XML) $<
	mkdir -p $(dir $@)
	touch $@
.PHONY: v4
v4: $(V4_T)

# validate NIEM-conformant REF schemas meet ndr rules for reference schemas
V5 := v5-schemas-meet-ref-rules
V5_D := $(VALID_TOKENS_DIR)/$(V5).d
V5_T := $(patsubst $(DISTRO_ROOT)/%,$(V5_D)/%,$(REF_XSD_DOCS))
V5_SB := $(SANDBOX_DIR)/$(V5).d
V5_SB_SCH := $(V5_SB)/ndr-rules-conformance-target-ref.sch
V5_SB_FUNCTIONS_XSL := $(V5_SB)/ndr-functions.xsl

$(V5_SB_SCH): $(NDR_REF_SCH)
	mkdir -p $(dir $@)
	$(INSTALL) --no-target-directory $< $@

$(V5_SB_FUNCTIONS_XSL): $(NDR_FUNCTIONS_XSL)
	mkdir -p $(dir $@)
	$(INSTALL) --no-target-directory $< $@

$(V5_D)/%: $(DISTRO_ROOT)/% $(V5_SB_SCH) $(V5_SB_FUNCTIONS_XSL)
ifneq ($(IGNORE),)	
	- $(SCHEMATRON) -ee -schema $(V5_SB_SCH) $<
else
	$(SCHEMATRON) -ee -schema $(V5_SB_SCH) $<
endif
	mkdir -p $(dir $@)
	touch $@

.PHONY: v5
v5: $(V5_T)

# Valiate that the niem schema set follows the rules for schema sets
V6 := v6-niem-distro-set-meets-ndr-set-rules
V6_T := $(VALID_TOKENS_DIR)/$(V6)

V6_SB := $(SANDBOX_DIR)/$(V6).d
V6_SB_SCH := $(V6_SB)/ndr-rules-conformance-target-set.sch
V6_SB_FUNCTIONS_XSL := $(V6_SB)/ndr-functions.xsl

$(V6_SB_SCH): $(NDR_SET_SCH)
	mkdir -p $(dir $@)
	$(INSTALL) --no-target-directory $< $@

$(V6_SB_FUNCTIONS_XSL): $(NDR_FUNCTIONS_XSL)
	mkdir -p $(dir $@)
	$(INSTALL) --no-target-directory $< $@

$(V6_T): $(XSD_CONSOLIDATED_XML) $(V6_SB_SCH) $(V6_SB_FUNCTIONS_XSL)
ifneq ($(IGNORE),)
	- $(SCHEMATRON) -ee -schema $(V6_SB_SCH) $<
else
	$(SCHEMATRON) -ee -schema $(V6_SB_SCH) $<
endif
	mkdir -p $(dir $@)
	touch $@

.PHONY: v6
v6: $(V6_T)

# run non-Schematron tests on distribution schemas
V7 := v7-niem-distro-xsds-non-schematron-tests
V7_D := $(VALID_TOKENS_DIR)/$(V7).d
V7_T := $(patsubst $(DISTRO_ROOT)/%,$(V7_D)/%,$(REF_XSD_DOCS) $(SUPPORT_XSD_DOCS))

$(V7_D)/%: $(DISTRO_ROOT)/% $(CHECK_SCHEMA_DOCUMENT)
	$(CHECK_SCHEMA_DOCUMENT) $<
	mkdir -p $(dir $@)
	touch $@

.PHONY: v7
v7: $(V7_T)

# v8: check schema documents for conformance to CTAS
V8 := v8-niem-distro-xsds-conform-to-ctas
V8_D := $(VALID_TOKENS_DIR)/$(V8).d
V8_T := $(patsubst $(DISTRO_ROOT)/%,$(V8_D)/%,$(XSD_DOCS))

V8_SB := $(SANDBOX_DIR)/$(V8).d
V8_SB_SCH := $(V8_SB)/ctas-conformant-document.sch

$(V8_SB_SCH): $(CTAS_RULES_SCH)
	mkdir -p $(dir $@)
	$(INSTALL) --no-target-directory $< $@

$(V8_D)/%: $(DISTRO_ROOT)/% $(V8_SB_SCH)
	$(SCHEMATRON) -schema $(V8_SB_SCH) $<
	mkdir -p $(dir $@)
	touch $@

.PHONY: v8
v8: $(V8_T)


valid: v1 v2 v3 v4 v5 v6 v7

clean:
	$(RM) -r $(VALID_TOKENS_DIR)

scrub:
	$(RM) -r $(TMP_DIR)

.PHONY: $(NDR_FUNCTIONS_XSL)
$(NDR_FUNCTIONS_XSL):
	$(MAKE) -C $(NDR_ROOT_DIR) dest/ndr-functions.xsl

.PHONY: $(NDR_REF_SCH)
$(NDR_REF_SCH):
	$(MAKE) -C $(NDR_ROOT_DIR) dest/ndr-rules-conformance-target-ref.sch

.PHONY: $(NDR_SET_SCH)
$(NDR_SET_SCH):
	$(MAKE) -C $(NDR_ROOT_DIR) dest/ndr-rules-conformance-target-set.sch

markup: $(HTML)

$(HTML): $(XSD_DOCS)
	mkdir -p tmp/markup-schemas.d
	~/working/tools/bin/markup-schemas -out $@ -tmp tmp/markup-schemas.d -title 'NIEM 3.0 alpha 2' - $(NOT_INCLUDED_XSD_DOCS)


t1: tmp/valid-tokens/v5-schemas-meet-ref-rules.d/niem/niem-core/3.0/niem-core.xsd
t2: tmp/valid-tokens/v5-schemas-meet-ref-rules.d/niem/adapters/edxl-cap/3.0/edxl-cap.xsd
t3: tmp/valid-tokens/v6-niem-distro-set-meets-ndr-set-rules
t4: tmp/xsd-consolidated.xml
t5: tmp/valid-tokens/v5-schemas-meet-ref-rules.d/niem/proxy/xsd/3.0/xsd.xsd
