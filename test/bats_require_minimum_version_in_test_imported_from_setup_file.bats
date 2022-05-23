setup_file() {
    load '../load.bash'
}

@test test {
    IFS=. read -a version <<< "$BATS_VERSION"
    if [[ ${version[0]} -lt 1 || (${version[0]} -eq 1 && ${version[1]} -lt 5) ]]; then
        skip "Version ${BATS_VERSION} does not offer setup_file()"
    fi
    bats_require_minimum_version 0.0.0
}