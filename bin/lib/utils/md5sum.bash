# shellcheck source=print.bash # @fatal

if ! command -v md5sum >/dev/null; then
  if ! command -v openssl >/dev/null; then
    @fatal md5sum: command not found
  fi

  md5sum() {
    openssl md5 "${@}" |
      awk -F '(' '{print $1" "$2}' |
      awk -F ')' '{print $1" "$2}' |
      awk '{print $4" "$2}' |
      column -t
  }
fi
