
#############################################################################
# things to set / override
#############################################################################

#HELP:set variable 'depend' to 'true' to enable rebuilding of dependencies
depend = false
ndr_version = 4.0beta2pre1
ndr_date = 2017-05-10

# command paths # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# # command variable defined by Make
# RM = rm -f

# # command variable defined by automake
MKDIR_P = mkdir -p

# # others
base64 = base64
check_doc = check-doc
check_doc_flags = --catalog=xsd/ndr-examples/xml-catalog.xml
chmod = chmod
cp = cp
grep = grep
head = head
identify = identify
m4 = m4
m4_flags = --prefix-builtins ${m4_macros} lib/m4-setup.m4
process_doc = process-doc
process_doc_flags = --catalog=xsd/ndr-examples/xml-catalog.xml
schematron = schematron
sed = sed
touch = touch

# source paths # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ndr_macros_m4 = src/ndr-macros.m4

#############################################################################
# other variables

# things that are derived & products
dest_dir = dest
# The NDR document rendered in HTML
ndr_doc_html := $(dest_dir)/ndr-doc.html

# things that are derived & intermediate
tmp_dir = tmp
tokens_dir = ${tmp_dir}/tokens
# generated dependencies for things derived from the NDR doc
dependencies_mk = ${tmp_dir}/dependencies.mk

# the NDR document with macros expanded
ndr_doc_xml = ${tmp_dir}/ndr-doc.xml 

m4_macros = \
  --define=MACRO_NDR_VERSION=${ndr_version} \
  --define=MACRO_NDR_DATE=${ndr_date} \

#############################################################################
#HELP:Targets:
#############################################################################

# convenience targets # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#HELP:  (There is no default target)
.PHONY: default
default:
	@printf 'Bravely doing nothing. Use target "help" for more info.\n'

.PHONY: html #  Build HTML version
html: ${ndr_doc_html}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# depend

ifneq (${depend},false)
.PHONY: depend
depend: ${dependencies_mk}

-include ${dependencies_mk}

${dependencies_mk}: ${ndr_doc_xml}
	${process_doc} ${process_doc_flags} --format=makedepend --in=$< --out=$@
else
include ${dependencies_mk}
endif

.PHONY: clean #  Remove generated artifacts
clean:
	${RM} -r tmp dest

#############################################################################
# products

${ndr_doc_html}: ${ndr_doc_xml} ${doc_html_required_files}
	@ ${MKDIR_P} ${dir $@}
	${process_doc} ${process_doc_flags} --in=$< --out=$@

${ndr_doc_xml}: ${ndr_macros_m4} src/ndr-doc.xml.m4 
	@ ${RM} $@
	@ ${MKDIR_P} ${dir $@}
	${m4} ${m4_flags} ${ndr_macros_m4} src/ndr-doc.xml.m4 > $@
	@ ${chmod} -w $@
	@ if ${grep} -n 'MACRO' $@; then printf 'ERROR: unresolved M4 macro.\n' >&2; exit 1; else exit 0; fi

${tmp_dir}/%: src/%
	@ ${MKDIR_P} ${dir $@}
	${cp} $< $@

${tmp_dir}/img/%.png.width.txt: ${tmp_dir}/img/%.png
	@ ${MKDIR_P} ${dir $@}
	${identify} -format '%w' $< > $@

${tokens_dir}/valid/doc/%: %
	${check_doc} ${check_doc_flags} $<
	${MKDIR_P} ${dir $@} && ${touch} $@

#############################################################################
# put temporary things here

check :
	${RM} tmp/tokens/valid/doc/tmp/ndr-doc.xml
	${MAKE} tmp/tokens/valid/doc/tmp/ndr-doc.xml

# make this the last target

.PHONY: help #  Print this help
help:
	@ ${sed} -e '/^\.PHONY:/s/^\.PHONY: *\([^ #]*\) *\#\( *\)\([^ ].*\)/\2\1: \3/p;/^[^#]*#HELP:/s/[^#]*#HELP:\(.*\)/\1/p;d' Makefile

# don't put anything after this
