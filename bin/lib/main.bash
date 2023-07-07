#!/usr/bin/env bash
# shellcheck source=core/runtime.bash # @handle

help() { @usage; }

@usage() {
  cat - <<EOF
Usage: $0 <task> <args>
Tasks:
EOF
  compgen -A function | grep -Ev '^(@|_|-|\+)' | sort | cat -n
}

@main() {
  local args=()
  IFS=' ' read -r -a args < <(@handle "${@}")

  "${args[@]:-@usage}"
}

@main "${@}"
