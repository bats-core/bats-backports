# bats-backports

Provides new functions to older Bats versions.

## Versioning

The versioning of this project mirrors `bats-core`'s major and minor version of the latest backported function.
The patch version is independent and tracks fixes on the `bats-backports` side.

For example, `bats_require_minimum_version` was introduced in `bats-core:1.7.0`. Therefore, the backport of it is in `bats-backports:1.7.0`.
A fix to the `bats-backports` implementation of that function would be released as `bats-backports:1.7.1`. However, a later change to this function in `bats-core:1.7.x` would be backported in `bats-backports:1.7.2`,
not necessarily tracking the `x` in the `bats-core` version.

## Backported Functions

 Function | Release | Compatible to `bats-core` Versions  | Differences to `bats-core` implementation
---------|---------|-------------------------|--------------------------------
[`bats_require_minimum_version`](https://bats-core.readthedocs.io/en/latest/writing-tests.html#bats-require-minimum-version-bats-version-number) | 1.7.0   |  all                    |  none
