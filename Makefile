#############################################################################
# Don't touch these...
#############################################################################

this_makefile := ${lastword ${MAKEFILE_LIST}}
SHELL = /bin/bash 
# generated dependencies for things derived from the NDR doc
dependencies_mk := dependencies.mk
.SECONDARY:

#############################################################################
# things to set / override
#############################################################################

#HELP:variable 'depend': (default value is 'include')
#HELP:  'build': build new dependencies file
#HELP:  anything else: if dependencies file exists, include it
depend = build

#HELP:Default is to clean, rebuild, and install
.DEFAULT_GOAL = default

repo_dir = repo

# command paths # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# # command variable defined by Make
# RM = rm -f

# # command variable defined by automake
MKDIR_P = mkdir -p

# # doc-processing
check_doc = check-doc
check_doc_flags = --catalog=xsd/ndr-examples/xml-catalog.xml
process_doc = process-doc
process_doc_flags = --catalog=xsd/ndr-examples/xml-catalog.xml
doc_to_schematron = doc-to-schematron

# # others
aspell = aspell
base64 = base64
check_xml = check-xml
chmod = chmod
cp = cp
find = find
grep = grep
head = head
identify = identify
m4 = m4
m4_flags = --prefix-builtins ${m4_macros} lib/m4-setup.m4
schematron = schematron
schematron_compile = schematron-compile
schematron_execute = schematron-execute
sed = sed
touch = touch
zip = zip

# source paths # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ndr_macros_m4 = src/ndr-macros.m4

#############################################################################
# products

conformance_targets = ref ext ins set

rules_products = \
  ${conformance_targets:%=ndr-rules-conformance-target-%.sch} \
  ${conformance_targets:%=ndr-rules-conformance-target-%.sch.xsl} \
  ndr-id-map.xml \

# local names of products
products = \
  niem-ndr-doc.html \
  niem-ndr-doc.txt \
  ${rules_products} \
  ndr-functions.xsl \
  ctas-conformant-document.sch \
  ctas-conformant-document.sch.xsl \
  appinfo.xsd \
  structures.xsd \

#############################################################################
# other variables

# things that are derived & intermediate
tmp_dir = tmp
tokens_dir = ${tmp_dir}/tokens
valid_dir = ${tokens_dir}/valid
# The NDR document rendered in HTML
ndr_doc_html := ${tmp_dir}/ndr-doc.html
# The NDR document rendered in text
ndr_doc_text := ${tmp_dir}/ndr-doc.txt

# the NDR document with macros expanded
ndr_doc_xml = ${tmp_dir}/ndr-doc.xml

spell_results_txt = ${tmp_dir}/spell-results.txt

# a copy of the niem release, for validation and comparison purposes
niem_release_checkout_dir = ${tmp_dir}/niem-release
niem_release_checked_out_token = ${tokens_dir}/niem-release-checked-out

#############################################################################
#HELP:Targets:
#############################################################################

# convenience targets # # # # # # # # # # # # # # # # # # # # # # # # # # # #

.PHONY: default
default:
	${MAKE} depend=no distclean
	${MAKE} depend=build depend
	${MAKE} depend=no --jobs all
	${MAKE} depend=no valid
	${MAKE} depend=no clean-repo
	${MAKE} depend=no repo

.PHONY: html #  Build HTML version
html: ${ndr_doc_html}

.PHONY: text #  Build text version
text: ${ndr_doc_text}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# depend

ifeq (${depend},build)
.PHONY: depend
depend: ${dependencies_mk}

-include ${dependencies_mk}

${dependencies_mk}: ${ndr_doc_xml} ${niem_release_checked_out_token}
	${process_doc} ${process_doc_flags} --format=makedepend --in=$< --out=$@
else
ifeq (${wildcard ${dependencies_mk}},${dependencies_mk})
include ${dependencies_mk}
endif
endif

.PHONY: clean #  Remove generated artifacts
clean: clean-repo
	${RM} -r ${tmp_dir}
	${RM} ${wildcard tmp.*} ${wildcard *~}

.PHONY: distclean #  Remove all artifacts
distclean: clean
	${RM} -r ${dependencies_mk}

.PHONY: all #  Generate everything
all: repo

.PHONY: rules #  Generate rules
rules: ${rules_products:%=${tmp_dir}/%}

