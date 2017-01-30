
SHELL = /bin/bash

REPO = ndr-tools.git

TEMP_DIR=tmp
TOKENS_DIR=$(TEMP_DIR)/tokens.d

TARGET_DIR=$(TEMP_DIR)/target.d

RELEASE_NAME=$(shell printf "ndr-%s-%s" $(shell cat date.txt) $(shell cat version.txt))
RELEASE_DIR=$(TEMP_DIR)/$(RELEASE_NAME)

NDR_TARGETS_ROOT = \
$(REPO)/ndr-doc.html \
$(REPO)/ndr-doc.txt \
$(REPO)/ndr-functions-interface.xsl \
$(REPO)/ndr-functions.xsl \
$(REPO)/ndr-rules-conformance-target-ext.sch \
$(REPO)/ndr-rules-conformance-target-ins.sch \
$(REPO)/ndr-rules-conformance-target-ref.sch \
$(REPO)/ndr-rules-conformance-target-set.sch \

NDR_TARGETS_LIB = \
$(REPO)/lib/ndr-id-map.xml \

NDR_TARGETS = $(NDR_TARGETS_ROOT) $(NDR_TARGETS_LIB)

NDR_SOURCES_ROOT = $(patsubst $(REPO)/%,../dest/%,$(NDR_TARGETS_ROOT))
NDR_SOURCES_LIB = $(patsubst $(REPO)/lib/%,../dest/%,$(NDR_TARGETS_LIB))
NDR_SOURCES = $(NDR_SOURCES_ROOT) $(NDR_SOURCES_LIB)

NDR_TARGETS_UPDATED_TOKEN = $(TOKENS_DIR)/ndr-targets-updated

help:
	@echo "Targets:"
	@echo "  put-current-ndr: install all the current NDR files (rules, etc) into the git repo"
	@echo "  clean-ndr"
	@echo "  put-downloads"
	@echo "  distclean"
	@echo "  put-nf: put the niem functions"

.PHONY: put-nf
put-nf:
	$(MAKE) -C ../nf-impl install
	$(MAKE) put-current-ndr

distclean:
	$(MAKE) -C ndr-tools.git distclean
	$(MAKE) clean-ndr

put-downloads:
	rsync -prv downloads/ $(REPO)/

again:
	$(MAKE) put-downloads

clean:
	rm -rf $(TOKENS_DIR)

purge: 
	chmod --recursive u+w $(TEMP_DIR) || true
	rm -rf $(TEMP_DIR)

reset-shasums:
	( cd $(RELEASE_DIR)/tools; shasum -a 1 -b tmp/iso-schematron-xslt2.zip tmp/SaxonHE9-5-1-4J.zip tmp/xalan-j_2_7_1-bin.zip tmp/niem-3.0.rel.zip ) > scripts/tools/shasums.txt

patches:
	( cd $(RELEASE_DIR)/tools; \
	  mv iso-schematron-xslt2 iso-schematron-xslt2.patched; \
	  unzip -d iso-schematron-xslt2 iso-schematron-xslt2.zip >&2; \
	  diff -Naur -x '*~' iso-schematron-xslt2 iso-schematron-xslt2.patched; \
	  rm -r iso-schematron-xslt2; \
	  mv iso-schematron-xslt2.patched iso-schematron-xslt2 ) \
	> scripts/tools/patch1.patch

##################################################################
# NDR 

put-current-ndr: $(NDR_TARGETS_UPDATED_TOKEN)

$(NDR_TARGETS_UPDATED_TOKEN): $(NDR_SOURCES)
	install -m 644 $(NDR_SOURCES_ROOT) $(REPO)
	install -m 644 $(NDR_SOURCES_LIB) $(REPO)/lib
	mkdir -p $(dir $@)
	touch $@

$(REPO)/%: ../dest/%
	cp $< $@

$(REPO)/lib/ndr-id-map.xml: ../dest/ndr-id-map.xml

clean-ndr:
	rm -f $(NDR_TARGETS) $(NDR_TARGETS_UPDATED_TOKEN) 

##################################################################
# specific NDR rule sets

#### set

SET_NAME = ndr-rules-conformance-target-set.sch

set: map build-set $(REPO)/$(SET_NAME)

build-set:
	$(MAKE) -C .. -f dependent.mk dest/$(SET_NAME)

$(REPO)/$(SET_NAME): ../dest/$(SET_NAME)
	install -m 644 $< $@

#### ref

REF_NAME = ndr-rules-conformance-target-ref.sch

ref: map build-ref $(REPO)/$(REF_NAME)

build-ref:
	$(MAKE) -C ..  -f dependent.mk dest/$(REF_NAME)

$(REPO)/$(REF_NAME): ../dest/$(REF_NAME)
	install -m 644 $< $@

#### ext

EXT_NAME = ndr-rules-conformance-target-ext.sch

ext: map build-ext $(REPO)/$(EXT_NAME)

build-ext:
	$(MAKE) -C ..  -f dependent.mk dest/$(EXT_NAME)

$(REPO)/$(EXT_NAME): ../dest/$(EXT_NAME)
	install -m 644 $< $@

#### map

map: build-map $(REPO)/lib/ndr-id-map.xml

build-map:
	$(MAKE) -C ..  -f dependent.mk dest/ndr-id-map.xml 

$(REPO)/lib/ndr-id-map.xml: ../dest/ndr-id-map.xml
	install -m 644 $< $@

