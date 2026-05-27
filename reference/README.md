# Reference Files

This directory stores reference copies of system files that are deployed outside of nix-darwin's managed paths. These files are **not** managed by nix — they serve as documentation of what was manually placed on the target system.

## Structure

- `LaunchDaemons/` — macOS LaunchDaemon plist files (deployed to `/Library/LaunchDaemons/`)

## Notes

- These files may contain host-specific store paths that change across rebuilds. Update them after significant nix-darwin changes.
- These are **reference copies only** — nix-darwin does not read from or deploy files in this directory.
