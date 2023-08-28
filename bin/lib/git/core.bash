@root() { git rev-parse --show-toplevel; }

@pull() {
  local remote
  for remote in $(git remote | grep -v origin); do
    git fetch --prune --tags "${remote}"
  done
  git fetch --prune --tags --prune-tags origin

  local remote actual target shared
  remote=${1:-'@{u}'}
  actual=$(git rev-parse @)
  target=$(git rev-parse "${remote}")
  shared="$(git merge-base @ "${remote}")"
  if [ "${actual}" != "${target}" ]; then
    if ! git diff-index --quiet HEAD; then
      git stash -m 'stash before pulling'
      trap 'git stash pop' EXIT
    fi
    git pull --force --rebase
  fi
}
