
SHELL = /bin/bash

default:
	@echo "Pick a target:"
	@echo "  rmsubset: remove the subset schemas" 
	@echo "  html: generate browsable HTML version of schemas"
	@echo "  reload: Expand the latest subset saved in ~/Dowloads"

rmsubset:
	rm -f wantlist.xml xml-catalog.xml 
	rm -rf niem

clean:
	$(RM) schemas.html

reload:
	$(MAKE) rmsubset
	find ~/Downloads -name 'Subset *.zip' -printf '%T+ %p\n' | sort | tail -n 1 | sed -e 's/^[^ ]* //' | xargs -d $$'\n' unzip
	$(MAKE) html

.PHONY: html
html: schemas.html

SCHEMAS = $(shell find niem -type f -name '*.xsd')
schemas.html: $(SCHEMAS)
	~/working/tools/bin/markup-schemas --verbose -out schemas.html -title 'XML Schemas for NDR examples' - $(SCHEMAS)
