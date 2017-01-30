
TMP_DIR = tmp
TOKENS_DIR = $(TMP_DIR)/tokens
# passing NIEM reference rules
REF_RULES_PASS_TOKENS_DIR = $(TOKENS_DIR)/ref-pass
STRICT_XSD_VALID_PASS_TOKENS_DIR = $(TOKENS_DIR)/strict-xsd-valid

REF_RULES_PASS_SRC = \
simple-pass/niem/niem-core/3.0/niem-core.xsd

REF_RULES_PASS_TOKENS = $(patsubst %,$(REF_RULES_PASS_TOKENS_DIR)/%,$(REF_RULES_PASS_SRC))

STRICT_XSD_VALID_PASS_SRC = $(REF_RULES_PASS_SRC)
STRICT_XSD_VALID_PASS_TOKENS = $(patsubst %,$(STRICT_XSD_VALID_PASS_TOKENS_DIR)/%,$(STRICT_XSD_VALID_PASS_SRC))

NDR_DIR = ../..
REF_RULES_SCH_REL = dest/ndr-rules-conformance-target-ref.sch
REF_RULES_SCH = $(NDR_DIR)/$(REF_RULES_SCH_REL)

SCHEMATRON = $(IEAD_TOOLS_ROOT)/bin/schematron

ALL_TOKENS = $(STRICT_XSD_VALID_PASS_TOKENS) $(REF_RULES_PASS_TOKENS)

default: $(ALL_TOKENS)

.PHONY: $(REF_RULES_SCH)
$(REF_RULES_SCH):
	$(MAKE) -C $(NDR_DIR) -f dependent.mk $(REF_RULES_SCH_REL)

$(REF_RULES_PASS_TOKENS_DIR)/%: % $(REF_RULES_SCH)
	rm -f $@
	$(SCHEMATRON) -ee -schema $(REF_RULES_SCH) $<
	mkdir -p $(dir $@)
	touch $@

$(STRICT_XSD_VALID_PASS_TOKENS_DIR)/%: %
	rm -f $@
	$(IEAD_TOOLS_ROOT)/bin/xsdvalid -catalog $(NDR_DIR)/xsd/catalog-xmlschema-strict.xml -catalog $(NDR_DIR)/xsd/catalog.xml $<
	mkdir -p $(dir $@)
	touch $@

inspect:
	@printf "ref: '%s'\n" $(STRICT_XSD_VALID_PASS_TOKENS)

grep:
	$(MAKE) 2>&1 | sed -e 's!file:/Users/webbroberts/working/ndr3/tests/experiments/!!' | emacsclient-grep

