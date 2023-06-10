#!/usr/bin/env bash
# shellcheck source=../core/git.bash # @root

# Example: run docs npm ci
# Example: run docs npm i nextra@latest
#
# Example: run docs dev|build|start|publish
# TODO:feat run docs -- build start
docs() {
  pushd "$(@root)/docs" >/dev/null || exit 1
  trap 'popd >/dev/null' ERR

  case "${1:-}" in
  dev) npx --no-install next dev ;;
  build) npx --no-install next build ;;
  start) npx --no-install next start ;;
  publish) rm -rf dist/ && TARGET=static npx --no-install next build ;;
  *) "${@}" ;;
  esac

  popd >/dev/null || exit 1
}
