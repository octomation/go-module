#!/usr/bin/env bash
# shellcheck source=../git/core.bash  # @root
# shellcheck source=../utils/env.bash # @os @arch

# TODO:debt find a better way to inject path/gobin
path="$(@root)/bin/$(@os)/$(@arch)"
if [[ ":${PATH}:" != *":${path}:"* ]]; then
  export PATH="${path}:${PATH}"
fi
if [[ -z "${GOBIN+x}" ]]; then
  export GOBIN="${path}"
fi

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
