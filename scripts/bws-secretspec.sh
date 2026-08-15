#!/usr/bin/env bash
# Workaround for secretspec's BWS provider hardcoding --server-url https://bitwarden.com
# (the web vault) instead of letting the bws CLI use its defaults (api.bitwarden.com).
# This wrapper strips the --server-url flag so BWS CLI uses correct endpoints.
# See: https://github.com/cachix/secretspec/issues/<TBD>
set -euo pipefail

args=()
skip_next=false
for arg in "$@"; do
  if $skip_next; then
    skip_next=false
    continue
  fi
  if [[ "$arg" == "--server-url" ]]; then
    skip_next=true
    continue
  fi
  args+=("$arg")
done

exec bws "${args[@]}"
