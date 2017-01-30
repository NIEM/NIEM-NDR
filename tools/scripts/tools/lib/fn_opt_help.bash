
if test is-set != "${LOADED_FN_OPT_HELP_BASH:+is-set}"
then LOADED_FN_OPT_HELP_BASH=true

    if test is-set != "${NDR_ROOT_DIR:+is-set}"
    then printf "%s\n" 'Error: $NDR_ROOT_DIR not set' >&2
        exit 1
    fi

    . "$NDR_ROOT_DIR"/tools/lib/common.bash

    opt_help () {
        sed -e "s/.*#""HELP://p;d" "$COMMAND_ABS" | sed -e "s/COMMAND_NAME/$COMMAND_NAME/g"
        exit 0
    }
fi

