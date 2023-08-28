# shellcheck source=../git/core.bash # @root
# shellcheck source=../utils/os.bash # @os @arch

_BINPATH="$(@root)/bin/$(@os)/$(@arch)"
if [[ ":${PATH}:" != *":${_BINPATH}:"* ]]; then
  export PATH="${_BINPATH}:${PATH}"
fi
[ -d "${_BINPATH}" ] || mkdir -p "${_BINPATH}"
export GOBIN="${_BINPATH}"

# Example: run @install path/to/gum
# Example: run @install vendor/gum ./bin/{os}/{arch}
# Example: run @install https://install.octolab.org/vendor/gum ./bin/{os}/{arch}
@install() {
  local script=${1} path=${2:-${_BINPATH}}
  path=${path/'{os}'/$(@os)}
  path=${path/'{arch}'/$(@arch)}

  if [[ "${script}" =~ ^vendor/ ]]; then
    script="https://install.octolab.org/${script}"
  fi
  if [[ ! "${script}" =~ ^https:// ]] && [ ! -f "${script}" ]; then
    script="https://install.octolab.org/${script}"
  fi

  [[ "${script}" =~ ^https:// ]] && [ \
    "$(curl -s -o /dev/null -w '%{http_code}' --head "${script}")" -eq "200" \
  ]

  if [[ "${script}" =~ ^https://install.octolab.org/vendor ]]; then
    curl -sSfL "${script}" | bash -s -- "${path}"
    return $?
  elif [[ "${script}" =~ ^https://install.octolab.org ]]; then
    curl -sSfL "${script}" | sh -s -- -b "${path}"
    return $?
  fi
  ${script} "${path}"
}
