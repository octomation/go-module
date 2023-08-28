@debug() { echo "${@}"; }

@trace() { @debug "${@}" && "${@}"; }

@error() { echo "${@}" >&2; }

@fatal() { @error "${@}" && exit 1; }
