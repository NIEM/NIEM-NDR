
SHELL = /bin/bash

CHECKSUM_FILE = lib/shasums.txt

CACHE_DIR = var/cache
ISO_SCHEMATRON_XSLT2_ZIP = $(CACHE_DIR)/iso-schematron-xslt2.zip
SAXON_HE_ZIP = $(CACHE_DIR)/SaxonHE9-5-1-4J.zip
XALAN_ZIP = $(CACHE_DIR)/xalan-j_2_7_1-bin.zip
NIEM_REL_ZIP = $(CACHE_DIR)/niem-3.0.rel.zip
CATALOG_DTD_CACHE = $(CACHE_DIR)/www.oasis-open.org/committees/entity/release/1.0/catalog.dtd

RESOLVER_HREF = http://www.gtlib.gatech.edu/pub/apache/xerces/xml-commons/xml-commons-resolver-1.2.zip
RESOLVER_ZIP = $(CACHE_DIR)/xml-commons-resolver-1.2.zip
TOKEN_EXTRACTED_RESOLVER = $(TOKENS_DIR)/extracted-resolver

CACHED_FILES = $(ISO_SCHEMATRON_XSLT2_ZIP) $(SAXON_HE_ZIP) $(XALAN_ZIP) $(NIEM_REL_ZIP) $(CATALOG_DTD_CACHE) $(RESOLVER_ZIP)

TOKENS_DIR = tmp/tokens
TOKEN_CHECKSUMS_OK = $(TOKENS_DIR)/checksums-ok
TOKEN_EXTRACTED_SCHEMATRON = $(TOKENS_DIR)/extracted-schematron
TOKEN_EXTRACTED_SAXON = $(TOKENS_DIR)/extracted-saxon
TOKEN_EXTRACTED_XALAN = $(TOKENS_DIR)/extracted-xalan
TOKEN_EXTRACTED_NIEM = $(TOKENS_DIR)/extracted-niem
TOKEN_PATCHED_SCHEMATRON = $(TOKENS_DIR)/patched-schematron

.PHONY: default
default: help

.PHONY: help
help:
	@ echo "Pick a target:"
	@ echo "  all: build all the usual suspects"
	@ echo "  clean: clean up the basics: remove tokens and redo a lot of stuff"
	@ echo "  distclean: nuke the package distribution zips and otherwise clean everything you can"
	@ echo "  set-shasums: reset the checksums so that the build system expects the zip files that are already on disk"
	@ echo "  reset-patch: rebuild the patch file so that the build system recreates the ISO Schematron distribution as it is on disk"
	@ echo "  check: identify badly-permissioned test scripts (must be at least u+rx)"
	@ echo "  retest: clean up traces of tests and run tests again"
	@ echo "  test: run tests, if needed"
	@ echo "  cache: download cached files"

all: $(TOKEN_CHECKSUMS_OK) $(TOKEN_EXTRACTED_SCHEMATRON) $(TOKEN_EXTRACTED_SAXON) $(TOKEN_EXTRACTED_XALAN) $(TOKEN_PATCHED_SCHEMATRON) $(TOKEN_EXTRACTED_NIEM) pkg/oasis/catalog.dtd $(TOKEN_EXTRACTED_RESOLVER)

.PHONY: cache
cache: $(CACHED_FILES)

##################################################################
# resolver

$(RESOLVER_ZIP):
	mkdir -p $(dir $@)
	curl --location -o $@ $(RESOLVER_HREF)

$(TOKEN_EXTRACTED_RESOLVER): $(RESOLVER_ZIP) $(TOKEN_CHECKSUMS_OK)
	rm -rf pkg/xml-commons-resolver
	mkdir -p pkg/xml-commons-resolver
	unzip -j -d pkg/xml-commons-resolver $< xml-commons-resolver-1.2/resolver.jar
	mkdir -p $(dir $@)
	touch $@

##################################################################

$(ISO_SCHEMATRON_XSLT2_ZIP):
	mkdir -p $(dir $@)
	curl -o $@ https://schematron.googlecode.com/files/iso-schematron-xslt2.zip

$(TOKEN_EXTRACTED_SCHEMATRON): $(ISO_SCHEMATRON_XSLT2_ZIP) $(TOKEN_CHECKSUMS_OK) 
	rm -rf pkg/iso-schematron-xslt2
	rm -f $(TOKEN_PATCHED_SCHEMATRON)
	mkdir -p pkg/iso-schematron-xslt2
	unzip -d pkg/iso-schematron-xslt2 $<
	mkdir -p $(dir $@)
	touch $@

