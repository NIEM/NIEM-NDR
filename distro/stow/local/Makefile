
DEST_DIR=../../../dest

DEST_FILE_NAMES = \
ndr-functions-interface.xsl \
ndr-functions.xsl \
ndr-rules-conformance-target-ext.sch \
ndr-rules-conformance-target-ins.sch \
ndr-rules-conformance-target-ref.sch \
ndr-rules-conformance-target-set.sch \
ndr-doc.html \
ndr-doc.txt \

default: $(DEST_FILE_NAMES)

clean:
	$(RM) $(DEST_FILE_NAMES) $(wildcard tmp.*)
	find . -type f -name '*~' -print0 | xargs -0 rm -f

%: $(DEST_DIR)/%
	install -m 444 -T $< $@

