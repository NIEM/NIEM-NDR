
TOOLS := $(HOME)/working/tools
SAXON := $(TOOLS)/bin/saxon
INSTALL := install

OUT_D := niem-3.0alpha1-as-3.0
ALPHA_D := $(HOME)/working/niem-3.0alpha1/niem
NIEM3_D := niem-3/release.niem.gov/niem

XSL_STAGES_D := xsl/niem-3.0alpha1-stages

COPY_NIEM3_IN := \
	$(NIEM3_D)/structures/3.0/structures.xsd \
	$(NIEM3_D)/appinfo/3.0/appinfo.xsd \
	$(NIEM3_D)/conformanceTargets/3.0/conformanceTargets.xsd
COPY_NIEM3_OUT := $(patsubst $(NIEM3_D)/%,$(OUT_D)/%,$(COPY_NIEM3_IN))

COPY_ALPHA_IN := $(shell find $(ALPHA_D)/external -type f -name '*.xsd')
COPY_ALPHA_OUT := $(patsubst $(ALPHA_D)/%,$(OUT_D)/%,$(COPY_ALPHA_IN))

# source is niem-2.1/ansi-nist/2.0/ansi-nist.xsd

# stages are:
#    tmp/stages/renamespace/ansi-nist/2.0/ansi-nist.xsd/
#    tmp/stages/transform/ansi-nist/2.0/ansi-nist.xsd/
#    tmp/stages/cleanup/ansi-nist/2.0/ansi-nist.xsd/

# dest is niem-2.1-as-3.0/ansi-nist/2.0/ansi-nist.xsd

STAGES := copy renamespace transform cleanup

TRANSFORMED_IN := $(shell find $(ALPHA_D) -type f -name '*.xsd' \
		   ! -path $(ALPHA_D)/structures/3.0/structures.xsd \
		   ! -path $(ALPHA_D)/appinfo/2.1/appinfo.xsd \
		   ! -path $(ALPHA_D)/appinfo/2.0/appinfo.xsd \
		   ! -path '$(ALPHA_D)/external/*' )
TRANSFORMED_BASE := $(patsubst $(ALPHA_D)/%,%,$(TRANSFORMED_IN))
TRANSFORMED_STAGES := $(foreach STAGE,$(STAGES),$(patsubst %,tmp/stages/%/$(STAGE),$(TRANSFORMED_BASE)))
TRANSFORMED_OUT := $(patsubst %,$(OUT_D)/%,$(TRANSFORMED_BASE))

.PRECIOUS: $(TRANSFORMED_STAGES)

ALL_OUT := $(TRANSFORMED_OUT) $(COPY_NIEM3_OUT) $(COPY_ALPHA_OUT)

.PHONY: all
all: $(ALL_OUT)

tmp/stages/%/copy: $(ALPHA_D)/%
	mkdir -p $(dir $@)
	cp $< $@

tmp/stages/%/renamespace: tmp/stages/%/copy $(XSL_STAGES_D)/renamespace.xsl $(XSL_STAGES_D)/common.xsl $(XSL_STAGES_D)/xsl-functions.xsl
	mkdir -p $(dir $@)
	$(SAXON) -ee -l:on -xsl $(XSL_STAGES_D)/renamespace.xsl -in $< -out $@

# tmp/stages/%/augmentations: tmp/stages/%/renamespace $(XSL_STAGES_D)/augmentations.xsl $(XSL_STAGES_D)/common.xsl $(XSL_STAGES_D)/xsl-functions.xsl
# 	mkdir -p $(dir $@)
#	$(SAXON) -ee -l:on -xsl $(XSL_STAGES_D)/augmentations.xsl -in $< -out $@

tmp/stages/%/transform: tmp/stages/%/renamespace $(XSL_STAGES_D)/transform.xsl $(XSL_STAGES_D)/common.xsl $(XSL_STAGES_D)/xsl-functions.xsl
	mkdir -p $(dir $@)
	BASE_D=tmp/stages; \
	DEST=$(dir $@); \
	DEST_D=$$(dirname $$DEST); \
	PATH_TO_ROOT=$$(realpath --relative-to $$DEST_D $$BASE_D); \
	$(SAXON) -ee -l:on -xsl $(XSL_STAGES_D)/transform.xsl -in $< -out $@ - PATH_TO_ROOT=$$PATH_TO_ROOT

tmp/stages/%/cleanup: tmp/stages/%/transform $(XSL_STAGES_D)/cleanup.xsl $(XSL_STAGES_D)/common.xsl $(XSL_STAGES_D)/xsl-functions.xsl
	mkdir -p $(dir $@)
	$(SAXON) -ee -l:on -xsl $(XSL_STAGES_D)/cleanup.xsl -in $< -out $@

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

$(OUT_D)/external/%: $(ALPHA_D)/external/%
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


.PHONY: 1
1: $(OUT_D)/codes/ansi_d20/3.0/ansi_d20.xsd 
diff-1: $(OUT_D)/codes/ansi_d20/3.0/ansi_d20.xsd
	wdiff-html $(ALPHA_D)/codes/ansi_d20/3.0/ansi_d20.xsd $(OUT_D)/codes/ansi_d20/3.0/ansi_d20.xsd > tmp.html
	open tmp.html
diff-1r: 
	! wdiff-html $(ALPHA_D)/codes/ansi_d20/3.0/ansi_d20.xsd tmp/stages/codes/ansi_d20/3.0/ansi_d20.xsd/renamespace > tmp.html
	open tmp.html

.PHONY: ct
ct: niem-2.1-as-3.0/conformanceTargets/3.0/conformanceTargets.xsd

$(XSL_STAGES_D)/xsl-functions.xsl: $(TOOLS)/lib/xsl/xsl-functions.xsl
	rm -f $@
	cp $< $@
	chmod 400 $@

