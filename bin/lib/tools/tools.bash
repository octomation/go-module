#!/usr/bin/env bash
# shellcheck source=../git/git.bash # @root

# Example: run tools go mod tidy
tools() {
  pushd "$(@root)/tools" >/dev/null || exit 1
  trap 'popd >/dev/null' ERR

  local arg args=()
  for arg in "${@}"; do
    shift

    if [[ "${arg}" == '--' ]]; then
      "${args[@]}"
      args=()
      continue
    fi
    args+=("${arg}")
  done
  "${args[@]}"

  popd >/dev/null || exit 1
}
