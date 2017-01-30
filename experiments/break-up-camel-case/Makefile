
ifeq ($(IEAD_TOOLS_ROOT),)
$(error Environment variable "IEAD_TOOLS_ROOT" is unset)
endif

SAXON := $(IEAD_TOOLS_ROOT)/bin/saxon

CHECK_WORDS_XSL := check-words-in-names.xsl

CONSOLIDATED := $(HOME)/working/beta/distribution/tmp/consolidated.xml
BREAK_UP_XSL := break-up-camel-case.xsl
RESULT := result.txt

REPORT_NOT_OED := report-not-oed-terms.txt
REPORT_NOT_OED_CSV := $(REPORT_NOT_OED:%.txt=%.csv)
REPORT_RED_FLAG := report-red-flag-terms.txt
REPORT_RED_FLAG_CSV := $(REPORT_RED_FLAG:%.txt=%.csv)

REPORT_WORDS = find $(shell realpath --relative-to=. ~/working/niem-3.0beta1/niem) -type f -name '*.xsd' \
		| grep -v external \
		| grep -v structures.xsd \
		| grep -v appinfo.xsd \
		| grep -v xsd.xsd \
		| xargs -I'{}' -n 1 ~/working/tools/bin/saxon -l:on -ee -in '{}' -xsl check-words-in-names.xsl - words-file=$(1) error-if-present=$(2) \
		| ./grepify

GENERATED := $(REPORT_NOT_OED) $(REPORT_RED_FLAG) oed-terms.xml red-flag-terms.xml $(REPORT_NOT_OED_CSV) $(REPORT_RED_FLAG_CSV)

default: $(REPORT_NOT_OED) $(REPORT_RED_FLAG) $(REPORT_NOT_OED_CSV) $(REPORT_RED_FLAG_CSV)

$(REPORT_NOT_OED) : oed-terms.xml $(CHECK_WORDS_XSL) 
	$(call REPORT_WORDS,$<,false) > $@

$(REPORT_RED_FLAG) : red-flag-terms.xml $(CHECK_WORDS_XSL) 
	$(call REPORT_WORDS,$<,true) > $@

oed-terms.xml: special-terms.txt oed-terms.txt generate-words-xml
	./generate-words-xml special-terms.txt oed-terms.txt > $@

red-flag-terms.xml: red-flag-terms.txt generate-words-xml
	./generate-words-xml < $< > $@

$(REPORT_RED_FLAG_CSV) : $(REPORT_RED_FLAG) csvify
	./csvify $< > $@

$(REPORT_NOT_OED_CSV) : $(REPORT_NOT_OED) csvify
	./csvify $< > $@

clean:
	$(RM) $(GENERATED) $(wildcard *~)

.PHONY: sort
sort:
	sort -u -o oed-terms.txt oed-terms.txt
	sort -u -o red-flag-terms.txt red-flag-terms.txt
	sort -u -o not-oed-terms.txt not-oed-terms.txt

words.xml: good-words.txt
	./generate-words-xml < $< > $@

missing: still-missing.txt

.PHONY: still-missing.txt 
still-missing.txt: good-words.txt sort
	rm -f $@
	comm -23 plain-bad-words.txt good-words.txt > $@

.PHONY: csv
csv: warnings.csv

warnings.csv: bad-words.txt
	./csvify $< > $@

