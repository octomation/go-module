#!/usr/bin/env bash

_os=$(uname -s | tr '[:upper:]' '[:lower:]')
_arch=$(uname -m | tr '[:upper:]' '[:lower:]')

# TODO:refactor inject while code generation
paths=(
  "$(pwd)/bin/${_os}/${_arch}"
)
for path in "${paths[@]}"; do
  if [[ ":${PATH}:" != *":${path}:"* ]]; then
    export PATH="${path}:${PATH}"
  fi
done

declare -A config
config['dryrun']=false

@handle() {
  local arg
  for arg in "${@}"; do
    case "${arg}" in
    -d | --dry-run)
      config['dryrun']=true
      shift
      ;;
    *) break ;;
    esac
  done

  echo "${@}"
}
