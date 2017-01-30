
if test is-set != "${NDR_TOOLS_LOADED_FN_FAIL_BASH:+is-set}"
then NDR_TOOLS_LOADED_FN_FAIL_BASH=true

    if test is-set != "${NDR_TOOLS_ROOT_DIR:+is-set}"
    then printf "%s\n" 'Error: $NDR_TOOLS_ROOT_DIR not set' >&2
        exit 1
    fi

    . "$NDR_TOOLS_ROOT_DIR"/lib/common.bash

    fail () {
        printf '%s: Error: %s\n' "$NDR_TOOLS_COMMAND_NAME" "$*" >&2
        printf "  at %s () in %s:%s\n" "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$LINENO" >&2
        local i
        for ((i = 0; i < ${#BASH_SOURCE[@]} - 1; ++i))
        do printf "  at %s () in %s:%s\n" "${FUNCNAME[i+1]}" "${BASH_SOURCE[i+1]}" "${BASH_LINENO[i]}" >&2
        done
        exit 1
    }
fi
