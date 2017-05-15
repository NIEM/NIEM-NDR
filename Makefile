this_makefile = ${lastword ${MAKEFILE_LIST}} # for help 

#############################################################################
# things to set / override
#############################################################################

# set 'true' to enable rebuilding of dependencies
depend = false 
ndr_version = 4.0beta2pre1
ndr_date = 2017-05-10

# command paths # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

m4 = m4
m4_flags = --prefix-builtins ${m4_macros} lib/m4-setup.m4
mkdir_p = mkdir -p
sed = sed

# source paths # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ndr_macros_m4 = src/ndr-macros.m4

#############################################################################
# other variables

# things that are derived & products
dest_dir = dest
# things that are derived & intermediate
tmp_dir = tmp
tokens_dir = ${tmp_dir}/tokens

# the NDR document with macros expanded
ndr_doc_xml := ${tmp_dir}/ndr-doc.xml 

m4_macros = \
  --define=MACRO_NDR_VERSION=${ndr_version} \
  --define=MACRO_NDR_DATE=${ndr_date} \

#############################################################################
# targets
#############################################################################

# convenience targets # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#HELP:There is no default target
.PHONY: default
default:
	@printf 'Bravely doing nothing. Use target "help" for more info.\n'

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# depend

ifneq (${depend},false)
.PHONY: depend
depend: ${dependencies_mk}

-include ${dependencies_mk}

${dependencies_mk}: $(NDR_DOC_XML) $(NDR_DOC_XML_VALID_T)
	process-doc $(PROCESS_DOC_COMMAND_FLAGS) -makedepend -in $< -out $@
else
include ${dependencies_mk}
endif

.PHONY: clean #  Remove generated artifacts
clean:
	${RM} -r tmp dest

#############################################################################
# products

# order of sources matters here, since it's fed directly to M4
lkj: prelkj ${ndr_doc_xml}

.PHONY: prelkj
prelkj:
	@echo building "${ndr_doc_xml}"

${ndr_doc_xml}: ${ndr_macros_m4} src/ndr-doc.xml.m4 
	${RM} $@
	@ ${mkdir_p} ${dir $@}
	${m4} ${m4_flags} ${ndr_macros_m4} src/ndr-doc.xml.m4 > $@
	@ chmod -w $@
	@ if grep -n 'MACRO' $@; then printf 'ERROR: unresolved M4 macro.\n' >&2; exit 1; else exit 0; fi

# make this the last target

.PHONY: help #  Print this help
help:
	@ ${sed} -e '/^\.PHONY:/s/^\.PHONY: *\([^ #]*\) *\#\( *\)\([^ ].*\)/\2\1: \3/p;/^[^#]*#HELP:/s/[^#]*#HELP:\(.*\)/\1/p;d' ${this_makefile}

# don't put anything after this
