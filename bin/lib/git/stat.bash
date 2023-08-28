@changelog() {
  local latest
  latest=$(git describe --tags --abbrev=0 2>/dev/null)

  git log --oneline "${latest}"... |
    cat |
    awk '{$1=""; print $0}' |
    sed 's|^|-|' |
    sort
}
