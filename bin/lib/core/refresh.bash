# shellcheck source=../docs/docs.bash # docs
# shellcheck source=../git/core.bash  # @pull

refresh() {
  @pull

  docs install
  make deps tools
}
