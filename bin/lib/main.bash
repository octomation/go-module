#!/usr/bin/env bash
# shellcheck source=core/config.bash
# shellcheck source=core/usage.bash

set -euo pipefail

[ "${BASH_VERSINFO:-0}" -ge 4 ] || {
  echo "bash version 4 or higher is required" >&2
  exit 1
}

for script in "$(pwd)"/bin/lib/*/*.bash; do
  # shellcheck source=core/config.bash
  source "${script}"
done

@main() {
  local args=()
  IFS=' ' read -r -a args < <(@handle "${@}")

  "${args[@]:-@usage}"
}

@main "${@}"
