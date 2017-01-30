
if [[ is-set != "${LOADED_FN_TEST_BASH:+is-set}" ]]
then LOADED_FN_TEST_BASH=true

    if test is-set != "${NDR_ROOT_DIR:+is-set}"
    then printf "%s\n" 'Error: $NDR_ROOT_DIR not set' >&2
        exit 1
    fi

    test_begin () {
        TEST_EXPECTED_STDOUT=$(mktemp)
        TEST_ACTUAL_STDOUT=$(mktemp)
    }

    test_end () {
        rm -f "$TEST_EXPECTED_STDOUT" "$TEST_ACTUAL_STDOUT"
    }

    test_run () {
        "$@" > "$TEST_ACTUAL_STDOUT" || true
        diff "$TEST_EXPECTED_STDOUT" "$TEST_ACTUAL_STDOUT" || true
    }

    test_begin
    
    trap test_end 0

fi

