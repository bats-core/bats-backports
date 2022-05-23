#!/usr/bin/env bash

export BATS_BACKPORTS_PLUGIN_VERSION=1.7.0

BATS_BACKPORTS_ROOT=$(dirname "${BASH_SOURCE[0]}")

source "$BATS_BACKPORTS_ROOT/src/common.bash"

if bats_backports_version_lt $BATS_VERSION 1.7.0; then
    source "$BATS_BACKPORTS_ROOT/src/bats_require_minimum_version.bash"
fi