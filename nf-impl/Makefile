
SHELL=/bin/bash

TARGET_XSLS = ndr-functions-interface.xsl \
	ndr-functions-impl.xsl

TARGETS = $(TARGET_XSLS)  \
	ndr-functions-interface.xsl.extra-xsl.signatures.txt \
	ndr-functions-impl.xsl.extra-xsl.signatures.txt \

JUNK = ndr-functions-interface.xsl.extra-xsl.signatures.txt \
	ndr-functions-interface.xsl \
	ndr-functions-interface.xsl.extra-xsl \
	ndr-functions-impl.xsl.extra-xsl \

default: $(TARGETS)

%: %.m4 ../config-decls.m4 ../src/ndr-macros.m4
	rm -f $@
	m4 -P ../config-decls.m4 ../src/ndr-macros.m4 $< > $@
	chmod uog-w $@

%: %.extra-xsl extra-xsl.xsl
	rm -f $@
	~/working/tools/bin/saxon -ee -l:on -xsl extra-xsl.xsl -in $< -out $@
	chmod uog-w $@

%.signatures.txt: % to-signature.xsl
	rm -f $@
	~/working/tools/bin/saxon -ee -l:on -xsl to-signature.xsl -in $< -out $@
	chmod uog-w $@

ndr-functions-interface.xsl.extra-xsl.signatures.txt: ndr-functions-interface.xsl.extra-xsl
ndr-functions-impl.xsl.extra-xsl.signatures.txt: ndr-functions-impl.xsl.extra-xsl

# do this to make sure that the impl matches the sig.
diff-sig: ndr-functions-interface.xsl.extra-xsl.signatures.txt ndr-functions-impl.xsl.extra-xsl.signatures.txt
	diff ndr-functions-interface.xsl.extra-xsl.signatures.txt <( sed -e 's/impl:/nf:/' < ndr-functions-impl.xsl.extra-xsl.signatures.txt | head -n 6)

clean:
	$(RM) $(wildcard *~) $(JUNK)

install: $(TARGET_XSLS)
	install -m 444 ndr-functions-interface.xsl ../dest
	install -m 444 -T ndr-functions-impl.xsl ../dest/ndr-functions.xsl
