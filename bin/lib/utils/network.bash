# shellcheck source=os.bash # @darwin

@busy() {
  local port=${1}
  if @darwin; then
    lsof -nP -i4TCP:"${port}" | grep -qi listen
  else
    sudo lsof -nP -i4TCP:"${port}" | grep -qi listen
  fi
}
