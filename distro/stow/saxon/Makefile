

TARGETS := lib/saxon9he.jar

default: $(TARGETS)

lib/%: SaxonHE9-5-1-3J/%
	@mkdir -p $(dir $@)
	install -m 444 -T $< $@

clean:
	$(RM) -r lib
	$(RM) $(wildcard *~)
