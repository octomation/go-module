# shellcheck source=md5sum.bash # md5sum

@consistent() {
  local lock file="${1:-package-lock.json}" vendor="${2:-node_modules}"
  if [ -d "${file}" ]; then file="${file}/package-lock.json"; fi
  lock="$(dirname "${file}")/${vendor}/checksum.lock"
  [ -f "${lock}" ] && [ "$(cat "${lock}")" == "$(md5sum "${file}")" ]
}

@lock() {
  local lock file="${1:-package-lock.json}" vendor="${2:-node_modules}"
  if [ -d "${file}" ]; then file="${file}/package-lock.json"; fi
  lock="$(dirname "${file}")/${vendor}/checksum.lock"
  md5sum "${file}" >"${lock}"
}
