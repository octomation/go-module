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
config['shift']=0
config['dryrun']=false

@handle() {
  local arg skip=false
  for arg in "${@}"; do
    if $skip; then
      skip=false
      continue
    fi

    case "${arg}" in
    -d | --dry-run)
      config['dryrun']=true
      config['shift']=$((config['shift'] + 1))
      shift
      ;;
    *) break ;;
    esac
  done
}

@config() {
  local key
  for key in "${!config[@]}"; do
    printf "[%s]=%s\n" "${key}" "${config[${key}]}"
  done
}
