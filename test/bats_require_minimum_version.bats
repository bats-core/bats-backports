setup() {
    FIXTURE_ROOT=$(dirname "$BATS_TEST_FILENAME")/fixtures/bats_require_minimum_version
    ALWAYS_SUCCEED=0.0.0
    ALWAYS_FAIL=99999.0.0

    load ../test_helper/bats-support/load.bash
    load ../test_helper/bats-assert/load.bash
}

@test "In free code" {
    REQUIRED_VERSION=$ALWAYS_SUCCEED run bats "$FIXTURE_ROOT/in_free_code.bats"
    assert_success
    assert_line --index 0 '1..1'
    assert_line --index 1 'ok 1 test'
    [ "${#lines[@]}" -eq 2 ]

    REQUIRED_VERSION=$ALWAYS_FAIL run bats "$FIXTURE_ROOT/in_free_code.bats"
    assert_failure
    assert_output --partial "BATS_VERSION=$BATS_VERSION does not meet required minimum $ALWAYS_FAIL"
}

@test "In setup" {
    REQUIRED_VERSION=$ALWAYS_SUCCEED run bats "$FIXTURE_ROOT/in_setup.bats"
    assert_success
    assert_line --index 0 '1..1'
    assert_line --index 1 'ok 1 test'
    [ "${#lines[@]}" -eq 2 ]

    REQUIRED_VERSION=$ALWAYS_FAIL run bats "$FIXTURE_ROOT/in_setup.bats"
    assert_failure
    assert_output --partial "BATS_VERSION=$BATS_VERSION does not meet required minimum $ALWAYS_FAIL"
}

@test "In test" {
    REQUIRED_VERSION=$ALWAYS_SUCCEED run bats "$FIXTURE_ROOT/in_test.bats"
    assert_success
    assert_line --index 0 '1..1'
    assert_line --index 1 'ok 1 test'
    [ "${#lines[@]}" -eq 2 ]

    REQUIRED_VERSION=$ALWAYS_FAIL run bats "$FIXTURE_ROOT/in_test.bats"
    assert_failure
    assert_output --partial "BATS_VERSION=$BATS_VERSION does not meet required minimum $ALWAYS_FAIL"
}