#!/usr/bin/env bash
# shellcheck source=../node/npm.bash

docs() {
  pushd docs || return 1
  trap popd EXIT

  local args=("${@}")
  if [ ${#args[@]} = 0 ]; then
    args=(install build start)
  fi

  local arg
  for arg in "${args[@]}"; do
    case "${arg}" in
    install) @npm install ;;
    build) npx --no-install next build ;;
    start) npx --no-install next start ;;
    publish) rm -rf dist/ && TARGET=static npx --no-install next build ;;
    *) break ;;
    esac
  done
}
