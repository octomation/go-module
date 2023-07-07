#!/usr/bin/env bash
# shellcheck source=print.bash  # @error @fatal
# shellcheck source=sed.bash    # @sed (cycle)

@arch() { uname -m; }

@os() { uname -s | tr '[:upper:]' '[:lower:]'; }

@darwin() { [ "$(@os)" == 'darwin' ]; }

@env() {
  local op="${1:-}" key="${2:-}" value="${3:-}"

  case "${op}" in
  get)
    if [ ${#@} != 2 ]; then
      @error 'usage: env get <key>'
      return 1
    fi

    if [ ! -f .env ]; then
      @error file .env not found
      return 1
    fi

    grep "^${key}=" .env | cut -d '=' -f 2
    ;;

  set)
    if [ ${#@} != 3 ]; then
      @error 'usage: env set <key> <value>'
      return 1
    fi

    if [ ! -f .env ]; then
      echo "${key}=${value}" >.env
      return 0
    fi

    if grep -qv "^${key}=" .env; then
      echo "${key}=${value}" >>.env
      return 0
    fi

    @sed -i "s|^${key}=.*|${key}=${value}|g" .env
    ;;

  *)
    @error 'usage: env <get|set>'
    return 1
    ;;
  esac
}

@token() {
  local op="${1:-}" name="${2:-}" value="${3:-}" length="${3:-}" key
  key=${name// /_}
  key=${key^^}_TOKEN

  case "${op}" in
  get)
    if [ ${#@} != 2 ]; then
      @error 'usage: token get <name>'
      return 1
    fi

    @env get "${key}"
    ;;

  set)
    if [ ${#@} != 3 ]; then
      @error 'usage: token set <name> <value>'
      return 1
    fi

    @env set "${key}" "${value}"
    ;;

  store)
    if [ ${#@} != 3 ]; then
      @error 'usage: token store <name> <length>'
      return 1
    fi

    local yn='N'
    read -rp "Do you have ${name} token? (y/N) " yn
    case $yn in
    [yY]) ;;
    *) return 1 ;;
    esac

    local token
    echo Please enter the token:
    read -rs token
    token=${token## }
    token=${token%% }

    if [ "${#token}" -ne "${length}" ]; then
      @fatal token is invalid
    fi
    @env set "${key}" "${token}"
    ;;

  *)
    @error 'usage: token <get|set|store>'
    return 1
    ;;
  esac
}
