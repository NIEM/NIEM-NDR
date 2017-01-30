
# From a function, invoke with
#     . "$(dirname "${BASH_SOURCE[0]}")"/../lib/common.bash
# or whatever the path is to the script. From a script:
#     . "$(dirname "$0")"/../lib/common.bash

if test is-set != "${NDR_TOOLS_LOADED_COMMON_BASH:+is-set}"
then NDR_TOOLS_LOADED_COMMON_BASH=true

    set -o nounset -o errexit

    if test is-set = "${NDR_TOOLS_ROOT_DIR:+is-set}"
    then printf "Warning: you don't need to set \$NDR_TOOLS_ROOT_DIR in %s\n" "${BASH_SOURCE[*]:1}" >&2
    fi
    NDR_TOOLS_ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")"/..; pwd)

    NDR_TOOLS_COMMAND_REL=$0
    NDR_TOOLS_COMMAND_NAME=$(basename "$NDR_TOOLS_COMMAND_REL")
    NDR_TOOLS_COMMAND_DIR=$(cd "$(dirname "$NDR_TOOLS_COMMAND_REL")"; pwd)
    NDR_TOOLS_COMMAND_ABS=$NDR_TOOLS_COMMAND_DIR/$NDR_TOOLS_COMMAND_NAME

    ndr_tools_common_handle_SIGINT () {
        printf "received SIGINT\n" >&2
        exit $((128 + 2))
    }
    
    trap ndr_tools_common_handle_SIGINT SIGINT

fi