.PHONY: spell # check spelling
spell: ${valid_dir}/spelling-ok

${spell_results_txt}: ${ndr_doc_text} aspell-exceptions.txt
	@ ${MKDIR_P} ${dir $@}
	${aspell} --home-dir=. -p aspell-exceptions.txt list < $< | sort -uf > $@

#############################################################################
# products

${ndr_doc_html}: ${ndr_doc_xml} ${doc_html_required_files} ${niem_release_checked_out_token}
	@ ${MKDIR_P} ${dir $@}
	${process_doc} ${process_doc_flags} --in=$< --out=$@

${ndr_doc_text}: ${ndr_doc_xml} ${doc_text_required_files} ${niem_release_checked_out_token}
	@ ${MKDIR_P} ${dir $@}
	${process_doc} ${process_doc_flags} --format=text --in=$< --out=$@

${ndr_doc_xml}: ${ndr_macros_m4} src/ndr-doc.xml.m4 
	@ ${RM} $@
	@ ${MKDIR_P} ${dir $@}
	${m4} ${m4_flags} ${ndr_macros_m4} src/ndr-doc.xml.m4 | ${sed} -e 's/  *$$//' > $@
	@ ${chmod} -w $@
	@ if ${grep} -n 'MACRO' $@; then printf 'ERROR: unresolved M4 macro.\n' >&2; exit 1; fi
	if egrep -nH ' +$$' $@; then printf 'ERROR: stray whitespace in document' >&2; exit 1; fi

${tmp_dir}/%: src/%
	@ ${MKDIR_P} ${dir $@}
	${cp} $< $@

${tmp_dir}/img/%.png.width.txt: ${tmp_dir}/img/%.png
	@ ${MKDIR_P} ${dir $@}
	${identify} -format '%w' $< > $@

${tmp_dir}/%: src/%.m4 src/ndr-macros.m4 
	@ ${MKDIR_P} ${dir $@}
	${m4} ${m4_flags} src/ndr-macros.m4 $< > $@

# rules schematron # # # # # # # # # # # # # # # # # # # # # # # # # # # #

${tmp_dir}/ndr-rules-conformance-target-ref.sch: ${ndr_doc_xml}
	@ ${MKDIR_P} ${dir $@}
	${doc_to_schematron} --blurb-set=ref --out=$@ $<

${tmp_dir}/ndr-rules-conformance-target-ext.sch: ${ndr_doc_xml}
	@ ${MKDIR_P} ${dir $@}
	${doc_to_schematron} --blurb-set=ext --out=$@ $<

${tmp_dir}/ndr-rules-conformance-target-set.sch: ${ndr_doc_xml}
	@ ${MKDIR_P} ${dir $@}
	${doc_to_schematron} --blurb-set=set --out=$@ $<

${tmp_dir}/ndr-rules-conformance-target-ins.sch: ${ndr_doc_xml}
	@ ${MKDIR_P} ${dir $@}
	${doc_to_schematron} --blurb-set=ins --out=$@ $<

${tmp_dir}/%.sch.xsl: ${tmp_dir}/%.sch
	${schematron_compile} --output-file=$@ $<

${tmp_dir}/ndr-id-map.xml: ${ndr_doc_xml}
	@ ${MKDIR_P} ${dir $@}
	${process_doc} ${process_doc_flags} --format=rules-id-map --in=$< --out=$@

# end products
#############################################################################
# valid

.PHONY: valid #  validate what can be validated
valid: \
  ${valid_dir}/spelling-ok \
  ${valid_dir}/macros-eliminated/tmp/ndr-doc.xml \
  ${valid_dir}/macros-eliminated/tmp/appinfo.xsd \
  ${valid_dir}/macros-eliminated/tmp/structures.xsd \
  ${valid_dir}/same/src/appinfo.xsd \
  ${valid_dir}/same/src/structures.xsd \
  ${valid_dir}/xml/${ndr_doc_xml} \
  ${valid_dir}/doc/${ndr_doc_xml} \
  ${valid_dir}/ndr-rules/${ndr_doc_xml} \
  ${valid_dir}/xml/tmp/ndr-rules-conformance-target-ref.sch \
  ${valid_dir}/xml/tmp/ndr-rules-conformance-target-ext.sch \
  ${valid_dir}/xml/tmp/ndr-rules-conformance-target-set.sch \
  ${valid_dir}/xml/tmp/ndr-rules-conformance-target-ins.sch \
  ${valid_dir}/xml/tmp/ndr-functions.xsl \

