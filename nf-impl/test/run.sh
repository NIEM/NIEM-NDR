#!/bin/bash

THIS_DIR="$(dirname "$0")"

opt_help () {
    printf 'Usage: %s [options] file1.xsd file2.xsd ...\n' "$(basename "$0")"
    printf '  Options:\n'
    printf '    --catalog $catalog | -c $catalog: use XML catalog to resolve namespaces\n'
    printf '    --make | -m: rebuild rules and XSLTs\n'
    printf '    --verbose | -v: print lots of stuff\n'
    exit 0
}

unset CATALOG
opt_catalog () {
    CATALOG=$(realpath "$1")
}

opt_make () {
    make -C "$THIS_DIR"
}

unset VERBOSE
opt_verbose () {
    VERBOSE=-verbose
}

fail () {
    printf '%s\n' "$*" >&2
    exit 1
}

OPTIND=1
while getopts :c:hmv-: option
do
    case "$option" in
        c ) opt_catalog "$OPTARG";;
        h ) opt_help;;
        m ) opt_make;;
        v ) opt_verbose;;
        - )
            case "$OPTARG" in
                catalog=* ) opt_catalog "${OPTARG#*=}";;
                help ) opt_help;;
                make ) opt_make;;
                verbose ) opt_verbose;;
                * ) fail "unknown long option \"$OPTARG\"";;
            esac;;
        '?' ) fail "unknown arg \"$OPTARG\"";;
        : ) fail "option \"$OPTARG\" missing argument";;
        * ) fail "bad state OPTARG=\"$OPTARG\"";;
    esac
done
shift $((OPTIND-1))

if test is-set != "${CATALOG:+is-set}"
then fail 'Must use --catalog=$catalog'
fi

test_one () {
    if test is-set = "${VERBOSE:+is-set}"
    then printf '# running SET rules on %s\n' "$file"
    fi
    ~/working/tools/bin/schematron ${VERBOSE:-} -ee -schema "$THIS_DIR/ndr-rules-conformance-target-set.sch" "$1" - xml-catalog="$CATALOG" 
    if test is-set = "${VERBOSE:+is-set}"
    then printf '# running REF rules on %s\n' "$file"
    fi
    ~/working/tools/bin/schematron ${VERBOSE:-} -ee -schema "$THIS_DIR/ndr-rules-conformance-target-ref.sch" "$1" - xml-catalog="$CATALOG"
}

for file in "$@"
do 
    test_one "$file"
done