$(SAXON_HE_ZIP):
	mkdir -p $(dir $@)
	curl --location -o $@ http://downloads.sourceforge.net/project/saxon/Saxon-HE/9.5/SaxonHE9-5-1-4J.zip

$(TOKEN_EXTRACTED_SAXON): $(SAXON_HE_ZIP) $(TOKEN_CHECKSUMS_OK) 
	rm -rf pkg/saxon
	mkdir -p pkg/saxon
	unzip -d pkg/saxon $< saxon9he.jar
	mkdir -p $(dir $@)
	touch $@

$(XALAN_ZIP):
	mkdir -p $(dir $@)
	curl --location -o $@ http://archive.apache.org/dist/xml/xalan-j/binaries/xalan-j_2_7_1-bin.zip

$(TOKEN_EXTRACTED_XALAN): $(XALAN_ZIP) $(TOKEN_CHECKSUMS_OK) 
	rm -rf pkg/xalan
	mkdir -p pkg/xalan
	unzip -j -d pkg/xalan $< xalan-j_2_7_1/xalan.jar xalan-j_2_7_1/serializer.jar xalan-j_2_7_1/xercesImpl.jar xalan-j_2_7_1/xml-apis.jar
	mkdir -p $(dir $@)
	touch $@

$(NIEM_REL_ZIP):
	mkdir -p $(dir $@)
	curl --location -o $@ http://release.niem.gov/niem/3.0/niem-3.0.rel.zip

$(TOKEN_EXTRACTED_NIEM): $(NIEM_REL_ZIP)
	rm -rf pkg/niem-release
	mkdir -p pkg/niem-release
	unzip -d pkg/niem-release $(NIEM_REL_ZIP)
	mkdir -p $(dir $@)
	touch $@

##################################################################
# DTDs

dtd: pkg/oasis/catalog.dtd

pkg/oasis/catalog.dtd: $(CACHE_DIR)/www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
	mkdir -p $(dir $@)
	cp $< $@

$(CACHE_DIR)/www.oasis-open.org/committees/entity/release/1.0/catalog.dtd:
	mkdir -p $(dir $@)
	curl --location -o $@ http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd

##################################################################
# checksums

$(TOKEN_CHECKSUMS_OK): $(CHECKSUM_FILE) $(CACHED_FILES)
	shasum -c $(CHECKSUM_FILE)
	mkdir -p $(dir $@)
	touch $@

set-shasums: $(CACHED_FILES)
	shasum -a 1 -b $^ > $(CHECKSUM_FILE)

##################################################################
# patches

$(TOKENS_DIR)/patched-schematron: lib/iso-schematron-xslt2.patch $(TOKEN_EXTRACTED_SCHEMATRON)
	patch -p0 < $<
	mkdir -p $(dir $@)
	touch $@

reset-patch:
	mv pkg/iso-schematron-xslt2 pkg/iso-schematron-xslt2.patched
	unzip -d pkg/iso-schematron-xslt2 var/cache/iso-schematron-xslt2.zip
	- diff -Naur -x '*~' pkg/iso-schematron-xslt2 pkg/iso-schematron-xslt2.patched > lib/iso-schematron-xslt2.patch
	rm -r pkg/iso-schematron-xslt2
	mv pkg/iso-schematron-xslt2.patched pkg/iso-schematron-xslt2

##################################################################
# cleanup

clean:
	rm -rf tmp pkg
	find . -type f -name 'tmp.*' -print0 | xargs -0 rm -f

distclean: clean
	rm -rf var
	find . -type f -name '*~' -print0 | xargs -0 rm -f

##################################################################
# tests

# any file named run-test* that is executable by the current user
TEST_SCRIPTS =     $(shell find tests -type f -name 'run-test*' ! -name '*~'   -perm -500)
BAD_TEST_SCRIPTS = $(shell find tests -type f -name 'run-test*' ! -name '*~' ! -perm -500)
TEST_TOKENS = $(patsubst %,$(TOKENS_DIR)/ran-test/%,$(TEST_SCRIPTS))

check:
	@ for s in $(BAD_TEST_SCRIPTS); do printf "Bad permission on %s\n" "$$s"; done

retest:
	@ $(RM) $(TEST_TOKENS)
	@ $(MAKE) test

test: $(TEST_TOKENS)

$(TOKENS_DIR)/ran-test/%: %
	@ mkdir -p $(dir $@)
	if ! bin/run-tests $< > $@; then rm $@; fi