${valid_dir}/macros-eliminated/%: %
	! grep 'MACRO_' $< > /dev/null
	@ ${MKDIR_P} ${dir $@} && touch $@

${valid_dir}/xml/%: %
	${check_xml} $<
	@ ${MKDIR_P} ${dir $@} && touch $@

${valid_dir}/doc/%: %
	${check_doc} ${check_doc_flags} $<
	@ ${MKDIR_P} ${dir $@} && ${touch} $@

${valid_dir}/ndr-rules/%: % ${tmp_dir}/ndr-rules.sch.xsl
	${schematron_execute} --xslt-file=${tmp_dir}/ndr-rules.sch.xsl --format=text $<
	@ ${MKDIR_P} ${dir $@} && ${touch} $@

${tmp_dir}/ndr-rules.sch.xsl: src/ndr-rules.sch
	${schematron_compile} --output-file=$@ $<

${valid_dir}/same/src/appinfo.xsd: ${tmp_dir}/appinfo.xsd ${niem_release_checked_out_token}
	diff $< ${niem_release_checkout_dir}/niem/utility/appinfo/4.0/appinfo.xsd
	@ ${MKDIR_P} ${dir $@} && ${touch} $@

${valid_dir}/same/src/structures.xsd: ${tmp_dir}/structures.xsd ${niem_release_checked_out_token}
	diff $< ${niem_release_checkout_dir}/niem/utility/structures/4.0/structures.xsd
	@ ${MKDIR_P} ${dir $@} && ${touch} $@

${valid_dir}/spelling-ok: ${spell_results_txt} ${ndr_doc_text}
	@ while read -r -d$$'\n'; do \
	  echo "SPELLING: WORD NOT FOUND: $$REPLY"; \
	  grep --context=1 "$$REPLY" ${ndr_doc_text}; \
	done < ${spell_results_txt}
	! [[ -s ${spell_results_txt} ]]

# end valid
#############################################################################
# repo : put the NDR into a git repo for publication

.PHONY: repo #  install everything into the repository
repo: ${products:%=${repo_dir}/%}

.PHONY: clean-repo #  Remove everything from repo/ so install can be clean
clean-repo:
	@ if [[ ! -d ${repo_dir} ]]; then echo Git repository '${repo_dir}' does not exist; exit 1; fi
	${find} -L ${repo_dir} -mindepth 1 ! -path '${repo_dir}/.git' ! -path '${repo_dir}/.git/*' ! -path '${repo_dir}/README.md' -print0 | xargs -0 ${RM}

${repo_dir}/niem-ndr-doc.html: ${ndr_doc_html}
	${cp} $< $@

${repo_dir}/niem-ndr-doc.txt: ${ndr_doc_text}
	${cp} $< $@

${repo_dir}/ndr-rules-conformance-target-%.sch: ${tmp_dir}/ndr-rules-conformance-target-%.sch
	${cp} $< $@

${repo_dir}/%: ${tmp_dir}/%
	${cp} $< $@

# repo - end
#############################################################################
# check out niem release

.PHONY: conr #  check out niem release
conr ${niem_release_checked_out_token}:
	${RM} -r ${niem_release_checkout_dir}
	${RM} ${niem_release_checked_out_token}
	${MKDIR_P} ${niem_release_checkout_dir}
	git archive \
	  --remote=${HOME}/r/niem/release/niem-releases \
	  --prefix=${niem_release_checkout_dir}/ \
	  dev-niem-4.0rc3 | tar xvf -
	${MKDIR_P} ${dir ${niem_release_checked_out_token}}
	${touch} ${niem_release_checked_out_token}

#############################################################################
# make this the last target

.PHONY: help #  Print this help
help:
	@ ${sed} -e '/^\.PHONY:/s/^\.PHONY: *\([^ #]*\) *\#\( *\)\([^ ].*\)/\2\1: \3/p;/^[^#]*#HELP:/s/[^#]*#HELP:\(.*\)/\1/p;d' ${this_makefile}

# don't put anything after this
