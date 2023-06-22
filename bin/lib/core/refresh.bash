#!/usr/bin/env bash
# shellcheck source=../git/git.bash     # @pull
# shellcheck source=../docs/docs.bash   # docs
# shellcheck source=../tools/tools.bash # tools

refresh() {
  @pull

  docs install
  tools go mod download && make tools
}
