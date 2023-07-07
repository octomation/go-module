#!/usr/bin/env bash
# shellcheck source=../git/core.bash  # @pull
# shellcheck source=../docs/docs.bash # docs

refresh() {
  @pull

  docs install
  make deps tools
}
