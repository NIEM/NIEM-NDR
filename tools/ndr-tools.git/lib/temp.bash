
if [[ is-set != "${NDR_TOOLS_LOADED_TEMPFILE_BASH:+is-set}" ]]
then NDR_TOOLS_LOADED_TEMPFILE_BASH=true

    if test is-set != "${NDR_TOOLS_ROOT_DIR:+is-set}"
    then printf "%s\n" 'Error: $NDR_TOOLS_ROOT_DIR not set' >&2
        exit 1
    fi

    . "$NDR_TOOLS_ROOT_DIR"/lib/fn_opt_verbose.bash
    . "$NDR_TOOLS_ROOT_DIR"/lib/exit_hook.bash

    NDR_TOOLS_TEMP_DIR_V1=${TMPDIR:-/tmp}
    NDR_TOOLS_TEMP_DIR=${NDR_TOOLS_TEMP_DIR_V1%/}
    unset NDR_TOOLS_TEMP_DIR_V1

    #HELP:  --keep-temps | -k: Don't delete temporary files
    opt_keep_temps () {
        # we don't initialize this variable, because we want
        # temporary-file-keeping to persist into subprocesses
        export NDR_TOOLS_TEMP_KEEP=true
    }

    NDR_TOOLS_TEMP_FILES=()
    NDR_TOOLS_TEMP_FILE_VARS=()
    
    # call with temp_make_file VARIABLE1 VARIABLE2 ...
    # and it'll make a temp file and set the value of VARIABLE1 to it, etc.
    temp_make_file () {
        for VAR in "$@"
        do
            local PATHNAME="$(umask 077; mktemp "$NDR_TOOLS_TEMP_DIR"/"$VAR".XXXXXX)"
            eval "$VAR"="$PATHNAME"
            # Append here; don't reset it, since this may be called multiple times.
            NDR_TOOLS_TEMP_FILE_VARS+=("$VAR")
            NDR_TOOLS_TEMP_FILES+=("$PATHNAME")
            vecho "make_temp_file(): $VAR=\"$PATHNAME\""
        done
    }

    NDR_TOOLS_TEMP_DIRS=()
    NDR_TOOLS_TEMP_DIR_VARS=()
    
    # call with temp_make_dir VARIABLE1 VARIABLE2 ...
    # and it'll make a temp dir and set the value of VARIABLE1 to it, etc.
    temp_make_dir () {
        for VAR in "$@"
        do
            local PATHNAME="$(umask 077; mktemp -d mktemp "$NDR_TOOLS_TEMP_DIR"/"$VAR".XXXXXX)"
            eval "$VAR"="$PATHNAME"
            # Append here; don't reset it, since this may be called multiple times.
            NDR_TOOLS_TEMP_DIR_VARS+=("$VAR")
            NDR_TOOLS_TEMP_DIRS+=("$PATHNAME")
            vecho "make_temp_dir(): $VAR=\"$PATHNAME\""
        done
    }

    temp_remove () {
        if [[ ! ${NDR_TOOLS_TEMP_KEEP:+is-set} ]]
        then
            # ICYMI, bash is evil: You get an unbound variable error
            # if you dereferece ${ARRAY[@]} after you set ARRAY=().
            if [[ ${#NDR_TOOLS_TEMP_FILES[@]} != 0 ]]
            then vrun rm -f "${NDR_TOOLS_TEMP_FILES[@]}"
                unset "${NDR_TOOLS_TEMP_FILE_VARS[@]}"
                NDR_TOOLS_TEMP_FILES=()
                NDR_TOOLS_TEMP_FILE_VARS=()
            fi
            if [[ ${#NDR_TOOLS_TEMP_DIRS[@]} != 0 ]]
            then vrun rm -rf "${NDR_TOOLS_TEMP_DIRS[@]}"
                unset "${NDR_TOOLS_TEMP_DIR_VARS[@]}"
                NDR_TOOLS_TEMP_DIRS=()
                NDR_TOOLS_TEMP_DIR_VARS=()
            fi
        else vecho "$(printf "Keeping temp files:"
                      for KEY in "${!NDR_TOOLS_TEMP_FILES[@]}"
                      do printf " %q=%q" "${NDR_TOOLS_TEMP_FILE_VARS[KEY]}" "${NDR_TOOLS_TEMP_FILES[KEY]}"
                      done
                      for KEY in "${!NDR_TOOLS_TEMP_DIRS[@]}"
                      do printf " %q=%q" "${NDR_TOOLS_TEMP_DIR_VARS[KEY]}" "${NDR_TOOLS_TEMP_DIRS[KEY]}"
                      done)"
        fi
    }

    add_exit_hook temp_remove

fi
