#!/usr/bin/env bash

bats_backports_check_valid_version() { # <version> [<suffix>]
  if [[ ! $1 =~ [0-9]+.[0-9]+.[0-9]+ ]]; then
    printf "ERROR: version%s '%s'  must be of format <major>.<minor>.<patch>! %s\n" "${2:-}" "$1" >&2
    exit 1
  fi
}

bats_backports_version_lt() { # <version1> <version2>
  bats_backports_check_valid_version "$1" 1
  bats_backports_check_valid_version "$2" 2

  local -a version1_parts version2_parts
  IFS=. read -ra version1_parts <<< "$1"
  IFS=. read -ra version2_parts <<< "$2"

  for i in {0..2}; do
    if (( version1_parts[i] < version2_parts[i] )); then
      return 0
    elif (( version1_parts[i] > version2_parts[i] )); then
      return 1
    fi
  done
  # if we made it this far, they are equal -> also not less then
  return 2 # use other failing return code to distinguish equal from gt
}