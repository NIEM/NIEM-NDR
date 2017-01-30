# -*-makefile-*-

SCHEMAS := w3/XMLSchema.xsd w3/xml.xsd

xsd.html: $(SCHEMAS)
	mkdir -p tmp/xsd.html.d
	$(HOME)/working/tools/bin/markup-schemas -out $@ -tmp tmp/xsd.html.d -title 'XML Schema' $^

clean:
	$(RM) -r tmp/xsd.html.d xsd.html
