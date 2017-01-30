
if test is-set != "${NDR_TOOLS_LOADED_EXIT_HOOK:+is-set}"
then NDR_TOOLS_LOADED_EXIT_HOOK=true

    NDR_TOOLS_EXIT_HOOK=()
    add_exit_hook () {
        NDR_TOOLS_EXIT_HOOK+=( "$@" )
    }
     
    run_exit_hook () {
        # ${!Array[@]} won't crash out if "nounset" is on, whereas a
        # direct dereference will, if the array has no items
        for KEY in "${!NDR_TOOLS_EXIT_HOOK[@]}"
        do "${NDR_TOOLS_EXIT_HOOK[KEY]}"
        done
    }

    trap run_exit_hook 0

fi

