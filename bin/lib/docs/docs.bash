# shellcheck source=../git/core.bash  # @root
# shellcheck source=../utils/npm.bash # @consistent @lock

# Example: run docs npm ci
# Example: run docs npm i nextra@latest
#
# Example: run docs install|dev|build|start|publish
# Example: run docs npm ci -- build -- start
docs() {
  pushd "$(@root)/docs" >/dev/null || exit 1
  trap 'popd >/dev/null' ERR

  if [[ ${#@} -eq 0 ]]; then
    set -- install -- build -- start
  fi

  local arg args=()
  for arg in "${@}"; do
    shift

    if [[ ${#args[@]} -eq 0 ]]; then
      case "${arg}" in
      install) if ! @consistent; then npm ci && @lock; fi ;;
      dev) npx --no-install next dev ;;
      build) npx --no-install next build ;;
      start) npx --no-install next start ;;
      publish) rm -rf dist/ && TARGET=static npx --no-install next build ;;
      --) continue ;;
      *) args+=("${arg}") ;;
      esac
      continue
    fi

    if [[ "${arg}" == '--' ]]; then
      "${args[@]}"
      args=()
      continue
    fi
    args+=("${arg}")
  done
  "${args[@]}"

  popd >/dev/null || exit 1
}
