
if test is-set != "${LOADED_FN_OPT_VERBOSE_BASH:+is-set}"
then LOADED_FN_OPT_VERBOSE_BASH=true

    if test is-set != "${NDR_ROOT_DIR:+is-set}"
    then printf "%s\n" 'Error: $NDR_ROOT_DIR not set' >&2
        exit 1
    fi

    . "$NDR_ROOT_DIR"/tools/lib/common.bash

    VERBOSE=false
    opt_verbose () {
        VERBOSE=true
        vecho maximum verbosity
    }

    vecho () {
        if test "$VERBOSE" = true
        then printf "#%s: %s\n" "$COMMAND_NAME" "$*" >&2
        fi
    }

    vrun () {
        if test "$VERBOSE" = true
        then printf "#%s: running " "$COMMAND_NAME" >&2
            printf " %q" "$@" >&2
            printf "\n" >&2
        fi
        "$@"
    }

fi

