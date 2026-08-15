#!/usr/bin/env bash
# fda-refresh.sh — Refresh macOS Full Disk Access entries for nix store binaries
#
# Run after `nix build .#darwinConfigurations.<host>.system` to update the
# TCC database with current nix-store binary paths and remove stale ones.
#
# Usage:
#   nix build .#darwinConfigurations.mac16-10.system
#   sudo ./scripts/fda-refresh.sh
#
# Requires: sudo, sqlite3 (ships with macOS), python3

set -euo pipefail

TCC_DB="/Library/Application Support/com.apple.TCC/TCC.db"
SERVICE="kTCCServiceSystemPolicyAllFiles"
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if [[ $EUID -ne 0 ]]; then
  echo "Error: This script must be run with sudo." >&2
  echo "Usage: sudo $0" >&2
  exit 1
fi

# Verify python3 is available (needed for plist XML entity decoding)
if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: python3 is required but not found in PATH." >&2
  echo "Under sudo, PATH is restricted. Try: sudo env PATH=\"\$PATH\" $0" >&2
  exit 1
fi

# --- Collect current nix-store paths that need FDA ---

collect_paths() {
  local result_link="$PROJECT_ROOT/result"

  if [[ ! -L "$result_link" ]]; then
    echo "Error: $result_link does not exist. Run 'nix build' first." >&2
    exit 1
  fi

  # 1. Shebang from the activate script
  local shebang
  shebang=$(head -1 "$result_link/activate" 2>/dev/null | sed 's|#!/usr/bin/env -i ||; s|#! ||')
  if [[ -n "$shebang" && "$shebang" == /nix/store/* ]]; then
    echo "$shebang"
  fi

  # 2. Paths from the built closure's LaunchDaemons
  #    (plist files are symlinks into /nix/store — cat follows them, grep -r does not)
  if [[ -d "$result_link/Library/LaunchDaemons" ]]; then
    for plist in "$result_link/Library/LaunchDaemons/"*.plist; do
      [[ -e "$plist" ]] || continue
      cat "$plist" 2>/dev/null
    done \
      | python3 -c "
import sys, html, re
text = html.unescape(sys.stdin.read())
for m in re.findall(r'/nix/store/[a-z0-9]+-[a-zA-Z0-9._+-]+(?:/bin/[a-zA-Z0-9._+-]+)?', text):
    print(m)
" \
      | grep -v '/bin/sh$' \
      | grep -v '/bin/wait4path$' \
      | grep -v '/bin/launchctl$' \
      | grep -v '\.json$' \
      || true
  fi

  # 3. Paths from the activate script that are actual executables
  if [[ -f "$result_link/activate" ]]; then
    grep -hoE '/nix/store/[^ "]+' "$result_link/activate" 2>/dev/null \
      | while IFS= read -r p; do
          [[ -f "$p" && -x "$p" ]] && echo "$p"
        done \
      || true
  fi
}

# --- Query TCC database ---

get_fda_entries() {
  sqlite3 "$TCC_DB" \
    "SELECT client FROM access WHERE service='$SERVICE' AND client LIKE '/nix/store/%';" 2>/dev/null
}

# Helper: check if a value exists in an array (bash 3.2 compatible)
in_array() {
  local needle="$1"; shift
  local item
  for item in "$@"; do
    [[ "$item" == "$needle" ]] && return 0
  done
  return 1
}

# --- Main ---

echo "==> Collecting current nix-store paths from built closure..."
CURRENT_PATHS=()
while IFS= read -r line; do
  CURRENT_PATHS+=("$line")
done < <(collect_paths | sort -u)

if [[ ${#CURRENT_PATHS[@]} -eq 0 ]]; then
  echo "Error: No nix-store paths found. Is result/ a valid system closure?" >&2
  exit 1
fi

echo "   Found ${#CURRENT_PATHS[@]} paths that need FDA:"
printf "   %s\n" "${CURRENT_PATHS[@]}"
echo

echo "==> Querying existing FDA entries..."
EXISTING_PATHS=()
while IFS= read -r line; do
  EXISTING_PATHS+=("$line")
done < <(get_fda_entries | sort -u)

echo "   Found ${#EXISTING_PATHS[@]} existing nix-store FDA entries:"
printf "   %s\n" "${EXISTING_PATHS[@]}"
echo

# Find stale entries (in TCC but not in current closure)
STALE_PATHS=()
for p in "${EXISTING_PATHS[@]}"; do
  if ! in_array "$p" "${CURRENT_PATHS[@]}"; then
    STALE_PATHS+=("$p")
  fi
done

# Find missing entries (in current closure but not in TCC)
MISSING_PATHS=()
for p in "${CURRENT_PATHS[@]}"; do
  if ! in_array "$p" "${EXISTING_PATHS[@]}"; then
    MISSING_PATHS+=("$p")
  fi
done

# Test if TCC database is writable (try an actual write and roll back)
TCC_WRITABLE=false
if sqlite3 "$TCC_DB" "SELECT 1;" >/dev/null 2>&1; then
  # Attempt a real write to detect read-only SIP protection
  if sqlite3 "$TCC_DB" "DELETE FROM access WHERE client='_fda_refresh_test_';" 2>/dev/null; then
    TCC_WRITABLE=true
  fi
fi

if [[ "$TCC_WRITABLE" == "true" ]]; then
  # --- Direct TCC database modification ---

  # Remove stale entries
  if [[ ${#STALE_PATHS[@]} -gt 0 ]]; then
    echo "==> Removing ${#STALE_PATHS[@]} stale FDA entries..."
    for p in "${STALE_PATHS[@]}"; do
      echo "   - $p"
      sqlite3 "$TCC_DB" "DELETE FROM access WHERE service='$SERVICE' AND client='$p';"
    done
  else
    echo "==> No stale entries to remove."
  fi

  # Add missing entries
  if [[ ${#MISSING_PATHS[@]} -gt 0 ]]; then
    echo "==> Adding ${#MISSING_PATHS[@]} new FDA entries..."
    for p in "${MISSING_PATHS[@]}"; do
      echo "   + $p"
      sqlite3 "$TCC_DB" \
        "INSERT OR REPLACE INTO access (service, client, client_type, auth_value, auth_reason, indirect_object_identifier_type, indirect_object_identifier, flags, last_modified)
         VALUES ('$SERVICE', '$p', 0, 2, 0, 0, 'UNUSED', 0, strftime('%s','now'));"
    done
  else
    echo "==> No new entries to add."
  fi

  # Summary
  echo
  echo "==> Done. Current FDA entries for /nix/store:"
  CURRENT_TOTAL=0
  while IFS= read -r p; do
    if [[ -e "$p" ]]; then
      echo "   ✓ $p"
      CURRENT_TOTAL=$((CURRENT_TOTAL + 1))
    else
      echo "   ✗ $p (stale — file no longer exists)"
    fi
  done < <(get_fda_entries | sort)

  echo
  echo "==> Summary: ${#CURRENT_PATHS[@]} needed, ${#STALE_PATHS[@]} removed, ${#MISSING_PATHS[@]} added, ${CURRENT_TOTAL} in DB"

else
  # --- Fallback: output paths for manual System Settings addition ---
  echo "==> TCC database is read-only (macOS SIP protection). Cannot modify directly."
  echo

  if [[ ${#MISSING_PATHS[@]} -gt 0 ]]; then
    echo "==> ${#MISSING_PATHS[@]} paths need to be added to FDA manually:"
    echo
    printf "   %s\n" "${MISSING_PATHS[@]}"
    echo
    echo "   To add each path:"
    echo "   1. Open System Settings → Privacy & Security → Full Disk Access"
    echo "   2. Click +, press Cmd+Shift+G (Go to Folder)"
    echo "   3. Paste each path above"
    echo
  fi

  if [[ ${#STALE_PATHS[@]} -gt 0 ]]; then
    echo "==> ${#STALE_PATHS[@]} stale entries can be removed from FDA:"
    echo
    printf "   %s\n" "${STALE_PATHS[@]}"
    echo
    echo "   To remove: select each entry in System Settings and click -"
    echo
  fi

  if [[ ${#MISSING_PATHS[@]} -eq 0 && ${#STALE_PATHS[@]} -eq 0 ]]; then
    echo "==> All FDA entries are up to date. No changes needed."
  fi

  # Copy paths to clipboard if pbcopy is available
  if command -v pbcopy >/dev/null 2>&1 && [[ ${#MISSING_PATHS[@]} -gt 0 ]]; then
    printf '%s\n' "${MISSING_PATHS[@]}" | pbcopy
    echo "==> Paths copied to clipboard. Paste into System Settings Go-to-Folder dialog."
  fi
fi

echo
echo "==> Restart affected services to pick up changes:"
echo "   sudo launchctl kickstart -k system/org.nixos.nix-daemon"
echo "   sudo launchctl kickstart -k system/org.nixos.sops-install-secrets"
