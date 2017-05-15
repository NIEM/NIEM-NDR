
.PHONY: default
default:
	@printf 'Bravely doing nothing. Use target "help" for more info.\n'

.PHONY: help
help:
	@printf 'Targets:\n'
	@printf '  rules: build the rules schematron files\n'
	@printf '  html: build HTML rendering of the NDR doc\n'
	@printf '  text: build text rendering of the NDR doc\n'
	@printf '  clean: remove lots of automatically-built stuff\n'
	@printf '  distclean: remove all automatically-built stuff\n'


.PHONY: all
all:
	$(MAKE) -f dependent.mk all

.PHONY: archive
archive:
	$(MAKE) -f dependent.mk archive

.PHONY: depend
depend:
	$(MAKE) -f dependent.mk depend

.PHONY: diff
diff:
	$(MAKE) -f dependent.mk diff

.PHONY: docs
docs:
	$(MAKE) -f dependent.mk docs

.PHONY: html
html:
	$(MAKE) -f dependent.mk html

.PHONY: list
list:
	$(MAKE) -f dependent.mk list

.PHONY: map
map:
	$(MAKE) -f dependent.mk map

.PHONY: rules
rules:
	$(MAKE) -f dependent.mk rules

.PHONY: text
text:
	$(MAKE) -f dependent.mk text

.PHONY: valid
valid:
	$(MAKE) -f dependent.mk valid

.PHONY: ref
ref:
	$(MAKE) -f dependent.mk ref

.PHONY: ext
ext:
	$(MAKE) -f dependent.mk ext

.PHONY: ins
ins:
	$(MAKE) -f dependent.mk ins

.PHONY: set
set:
	$(MAKE) -f dependent.mk set

.PHONY: docs-local
docs-local:
	$(MAKE) -f dependent.mk docs-local

.PHONY: v1
v1:
	$(MAKE) -f dependent.mk v1


.PHONY: clean
clean:
	'/opt/local/bin/grm' -rf tmp tests/common/tmp
	find . -type d -name '.DS_Store' -print0 | xargs -0 '/opt/local/bin/grm' -rf
	find . -name '*~' -print0 | xargs -0 '/opt/local/bin/grm' -f

.PHONY: distclean
distclean: clean
	'/opt/local/bin/grm' -f Makefile dependent.mk reconfigure config-decls.m4 postinstall

update:
	$(MAKE) all
	$(MAKE) -C tools put-current-ndr

