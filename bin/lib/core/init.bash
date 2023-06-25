#!/usr/bin/env bash

init() {
  local from to=${1}
  from=$(go list -m)

  make tools
  go mod edit -module "${to}"
  find . -type file -name '*.go' -exec sed -i '' "s|${from}|${to}|g" {} +
  make format
}
