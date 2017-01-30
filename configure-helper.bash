
set -o nounset -o errexit

CONFIG_DECLS_M4=config-decls.m4

unset CONFIG_BIN_DIR
unset CONFIG_PACKAGES_DIR
unset CONFIG_PACKAGE_DIR
unset CONFIG_PACKAGE_NAME
unset CONFIG_PREFIX
unset CONFIG_SHARE_DIR

# set macros that require multiple macros to be set. Figure out what
# can be set and set those.
config_set_shared () {
    if test is-set != "${CONFIG_SHARE_DIR:+is-set}" \
        -a is-set = "${CONFIG_PACKAGE_NAME:+is-set}" \
        -a is-set = "${CONFIG_PREFIX:+is-set}"; then
        CONFIG_SHARE_DIR="$CONFIG_PREFIX/share/$CONFIG_PACKAGE_NAME"
        config_decl_set CONFIG_SHARE_DIR "$CONFIG_SHARE_DIR"
    fi
    if test is-set != "${CONFIG_PACKAGE_DIR:+is-set}" \
        -a is-set = "${CONFIG_PACKAGES_DIR:+is-set}" \
        -a is-set = "${CONFIG_PACKAGE_NAME:+is-set}"; then
        CONFIG_PACKAGE_DIR="$CONFIG_PACKAGES_DIR/$CONFIG_PACKAGE_NAME"
        config_decl_set CONFIG_PACKAGE_DIR "$CONFIG_PACKAGE_DIR"
    fi
}    

config_decl_set_package_name () {
    config_ensure "${FUNCNAME[0]} requires one parameter \$package-name (got $# args)" test $# = 1
    config_ensure "${FUNCNAME[0]} can only be called once" test is-set != "${CONFIG_PACKAGE_NAME:+is-set}"
    CONFIG_PACKAGE_NAME=$1
    config_decl_set CONFIG_PACKAGE_NAME "$CONFIG_PACKAGE_NAME"
    config_set_shared
}

config_decl_set_prefix () {
    config_ensure "${FUNCNAME[0]} requires one parameter \$prefix (got $# args)" test $# = 1
    config_ensure "${FUNCNAME[0]} can only be called once" test is-set != "${CONFIG_PREFIX:+is-set}"
    CONFIG_PREFIX="$1"
    config_decl_set CONFIG_PREFIX "$CONFIG_PREFIX"
    CONFIG_PACKAGES_DIR="$CONFIG_PREFIX/packages"
    config_decl_set CONFIG_PACKAGES_DIR "$CONFIG_PACKAGES_DIR"
    CONFIG_BIN_DIR="$CONFIG_PREFIX/bin"
    config_decl_set CONFIG_BIN_DIR "$CONFIG_BIN_DIR"
    config_set_shared
}

config_ensure () (
    # point file descriptors 3 and 4 to stdout and stderr
    exec 3>&1 4>&2
    while test $# -gt 0
    do
        case "$1" in
            -1 ) # send stdout of command to /dev/null
                exec 3>/dev/null
                shift 1
                ;;
            -2 ) # send stderr of command to /dev/null
                exec 4>/dev/null
                shift 1
                ;;
            * ) break ;;
        esac
    done
    message="$1"
    shift 1
    if "$@" 1>&3 2>&4
    then
        return 0
    else
        echo "$0: Error: $message" >&2
        return 1
    fi
)

# make help lines look like:
#HELP:  -parameter argument: what it does for you
#
config_print_help () {
    sed -e 's/^.*#''HELP://p;d' "$0"
}

config_decl_set () {
    macro="$1"
    value="$2"
    echo "$0: $1 -> \"$2\"" >&2
cat <<EOF >> "$CONFIG_DECLS_M4"
m4_define([[[$1]]],[[[$2]]])m4_dnl
EOF
}

config_decl_set_command () {
    config_ensure "config_decl_set_command needs 2 args" test $# -ge 2
    local MACRO="$1"
    shift 1
    local OPTIONS=( $* )
    local COMMAND_PATH
    unset COMMAND_PATH
    while test $# -gt 0
    do if COMMAND_PATH=$(type -p "$1")
        then break
        else unset COMMAND_PATH
            shift
        fi
    done

    if test is-set = "${COMMAND_PATH:+is-set}"
    then config_decl_set "$MACRO" "$COMMAND_PATH"
    else config_ensure "executable for macro \"$MACRO\" not found (options were: ${OPTIONS[*]})" false
    fi
}

config_decl_set_command_bash () {
    config_decl_set_command CONFIG_BASH_COMMAND bash
}

config_decl_set_dir () {
    local MACRO="$1"
    local DIRECTORY="$2"
    config_ensure "directory does not exist ($DIRECTORY)" test -d "$DIRECTORY"
    config_decl_set "$MACRO" "$DIRECTORY"
}

config_decl_set_file () {
    local MACRO="$1"
    local FILE="$2"
    config_ensure "file does not exist ($FILE)" test -f "$FILE"
    config_decl_set "$MACRO" "$FILE"
}

config_end () {
    chmod uog-w "$CONFIG_DECLS_M4"
}

rm -f "$CONFIG_DECLS_M4"
cat <<EOF > "$CONFIG_DECLS_M4"
m4_changequote([[[,]]])m4_dnl
m4_changecom(,)m4_dnl
EOF

config_decl_set CONFIG_DECLS_M4 "$CONFIG_DECLS_M4"

trap config_end 0
