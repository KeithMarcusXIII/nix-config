# Deployment Guide: nix-config

---

## Deployment Target

- **Host:** `mac16-10`
- **Architecture:** aarch64-darwin
- **Nix Store:** External APFS volume (software RAID, two 500 GB disks)

## Deployment Commands

### Local Deploy

```bash
darwin-rebuild switch --flake .#mac16-10
```

### Remote Deploy

```bash
darwin-rebuild switch --flake .#mac16-10 --target-host keith@mac16-10
```

## Validation Pipeline

Run these before every deploy:

```bash
# 1. Flake structure + eval check
nix flake check

# 2. Build full system closure
nix build .#darwinConfigurations.mac16-10.system

# 3. Preview what will change
darwin-rebuild switch --dry-run --flake .#mac16-10
```

## Post-Deploy Verification

```bash
# Verify colima is running
launchctl list | grep colima

# Verify docker works through colima
docker info

# Verify sops-nix secrets decrypted
ls -la /run/secrets/

# Verify activate-system KeepAlive
sudo launchctl list | grep activate-system

# Verify launchd env vars (for GUI apps)
launchctl getenv DEEPSEEK_API_KEY
launchctl getenv BWS_ACCESS_TOKEN
```

## Rollback

```bash
# Immediate rollback to previous generation
darwin-rebuild switch --rollback

# List available generations
darwin-rebuild --list-generations
```

## Bootstrap (Nuclear Option)

If `darwin-rebuild` itself is unavailable (e.g., after reboot with external volume):

```bash
sudo nix run --extra-experimental-features 'nix-command flakes' \
  nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake .#mac16-10
```

Note: The `activate-system` KeepAlive fix (see [`architecture.md`](./architecture.md)) should prevent this in normal operation.

## CI/CD

No CI/CD pipeline is configured. Deployment is manual via `darwin-rebuild switch`.

## Infrastructure

- **Nix daemon:** LaunchDaemon at `/Library/LaunchDaemons/org.nixos.nix-daemon.plist`
- **External volume mount:** LaunchDaemon at `/Library/LaunchDaemons/org.nixos.darwin-store.plist` (externally created, not in nix closure)
- **System activation:** LaunchDaemon at `/Library/LaunchDaemons/org.nixos.activate-system.plist` (nix-darwin managed, with KeepAlive override)
- **Secret decryption:** sops-nix during `darwin-rebuild switch` activation phase

---

_Generated: 2026-06-06 | Scan Level: Deep_
