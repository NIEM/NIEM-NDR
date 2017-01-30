
if [[ is-set != "${LOADED_FN_ENSURE_BASH:+is-set}" ]]
then LOADED_FN_ENSURE_BASH=true

    if test is-set != "${NDR_ROOT_DIR:+is-set}"
    then printf "%s\n" 'Error: $NDR_ROOT_DIR not set' >&2
        exit 1
    fi

    . "$NDR_ROOT_DIR"/tools/lib/fn_fail.bash

    ensure () {
        if ! "${@:2}"
        then fail "$1"
        fi
    }

    # ensure_file_exists "$file"
    ensure_file_exists () {
        ensure "File not found: \"$1\"" test -f "$1"
    }
fi

