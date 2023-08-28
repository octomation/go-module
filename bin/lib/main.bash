# shellcheck source=config/global.bash # $config @handle

help() { @usage; }

@usage() {
  cat - <<EOF
Usage: $0 <task> <args>
Tasks:
EOF
  compgen -A function | grep -Ev '^(@|_|-|\+)' | sort | cat -n
}

@main() {
  @handle "${@}"
  shift "${config['shift']}"
  [ -f .env ] && source .env
  "${@:-@usage}"
}

@main "${@}"
