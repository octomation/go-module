#!/usr/bin/env bash

@usage() {
  cat - <<EOF
Usage: $0 <task> <args>
Tasks:
EOF
  compgen -A function | grep -Ev '^(@|_|-|\+)' | sort | cat -n
}

help() { @usage; }
