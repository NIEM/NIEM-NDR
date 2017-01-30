
NDR_DEST_DIR = ../../dest

TARGETS = \
ndr-doc.html \
ndr-doc.txt \
ndr-functions-interface.xsl \
ndr-functions.xsl \
ndr-rules-conformance-target-ext.sch \
ndr-rules-conformance-target-ins.sch \
ndr-rules-conformance-target-ref.sch \
ndr-rules-conformance-target-set.sch \
tools/lib/ndr-id-map.xml

default: $(TARGETS)

%: $(NDR_DEST_DIR)/%
	rm -f $@
	install --mode=400 --no-target-directory $< $@

tools/lib/ndr-id-map.xml: $(NDR_DEST_DIR)/ndr-id-map.xml
	rm -f $@
	mkdir -p $(dir $@)
	install --mode=400 --no-target-directory $< $@
