# shellcheck source=../utils/env.bash   # @env @key @token
# shellcheck source=../utils/print.bash # @fatal

set_github_token() { @token store GitHub 40; }

_gh=$(which gh || true)

# Useful: gh repo set-default
# It sets `gh-resolved = base` for selected remote, e.g., `[remote "origin"]`.
gh() {
  [ -z "${_gh}" ] && @fatal please setup environment first

  local key token
  key=$(@key github)
  token=${!key:-$(@env get "${key}")}

  local args=("${@}")
  GITHUB_TOKEN="${token}" "${_gh}" "${args[@]}"
}

@workflows() {
  local action=${1:-$(gum choose disable enable)}
  case "${action}" in
  disable)
    local workflow workflows
    workflows=$(
      gh workflow list |
        gum choose --no-limit |
        awk '{print $NF}'
    )
    for workflow in ${workflows}; do
      gh workflow disable "${workflow}"
    done
    ;;

  enable)
    local workflow workflows
    workflows=$(
      gh workflow list --all |
        grep disabled |
        gum choose --no-limit |
        awk '{print $NF}'
    )
    for workflow in ${workflows}; do
      gh workflow enable "${workflow}"
    done
    ;;

  *) @fatal unknown action "${action}" ;;
  esac
}
