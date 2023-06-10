#!/usr/bin/env bash

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
