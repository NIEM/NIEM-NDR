
if test is-set != "${NDR_TOOLS_LOADED_FN_OPT_HELP_BASH:+is-set}"
then NDR_TOOLS_LOADED_FN_OPT_HELP_BASH=true

    if test is-set != "${NDR_TOOLS_ROOT_DIR:+is-set}"
    then printf "%s\n" 'Error: $NDR_TOOLS_ROOT_DIR not set' >&2
        exit 1
    fi

    . "$NDR_TOOLS_ROOT_DIR"/lib/common.bash

    opt_help () {
        sed -e "s/.*#""HELP://p;d" "$NDR_TOOLS_COMMAND_ABS" | sed -e "s/COMMAND_NAME/$NDR_TOOLS_COMMAND_NAME/g"
        exit 0
    }
fi

