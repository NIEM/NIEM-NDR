
SAXON := $(HOME)/working/tools/bin/saxon
INSTALL := install

OUT_D := niem-2.1-as-3.0
NIEM2_D := niem-2.1
NIEM3_D := niem-3/release.niem.gov/niem

COPY_NIEM3_IN := \
	$(NIEM3_D)/structures/3.0/structures.xsd \
	$(NIEM3_D)/appinfo/3.0/appinfo.xsd \
	$(NIEM3_D)/conformanceTargets/3.0/conformanceTargets.xsd
COPY_NIEM3_OUT := $(patsubst $(NIEM3_D)/%,$(OUT_D)/%,$(COPY_NIEM3_IN))

COPY_NIEM2_IN := $(shell find $(NIEM2_D)/external -type f -name '*.xsd')
COPY_NIEM2_OUT := $(patsubst $(NIEM2_D)/%,$(OUT_D)/%,$(COPY_NIEM2_IN))

# source is niem-2.1/ansi-nist/2.0/ansi-nist.xsd

# stages are:
#    tmp/stages/renamespace/ansi-nist/2.0/ansi-nist.xsd/
#    tmp/stages/transform/ansi-nist/2.0/ansi-nist.xsd/
#    tmp/stages/cleanup/ansi-nist/2.0/ansi-nist.xsd/

# dest is niem-2.1-as-3.0/ansi-nist/2.0/ansi-nist.xsd

STAGES := copy renamespace augmentations transform cleanup

TRANSFORMED_IN := $(shell find $(NIEM2_D) -type f -name '*.xsd' \
		   ! -path $(NIEM2_D)/structures/2.0/structures.xsd \
		   ! -path $(NIEM2_D)/appinfo/2.1/appinfo.xsd \
		   ! -path $(NIEM2_D)/appinfo/2.0/appinfo.xsd \
		   ! -path '$(NIEM2_D)/external/*' )
TRANSFORMED_BASE := $(patsubst $(NIEM2_D)/%,%,$(TRANSFORMED_IN))
TRANSFORMED_STAGES := $(foreach STAGE,$(STAGES),$(patsubst %,tmp/stages/%/$(STAGE),$(TRANSFORMED_BASE)))
TRANSFORMED_OUT := $(patsubst %,$(OUT_D)/%,$(TRANSFORMED_BASE))

.PRECIOUS: $(TRANSFORMED_STAGES)

ALL_OUT := $(TRANSFORMED_OUT) $(COPY_NIEM3_OUT) $(COPY_NIEM2_OUT)

.PHONY: all
all: $(ALL_OUT)

tmp/stages/%/copy: $(NIEM2_D)/%
	mkdir -p $(dir $@)
	cp $< $@

tmp/stages/%/renamespace: tmp/stages/%/copy xsl/stages/renamespace.xsl xsl/stages/common.xsl
	mkdir -p $(dir $@)
	$(SAXON) -ee -l:on -xsl xsl/stages/renamespace.xsl -in $< -out $@

tmp/stages/%/augmentations: tmp/stages/%/renamespace xsl/stages/augmentations.xsl xsl/stages/common.xsl
	mkdir -p $(dir $@)
	$(SAXON) -ee -l:on -xsl xsl/stages/renamespace.xsl -in $< -out $@

tmp/stages/%/transform: tmp/stages/%/augmentations xsl/stages/transform.xsl xsl/stages/common.xsl
	mkdir -p $(dir $@)
	BASE_D=tmp/stages; \
	DEST=$(dir $@); \
	DEST_D=$$(dirname $$DEST); \
	PATH_TO_ROOT=$$(realpath --relative-to $$DEST_D $$BASE_D); \
	$(SAXON) -ee -l:on -xsl xsl/stages/transform.xsl -in $< -out $@ - PATH_TO_ROOT=$$PATH_TO_ROOT

tmp/stages/%/cleanup: tmp/stages/%/transform xsl/stages/cleanup.xsl xsl/stages/common.xsl
	mkdir -p $(dir $@)
	$(SAXON) -ee -l:on -xsl xsl/stages/cleanup.xsl -in $< -out $@

$(OUT_D)/%: tmp/stages/%/cleanup
	mkdir -p $(dir $@)
	cp $< $@


#
#$(OUT_D)/%: $(IN_D)/% niem-2.1-to-3.0.xsl
#	mkdir -p $(dir $@)
#	BASE_D=$(OUT_D); \
#	DEST=$@; \
#	DEST_D=$$(dirname $$DEST); \
#	PATH_TO_ROOT=$$(realpath --relative-to $$DEST_D $$BASE_D); \
#	$(SAXON) -ee -l:on -xsl niem-2.1-to-3.0.xsl -in $< -out $@ - PATH_TO_ROOT=$$PATH_TO_ROOT

$(OUT_D)/external/%: $(NIEM2_D)/external/%
	mkdir -p $(dir $@)
	$(INSTALL) --no-target-directory $< $@

$(OUT_D)/%: $(NIEM3_D)/%
	mkdir -p $(dir $@)
	$(INSTALL) --no-target-directory $< $@

.PHONY: clean
clean:
	$(RM) -r $(OUT_D) tmp

.PHONY: list
list:
	@ echo $(ALL_OUT)


.PHONY: an
an: niem-2.1-as-3.0/ansi-nist/2.0/ansi-nist.xsd

.PHONY: ct
ct: niem-2.1-as-3.0/conformanceTargets/3.0/conformanceTargets.xsd
