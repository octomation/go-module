# shellcheck source=os.bash # @darwin

@sed() {
  local args=("$@")

  # bsd vs gnu sed
  if @darwin; then
    local arg
    args=()

    for arg in "$@"; do
      args+=("${arg}")
      if [[ "${arg}" == '-i' ]]; then
        args+=('')
      fi
    done
  fi

  sed "${args[@]}"
}
