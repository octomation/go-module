#!/usr/bin/env bash
# shellcheck source=../utils/md5sum.bash

@npm() {
  # TODO:refactor make generic
  local _="${*}"

  local cmd=ci

  local lock file=package-lock.json
  lock=$(pwd)/node_modules/package.lock

  if [ ! -f "${file}" ]; then
    cmd=install
  fi

  if [ ! -f "${lock}" ] || [ "$(cat "${lock}")" != "$(md5sum "${file}")" ]; then
    npm "${cmd}"
    md5sum "${file}" >"${lock}"
  fi
}
