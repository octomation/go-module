#!/usr/bin/env bash
# shellcheck source=../core/git.bash # @root

_os=$(uname -s | tr '[:upper:]' '[:lower:]')
_arch=$(uname -m | tr '[:upper:]' '[:lower:]')

path="$(@root)/bin/${_os}/${_arch}"
if [[ ":${PATH}:" != *":${path}:"* ]]; then
  export PATH="${path}:${PATH}"
fi
if [[ -z "${GOBIN+x}" ]]; then
  export GOBIN="${path}"
fi

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
