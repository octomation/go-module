#!/usr/bin/env bash

if ! command -v md5sum >/dev/null; then
  if ! command -v openssl >/dev/null; then
    echo "md5sum: command not found" >&2
    exit 1
  fi

  md5sum() { openssl md5 "${@}"; }
fi
