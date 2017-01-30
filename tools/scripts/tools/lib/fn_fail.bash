
if test is-set != "${LOADED_FN_FAIL_BASH:+is-set}"
then LOADED_FN_FAIL_BASH=true

    if test is-set != "${NDR_ROOT_DIR:+is-set}"
    then printf "%s\n" 'Error: $NDR_ROOT_DIR not set' >&2
        exit 1
    fi

    . "$NDR_ROOT_DIR"/tools/lib/common.bash

    fail () {
        printf '%s: Error: %s\n' "$COMMAND_NAME" "$*" >&2
        printf "  at %s () in %s:%s\n" "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$LINENO" >&2
        local i
        for ((i = 0; i < ${#BASH_SOURCE[@]} - 1; ++i))
        do printf "  at %s () in %s:%s\n" "${FUNCNAME[i+1]}" "${BASH_SOURCE[i+1]}" "${BASH_LINENO[i]}" >&2
        done
        exit 1
    }
fi

