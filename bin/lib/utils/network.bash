#!/usr/bin/env bash

@busy() {
  local port=${1}
  sudo lsof -nP -i4TCP:"${port}" | grep -qi listen
}
