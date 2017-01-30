
all: tmp/unknown-terms.txt

clean: 
	$(RM) tmp/unknown-terms.txt tmp/not-oed-terms.txt

tmp/unknown-terms.txt: tmp/candidate-not-oed-terms.txt not-oed-terms.txt
	mkdir -p $(dir $@)
	comm -23 $^ > $@

tmp/candidate-not-oed-terms.txt: report-not-oed-terms.txt
	mkdir -p $(dir $@)
	tail -n +2 $< | sed -e 's/^[^"]*"\([^"]*\)\".*$$/\1/' | sort -u > $@

