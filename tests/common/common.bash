
set -o nounset -o errexit -o pipefail

unset CDPATH

TOOLS=$(realpath "$HOME/working/tools")

export PATH="$TOOLS/bin:/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin"

. "$TOOLS/lib/test-helper.bash"

test_set_verbose

test_set_return_error_on_test_fail

COMMON=$(realpath ~/working/ndr3/tests/common)

validate_ref_sch () {
    relative_filename="$1"
    absolute_filename=$(realpath "$1")
    schematron -ee -schema "$COMMON/ref.sch" "$relative_filename" \
        | run-status -s 0 grep -v -f "$COMMON/format-schematron.grep.txt" \
        | sed -e "s!^file:$absolute_filename!$relative_filename!"
}

validate_xsd () {
    echo # xsdvalid -catalog "$COMMON/xsd-catalog.xml" "$@"
    xsdvalid -catalog "$COMMON/xsd-catalog.xml" "$@"
}
