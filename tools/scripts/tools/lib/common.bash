
if test is-set != "${LOADED_COMMON_BASH:+is-set}"
then LOADED_COMMON_BASH=true

    COMMAND_NAME=$(basename "$0")
    COMMAND_ABS=$(cd "$(dirname "$0")"; pwd)/$COMMAND_NAME

    opt_help () {
        printf '%s' "$COMMAND_NAME"
        sed -e "s/.*#""HELP://p;d" "$COMMAND_ABS"
    }
fi

