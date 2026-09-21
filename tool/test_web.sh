#!/usr/bin/env bash
# Runs the tests in Chrome, to prove that the package works on the web.
#
# Two kinds of test files are left out, because they can not run in a browser:
# - `*_golden_test.dart`: alchemist does not compile for the web, and the
#   goldens are only generated on a macOS host anyway.
# - files annotated with `@TestOn('vm')`: they use `dart:io` (e.g. to read
#   files from the repository).
# `test/src/test_platform_test.dart` fails when a test file that needs the VM
# is not excluded by one of these two rules.
#
# Extra arguments are passed to `flutter test`, e.g. `tool/test_web.sh --wasm`.
set -euo pipefail

cd "$(dirname "$0")/.."

files=()
while IFS= read -r file; do
  if ! grep -q "@TestOn('vm')" "$file"; then
    files+=("$file")
  fi
done < <(find test -name '*_test.dart' ! -name '*_golden_test.dart' | sort)

flutter test --platform chrome "$@" "${files[@]}"
