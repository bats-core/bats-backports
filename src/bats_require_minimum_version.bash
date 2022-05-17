#!/usr/bin/env bash

source "$BATS_BACKPORTS_ROOT/src/common.bash"

# ensure a minimum version of bats is running or exit with failure
bats_require_minimum_version() { # <required version>
  local required_minimum_version=$1

  if bats_backports_version_lt "$BATS_VERSION" "$required_minimum_version"; then
    printf "BATS_VERSION=%s does not meet required minimum %s\n" "$BATS_VERSION" "$required_minimum_version"
    exit 1
  fi

  if bats_backports_version_lt "$BATS_GUARANTEED_MINIMUM_VERSION" "$required_minimum_version"; then
    BATS_GUARANTEED_MINIMUM_VERSION="$required_minimum_version"
  fi
}