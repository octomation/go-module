#!/usr/bin/env bash
# shellcheck source=../core/git.bash # @root

_os=$(uname -s | tr '[:upper:]' '[:lower:]')
_arch=$(uname -m | tr '[:upper:]' '[:lower:]')

path="$(@root)/bin/${_os}/${_arch}"
if [[ ":${PATH}:" != *":${path}:"* ]]; then
  export PATH="${path}:${PATH}"
fi

# Example: run tools go mod tidy
tools() {
  pushd "$(@root)/tools" >/dev/null || exit 1
  trap 'popd >/dev/null' ERR
  "${@}"
  popd >/dev/null || exit 1
}
