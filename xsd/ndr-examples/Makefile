
SHELL = /bin/bash

default:
	@echo "Pick a target:"
	@echo "  html: generate browsable HTML version of schemas"
	@echo "  reload: Expand the latest subset saved in ~/Dowloads"
	@echo "  all: reload, html"

clean:
	$(RM) schemas.html

reload:
	rm -rf subset
	mkdir subset
	find ~/Downloads -name 'Subset *.zip' -printf '%T+ %p\n' | sort | tail -n 1 | sed -e 's/^[^ ]* //' | xargs -d $$'\n' unzip -d subset

all:
	$(MAKE) reload
	$(MAKE) html

.PHONY: html
html: schemas.html

SCHEMAS = $(shell find subset -type f -name '*.xsd')
schemas.html: $(SCHEMAS)
	~/working/tools/bin/markup-schemas --verbose -out schemas.html -title 'XML Schemas for NDR examples' - $(SCHEMAS)
