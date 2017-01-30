
SHELL = /bin/bash

CHECKSUM_FILE = shasums.txt

ISO_SCHEMATRON_XSLT2_ZIP = tmp/iso-schematron-xslt2.zip
SAXON_HE_ZIP = tmp/SaxonHE9-5-1-4J.zip
XALAN_ZIP = tmp/xalan-j_2_7_1-bin.zip
NIEM_REL_ZIP = tmp/niem-3.0.rel.zip

TOKEN_CHECKSUMS_OK = tmp/checksums-ok
TOKEN_EXTRACTED_SCHEMATRON = tmp/extracted-schematron
TOKEN_EXTRACTED_SAXON = tmp/extracted-saxon
TOKEN_EXTRACTED_XALAN = tmp/extracted-xalan
TOKEN_EXTRACTED_NIEM = tmp/extracted-niem

PATCHES = $(wildcard patch*.patch)
TOKENS_APPLIED_PATCHES = $(patsubst %,tmp/applied-%,$(PATCHES))

default: $(TOKEN_CHECKSUMS_OK) $(TOKEN_EXTRACTED_SCHEMATRON) $(TOKEN_EXTRACTED_SAXON) $(TOKEN_EXTRACTED_XALAN) $(TOKENS_APPLIED_PATCHES) $(TOKEN_EXTRACTED_NIEM)

$(TOKEN_CHECKSUMS_OK): $(ISO_SCHEMATRON_XSLT2_ZIP) $(SAXON_HE_ZIP) $(XALAN_ZIP) $(NIEM_REL_ZIP) $(CHECKSUM_FILE) 
	shasum -c $(CHECKSUM_FILE)
	mkdir -p $(dir $@)
	touch $@

$(ISO_SCHEMATRON_XSLT2_ZIP):
	mkdir -p $(dir $@)
	curl -o $@ https://schematron.googlecode.com/files/iso-schematron-xslt2.zip

$(TOKEN_EXTRACTED_SCHEMATRON): $(ISO_SCHEMATRON_XSLT2_ZIP) $(TOKEN_CHECKSUMS_OK) 
	unzip -d iso-schematron-xslt2 $<
	mkdir -p $(dir $@)
	touch $@

$(SAXON_HE_ZIP):
	mkdir -p $(dir $@)
	curl --location -o $@ http://downloads.sourceforge.net/project/saxon/Saxon-HE/9.5/SaxonHE9-5-1-4J.zip

$(TOKEN_EXTRACTED_SAXON): $(SAXON_HE_ZIP) $(TOKEN_CHECKSUMS_OK) 
	unzip -d saxon $< saxon9he.jar
	mkdir -p $(dir $@)
	touch $@

$(XALAN_ZIP):
	mkdir -p $(dir $@)
	curl --location -o $@ http://archive.apache.org/dist/xml/xalan-j/binaries/xalan-j_2_7_1-bin.zip

$(TOKEN_EXTRACTED_XALAN): $(XALAN_ZIP) $(TOKEN_CHECKSUMS_OK) 
	unzip -j -d xalan $< xalan-j_2_7_1/xalan.jar xalan-j_2_7_1/serializer.jar xalan-j_2_7_1/xercesImpl.jar xalan-j_2_7_1/xml-apis.jar
	mkdir -p $(dir $@)
	touch $@

tmp/applied-patch%.patch: patch%.patch $(TOKEN_EXTRACTED_SCHEMATRON)
	patch -p0 < $<
	mkdir -p $(dir $@)
	touch $@

$(NIEM_REL_ZIP):
	mkdir -p $(dir $@)
	curl --location -o $@ http://release.niem.gov/niem/3.0/niem-3.0.rel.zip

$(TOKEN_EXTRACTED_NIEM): $(NIEM_REL_ZIP)
	unzip -d ../tests/niem-release $(NIEM_REL_ZIP)
	mkdir -p $(dir $@)
	touch $@

