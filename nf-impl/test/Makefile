
TARGETS = \
	ndr-functions.xsl \
	ndr-functions-interface.xsl \
	ndr-rules-conformance-target-set.sch \
	ndr-rules-conformance-target-ref.sch \

default: REBUILD $(TARGETS)

.PHONY: REBUILD
REBUILD:
	$(MAKE) -C .. ndr-functions-impl.xsl ndr-functions-interface.xsl
	$(MAKE) -C ../.. -f dependent.mk dest/ndr-rules-conformance-target-set.sch dest/ndr-rules-conformance-target-ref.sch

ndr-functions.xsl: ../ndr-functions-impl.xsl
	install -m 444 -T $< $@

ndr-functions-interface.xsl: ../ndr-functions-interface.xsl
	install -m 444 -T $< $@

ndr-rules-conformance-target-set.sch: ../../dest/ndr-rules-conformance-target-set.sch
	install -m 444 -T $< $@

ndr-rules-conformance-target-ref.sch: ../../dest/ndr-rules-conformance-target-ref.sch
	install -m 444 -T $< $@

clean:
	$(RM) $(wildcard *.text.xsl) $(wildcard tmp.*) $(wildcard *~) $(wildcard *.zip)
