
FILES = \
iso_abstract_expand.xsl \
iso_dsdl_include.xsl \
iso_schematron_message_xslt2.xsl \
iso_schematron_skeleton_for_saxon.xsl \
iso_svrl_for_xslt2.xsl \
sch-messages-cs.xhtml \
sch-messages-de.xhtml \
sch-messages-en.xhtml \
sch-messages-fr.xhtml \
sch-messages-nl.xhtml \

TARGET_DIR = lib/schematron-xslt

TARGETS = $(patsubst %,$(TARGET_DIR)/%,$(FILES))

default: $(TARGETS)

$(TARGET_DIR)/%: iso-schematron-xslt2/%
	@ mkdir -p $(dir $@)
	install -m 444 -T $< $@

clean:
	$(RM) -r lib
	find . -type f -name '*~' -print0 | xargs -0 rm -f


