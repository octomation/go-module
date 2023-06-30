#!/usr/bin/env bash

_os=$(uname -s | tr '[:upper:]' '[:lower:]')
_arch=$(uname -m | tr '[:upper:]' '[:lower:]')

path="$(@root)/bin/${_os}/${_arch}"
if [[ ":${PATH}:" != *":${path}:"* ]]; then
  export PATH="${path}:${PATH}"
fi
if [[ -z "${GOBIN+x}" ]]; then
  export GOBIN="${path}"
fi
