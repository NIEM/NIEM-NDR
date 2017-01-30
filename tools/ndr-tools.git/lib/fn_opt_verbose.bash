
if test is-set != "${NDR_TOOLS_LOADED_FN_OPT_VERBOSE_BASH:+is-set}"
then NDR_TOOLS_LOADED_FN_OPT_VERBOSE_BASH=true

    # use caution when combining this library with pipelines.
    # Pipelines are asynchronous, and verbosity / debugging output can
    # overlap in strange, sometimes painfully unfortunate ways.

    if test is-set != "${NDR_TOOLS_ROOT_DIR:+is-set}"
    then printf "%s\n" 'Error: $NDR_TOOLS_ROOT_DIR not set' >&2
        exit 1
    fi

    . "$NDR_TOOLS_ROOT_DIR"/lib/common.bash

    opt_verbose () {
        export NDR_TOOLS_VERBOSE=true
        vecho maximum verbosity
    }

    is_verbose () {
        test is-set = "${NDR_TOOLS_VERBOSE:+is-set}"
    }

    vecho () {
        if is_verbose
        then printf "#%s: %s\n" "$NDR_TOOLS_COMMAND_NAME" "$*" >&2
        fi
    }

    vrun () {
        if is_verbose
        then printf "#%s: running " "$NDR_TOOLS_COMMAND_NAME" >&2
            printf " %q" "$@" >&2
            printf "\n" >&2
        fi
        "$@"
    }
    
    vecho_location () {
        if [[ "${FUNCNAME[1]}" = "main" ]]
        then vecho "$(printf "location: %s:%s\n" "${BASH_SOURCE[1]}" "${BASH_LINENO[0]}")"
        else vecho "$(printf "location: %s () in %s:%s\n" "${FUNCNAME[1]}" "${BASH_SOURCE[1]}" "${BASH_LINENO[0]}")"
        fi
    }

fi

