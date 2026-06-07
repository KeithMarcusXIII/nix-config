---
source: "https://github.com/VTimofeenko/monorepo-machine-config"
commit: "6e4cd122c15e2b4e726c0794f2b52673b2b7cf79"
generated: "2026-06-06T15:08:41Z"
topic: "flake-parts"
description: "Subflake composition pattern: homelab-subflake with traits, services, and independent flake-modules"
---

This file is a merged representation of a subset of the codebase, containing specifically included files and files not matching ignore patterns, combined into a single document by Repomix.
The content has been processed where content has been compressed (code blocks are separated by ⋮---- delimiter).

# File Summary

## Purpose
This file contains a packed representation of a subset of the repository's contents that is considered the most important context.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Only files matching these patterns are included: homelab-subflake/**/*.nix, homelab-subflake/README.md
- Files matching these patterns are excluded: flake.lock
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Content has been compressed - code blocks are separated by ⋮---- delimiter
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
homelab-subflake/
  devshell/
    default.nix
  hosts/
    actinium/
      configuration/
        default.nix
    beryllium/
      configuration/
        default.nix
    boron/
      configuration/
        default.nix
    carbon/
      configuration/
        default.nix
    cerium/
      configuration/
        default.nix
    dns-test-vm/
      configuration/
        default.nix
    fluorine/
      configuration/
        default.nix
      seed/
        default.nix
        disk-config.nix
        hardware-configuration.nix
    helium/
      configuration/
        default.nix
      seed/
        default.nix
        disk-config.nix
        hardware-configuration.nix
    hydrogen/
      configuration/
        default.nix
        network.nix
      seed/
        configuration.nix
        hardware-configuration.nix
    lanthanum/
      configuration/
        default.nix
      seed/
        default.nix
        disk-config.nix
        hardware-configuration.nix
    lithium/
      configuration/
        default.nix
    neon/
      configuration/
        default.nix
        hardware-configuration.nix
        hw-acceleration.nix
        storage.nix
      seed/
        default.nix
        disk-config.nix
        hardware-configuration.nix
    nitrogen/
      configuration/
        default.nix
      seed/
        default.nix
        disk-config.nix
        hardware-configuration.nix
    oxygen/
      configuration/
        default.nix
        hw-acceleration.nix
        interrupt-disable.nix
        network.nix
    sodium/
      configuration/
        default.nix
        impermanence.nix
      seed/
        default.nix
  lib/
    healthchecks-systemd-module/
      default.nix
    local-lib.nix
    manifest-options.nix
    merge-manifests.nix
    mk-bkp.nix
    mk-iscsi.nix
  services/
    alert-manager/
      alertmanager-config/
        ntfy.nix
        telegram.nix
      functional/
        ntfy-sh.nix
        telegram.nix
      non-functional/
        endpoints-config.nix
      alertmanager.nix
      manifest.nix
    auth-dns/
      functional/
        zones/
          backbone-special.nix
          db-home-arpa-special.nix
          metrics-zone.nix
          network-zones.nix
          reverse-zones.nix
          srv-zone.nix
        nodata-clients.nix
      non-functional/
        alerts.nix
        endpoints-config.nix
        metrics.nix
      auth-dns.nix
      manifest.nix
      srv-lib.nix
    cyberchef/
      non-functional/
        endpoints-config.nix
        ssl.nix
      cyberchef.nix
      default.nix
      manifest.nix
    db/
      functional/
        gather-databases-from-manifests.nix
      non-functional/
        alerts.nix
        endpoints-config.nix
        firewall.nix
        metrics.nix
        storage.nix
      manifest.nix
      postgresql.nix
    dhcp/
      functional/
        long-lease-times.nix
      non-functional/
        alerts.nix
        firewall.nix
        metrics.nix
      kea.nix
      manifest.nix
    dns/
      functional/
        blocks.nix
        client-view.nix
        performance.nix
        reverse.nix
        services-split-view.nix
      non-functional/
        acl.nix
        alerts.nix
        endpoints-config.nix
        firewall.nix
        logging.nix
        metrics.nix
      manifest.nix
      unbound.nix
    docspell/
      non-functional/
        alerts.nix
        endpoints-config.nix
        ssl.nix
      docspell.nix
      manifest.nix
    esphome/
      non-functional/
        endpoints-config.nix
        ssl.nix
      esphome.nix
      manifest.nix
    fava/
      non-functional/
        observability/
          metrics/
            impl.nix
        endpoints-config.nix
        ssl.nix
        storage.nix
      fava.nix
      manifest.nix
    filedump/
      non-functional/
        alerts.nix
        endpoints-config.nix
        ssl.nix
      filedump.nix
      manifest.nix
    gitea/
      functional/
        mailer.nix
      non-functional/
        observability/
          metrics/
            impl.nix
          alerts.nix
        database.nix
        dumps.nix
        endpoints-config.nix
        monitoring.nix
        ssl.nix
        storage.nix
      default.nix
      gitea.nix
      manifest.nix
    healthchecks/
      non-functional/
        alerts.nix
        endpoints-config.nix
      fix-401010-pydantic-error.nix
      healthchecks.nix
      manifest.nix
    home-assistant/
      customComponents/
        meross_lan.nix
      functional/
        allow-ui-object-editing.nix
        outlet-rebooter.nix
        zwave.nix
      non-functional/
        alerts.nix
        endpoints-config.nix
        metrics.nix
      home-assistant.nix
      manifest.nix
    home-dashboard/
      functional/
        add-links-from-manifests.nix
        maintenance-iframe.nix
      non-functional/
        alerts.nix
        endpoints-config.nix
      home-dashboard.nix
      manifest.nix
    homebox/
      non-functional/
        alerts.nix
        endpoints-config.nix
        ssl.nix
        sso.nix
      homebox.nix
      manifest.nix
    keycloak/
      non-functional/
        probes/
          prometheus.nix
        alerts.nix
        endpoints-config.nix
        firewall.nix
        metrics.nix
      keycloak.nix
      manifest.nix
    linkwarden/
      non-functional/
        database.nix
        endpoints-config.nix
      flaresolverr.nix
      linkwarden.nix
      manifest.nix
    log-concentrator/
      functional/
        collect-access-logs.nix
        collect-and-remap-rsyslog.nix
        collect-deployments.nix
        dnstap.nix
        remap-journald-to-otel.nix
      non-functional/
        alerts.nix
        endpoints-config.nix
        firewall.nix
        metrics.nix
      log-concentrator.nix
      manifest.nix
    lubelogger/
      non-functional/
        database.nix
        endpoints-config.nix
        sso.nix
        storage.nix
      lubelogger.nix
      manifest.nix
    mqtt/
      non-functional/
        firewall.nix
        logging.nix
        ssl.nix
      manifest.nix
      mqtt.nix
    nextcloud/
      functional/
        long-session.nix
        mail.nix
      non-functional/
        alerts.nix
        endpoints-config.nix
        metrics.nix
        ssl.nix
        storage.nix
      manifest.nix
      nextcloud.nix
    ntfy-sh/
      non-functional/
        alerts.nix
        endpoints-config.nix
        metrics.nix
      manifest.nix
      ntfy-sh.nix
    ntp/
      non-functional/
        alerts.nix
        firewall.nix
        metrics.nix
      manifest.nix
      service.nix
    nut-server/
      non-functional/
        alerts.nix
        firewall.nix
        metrics.nix
      manifest.nix
      nut.nix
    pgadmin/
      non-functional/
        alerts.nix
        endpoints-config.nix
        ssl.nix
      manifest.nix
      pgadmin.nix
    prometheus/
      functional/
        gather-alerts-from-manifests.nix
        host-alerts.nix
        host-down-rules.nix
        scrape-from-nodes.nix
      non-functional/
        alerts.nix
        endpoints-config.nix
        storage.nix
      service-scraping/
        default.nix
        gather-probes-from-manifests.nix
        gather-services-from-manifests.nix
      synology/
        default.nix
      default.nix
      manifest.nix
      service.nix
      srv-lib.nix
      wip-sample-alert.nix
    prusa-exporter/
      non-functional/
        alerts.nix
      dashboard.nix
      manifest.nix
      service.nix
    restic-server/
      non-functional/
        alerts.nix
        endpoints-config.nix
        metrics.nix
        ssl.nix
        storage.nix
      impl.nix
      manifest.nix
    ssl-proxy/
      functional/
        allow-big-uploads.nix
        default-no-answer.nix
        metrics-vhosts.nix
        proxy-vhosts.nix
      non-functional/
        observability/
          metrics.nix
        probes/
          default.nix
          prometheus.nix
        alerts.nix
      oauth2-proxy-config/
        per-service/
          healthchecks.nix
        default.nix
      firewall.nix
      listen-address.nix
      manifest.nix
      service.nix
      srv-lib.nix
      utils.nix
    web-receipt-printer/
      non-functional/
        endpoints-config.nix
        firewall.nix
        ssl.nix
      default.nix
      impl.nix
      manifest.nix
      web-receipt-printer.nix
    your-spotify/
      non-functional/
        alerts.nix
        endpoints-config.nix
      manifest.nix
      your-spotify.nix
  tests/
    dns-test-vm.nix
    test-data.nix
  traits/
    base-wayland-environment/
      xremap/
        app-jumps.nix
        default.nix
        shortcuts.nix
      default.nix
      wallpaper-orig.nix
      wallpaper.nix
      xdg-portal.nix
    client-hardware/
      default.nix
      flipper.nix
      keyboard.nix
      printer.nix
      rtl.nix
      scanner.nix
    disable-docs/
      default.nix
    lan-net/
      default.nix
    logs-in-ram-only/
      default.nix
    microvm-guest/
      default.nix
    microvm-host/
      default.nix
    monitoring-source/
      collect-nixos-version.nix
      default.nix
      firewall.nix
      service.nix
    network-access-check/
      default.nix
    network-general-setup/
      default.nix
    nix-config/
      default.nix
    ntp-config/
      default.nix
    nut-client/
      default.nix
      upssched.nix
    root-env/
      default.nix
    ship-journald-logs/
      default.nix
    user-base/
      default.nix
      general-home-manager.nix
      user.nix
    user-environment/
      broot.nix
      default.nix
      file-associations.nix
      firejail.nix
      flatpak.nix
      fonts.nix
      general-home-manager.nix
      my-vim-config.nix
      packages.nix
      ripgrep.nix
      user.nix
      virtualization.nix
      zathura.nix
    user-scratch/
      default.nix
    user-shell/
      broot.nix
      default.nix
      gh.nix
      ripgrep.nix
    wg-ddns/
      default.nix
  flake-lib.nix
  flake.nix
  README.md
```

# Files

## File: homelab-subflake/devshell/default.nix
````nix
# Devshell configuration for homelab-subflake
{
  commands = [
    {
      name = "validate-service";
      category = "validation";
      help = "Validate a service manifest merge (uses fzf if no argument)";
      command = builtins.readFile ./validate-service.sh;
    }
    {
      name = "validate-host";
      category = "validation";
      help = "Validate a host configuration (uses fzf if no argument)";
      command = builtins.readFile ./validate-host.sh;
    }
    {
      name = "bump-inputs";
      category = "maintenance";
      help = "Bump flake inputs with trailers (--all for all, --fixup to squash with matching previous)";
      command = builtins.readFile ./bump-inputs.sh;
    }
    {
      name = "dev-loop";
      category = "development";
      help = "Rapid iteration loop: update data-flake and deploy on each Enter press";
      command = builtins.readFile ./dev-loop.sh;
    }
    {
      name = "switch-private-inputs";
      category = "development";
      help = "Toggle data-flake and private-modules between local and remote sources";
      command = builtins.readFile ./switch-private-inputs.sh;
    }
  ];
}
````

## File: homelab-subflake/hosts/actinium/configuration/default.nix
````nix
{ lib, modulesPath, ... }:
let
  hostConfig = lib.homelab.getOwnHostConfig;
in
{
  # Boot
  boot = {
    loader.grub.device = "/dev/sda";
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "xen_blkfront"
        "vmw_pvscsi"
      ];
      kernelModules = [ "nvme" ];
    };
  };

  # File systems
  fileSystems = {
    "/" = {
      device = "/dev/sda1";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  # Network
  systemd.network = {
    links."10-wan" = {
      enable = true;
      linkConfig.Name = "wan";
      matchConfig.PermanentMACAddress = hostConfig.macAddr;
    };

    networks."10-wan" = {
      enable = true;
      name = "10-wan";
      matchConfig.Name = lib.mkForce "wan";
      address = "${hostConfig.ipAddress}/${hostConfig.netmask}" |> lib.toList;
      gateway = hostConfig.gateway |> lib.toList;
      dns =
        (lib.homelab.getServiceConfig "dns-1")
        |> builtins.getAttr "upstream"
        # At this point the upstreams come in format [ "123.456.789.123@<port>#<domain>"];
        # Systemd needs it in a different format, 123.456.789.123:<port>#<domain>
        # Naive approach: replace "@" with ":"
        |> map (builtins.replaceStrings [ "@" ] [ ":" ]);
      networkConfig = {
        DHCP = "no";
        # This will also disable IPv6 assigning
        LinkLocalAddressing = "no";
      };
      DHCP = "no";
    };
  };

  # Misc
  system.stateVersion = "25.05";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Imports
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
}
````

## File: homelab-subflake/hosts/beryllium/configuration/default.nix
````nix
{ inputs, pkgs, lib, ... }:
{
  # Boot
  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "usbhid"
      "usb_storage"
    ];
    initrd.kernelModules = [
      "xhci_pci"
      "usbhid"
      "usb_storage"
    ];
    # Necessary for USB boot(!)
    kernelPackages = pkgs.linuxPackages_rpi4;
    blacklistedKernelModules = [
      "bluetooth"
      "btusb"
    ];
    kernelParams = [
      "8250.nr_uarts=1"
      "console=ttyAMA0,115200"
      "console=tty1"
      "fbcon=rotate:1"
      "boot.shell_on_fail"
    ];
    consoleLogLevel = 7;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };
  boot.kernel.sysctl."vm.mmap_rnd_bits" = lib.mkForce 18;

  # File systems
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };
  swapDevices = [ { device = "/dev/disk/by-uuid/3d865d57-cc32-4e99-ae4d-16650e9f8794"; } ];

  # Network

  # Misc
  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "22.05";

  # Imports
  imports = [
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
  ];
}
````

## File: homelab-subflake/hosts/boron/configuration/default.nix
````nix
{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Boot
  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "hid_logitech_hidpp"
        "xhci_pci_renesas"
      ];
      kernelModules = [
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "hid_logitech_hidpp"
        "xhci_pci_renesas"
      ];
    };
    supportedFilesystems = lib.mkForce [
      "btrfs"
      "reiserfs"
      "vfat"
      "f2fs"
      "xfs"
      "ntfs"
      "cifs"
      "ext4"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    tmp = {
      useTmpfs = true;
      tmpfsSize = "1G";
    };
    kernelParams = [
      "8250.nr_uarts=1"
      "console=ttyAMA0,115200"
      "console=tty1"
      "boot.shell_on_fail"
      # ```
      # ID 174c:1153 ASMedia Technology Inc. ASM1153 SATA 3Gb/s bridge
      # ```
      # Is prone to I/O errors if using `uas` driver. This
      # forces the `usb-storage` one. See lithium config for similar example.
      "usb-storage.quirks=174c:1153:u"
    ];
    consoleLogLevel = 7;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  # File systems
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  # Misc
  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "22.05";

  # Imports
  imports = [
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
  ];
}
````

## File: homelab-subflake/hosts/carbon/configuration/default.nix
````nix
{ lib, ... }:
{
  # Boot
  boot = {
    # Sets screen timeout to 1 minute
    kernelParams = [ "consoleblank=60" ];
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ehci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # File systems
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
      options = [ "noatime" ];
    };
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };
  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  # Misc
  system.stateVersion = "22.11";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    cpu.intel.updateMicrocode = lib.mkForce true;
    enableRedistributableFirmware = true;
  };
  # Imports
  imports = [ ];
}
````

## File: homelab-subflake/hosts/cerium/configuration/default.nix
````nix
{ lib, ... }:
{
  # Boot
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/sda";
      };
    };
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_scsi"
        "sd_mod"
        "sr_mod"
      ];
    };
    kernelModules = [ "kvm-intel" ];
  };

  # File systems
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  # Misc
  system.stateVersion = "24.05";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkForce true;
  networking.interfaces.ens3.useDHCP = true;
  services.qemuGuest.enable = true;

  # Imports
  imports = [ ];
}
````

## File: homelab-subflake/hosts/dns-test-vm/configuration/default.nix
````nix
/**
  Minimal VM configuration for DNS testing.

  This is a simple QEMU VM that only runs dns and auth-dns services.
*/
{
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.loader.grub.device = "/dev/vda";
  boot.initrd.availableKernelModules = [
    "virtio_pci"
    "virtio_blk"
  ];

  fileSystems."/" = {
    device = "/dev/vda1";
    fsType = "ext4";
  };

  # Networking with networkd
  networking.useDHCP = false;
  networking.useNetworkd = true;

  # Configure network interfaces
  systemd.network = {
    enable = true;

    # Primary interface with DHCP
    networks."10-eth0" = {
      matchConfig.Name = "eth0";
      networkConfig.DHCP = "yes";
    };

    # Dummy interface for LAN simulation
    netdevs."20-lan0" = {
      netdevConfig = {
        Name = "lan0";
        Kind = "dummy";
      };
    };

    networks."20-lan0" = {
      matchConfig.Name = "lan0";
      address = [ "192.168.1.199/24" ];
      networkConfig.ConfigureWithoutCarrier = true;
    };

    # Dummy interface for backbone-inner simulation
    netdevs."20-backbone0" = {
      netdevConfig = {
        Name = "backbone0";
        Kind = "dummy";
      };
    };

    networks."20-backbone0" = {
      matchConfig.Name = "backbone0";
      address = [ "10.200.0.199/24" ];
      networkConfig.ConfigureWithoutCarrier = true;
    };
  };

  # Enable SSH for VM access
  services.openssh.enable = true;
  users.users.root.password = "hunter2";

  # Enable serial console for non-graphical VM access with autologin
  boot.kernelParams = [ "console=ttyS0" ];
  services.getty.autologinUser = "root";

  # Add check script and tools to the system
  environment.systemPackages = with pkgs; [
    dnsutils # provides dig
    (writeScriptBin "check-dns" ''
      #!${bash}/bin/bash
      set -e
      set -x

      DNS_SERVER="192.168.1.199"
      PUBLIC_DOMAIN="${lib.homelab.getSettings.publicDomainName}"

      echo "=== DNS Test VM Checks ==="
      echo

      echo "1. Checking blocked domains return 0.0.0.0..."
      RESULT=$(${dnsutils}/bin/dig @$DNS_SERVER flurry.com A +short)
      if [[ "$RESULT" != "0.0.0.0" ]]; then
        echo "FAIL: flurry.com should return 0.0.0.0, got: $RESULT"
        exit 1
      fi
      echo "  ✓ flurry.com → 0.0.0.0"

      RESULT=$(${dnsutils}/bin/dig @$DNS_SERVER example.tld A +short)
      if [[ "$RESULT" != "0.0.0.0" ]]; then
        echo "FAIL: example.tld should return 0.0.0.0, got: $RESULT"
        exit 1
      fi
      echo "  ✓ example.tld → 0.0.0.0"
      echo

      echo "2. Checking CNAME records to home.arpa zone..."
      RESULT=$(${dnsutils}/bin/dig @$DNS_SERVER gitea.$PUBLIC_DOMAIN CNAME +short)
      if [[ ! "$RESULT" =~ home\.arpa ]]; then
        echo "FAIL: gitea.$PUBLIC_DOMAIN should return CNAME to home.arpa, got: $RESULT"
        exit 1
      fi
      echo "  ✓ gitea.$PUBLIC_DOMAIN → $RESULT"
      echo

      echo "3. Checking CNAME records to backbone-inner.home.arpa zone..."
      RESULT=$(${dnsutils}/bin/dig @$DNS_SERVER maindb.$PUBLIC_DOMAIN CNAME +short)
      if [[ ! "$RESULT" =~ backbone-inner\.home\.arpa ]]; then
        echo "FAIL: maindb.$PUBLIC_DOMAIN should return CNAME to backbone-inner.home.arpa, got: $RESULT"
        exit 1
      fi
      echo "  ✓ maindb.$PUBLIC_DOMAIN → $RESULT"
      echo

      echo "4. Checking metrics zone..."
      RESULT=$(${dnsutils}/bin/dig @$DNS_SERVER metrics.$PUBLIC_DOMAIN SOA +short)
      if [[ -z "$RESULT" ]]; then
        echo "FAIL: metrics.$PUBLIC_DOMAIN zone should exist"
        exit 1
      fi
      echo "  ✓ metrics.$PUBLIC_DOMAIN zone exists"
      echo "    SOA: $RESULT"
      echo

      echo "5. Checking reverse DNS (PTR records)..."
      # First test NSD directly
      RESULT=$(${dnsutils}/bin/dig @127.0.0.1 -p 5454 -x 192.168.1.199 +short)
      if [[ -z "$RESULT" ]]; then
        echo "FAIL: NSD reverse DNS for 192.168.1.199 should return a PTR record"
        echo "  Zone check:"
        ${dnsutils}/bin/dig @127.0.0.1 -p 5454 1.168.192.in-addr.arpa SOA +short
        exit 1
      fi
      echo "  ✓ NSD: 192.168.1.199 → $RESULT"

      # Then test through Unbound
      RESULT=$(${dnsutils}/bin/dig @$DNS_SERVER -x 192.168.1.199 +short)
      if [[ -z "$RESULT" ]]; then
        echo "FAIL: Unbound reverse DNS for 192.168.1.199 should return a PTR record"
        exit 1
      fi
      echo "  ✓ Unbound: 192.168.1.199 → $RESULT"
      echo

      echo "6. Checking local zone resolution..."
      RESULT=$(${dnsutils}/bin/dig @$DNS_SERVER home.arpa SOA +short)
      if [[ -z "$RESULT" ]]; then
        echo "FAIL: home.arpa zone should exist"
        exit 1
      fi
      echo "  ✓ home.arpa zone exists"
      echo

      RESULT=$(${dnsutils}/bin/dig @$DNS_SERVER backbone-inner.home.arpa SOA +short)
      if [[ -z "$RESULT" ]]; then
        echo "FAIL: backbone-inner.home.arpa zone should exist"
        exit 1
      fi
      echo "  ✓ backbone-inner.home.arpa zone exists"
      echo

      echo "=== All DNS checks passed! ==="
    '')
  ];

  system.stateVersion = "24.05";
}
````

## File: homelab-subflake/hosts/fluorine/configuration/default.nix
````nix
{ lib, ... }:
let
  rootUUID = "f5206f6a-ef59-4e72-b6d0-041e7567376e";
  swapUUID = "6f03849f-bbc6-4c53-af20-e99fd7143431";
in
{
  # Boot
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "nvme"
        "usb_storage"
        "sd_mod"
        "sdhci_pci"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
  };

  # File systems
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/${rootUUID}";
      fsType = "ext4";
      options = [ "noatime" ];
    };
    "/boot" = {
      device = "/dev/disk/by-label/ESP";
      fsType = "vfat";
    };
  };
  swapDevices = [ { device = "/dev/disk/by-uuid/${swapUUID}"; } ];

  # Misc
  system.stateVersion = "24.05";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkForce true;
  networking.wireless.enable = false;
  hardware.enableRedistributableFirmware = true;
  services.fstrim.enable = true;
  # Imports
  imports = [ ];
}
````

## File: homelab-subflake/hosts/fluorine/seed/default.nix
````nix
{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];
  boot.loader = {

    # Use the systemd-boot EFI boot loader.
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "fluorine";
    wireless.enable = false;
    firewall.allowedTCPPorts = [ 22 ];
  };

  time.timeZone = "America/Los_Angeles";
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  sound.enable = false;

  environment.systemPackages = with pkgs; [
    vim
    gitMinimal
  ];
  system.stateVersion = "24.05"; # Did you read the comment?
  users.users.root.openssh.authorizedKeys.keys = config.my-data.settings.SSHKeys;
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
````

## File: homelab-subflake/hosts/fluorine/seed/disk-config.nix
````nix
{
  disko.devices = {
    disk = {
      nvme0n1 = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "defaults"
                  "noatime"
                ];
              };
            };
            root = {
              size = "64G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
            plainSwap = {
              size = "8G";
              content.type = "swap";
            };
          };
        };
      };
    };
  };
}
````

## File: homelab-subflake/hosts/fluorine/seed/hardware-configuration.nix
````nix
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];
  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "nvme"
        "usb_storage"
        "sd_mod"
        "sdhci_pci"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
````

## File: homelab-subflake/hosts/helium/configuration/default.nix
````nix
{ lib, ... }:
{
  # Boot
  boot = {
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_scsi"
        "sd_mod"
        "sr_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ ];
    extraModulePackages = [ ];
    loader.grub = {
      enable = true;
      device = "/dev/sda";
    };
  };

  # File systems
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
    ];
  };

  # Misc
  system.stateVersion = "24.05";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkForce true;
  services.qemuGuest.enable = true;

  # Imports
  imports = [ ];
}
````

## File: homelab-subflake/hosts/helium/seed/default.nix
````nix
/**
  Seed config for helium.

  Helium will be launched as a VM.
*/
{ config, pkgs, ... }:
let
  hostName = "helium";
  stateVersion = "24.05";
in
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];

  boot.loader.grub = {
    enable = true;
    # device = "/dev/sda";
  };

  networking = {
    inherit hostName;
    wireless.enable = false;
    firewall.allowedTCPPorts = [ 22 ];
  };

  time.timeZone = "America/Los_Angeles";

  # Access
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };
  users.users.root.openssh.authorizedKeys.keys = config.my-data.settings.SSHKeys;

  environment.systemPackages = with pkgs; [
    vim
    gitMinimal
  ];

  sound.enable = false;
  system = {
    inherit stateVersion;
  };

  # Enable flakes
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
````

## File: homelab-subflake/hosts/helium/seed/disk-config.nix
````nix
# Simple layout
{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02"; # for grub MBR
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = [
                  "defaults"
                  "noatime"
                ];
              };
            };
          };
        };
      };
    };
  };
}
````

## File: homelab-subflake/hosts/helium/seed/hardware-configuration.nix
````nix
{ lib, ... }:
{
  boot = {
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_scsi"
        "sd_mod"
        "sr_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ ];
    extraModulePackages = [ ];
  };

  networking.useDHCP = lib.mkDefault true;

  virtualisation.hypervGuest.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
````

## File: homelab-subflake/hosts/hydrogen/configuration/default.nix
````nix
{ lib, ... }:

{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd = {

      availableKernelModules = [
        "ahci"
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  networking.wireless.enable = false;

  system.stateVersion = "23.05";
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };

  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkForce true;
  imports = [ ./network.nix ];
  powerManagement.cpuFreqGovernor = "performance";
}
````

## File: homelab-subflake/hosts/hydrogen/configuration/network.nix
````nix
{ lib, ... }:
let
  lan = lib.homelab.getNetwork "lan";
  inherit (lib.homelab.getOwnHostConfig) netInterfaces;

  inherit (netInterfaces)
    wan
    lan-1
    lan-2
    lan-3
    lan-bridge
    ;

  lanIP = lib.homelab.getOwnIpInNetwork "lan";
in
{
  # Disable autogenerated names
  networking.usePredictableInterfaceNames = false;
  networking.useNetworkd = true;

  # Consider any iface to be up => network is up
  systemd.network.wait-online.anyInterface = true;

  systemd.network = {
    links =
      let
        mkLink = link: {
          name = "0-${link.name}";
          value = {
            matchConfig.PermanentMACAddress = link.macAddr;
            linkConfig.Name = link.name;
          };
        };
      in
      builtins.listToAttrs (
        map mkLink [
          wan
          lan-1
          lan-2
          lan-3
        ]
      );
    networks = {
      "1-bridge-bind" = {
        # Binds the devices to the bridge, needs to go first
        # https://wiki.archlinux.org/title/Systemd-networkd#Bind_Ethernet_to_bridge
        enable = true;
        matchConfig.Name = lib.concatMapStringsSep " " (adapter: adapter.name) [
          lan-1
          lan-2
          lan-3
        ];
        networkConfig = {
          Bridge = lan-bridge.name;
        };
      };
      "10-lan" = {
        # The bridge network
        # https://wiki.archlinux.org/title/Systemd-networkd#Bridge_network
        enable = true;
        inherit (lan-bridge) name;
        matchConfig.Name = lan-bridge.name;
        networkConfig = {
          Address = [ (lanIP + lan.settings.netmask) ];
          DNS = [ lan.dnsServers ];
          DHCP = "no";
          # DNSSEC = "yes";
          # DNSOverTLS = "no";
          LinkLocalAddressing = "no";
          DNSDefaultRoute = true;
          Domains = [ lib.homelab.getSettings.publicDomainName ];
        };
      };
      "99-wan" = {
        enable = true;
        inherit (wan) name;
        matchConfig.Name = "${wan.name}";
        networkConfig = {
          DHCP = "yes"; # Enables DHCP Client on this interface
          DNS = [ lan.dnsServers ]; # Disable getting DNS from upstream.
          DNSDefaultRoute = false;
        };
      };
    };
    netdevs.lan.netdevConfig = {
      # The interface itself
      # https://wiki.archlinux.org/title/Systemd-networkd#Bridge_interface
      Kind = "bridge";
      Name = lan-bridge.name;
      # bridge between LAN ports
    };
  };
}
````

## File: homelab-subflake/hosts/hydrogen/seed/configuration.nix
````nix
# Seed config for hydrogen, to be used after formatting the disk
{ pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking = {

    hostName = "helium";
    wireless.enable = false;

    firewall.allowedTCPPorts = [ 22 ];
  };
  time.timeZone = "America/Los_Angeles";

  sound.enable = false;

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDa78M7tTZW84yAsZuvgN1M6AUd3JB9wa8wMoR3cy59LtrU8FwHjJmCqlpyB7Wa9GrfJe7NEqJ077sYrGQZIw41xUJ7fKaa07Xj4GzASYTB0qlZrdr1WJ4XYif5eh7iXMps5F5saz0d3cJWOeKq6jSAwgkqT/tK5ykPm75uV0PyEvNI06pSqmJy+2VHUu1b3f/cwGHUrBzrJjLSvPBppRxpLc4nhNMIdf+G481MQHzCsdz0lIisGk4t+WcMPapH8nwSFDgKZ1ZesGqFaC/AvyRMuaASjFTk+eNMFgR5KQCCP48iaKkr/CGld9mGZyN8nQ9A0g6ckDQInnhef2EwVJFpfYktqBmi4DOfZksw65qY8eQFdQFxRoQ1D69fEsupX3AF0xgRPV+ByVxKCWz11CUR3+QhKJ7uzEhou/RS4GqG4TiR2+b0zMP/sGZwedNMJQYy1h3bfauo2NVmSJMFt8jKmb82tMcqCW6t71UITRmmluwDNHCyrVXLr3GrhOLylp+NBwzm33QlOZ3ExHV+77hM4vHJwpraR+WrzijzqwQ+ut9zNNWv87AS12++kOWsIZmIJk5idpAjUuxRI8ZjMHNZft9+jaARVVAyVFIzdegfLMJZIs8edaqGN1egERJ4FPU64aFosyymHLSmSAnVEIa7SB04BbWvE19kbRTdUG/Q1Q== cardno:000500006946"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAING/fy5GuSKLFcA/EY30jFDB9MOIoMQbSmaXY/FLjf2s cardno:15_146_736"
  ];

  system.stateVersion = "23.05";
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
````

## File: homelab-subflake/hosts/hydrogen/seed/hardware-configuration.nix
````nix
{ lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];
  boot = {
    initrd = {

      availableKernelModules = [
        "ahci"
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkForce true;
}
````

## File: homelab-subflake/hosts/lanthanum/configuration/default.nix
````nix
{ lib, ... }:
{
  # Boot
  boot = {
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_scsi"
        "sd_mod"
        "sr_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ ];
    extraModulePackages = [ ];
    loader.grub = {
      enable = true;
      device = "/dev/sda";
    };
  };

  # File systems
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
    ];
  };

  # Misc
  system.stateVersion = "24.05";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkForce true;
  services.qemuGuest.enable = true;

  # Imports
  imports = [ ];
}
````

## File: homelab-subflake/hosts/lanthanum/seed/default.nix
````nix
/**
  Seed config for helium.

  Lanthanum will be launched as a VM.
*/
{ config, pkgs, ... }:
let
  hostName = "lanthanum";
  stateVersion = "24.05";
in
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];

  boot.loader.grub = {
    enable = true;
    # device = "/dev/sda";
  };

  networking = {
    inherit hostName;
    wireless.enable = false;
    firewall.allowedTCPPorts = [ 22 ];
  };

  time.timeZone = "America/Los_Angeles";

  # Access
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };
  users.users.root.openssh.authorizedKeys.keys = config.my-data.settings.SSHKeys;

  environment.systemPackages = with pkgs; [
    vim
    gitMinimal
  ];

  sound.enable = false;
  system = {
    inherit stateVersion;
  };

  # Enable flakes
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
````

## File: homelab-subflake/hosts/lanthanum/seed/disk-config.nix
````nix
# Simple layout
{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02"; # for grub MBR
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                label = "nixos";
                mountOptions = [
                  "defaults"
                  "noatime"
                ];
              };
            };
          };
        };
      };
    };
  };
}
````

## File: homelab-subflake/hosts/lanthanum/seed/hardware-configuration.nix
````nix
{ lib, ... }:
{
  boot = {
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_scsi"
        "sd_mod"
        "sr_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ ];
    extraModulePackages = [ ];
  };

  networking.useDHCP = lib.mkDefault true;

  virtualisation.hypervGuest.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
````

## File: homelab-subflake/hosts/lithium/configuration/default.nix
````nix
{ inputs, pkgs, lib, ... }:
{
  # Boot
  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "usbhid"
        "usb_storage"
      ];
      kernelModules = [
        "xhci_pci"
        "usbhid"
        "usb_storage"
      ];
    };
    # Necessary for USB boot(!)
    kernelPackages = pkgs.linuxPackages_rpi4;
    blacklistedKernelModules = [
      "bluetooth"
      "btusb"
    ];
    kernelParams = [
      "8250.nr_uarts=1"
      "console=ttyAMA0,115200"
      "console=tty1"
      "boot.shell_on_fail"
      # ```
      # ID 152d:0578 JMicron Technology Corp. / JMicron USA Technology Corp.
      # JMS578 SATA 6Gb/s
      # ```
      # Is prone to I/O errors if using `uas` driver. This
      # forces the `usb-storage` one
      "usb-storage.quirks=152d:0578:u"
    ];
    consoleLogLevel = 7;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };
  boot.kernel.sysctl."vm.mmap_rnd_bits" = lib.mkForce 18;

  # File systems
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
    options = [ "noatime" ];
  };
  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  # Misc
  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "22.05";

  # Imports
  imports = [
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
  ];
}
````

## File: homelab-subflake/hosts/neon/configuration/default.nix
````nix
{ lib, ... }:
let
  settings.bootDevice = "/dev/nvme0n1p1";
  settings.rootDevice = "/dev/disk/by-label/nixos";
  settings.swapDevice = "/dev/disk/by-uuid/84cc88b6-3ea2-42fa-a606-c83346e08e56";
in
{
  # Boot
  boot = {
    initrd.availableKernelModules = [
      "vmd"
      "xhci_pci"
      "ahci"
      "nvme"
      "usb_storage"
      "usbhid"
      "sd_mod"
    ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/boot" = {
    device = settings.bootDevice;
    fsType = "vfat";
  };

  # File systems
  fileSystems."/" = {
    device = settings.rootDevice;
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
    ];
  };
  swapDevices = [ { device = settings.swapDevice; } ];

  # Misc
  system.stateVersion = "24.11";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkForce true;
  systemd.network.links."10-phy-lan".linkConfig.WakeOnLan = "magic";

  # Imports
  imports = [
    ./hw-acceleration.nix
    ./storage.nix
  ];

}
````

## File: homelab-subflake/hosts/neon/configuration/hardware-configuration.nix
````nix
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "vmd"
    "xhci_pci"
    "ahci"
    "nvme"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
````

## File: homelab-subflake/hosts/neon/configuration/hw-acceleration.nix
````nix
/**
  Node has:
  - UHD Graphics 730
  - ARC 310 GPU

  The point is to use this machine for transcoding.

  References:

  - https://jellyfin.org/docs/general/administration/hardware-acceleration/intel
  - https://github.com/intel/media-delivery/blob/master/doc/benchmarks/intel-data-center-gpu-flex-series/intel-data-center-gpu-flex-series.rst
*/
{
  pkgs,
  inputs,
  ...
}:
{
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    intel-ocl
    vpl-gpu-rt
    intel-compute-runtime
    intel-vaapi-driver
  ];

  imports = [
    inputs.nixos-hardware.nixosModules.common-gpu-intel
  ];
  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
  hardware.intelgpu.driver = "xe";

  # Arc GPU support needs fresh kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.systemPackages = [
    # `lspci`
    pkgs.pciutils
    # `vainfo` lives here
    pkgs.libva-utils
    # for `intel_gpu_top`
    pkgs.intel-gpu-tools
  ];

  # Needed for correct Arc driver?
  hardware.enableRedistributableFirmware = true;
}
````

## File: homelab-subflake/hosts/neon/configuration/storage.nix
````nix
{ pkgs, ... }:
let
  disks = {
    one = "8cc1e2d2-1ff9-4145-bbac-74a3056a242f";
  };
in
{
  boot.kernelParams = [ "libata.force=noncq" ];

  fileSystems."/data" = {
    fsType = "btrfs";
    device = "/dev/disk/by-uuid/${disks.one}";
    options = [
      "defaults"
      "noatime"
    ];
  };

  fileSystems."/vms" = {
    fsType = "btrfs";
    device = "/dev/disk/by-label/VMs";
    options = [
      "defaults"
      "noatime"
    ];
  };

  environment.systemPackages = [
    pkgs.btrfs-progs
    pkgs.smartmontools
    pkgs.iotop
  ];

  /**
    This node runs on `PRIME B760M` motherboard. A PWM fan is connected to
    `CHA_FAN1` header and cools down the HDDs.

    `hddfancontrol` will ramp the fan up when they are over 30C and max the
    speed out at 50 degrees.

    `/sys/class/hwmon/` value was found using `pwmconfig` from `lm-sensors`
    package.

    Apparently for `pwmconfig` to see this fan, the bios must have the speed
    set to maximum.

    One thing to note is that the `/sys/class/hwmon/hwmon*` numbering depends
    on the order of the kernel modules. Better point `hddfancontrol` at the
    target of `readlink -f` which will point to the actual device.
  */
  boot.kernelModules = [ "nct6775" ];
  services.hddfancontrol = {
    enable = true;

    settings.harddrives = {
      disks = disks |> builtins.attrValues |> map (x: "/dev/disk/by-uuid/${x}");
      pwmPaths = [
        "/sys/devices/platform/nct6775.656/hwmon/hwmon1/pwm1:255:0"
      ];
      logVerbosity = "DEBUG";
    };
  };

  systemd.services.hddfancontrol-harddrives.serviceConfig.Restart = "on-failure";
}
````

## File: homelab-subflake/hosts/neon/seed/default.nix
````nix
{ config, pkgs, ... }:
let
  settings.hostName = "neon";
in
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];
  boot.loader = {

    # Use the systemd-boot EFI boot loader.
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    inherit (settings) hostName;
    wireless.enable = false;
    firewall.allowedTCPPorts = [ 22 ];
  };

  time.timeZone = "America/Los_Angeles";
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  environment.systemPackages = with pkgs; [
    vim
    gitMinimal
  ];
  system.stateVersion = "24.11"; # Did you read the comment?
  users.users.root.openssh.authorizedKeys.keys = config.my-data.settings.SSHKeys;
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
````

## File: homelab-subflake/hosts/neon/seed/disk-config.nix
````nix
let
  settings.mainDevice = "/dev/nvme0n1";
in
{
  disko.devices.disk.main = {
    device = settings.mainDevice;
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          type = "EF00";
          size = "500M";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };
        root = {
          size = "64G";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
            mountOptions = [
              "defaults"
              "noatime"
            ];
          };
        };
        plainSwap = {
          size = "8G";
          content.type = "swap";
        };
      };
    };
  };

}
````

## File: homelab-subflake/hosts/neon/seed/hardware-configuration.nix
````nix
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "vmd"
    "xhci_pci"
    "ahci"
    "nvme"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
````

## File: homelab-subflake/hosts/nitrogen/configuration/default.nix
````nix
{ lib, inputs, ... }:
{
  # Boot
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      availableKernelModules = [
        "ahci"
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
  };

  # File systems
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/8b8ed380-e3b4-4c64-95fa-d3c14acd0f1e";
      fsType = "ext4";
      options = [ "noatime" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/4ECC-8FD1";
      fsType = "vfat";
    };
  };
  swapDevices = [ { device = "/dev/disk/by-uuid/51449286-d2ba-4f22-b951-0697af940370"; } ];

  # Misc
  system.stateVersion = "23.11";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkForce true;
  networking.wireless.enable = false;
  # Imports
  imports = [
    inputs.nixos-hardware.nixosModules.framework-11th-gen-intel
  ];
}
````

## File: homelab-subflake/hosts/nitrogen/seed/default.nix
````nix
{ lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];
  boot.loader = {

    # Use the systemd-boot EFI boot loader.
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nitrogen";
    wireless.enable = false;
    firewall.allowedTCPPorts = [ 22 ];
  };

  time.timeZone = "America/Los_Angeles";
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  sound.enable = false;

  environment.systemPackages = with pkgs; [
    vim
    gitMinimal
  ];
  system.stateVersion = "23.11"; # Did you read the comment?
  users.users.root.openssh.authorizedKeys.keys = lib.homelab.getSettings.SSHKeys;
}
````

## File: homelab-subflake/hosts/nitrogen/seed/disk-config.nix
````nix
{
  disko.devices = {
    disk = {
      nvme0n1 = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "64G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
            plainSwap = {
              size = "8G";
              content.type = "swap";
            };
          };
        };
      };
    };
  };
}
````

## File: homelab-subflake/hosts/nitrogen/seed/hardware-configuration.nix
````nix
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];
  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
````

## File: homelab-subflake/hosts/oxygen/configuration/default.nix
````nix
/**
  NixOS configuration for oxygen.
*/
{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Boot
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      availableKernelModules = [
        "ahci"
        "xhci_pci"
        "ehci_pci"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [
      "kvm-intel"
      "wl"
    ];
  };

  # File systems
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
      options = [ "noatime" ];
    };
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };
  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  # Misc
  system.stateVersion = "23.11";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkForce true;

  systemd.services.console-blank = {
    enable = true;
    description = "Blank and powerdown the monitor";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.util-linux}/bin/setterm --blank 1 --powerdown 1";
      TTYPath = "/dev/console";
      StandardOutput = "tty";
    };
    wantedBy = [ "multi-user.target" ];
    environment = {
      TERM = "linux";
    };
  };

  services.logind.settings.Login.HandleLidSwitch = "ignore";

  # Imports
  imports = [
    # nixos-hardware.nixosModules.common-gpu-intel
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    ./interrupt-disable.nix
    ./hw-acceleration.nix
    ./network.nix
  ];

  # Hardware acceleration
  # hardware.opengl = {
  #   enable = true;
  #   driSupport = true;
  #   driSupport32Bit = true;
  #   # extraPackages = [
  #   #   pkgs.intel-vaapi-driver
  #   #   pkgs.intel-media-driver
  #   #   pkgs.vaapiVdpau
  #   #   pkgs.libvdpau-va-gl
  #   # ];
  # };
  # environment.sessionVariables = {
  #   LIBVA_DRIVER_NAME = "i965";
  # };
}
````

## File: homelab-subflake/hosts/oxygen/configuration/hw-acceleration.nix
````nix
/**
  Enables hardware acceleration for ffmpeg transcoding.

  Source: https://wiki.nixos.org/wiki/Nvidia
*/
{ config, ... }:
{

  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Newest drivers will complain:
    # NVRM: The NVIDIA GeForce GTX 870M GPU installed in this system is
    # NVRM:  supported through the NVIDIA 470.xx Legacy drivers. Please
    # NVRM:  visit http://www.nvidia.com/object/unix.html for more
    # NVRM:  information.  The 565.77 NVIDIA driver will ignore
    # NVRM:  this GPU.  Continuing probe...
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

    modesetting.enable = true;

    powerManagement.enable = false;

    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    # nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
  };
}
````

## File: homelab-subflake/hosts/oxygen/configuration/interrupt-disable.nix
````nix
/**
  This machine has some weird bug which causes one CPU to be ~60% occupied by a kworker/kacipd.

  A workaround is to disable that interrupt. This hasn't (so far) caused any problems but I honestly
  have no idea. Very experimental, don't use in a random copypaste.
*/
{ pkgs, lib, ... }:
let
  disableInterruptScript = pkgs.writeShellApplication {
    name = "disable-buggy-interrupt";
    runtimeInputs = [
      pkgs.gnugrep
      pkgs.coreutils-full
      pkgs.gawk
    ];
    text = ''
      # INTERRUPT_TARGET=$(grep -Ev '^[ ]*0'  /sys/firmware/acpi/interrupts/gpe?? | sort --field-separator=: --key=2 --numeric --reverse | head -1 | awk -F: '{print $1}')
      INTERRUPT_TARGET="/sys/firmware/acpi/interrupts/gpe13";
      # Hack: always succeed
      echo disable > "$INTERRUPT_TARGET" || true
    '';
  };
in
{
  systemd.services.disable-buggy-interrupt = {
    enable = true;
    description = "Kill CPU-hogging interrupt";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = lib.getExe disableInterruptScript;
    };
    wantedBy = [ "multi-user.target" ];
  };
}
````

## File: homelab-subflake/hosts/oxygen/configuration/network.nix
````nix
/**
  Oxygen-specific network config.
*/
{ lib, ... }:
{
  imports = [ ];

  networking = {

    wireless.enable = lib.mkForce false;

    defaultGateway.interface = "phy-lan"; # This may be needed by default...
  };
}
````

## File: homelab-subflake/hosts/sodium/configuration/default.nix
````nix
{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  # Boot
  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "usbhid"
        "usb_storage"
      ];
      kernelModules = [
        "xhci_pci"
        "usbhid"
        "usb_storage"
      ];
    };
    kernelParams = [
      "8250.nr_uarts=1"
      "console=ttyAMA0,115200"
      "console=tty1"
      "boot.shell_on_fail"
    ];
    consoleLogLevel = 7;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };
  boot.kernel.sysctl."vm.mmap_rnd_bits" = lib.mkForce 18;

  # Misc
  system.stateVersion = "25.05";

  hardware.enableRedistributableFirmware = false;
  hardware.firmware = [ pkgs.raspberrypiWirelessFirmware ];
  # Imports
  imports = [
    inputs.nixos-hardware.nixosModules.raspberry-pi-3
    ./impermanence.nix
  ];

  networking.wireless.extraConfig = ''
    country=US
    p2p_disabled=1
  '';
}
````

## File: homelab-subflake/hosts/sodium/configuration/impermanence.nix
````nix
{
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [
      "defaults"
      "size=25%"
      "mode=755"
    ];
  };

  users.users.root.hashedPasswordFile = "/persist/secrets/root-password";

  age.identityPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ];

  fileSystems."/persist" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
    neededForBoot = true;
  };

  fileSystems."/nix" = {
    device = "/persist/nix";
    fsType = "none";
    options = [ "bind" ];
    neededForBoot = true;
  };

  fileSystems."/boot" = {
    device = "/persist/boot";
    fsType = "none";
    options = [ "bind" ];
  };

  # This is Raspberry Pi 3B with 1 gig of memory
  # Using zramSwap + mounting `/tmp` and `/var/tmp` back to the physical
  # device
  zramSwap.enable = true;
  zramSwap.memoryPercent = 50;

  fileSystems."/tmp" = {
    device = "/persist/tmp";
    fsType = "none";
    options = [ "bind" ];
  };

  fileSystems."/var/tmp" = {
    device = "/persist/var/tmp";
    fsType = "none";
    options = [ "bind" ];
  };

  # Persistence config
  environment.persistence."/persist" = {
    enable = true;
    directories = [
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
    ];
    files = (
      [
        "/etc/machine-id"
      ]
      ++ (lib.mapCartesianProduct ({ cypher, ext }: "/etc/ssh/ssh_host_${cypher}_key${ext}") {
        cypher = [
          "ed25519"
          "rsa"
        ];
        ext = [
          ""
          ".pub"
        ];
      })
    );
  };
}
````

## File: homelab-subflake/hosts/sodium/seed/default.nix
````nix
/**
  1. `nix build .#nixosConfigurations.sodium-seed.config.system.build.images.sd-card`
  2. `zstdcat ./result/sd-image/nixos-image-sd-card-*-aarch64-linux.img.zst | sudo dd of=/dev/sdb bs=4M status=progress conv=fsync`
  3. Insert the SD card
  4. Boot
  5. Wait
  6. Wait until reboot OK
  7. `ssh` in, grab public key
  8. Set up root password
  9. Edit `hosts.ncl`, optionally add host to `services.ncl` for Wi-Fi
  10. Generate secrets
  11. Don't forget to add WireGuard public keys to git
  12. `deploy-sodium --hostname <IP from DHCP> --magic-rollback false --auto-rollback false`

      Rollbacks are not needed since the network config will change dramatically
*/
{
  config,
  lib,
  ...
}:
let
  # Importing the old way since (as of writing) `lib` does not have `homelab`
  # attribute, so I can't use custom functions here.
  inherit (config) my-data;
in
{
  # Set up SSHd
  systemd.services.sshd.wantedBy = lib.mkForce [ "multi-user.target" ];
  users.users.root.openssh.authorizedKeys.keys = my-data.settings.SSHKeys;
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "prohibit-password";
    openFirewall = true;
  };

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  networking.hostName = "sodium";

  nix = {
    extraOptions = "experimental-features = nix-command flakes";
  };
  system.stateVersion = "25.05";
}
````

## File: homelab-subflake/lib/healthchecks-systemd-module/default.nix
````nix
/**
  Creates a systemd service template
*/
{ lib, pkgs, ... }:
{
  systemd.services."ping-healthchecks@" = {
    serviceConfig.ExecStart =
      let
        ping-hc = pkgs.writeShellApplication {
          name = "ping-hc";
          runtimeInputs = [ pkgs.curl ];
          text =
            let
              baseUrl = "https://${lib.homelab.getServiceFqdn "healthchecks"}/ping/${(lib.homelab.getServiceConfig "healthchecks").pingKey}";
            in
            # bash
            ''
              # If I ever want to debug this:
              # env
              # set -x

              # Source: https://passbe.com/2022/healthchecks-io-systemd-checks/
              # Parse the template variable into actions
              IFS=:
              read -r SLUG ACTION <<< "$1"

              # Remove "@localhost" from the SLUG
              SLUG="''${SLUG%%@localhost}"

              if [ "$ACTION" = "start" ]; then
                LOGS=""
                EXIT_CODE="start"
                # Auto provision the check by slug
                curl \
                  --fail `#fail fast on server errors` \
                  --show-error --silent `#show error <=> it fails` \
                  --max-time 10 \
                  --retry 3 \
                  "${baseUrl}/$SLUG/$EXIT_CODE?create=1"
              elif [ "$ACTION" = "success" ]; then
                # Signal success without collecting logs
                curl \
                  --fail `#fail fast on server errors` \
                  --show-error --silent `#show error <=> it fails` \
                  --max-time 10 \
                  --retry 3 \
                  "${baseUrl}/$SLUG"
              else
                # Signal failure and collect logs

                # Get logs of last invocation
                # Source:
                # https://serverfault.com/questions/768901/is-there-a-way-to-make-journalctl-show-logs-from-the-last-time-foo-service-ran
                # Slight tweak -- needs InactiveExitTimestamp ?
                LAST_TIMESTAMP=$(systemctl show --property InactiveExitTimestamp --value "$MONITOR_UNIT")
                LOGS=$(journalctl --no-pager -u "$MONITOR_UNIT" --since "$LAST_TIMESTAMP")

                # This will be 1 in case of error
                # Healthchecks supports "fail" or 1 for this:
                # https://healthchecks.io/docs/signaling_failures/
                EXIT_CODE=''${MONITOR_EXIT_STATUS:-"fail"}
                curl \
                  --fail `#fail fast on server errors` \
                  --show-error --silent `#show error <=> it fails` \
                  --max-time 10 \
                  --retry 3 \
                  --data-raw "$LOGS" \
                  "${baseUrl}/$SLUG/$EXIT_CODE"
              fi
            '';
        };
      in
      "${lib.getExe ping-hc} %i";
  };
}
````

## File: homelab-subflake/lib/local-lib.nix
````nix
/** A grab bag of helper functions.

It will probably need to be broken down into:

1. Pure helper functions (`pluck`)
2. Homelab producing functions (`mkLuksMount`)
*/
{ lib, ... }:
let
  luksOpts = "noauto,nofail,_netdev";
  inherit (lib)
    pipe
    splitString
    reverseList
    concatStringsSep
    ;
in
{
  recursiveMerge =
    attrList:
    with lib;
    let
      f =
        attrPath:
        zipAttrsWith (
          n: values:
          if tail values == [ ] then
            head values
          else if all isList values then
            unique (concatLists values)
          else if all isAttrs values then
            f (attrPath ++ [ n ]) values
          else
            last values
        );
    in
    f [ ] attrList;

  # * Creates the systemd mount that waits for network to be active
  mkLuksMount =
    { device_name, target }:
    {
      what = "/dev/mapper/${device_name}";
      where = target;
      requires = [ "systemd-cryptsetup@${device_name}.service" ];
      options = luksOpts;
    };
  # * Makes a /etc/crypttab entry for a generated LUKS unit so that it's activated after SSH
  mkCryptTab =
    { device_name, UUID }:
    ''
      ${device_name} UUID=${UUID} - ${luksOpts}
    '';

  /**
    Plucks an attribute from nested attrset, returing a list of values

    # Type

    ```
    pluck :: String -> AttrSet -> [ Any ]
    ```

    # Examples
    ```nix
    pluck "foo" { a = { foo = 1; }; b = { bar = 2; }; c = { foo = 3; }; }
    => [ 1 3 ]
    ```
  */
  pluck =
    attrName: attrSet:
    lib.catAttrs attrName
      # Strip the outer keys and turn into a list
      (builtins.map (x: x.value) (lib.attrsets.attrsToList attrSet));

  /**
    Useful for reversing the octets of an IP address.

    # Type
    ```
    splitReverseJoin :: String -> String
    ```

    # Example
    ```nix
    splitReverseJoin "192.168.1.2"
    => "2.1.168.192"
    ```
  */
  splitReverseJoin =
    x:
    pipe x [
      (splitString ".")
      reverseList
      (concatStringsSep ".")
    ];

  mkHealthCheckModules = import ./healthchecks-systemd-module;

  /**
    Interface to produce backup modules for a service.

    Implementation note:

    `mkBkp` is a function that, when called, passes its arguments to the function
    defined in the imported file. This, in turn, produces a dynamic module.
  */
  mkBkp = lib.modules.importApply ./mk-bkp.nix;

  mkIscsi = lib.modules.importApply ./mk-iscsi.nix;

  # Construct imports from specified directory directory by auto-including all files
  mkImportsFromDir =
    path:
    if builtins.pathExists path then
      path |> lib.fileset.fileFilter (file: file.hasExt "nix") |> lib.fileset.toList
    else
      [ ];

  /**
    Capitalizes first letter of the string.

    # Type

    ```
    uppercase :: String -> String
    ```

    # Examples
    ```nix
    uppercase "foo"
    => "Foo"
    ```
  */
  uppercase =
    str:
    let
      firstLetter = builtins.substring 0 1 str;
      remainder = builtins.substring 1 (str |> builtins.stringLength) str;
    in
    (firstLetter |> lib.toUpper) + remainder;
}
````

## File: homelab-subflake/lib/manifest-options.nix
````nix
# NixOS module options schema for service manifests
# Defines structure and merge behavior of manifests

{ lib, ... }:
let
  inherit (lib) mkOption types;

  # Custom type: singular path syntax, multiple definitions merge into list
  # Public: module = ./service.nix;
  # Private: module = ./private.nix;
  # Result: module = [./service.nix ./private.nix]
  modulePathType = types.mkOptionType {
    name = "modulePath";
    description = "module path (multiple definitions merge into list)";
    check = v: types.path.check v;
    merge = loc: defs: lib.flatten (map (def: def.value) defs);
  };

  endpointType = types.submodule {
    options = {
      port = mkOption {
        type = types.port;
        description = "Port number";
      };
      protocol = mkOption {
        type = types.enum [
          "tcp"
          "udp"
          "https"
        ];
        description = "Protocol type";
      };
      path = mkOption {
        type = types.str;
        default = "/";
        description = "URL path for https endpoints";
      };
    };
  };

  linkType = types.submodule {
    options = {
      name = mkOption {
        type = types.str;
        description = "Display name";
      };
      description = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
      icon = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
      absoluteURL = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
      path = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
      service = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
    };
  };

  # Single metrics exporter configuration
  metricsExporterType = types.submodule {
    options = {
      impl = mkOption {
        type = types.nullOr types.path;
        default = null;
        description = "Metrics implementation module";
      };
      endpoint = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = "Which endpoint exposes metrics (inferred if null)";
      };
      path = mkOption {
        type = types.str;
        default = "/metrics";
        description = "Metrics path on the endpoint";
      };
    };
  };

  observabilityType = types.submodule {
    options = {
      metrics = mkOption {
        type = types.attrsOf metricsExporterType;
        default = { };
        description = ''
          Metrics exporters for this service/trait.

          Each exporter is exposed at:
            https://<service>.metrics.<domain>/metrics/<exporterName>

          Naming convention:
            - Single exporter: Use "main" as the exporter name
            - Multiple exporters: Use descriptive names (app, geo, infra, etc.)

          Examples:
            - Single exporter:
              metrics.main = { impl = ./metrics.nix; };

            - Multiple exporters:
              metrics.app = { impl = ./app-metrics.nix; endpoint = "web"; };
              metrics.geo = { impl = ./geo-metrics.nix; endpoint = "geo-exporter"; };

          Migration-friendly: Adding exporters doesn't break existing scrape configs.
        '';
      };
      alerts = mkOption {
        type = types.nullOr (
          types.submodule {
            options = {
              # Kept for compatibility, change later
              grafanaImpl = mkOption {
                type = types.nullOr types.path;
                default = null;
                description = "Path to Grafana alerting rules definition";
              };
              prometheusImpl = mkOption {
                type = types.nullOr types.path;
                default = null;
                description = "Path to Prometheus alerting rules definition";
              };
            };
          }
        );
        default = null;
      };
      logging = mkOption {
        type = types.nullOr (
          types.submodule {
            options = {
              impl = mkOption {
                type = types.nullOr types.path;
                default = null;
              };
            };
          }
        );
        default = null;
      };
      dashboards = mkOption {
        type = types.nullOr (
          types.submodule {
            options = {
              enable = mkOption {
                type = types.bool;
                default = false;
                description = "Whether to provision a Grafana dashboard for this service";
              };
              mod = mkOption {
                type = types.nullOr types.path;
                default = null;
                description = ''
                  NixOS module evaluated on the Grafana host that installs the
                  dashboard JSON under /etc/grafana-dashboards/.
                '';
              };
            };
          }
        );
        default = null;
        description = "Grafana dashboard provisioning configuration";
      };

      probes = mkOption {
        type = types.nullOr (
          types.submodule {
            options = {
              enable = mkOption {
                type = types.bool;
                default = false;
                description = "Whether Prometheus probing is enabled for this service";
              };
              ssl = mkOption {
                type = types.bool;
                default = false;
                description = "Whether probing checks an SSL certificate (enables auto-generated cert expiry alerts)";
              };
              impl = mkOption {
                type = types.nullOr types.path;
                default = null;
                description = "NixOS module enabling the probe exporter on the service host";
              };
              prometheusImpl = mkOption {
                type = types.nullOr types.path;
                default = null;
                description = "NixOS module configuring Prometheus scrape jobs for this service's probes";
              };
            };
          }
        );
        default = null;
      };
    };
  };

in
{
  options = {
    module = mkOption {
      type = types.nullOr modulePathType;
      default = null;
      description = "Main service module path (auto-collects for mixed services)";
    };

    endpoints = mkOption {
      type = types.attrsOf endpointType;
      default = { };
      description = "Service network endpoints";
      # Merge behavior: union of attrsets (automatic)
    };

    endpointsConfig = mkOption {
      type = types.nullOr types.anything;
      default = null;
      description = "Optional module to configure service ports (receives endpoints as arg)";
    };

    firewall = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = "Custom firewall module";
    };

    sslProxyConfig = mkOption {
      type = types.nullOr types.anything;
      default = null;
      description = "SSL proxy configuration";
    };

    observability = mkOption {
      type = observabilityType;
      default = { };
      description = ''
        Observability configuration.

        Metrics exporters merge across public/private manifests.
        Each exporter gets path-based routing at:
          https://<service>.metrics.<domain>/metrics/<exporterName>
      '';
    };

    backups = mkOption {
      type = types.nullOr (
        types.submodule {
          options = {
            paths = mkOption {
              type = types.listOf types.str;
              default = [ ];
              description = "Paths to include in the backup";
            };
            exclude = mkOption {
              type = types.listOf types.str;
              default = [ ];
              description = "Paths to exclude from the backup";
            };
            schedule = mkOption {
              type = types.str;
              default = "daily";
              description = "Backup schedule (OnCalendar value)";
            };
            localDB = mkOption {
              type = types.bool;
              default = false;
              description = "Also dump and back up the local PostgreSQL database";
            };
            localOnly = mkOption {
              type = types.bool;
              default = false;
              description = "Do not store backups remotely (local restic server only)";
            };
            serviceName = mkOption {
              type = types.nullOr types.str;
              default = null;
              description = "Override the service name used in backup job IDs and secrets (useful for abbreviated names)";
            };
            backupName = mkOption {
              type = types.nullOr types.str;
              default = null;
              description = "Override the backup name if only that needs to be abbreviated.";
            };
            extraConfig = mkOption {
              type = types.nullOr types.path;
              default = null;
              description = ''
                Path to a NixOS module for additional backup customizations.
                Called via importApply with { serviceName } as static arg.
                Use this to override fields like dynamicFilesFrom or repository.
              '';
            };
          };
        }
      );
      default = null;
      description = "Backup configuration. Parameters are forwarded to mkBkp; extraConfig allows per-service overrides.";
    };

    storage = mkOption {
      type = types.nullOr types.anything;
      default = null;
      description = "Storage configuration";
    };

    dashboard = mkOption {
      type = types.nullOr (
        types.submodule {
          options = {
            category = mkOption {
              type = types.str;
              description = "Dashboard category";
            };
            links = mkOption {
              type = types.listOf linkType;
              default = [ ];
              description = "Dashboard links";
              # Lists automatically concatenate when merged
            };
          };
        }
      );
      default = null;
      description = "Dashboard integration";
    };

    documentation = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = "Path to service documentation (README.md)";
    };

    multiInstance = mkOption {
      type = types.bool;
      default = false;
      description = "Whether service supports multiple instances";
    };

    database = mkOption {
      type = types.nullOr (types.submodule {
        options = {
          create = mkOption {
            type = types.bool;
            default = false;
            description = "Signal to the db service to create a PostgreSQL user and database for this service";
          };
          impl = mkOption {
            type = types.nullOr types.path;
            default = null;
            description = "NixOS module configuring the service's database client connection";
          };
        };
      });
      default = null;
      description = "Database configuration";
    };

    srvLib = mkOption {
      type = types.nullOr types.anything;
      default = null;
      description = "Service-specific utilities";
    };
  };
}
````

## File: homelab-subflake/lib/merge-manifests.nix
````nix
# Merges public and private service manifests using NixOS module system

{ lib }:
let
  inherit (builtins) trace filter;

  manifestOptionsModule = import ./manifest-options.nix;

  # Takes unevaluated manifest modules and returns evaluated attrset
  mergeServiceManifests =
    publicServices: privateServices:
    let
      allNames = lib.unique (builtins.attrNames publicServices ++ builtins.attrNames privateServices);

      mergeOne =
        serviceName:
        let
          publicMod = publicServices.${serviceName} or null;
          privateMod = privateServices.${serviceName} or null;

          hasPublic = publicMod != null;
          hasPrivate = privateMod != null;

          # Debug logging
          _ = trace "[merge-manifests] ${serviceName}: public=${toString hasPublic} private=${toString hasPrivate}" null;

          # Build module list
          modules = filter (m: m != null) [
            manifestOptionsModule
            publicMod
            privateMod
          ];

          # Evaluate modules with serviceName in scope
          evaluated = lib.evalModules {
            inherit modules;
            specialArgs = { inherit serviceName; };
          };

          # Extract the manifest attrset
          manifestData = evaluated.config;

          # Auto-assemble .default field from manifest components

          # module is either null or a list (custom merge collected multiple definitions)
          allModules = if manifestData.module == null then [ ] else lib.toList manifestData.module;

          # endpointsModule: custom impl if provided
          endpointsModule =
            if manifestData.endpointsConfig != null then
              if lib.isAttrs manifestData.endpointsConfig && !lib.isFunction manifestData.endpointsConfig then
                let
                  _ = builtins.trace "WARNING: [${serviceName}] endpointsConfig is a set, not a function - passing through as-is" null;
                in
                manifestData.endpointsConfig
              else
                manifestData.endpointsConfig manifestData.endpoints
            else
              null;

          # firewallModule: custom or auto-generated
          firewallModule =
            if manifestData.firewall != null then
              manifestData.firewall
            else if manifestData.endpoints != { } then
              # Auto-generate firewall from endpoints
              { lib, self, ... }:
              let
                endpointData = builtins.removeAttrs manifestData.endpoints [ "impl" ];
                ports = lib.mapAttrsToList (_: ep: ep.port) endpointData |> lib.unique;
              in
              {
                imports = [
                  (self.serviceModules.ssl-proxy.srvLib.mkBackboneInnerFirewallRules {
                    inherit lib ports;
                  })
                ];
              }
            else
              null;

          # observabilityImpls: only local concerns (metrics, logging, probes)
          # NOT alerts - that's a remote concern evaluated on grafana/prometheus hosts

          # Collect all metrics exporter implementations (optional, may be empty attrset)
          metricsImpls =
            manifestData.observability.metrics
            |> lib.mapAttrsToList (_: exporter: exporter.impl or null)
            |> lib.filter (impl: impl != null);

          observabilityImpls = lib.flatten [
            metricsImpls
            (lib.optional (
              manifestData.observability.logging.impl or null != null
            ) manifestData.observability.logging.impl)
            (lib.optional (
              manifestData.observability.probes.impl or null != null
            ) manifestData.observability.probes.impl)
          ];

          # Auto-generate firewall rules for metrics endpoints (infrastructure concern)
          # Metrics are always scraped by prometheus from backbone-inner, regardless of
          # custom service firewall rules.
          metricsFirewallModule =
            if manifestData.observability.metrics != { } then
              (
                { lib, self, ... }:
                let
                  # Extract ports from metrics exporters by looking up their endpoint references
                  metricsPorts =
                    lib.mapAttrsToList (
                      exporterName: exporter:
                      let
                        # Determine which endpoint this exporter uses
                        endpointName =
                          if exporter.endpoint != null then
                            exporter.endpoint
                          else
                          # Infer: look for endpoints.metrics first, then fall back to first endpoint
                          if manifestData.endpoints ? metrics then
                            "metrics"
                          else
                            null;
                        endpoint = if endpointName != null then manifestData.endpoints.${endpointName} or null else null;
                      in
                      if endpoint != null then endpoint.port else null
                    ) manifestData.observability.metrics
                    |> lib.filter (p: p != null)
                    |> lib.unique;
                in
                if metricsPorts != [ ] then
                  self.serviceModules.ssl-proxy.srvLib.mkBackboneInnerFirewallRules {
                    inherit lib;
                    ports = metricsPorts;
                  }
                else
                  { }
              )
            else
              null;

          # Auto-assemble backup modules from structured backups config
          backupsModules =
            if manifestData.backups == null then
              [ ]
            else
              let
                bkp = manifestData.backups;
                bkpServiceName = if bkp.serviceName != null then bkp.serviceName else serviceName;
              in
              lib.flatten [
                (lib.localLib.mkBkp {
                  inherit (bkp)
                    paths
                    exclude
                    schedule
                    localDB
                    localOnly
                    backupName
                    ;
                  serviceName = bkpServiceName;
                })
                (lib.optional (bkp.extraConfig != null) (
                  lib.modules.importApply bkp.extraConfig { serviceName = bkpServiceName; }
                ))
              ];

          # storage impl
          extractImpl = attr: if lib.isAttrs attr && attr ? impl then attr.impl else null;

          defaultModules =
            lib.flatten [
              allModules
              endpointsModule
              firewallModule
              metricsFirewallModule
              observabilityImpls
              backupsModules
              (extractImpl (manifestData.storage or { }))
              (extractImpl (manifestData.database or { }))
            ]
            |> filter (v: v != { } && v != null);

        in
        manifestData
        // {
          # Add auto-assembled default field
          default = defaultModules;

          # Add source tracking for debug
          _sources = {
            inherit hasPublic hasPrivate;
          };
        };

    in
    lib.genAttrs allNames mergeOne;

in
{
  inherit mergeServiceManifests;
}
````

## File: homelab-subflake/lib/mk-bkp.nix
````nix
/**
  Function that produces a module implementing backups.

  If the `localDB` variable is true, restic will perform a local database dump
  and back it up too.
*/
{
  paths,
  exclude ? [ ],
  schedule ? "daily",
  localDB ? false, # If set to true, adds `pg_dumpall` script to backup the result of the DB dump
  localOnly ? false, # If set to true, do not store backups remotely
  backupName ? null,
  serviceName,
}:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  inherit (config.networking) hostName;

  actualBackupName = if builtins.isNull backupName then serviceName else backupName;

  # Define retention policy
  pruneOpts = [
    "--keep-daily 7"
    "--keep-weekly 4"
    "--keep-monthly 6"
  ];

  dumpScript =
    if localDB then
      ''
        ${pkgs.util-linux}/bin/logger "Starting DB dump for ${serviceName}"
        ${lib.getExe pkgs.sudo} -u postgres ${config.services.postgresql.package}/bin/pg_dumpall | ${lib.getExe pkgs.gzip} > "$RUNTIME_DIRECTORY/pg_dumpall.sql.gz"
        ${pkgs.util-linux}/bin/logger "DB dump done"
      ''
    else
      null;

  dumpFile = if localDB then "pg_dumpall.sql.gz" else null;
in
{
  imports = [
    lib.localLib.mkHealthCheckModules
    {

      /**
        Local backup is done to an instance of restic server running in the lab.

        The mechanism is REST:
        https://restic.readthedocs.io/en/latest/030_preparing_a_new_repo.html#rest-server
      */
      services.restic.backups = {
        "${serviceName}-localbackup" = {
          inherit exclude paths pruneOpts;
          timerConfig.OnCalendar = schedule;
          # If `localDB` is set, `dynamicFilesFrom` will list the dump
          dynamicFilesFrom = if localDB then "ls $RUNTIME_DIRECTORY/${dumpFile}" else null;

          backupPrepareCommand = dumpScript;

          repository = "rest:https://${lib.homelab.getServiceFqdn "restic-server"}/${hostName}/${actualBackupName}";
          package = (
            ''
              export RESTIC_REST_PASSWORD=$(cat $CREDENTIALS_DIRECTORY/restic_server_password)
              ${lib.getExe pkgs.restic} $@
            ''
            |> pkgs.writeShellScriptBin "restic"
          );
          initialize = true;
          passwordFile = config.age.secrets."${serviceName}-bkp-password".path;
        };
      };

      systemd.services."restic-backups-${serviceName}-localbackup" = {
        onFailure = [ "ping-healthchecks@${serviceName}-local-backup:failure.service" ];
        onSuccess = [ "ping-healthchecks@${serviceName}-local-backup:success.service" ];
        wants = [ "ping-healthchecks@${serviceName}-local-backup:start.service" ];

        serviceConfig = {
          Environment = [ "RESTIC_REST_USERNAME=${hostName}" ];
          LoadCredential = [
            "restic_server_password:${config.age.secrets.restic-client-htpasswd.path}"
          ];
        };
      };
    }
    (lib.optionalAttrs (!localOnly) {
      /**
        Remote backup is done to rsync.net by default. The implementation is
        largely the same as local backup, except for special handling of the SSH
        key.

        The mechanism is sFTP:
        https://restic.readthedocs.io/en/latest/030_preparing_a_new_repo.html#sftp
      */
      services.restic.backups."${serviceName}-rsync-net-backup" = {
        inherit exclude paths pruneOpts;

        # If `localDB` is set, `dynamicFilesFrom` will list the dump
        dynamicFilesFrom = if localDB then "ls $RUNTIME_DIRECTORY/${dumpFile}" else null;

        repository = "sftp:${(lib.homelab.getService "rsync-net").settings.sftpConnectString}:${actualBackupName}";
        timerConfig.OnCalendar = schedule;

        backupPrepareCommand = dumpScript;

        # The package override ensures that the service has access to the SSH key
        # when it's running
        package =
          let
            userKnownHostsFile =
              lib.homelab.getServiceConfig "rsync-net"
              |> builtins.getAttr "knownFingerPrint"
              |> pkgs.writeText "rsync-net-fingerprint";
          in
          (
            ''
              ${lib.getExe pkgs.restic} \
              -o sftp.args="-i $CREDENTIALS_DIRECTORY/rsync-net-ssh-key -o UserKnownHostsFile=${userKnownHostsFile}" \
              $@
            ''
            |> pkgs.writeShellScriptBin "restic"
          );
        initialize = true;
        passwordFile = config.age.secrets."${serviceName}-bkp-password".path;
      };

      systemd.services."restic-backups-${serviceName}-rsync-net-backup" = {
        onFailure = [ "ping-healthchecks@${serviceName}-rsync-net-backup:failure.service" ];
        onSuccess = [ "ping-healthchecks@${serviceName}-rsync-net-backup:success.service" ];
        wants = [ "ping-healthchecks@${serviceName}-rsync-net-backup:start.service" ];

        serviceConfig.LoadCredential = [ "rsync-net-ssh-key:${config.age.secrets.rsync-net-ssh.path}" ];
      };
    })
  ];
}
````

## File: homelab-subflake/lib/mk-iscsi.nix
````nix
{
  targetIqn,
  mountPoint,
  lun ? 1,
  part ? null,
  fsType ? "ext4",
  mountOptions ? [
    "_netdev"
    "nofail"
    "noatime"
  ],
  initiatorName,
}:
{
  pkgs,
  lib,
  ...
}:
let
  devicePath =
    [
      "/dev/disk/by-path/ip-"
      ip
      ":3260-iscsi-"
      targetIqn
      "-lun-"
      (toString lun)
      (lib.optionalString (!builtins.isNull part) "-part${toString part}")
    ]
    |> lib.concatStrings;
  serviceName = "iscsi-login-${builtins.replaceStrings [ "/" ] [ "-" ] mountPoint}";
  ip = "nas" |> lib.flip lib.homelab.getHostIpInNetwork "lan";
in
{
  services.openiscsi = {
    enable = true;
    name = initiatorName;
    discoverPortal = ip;
  };
  environment.systemPackages = [ pkgs.openiscsi ];
  boot.kernelModules = [ "iscsi_tcp" ];

  systemd.services."${serviceName}" = {
    description = "Login to iSCSI target ${targetIqn}";
    after = [
      "network.target"
      "iscsid.service"
    ];
    wants = [ "iscsid.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStartPre = "${pkgs.openiscsi}/bin/iscsiadm -m discovery -t sendtargets -p ${ip}";
      ExecStart = "${pkgs.openiscsi}/bin/iscsiadm -m node -T ${targetIqn} -p ${ip} --login";
      ExecStop = "${pkgs.openiscsi}/bin/iscsiadm -m node -T ${targetIqn} -p ${ip} --logout";
      Restart = "on-failure";
      RemainAfterExit = true;
      SuccessExitStatus = 15; # `ISCSI_ERR_SESS_EXISTS`, so that restarts are considered OK.
    };
    wantedBy = [ "multi-user.target" ];
  };

  fileSystems."${mountPoint}" = {
    device = devicePath;
    fsType = fsType;
    options = mountOptions;
  };
}
````

## File: homelab-subflake/services/alert-manager/alertmanager-config/ntfy.nix
````nix
{ rcvName, address }:
{
  route.routes = [
    {
      receiver = rcvName;
      # Dispatch non-critical alerts only
      matchers = [ "alertLevel!=\"Emergency\"" ];
    }
  ];
  receivers = [
    {
      name = rcvName;
      webhook_configs = [
        {
          url = "http://${address}/hook";
          max_alerts = 3;
          send_resolved = true;
        }
      ];
    }
  ];
}
````

## File: homelab-subflake/services/alert-manager/alertmanager-config/telegram.nix
````nix
{ rcvName, chat_id, ... }:
{
  receivers = [
    {
      name = rcvName;
      telegram_configs = [
        {
          send_resolved = true;
          bot_token_file = "\${TG_KEY_PATH}";
          inherit chat_id;
          message =
            let
              labelsToHide = [
                "__alert_rule_uid__"
                "__alert_rule_namespace_uid__"
                "__name__"
                "grafana_folder"
              ];
              annotationsToHide = [
                "__dashboardUid__"
                "__orgId__"
                "__panelId__"
                "__value_string__"
                "__values__"
              ];
              concat =
                list:
                list
                # Encase in quotes
                |> (map (x: "\"${x}\""))
                # Effectively concatenate with spaces
                |> toString;
            in
            ''
              {{ define "conciseAlerts" }}{{ range . }}Labels:
              {{ range (.Labels.Remove (stringSlice ${concat labelsToHide})).SortedPairs }} - {{ .Name}} = {{ .Value }}
              {{ end }}Annotations:
              {{ range (.Annotations.Remove (stringSlice ${concat annotationsToHide})).SortedPairs }} - {{ .Name }} = {{ .Value }}
              {{ end }}Source: {{ .GeneratorURL }}
              {{ end }}
              {{ end }}

              {{ if gt (len .Alerts.Firing) 0 }}
              Alerts Firing:
              {{ template "conciseAlerts" .Alerts.Firing }}
              {{ end }}
              {{ if gt (len .Alerts.Resolved) 0 }}
              Alerts Resolved:
              {{ template "conciseAlerts" .Alerts.Resolved }}
              {{ end }}
            '';
        }
      ];
    }
  ];

}
````

## File: homelab-subflake/services/alert-manager/functional/ntfy-sh.nix
````nix
/**
  Set up `alertmanager-ntfy` to send `Alertmanager` alerts to `ntfy-sh` instance.

  Docs:
  https://github.com/alexbakker/alertmanager-ntfy
*/
{ lib, ... }:
let
  address = "127.0.0.1:8000";
  settings.priorityCutoff = (lib.homelab.getSrvLib "grafana").constants.severityNumMap.Error;
in
{
  services.prometheus.alertmanager-ntfy = {
    enable = true;
    settings = {
      http.addr = address;
      ntfy = {
        baseurl = "https://${lib.homelab.getServiceFqdn "ntfy-sh"}";
        notification = {
          topic = "homelab-alerts";
          priority = ''
            labels._alertLevelNum > ${toString settings.priorityCutoff} ? "default" : "low"
          '';
          tags = [
            {
              tag = "+1";
              condition = ''status == "resolved"'';
            }
            {
              tag = "rotating_light";
              condition = ''status == "firing"'';
            }
          ];
          templates = {
            title = ''{{ if eq .Status "resolved" }}Resolved: {{ end }}{{ index .Annotations "summary" }}'';
            description = ''{{ index .Annotations "description" }}'';
            headers.X-Click = ''{{ index .Annotations "dashboard" }}'';
          };
        };
      };
    };
  };
}
````

## File: homelab-subflake/services/alert-manager/functional/telegram.nix
````nix
/**
  Sets up Telegram bot integration for Alert manager.
*/
{ config, ... }:
{
  # Use the secret as a credential
  systemd.services.alertmanager.serviceConfig = {
    LoadCredential = [ "tg-key:${config.age.secrets.telegram-bot-key-vt-s-bot.path}" ];
    Environment = [ "TG_KEY_PATH=%d/tg-key" ];
  };
}
````

## File: homelab-subflake/services/alert-manager/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  services.prometheus.alertmanager = {
    port = endpoints.web.port;
    listenAddress = lib.homelab.getServiceInnerIP "alert-manager";
  };
}
````

## File: homelab-subflake/services/alert-manager/alertmanager.nix
````nix
{ lib, ... }:
let
  defaultReceiver = "telegram";
  receiverConfigs = {
    ntfy = import ./alertmanager-config/ntfy.nix {
      rcvName = "ntfy";
      address = "127.0.0.1:8000";
    };
    telegram = import ./alertmanager-config/telegram.nix {
      rcvName = defaultReceiver;
      chat_id = lib.homelab.getSettings.Telegram.Vladimir;
    };
  };
in
{
  services.prometheus.alertmanager.enable = true;

  imports = lib.localLib.mkImportsFromDir ./functional;

  # Looks like there is some bug with merging the `services.prometheus.alertmanager.config`...
  # Merging by hand:
  services.prometheus.alertmanager.configuration = lib.localLib.recursiveMerge (
    [
      {
        route = {
          group_by = [ "resource" ];
          group_wait = "30s";
          group_interval = "1m";
          repeat_interval = "4h";
          receiver = defaultReceiver;
        };
      }
    ]
    ++ (receiverConfigs |> builtins.attrValues)
  );
}
````

## File: homelab-subflake/services/alert-manager/manifest.nix
````nix
{ ... }:
{
  module = ./alertmanager.nix;

  endpoints.web = {
    port = 9093;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  # TODO: ACL to only allow humans & `srv:grafana`

  # TODO: implement "watch the watcher". Periodic pings into `srv:healthchecks`?
  # observability = { };

  dashboard = {
    category = "Admin";
    links = [
      {
        icon = "alertmanager";
        name = "Alert manager";
      }
    ];
  };
}
````

## File: homelab-subflake/services/auth-dns/functional/zones/backbone-special.nix
````nix
/**
  One service currently has a backbone-inner domain name. I will need to
  remove this post-migration, but will leave in for now so nothing is broken.
*/

{ lib, ... }:
let
  inherit (lib.homelab.getManifest "auth-dns") srvLib;
  srv = lib.homelab.getService "log-concentrator";
in
{
  services.nsd.zones.${"backbone-inner" |> lib.homelab.getNetwork |> builtins.getAttr "domain"}.data =
    srvLib.mkARecord (srv |> builtins.getAttr "domain") (
      srv |> builtins.getAttr "onHost" |> lib.flip lib.homelab.getHostIpInNetwork "backbone-inner"
    )
    |> lib.mkAfter;
}
````

## File: homelab-subflake/services/auth-dns/functional/zones/db-home-arpa-special.nix
````nix
/**
  Some special rules for the DB network
*/
{ lib, ... }:
let
  inherit (lib.homelab.getManifest "auth-dns") srvLib;
  srv = lib.homelab.getService "db";
in
{
  services.nsd.zones.${"db" |> lib.homelab.getNetwork |> builtins.getAttr "domain"}.data =
    srvLib.mkARecord (srv |> builtins.getAttr "domain")
      (srv |> builtins.getAttr "onHost" |> lib.flip lib.homelab.getHostIpInNetwork "db") |> lib.mkAfter;
}
````

## File: homelab-subflake/services/auth-dns/functional/zones/metrics-zone.nix
````nix
/**
  Creates a zone that will house all metrics for all services.

  For each service instance with observability.metrics in its manifest, creates
  A records pointing to all SSL proxy hosts for redundancy and load balancing.

  Example (with 2 SSL proxies):
  ```
    dns-1.metrics.<publicDomain>  IN A  192.168.1.100
    dns-1.metrics.<publicDomain>  IN A  192.168.1.101
    dns-2.metrics.<publicDomain>  IN A  192.168.1.100
    dns-2.metrics.<publicDomain>  IN A  192.168.1.101
  ```
*/

{ lib, ... }:
let
  inherit (lib.homelab.getManifest "auth-dns") srvLib;
  domain = "metrics.${lib.homelab.getSettings.publicDomainName}";

  # Pre-compute manifests with metrics to avoid repeated lookups
  manifestsWithMetrics =
    lib.homelab.getManifests
    |> lib.filterAttrs (_: manifest: manifest.observability.metrics or { } != { })
    |> lib.attrNames
    |> (map (name: lib.nameValuePair name true))
    |> lib.listToAttrs;
in
{
  services.nsd.zones.${domain}.data =
    [
      # Zone header
      (srvLib.mkZoneBase {
        inherit domain;
        nameserverIPs = (lib.homelab.networks.get "backbone-inner").dnsServers;
      })

      # A records for each service instance with metrics, pointing to all SSL proxies
      (lib.mapCartesianProduct ({ a, b }: srvLib.mkCNAMERecord a b) {
        a =
          # This goes back to service _instances_
          lib.homelab.services.getAll
          |> lib.filterAttrs (_: svcData: manifestsWithMetrics ? ${svcData.moduleName or ""})
          |> lib.attrNames;
        b =
          # Prometheus is the one that will be using this; Prometheus can talk over backbone-inner
          lib.homelab.hosts.getWithService "ssl-proxy"
          |> map (lib.flip lib.homelab.hosts.getFQDNInNetwork "backbone-inner");
      })
    ]
    |> lib.flatten
    |> lib.concatStringsSep "\n";
}
````

## File: homelab-subflake/services/auth-dns/functional/zones/network-zones.nix
````nix
/**
  For all networks, create a zone containing the hosts
*/
{ lib, ... }:

let
  inherit (lib.homelab.getManifest "auth-dns") srvLib;
in
{
  services.nsd.zones =
    [
      "lan"
      "db"
      "mgmt"
      "backbone"
      "backbone-inner"
    ]
    |> map srvLib.mkZoneForNet
    |> lib.mergeAttrsList;
}
````

## File: homelab-subflake/services/auth-dns/functional/zones/reverse-zones.nix
````nix
/**
  Create reverse zones for all IPs
*/
{ lib, ... }:
let
  inherit (lib.localLib) splitReverseJoin;
  inherit (lib.homelab.getManifest "auth-dns") srvLib;
in
{

  services.nsd.zones =
    lib.homelab.networks.getAll
    |> lib.mapAttrs' (
      netName: net:
      let
        reverseZone = net.subnet |> splitReverseJoin |> (it: "${it}.in-addr.arpa");
        ptrRecords =
          net.hostsInNetwork
          |> builtins.attrValues
          |> map (it: {
            inherit (it) fqdn;
            domainName = it.ipAddress |> lib.removePrefix "${net.subnet}." |> splitReverseJoin;
          })
          |> map (it: srvLib.mkPTRRecord it.domainName it.fqdn);
      in
      lib.nameValuePair reverseZone {
        data =
          [
            # Zone header with network-specific nameservers
            (srvLib.mkReverseZoneBase {
              inherit reverseZone;
              forwardDomain = net.domain;
              nameserverIPs = net.dnsServers;
            })

            # PTR records
            ptrRecords
          ]
          |> lib.flatten
          |> lib.concatStringsSep "\n";
      }
    );
}
````

## File: homelab-subflake/services/auth-dns/functional/zones/srv-zone.nix
````nix
/**
  Implements the `srv.*` zone.

  All instances of managed services get two records:

  1. `CNAME` record that points the record to one of:
  - to the HOST where the service is located if this service does not have SSL termination
  - points the record to the host itself if there is no SSL termination

  2. `_i.` `TXT` record that tells which host the instance is located at.
*/
{ lib, ... }:
let
  zone = lib.homelab.getSettings.publicDomainName;
  inherit (lib.homelab.getManifest "auth-dns") srvLib;
in
{
  services.nsd.zones.${zone}.data =
    [
      # Zone header
      (srvLib.mkZoneBase {
        domain = zone;
        nameserverIPs = "lan" |> lib.homelab.getNetwork |> builtins.getAttr "dnsServers";
      })

      # CNAME records for SSL proxied services
      (
        (lib.homelab.getManifest "ssl-proxy").srvLib.getProxiedServices
        |> map lib.homelab.services.get
        |> builtins.catAttrs "domain"
        # Future proof: do this for all SSL proxies
        |> (
          it:
          lib.mapCartesianProduct ({ a, b }: srvLib.mkCNAMERecord a b) {
            a = it;
            b =
              lib.homelab.hosts.getWithService "ssl-proxy"
              |> map (lib.flip lib.homelab.hosts.getFQDNInNetwork "lan"); # TODO: revisit "`lan`" here. I don't remember how exactly unbound views work with this
          }
        )
      )

      # CNAME records for non-SSL proxied services
      (
        lib.homelab.services.getAll
        |> lib.filterAttrs (n: v: !builtins.elem "alien" v.groups || n == "nfs") # Exclude alien services, except NFS. # TODO: Maybe come up with a better separation of truly remote services vs NFS on NAS that I just don't declaratively manage
        |> lib.filterAttrs (_: v: !builtins.elem "nonWeb" v.groups) # exclude non-web services (DNS, DHCP, etc.)
        |> lib.filterAttrs (_: v: !v.centralSSL) # remove services covered above
        |> lib.mapAttrsToList (
          _: v:
          let
            # - Certain services (NTP/MQTT, etc.) need to be in LAN so they can
            #   serve non-VPN clients. They have `"lan"` in `networkAccess`.
            # - Other services (database) don't need to be in LAN, they are
            #   accessible only over VPN.
            # - If a service is present in both and handles its own termination
            #   (`keycloak`) – LAN wins for non-VPN clients, but unbound (`dns`)
            #   should handle the split view
            targetNet = if builtins.elem "lan" v.networkAccess then "lan" else "backbone-inner";
          in
          srvLib.mkCNAMERecord v.domain (v.onHost |> lib.flip lib.homelab.hosts.getFQDNInNetwork targetNet)
        )
      )

      # `_i.<service>` record that tells me where a service is
      (
        lib.homelab.services.getAll
        |> lib.filterAttrs (n: v: !builtins.elem "alien" v.groups || n == "nfs") # See above
        # Create a `TXT` record for _all_ services. If a service does not have a domain, fall back to service name
        |> lib.mapAttrsToList (n: v: srvLib.mkRecord "TXT" "_i.${v.domain or n}" ''"real-host=${v.onHost}"'')
        )
    ]
    |> lib.flatten
    |> lib.concatStringsSep "\n";
}
````

## File: homelab-subflake/services/auth-dns/functional/nodata-clients.nix
````nix
/**
  Apple devices ask for a set of records to do discovery. I am not interested
  in providing a response.

  Default is NXDomain, but I don't want to pollute my logs.

  Solution: add 'IN A' replies. Questions should come for `PTR` records, so the
  answer will be `NODATA`.
*/
{ lib, ... }:
let
  nodataRecords = [
    "lb._dns-sd._udp"
    "db._dns-sd._udp"
    "b._dns-sd._udp"
    "_aaplcache2._tcp" # If I ever get to running the Apple update cache – this will need to be updated
  ];
  lan = lib.homelab.getNetwork "lan";
  mainDNS = lan |> builtins.getAttr "dnsServers" |> builtins.head;
  data =
    nodataRecords
    # Add A record. No `PTR` record => `NODATA` reply
    |> map (it: "${it} IN A ${mainDNS}")
    # Turn into a single string
    |> lib.concatLines
    # Add header and footer
    |> (it: "; NODATA for Apple queries\n${it}\n");
in
{
  services.nsd.zones = lib.mkAfter {
    # Main zone
    ${lan |> lib.getAttr "domain"}.data = lib.mkAfter data;
    # Reverse zone (`in-addr.arpa.`)
    ${
      lan
      |> lib.getAttr "subnet"
      |> lib.localLib.splitReverseJoin
      |> (it: "${it}.in-addr.arpa")
    }.data = lib.mkAfter ''
      ; Dummy record to fix weird queries from Apple devices
      0 IN PTR network.home.arpa.
      0 IN NS ns1.home.arpa.

    '';
  };
}
````

## File: homelab-subflake/services/auth-dns/non-functional/alerts.nix
````nix
{ serviceName, ... }:
{
  Emergency = [
    {
      title = "Auth DNS is down";
      expr = ''absent(up{resource="srv:${serviceName}"}) or up{resource="srv:${serviceName}"} == 0'';
      description = "NSD is not responding. Authoritative DNS is unavailable.";
    }
  ];
  Error = [
    {
      title = "High SERVFAIL rate";
      expr = ''rate(nsd_queries_by_rcode_total{rcode="SERVFAIL",resource="srv:${serviceName}"}[5m]) / rate(nsd_queries_total{resource="srv:${serviceName}"}[5m]) > 0.05'';
      description = "More than 5% of responses are SERVFAIL. NSD may be misconfigured or zones may be broken.";
    }
    {
      title = "Answer TX failures";
      expr = ''rate(nsd_answers_tx_failed_total{resource="srv:${serviceName}"}[5m]) > 0'';
      description = "NSD is failing to send answers to clients.";
    }
  ];
  Warning = [
    {
      title = "Queries dropped";
      expr = ''rate(nsd_queries_dropped_total{resource="srv:${serviceName}"}[5m]) > 0'';
      description = "NSD is dropping incoming queries. Server may be overloaded.";
    }
    {
      title = "No primary zones loaded";
      expr = ''nsd_zones_primary{resource="srv:${serviceName}"} == 0'';
      description = "NSD has no primary zones loaded. All zone data may have been lost.";
    }
  ];
}
````

## File: homelab-subflake/services/auth-dns/non-functional/endpoints-config.nix
````nix
endpoints: { ... }:
{
  services.nsd = {
    port = endpoints.dns.port;
    # NSD listens on localhost only for DNS queries - Unbound forwards authoritative queries to it
    interfaces = [ "127.0.0.1" ];
  };

}
````

## File: homelab-subflake/services/auth-dns/non-functional/metrics.nix
````nix
/**
  Observability module for `auth_dns` (NSD).

  The configuration (metrics-interface, metrics-port) is handled in
  endpoints-config.nix to access the endpoints data.

  The firewall rules are auto-generated from the metrics endpoint
  on the backbone-inner interface.
*/
{ lib, ... }:
let
  port = 8081; # TODO: make metrics implementation also an auto-applied function of endpoints like endpoints-config?
in
{
  # This module exists primarily to signal that metrics are enabled in the manifest
  # If metrics endpoint exists, configure it on the backbone-inner interface
  services.nsd.extraConfig = ''
    server:
        metrics-enable: yes
        metrics-interface: ${lib.homelab.getOwnIpInNetwork "backbone-inner"}
        metrics-port: ${toString port}
  '';

  services.nsd.bind8Stats = true;
}
````

## File: homelab-subflake/services/auth-dns/auth-dns.nix
````nix
/**
  Base NSD configuration for authoritative DNS.

  Sets up:
  - NSD daemon configuration
  - Base zone structures (SOA and NS records)
  - Imports functional modules that populate zone records
*/
{ lib, ... }:
{
  imports = lib.localLib.mkImportsFromDir ./functional;

  services.nsd = {
    enable = true;
    # Port and interface configuration in non-functional/endpoints-config.nix
  };
}
````

## File: homelab-subflake/services/auth-dns/manifest.nix
````nix
{ lib, ... }:
{
  module = ./auth-dns.nix;

  # NSD (authoritative DNS) listens on localhost:5454
  # NOT exposed externally - Unbound (recursive DNS) forwards queries to NSD
  endpoints = {
    dns = {
      port = 5454;
      protocol = "udp";
    };
    metrics = {
      port = 8081;
      protocol = "tcp";
    };
  };

  # Configure NSD port and listen interface from endpoints
  endpointsConfig = import ./non-functional/endpoints-config.nix;

  # No firewall - NSD only listens on localhost, no network firewall rules needed

  multiInstance = true;

  # Zone generation library
  srvLib = import ./srv-lib.nix { inherit lib; };

  observability = {
    metrics.main = {
      impl = ./non-functional/metrics.nix;
      endpoint = "metrics";
    };
    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };

  documentation = ./README.md;

  # No backups - zones are auto-generated from config
  # No SSL proxy - raw DNS protocol
  # No dashboard - backend service
}
````

## File: homelab-subflake/services/auth-dns/srv-lib.nix
````nix
{ lib, ... }:
let
  # DNS record formatters
  mkRecord =
    recordType: domainName: recordValue:
    "${domainName} IN ${recordType} ${recordValue}";
  mkARecord = mkRecord "A";
  mkCNAMERecord = domainName: recordValue: (mkRecord "CNAME" domainName (recordValue + "."));
  mkPTRRecord = domainName: recordValue: (mkRecord "PTR" domainName (recordValue + "."));
in
rec {
  # Re-export record formatters for internal use
  inherit mkRecord mkARecord mkCNAMERecord mkPTRRecord;

  /**
    Get nameserver IPs for zone SOA/NS records.

    Returns IPs of DNS (Unbound) service instances, since that's what clients query.
    `auth-dns` (NSD) is localhost-only and not directly accessible to clients.
    Returns list of IPs (e.g., ["192.168.1.1", "192.168.1.2"])
  */
  getNameserverIPs =
    { lib }:
    lib.homelab.services.getAll
    |> lib.filterAttrs (_name: svcData: (svcData.moduleName or _name) == "dns")
    |> lib.attrNames
    |> map lib.homelab.getServiceInnerIP
    |> lib.take 2; # Typically `ns1` and `ns2`

  /**
    Create base zone configuration with SOA and NS records.

    Arguments:
      `domain`: Zone domain name (e.g., "srv.example.com")
      `nameserverIPs`: List of nameserver IPs for NS records
      `ttl`: Zone TTL (default 1800)

    Returns NSD zone config with SOA/NS headers as a string
  */
  mkZoneBase =
    {
      domain,
      nameserverIPs,
      ttl ? 604800,
    }:
    ''
      $ORIGIN ${domain}.
      $TTL ${toString ttl}

      @ IN SOA ns1.${domain}. admin.${domain}. (
          ${builtins.readFile ./serial} ; serial number
          28800 ; Refresh
          7200 ; Retry
          864000 ; Expire
          604800 ; Min TTL
          )

      ${lib.concatLines (lib.imap1 (i: _ip: "IN NS ns${toString i}.${domain}.") nameserverIPs)}

      ${lib.concatLines (lib.imap1 (i: ip: "ns${toString i} IN A ${ip}") nameserverIPs)}

    '';

  /**
    Returns a list of forward zones that `auth-dns` manages

    Note: Reverse zones (in-addr.arpa) are handled separately via getReverseZones.
  */
  getZones =
    let
      srvDomain = lib.homelab.getSettings.publicDomainName;
    in
    [
      srvDomain
      "metrics.${srvDomain}"
    ]
    ++
      # Assemble domains from networks
      (
        lib.homelab.networks.getAll
        |> builtins.mapAttrs (_: builtins.getAttr "domain")
        |> builtins.attrValues
      );

  /**
    Returns reverse zone information for DNS forwarding.

    Returns an attrset with:
      - reverseZones: List of specific reverse zones (e.g., ["1.168.192.in-addr.arpa."])
      - parentZones: List of parent zones that need nodefault (e.g., ["168.192.in-addr.arpa."])
  */
  getReverseZones =
    let
      inherit (lib.localLib) splitReverseJoin;

      # Get all network subnets and convert to reverse format
      # e.g., "192.168.1" -> "1.168.192"
      subnetsInArpa =
        lib.homelab.networks.getAll
        |> lib.mapAttrsToList (_: net: net.subnet)
        |> map splitReverseJoin;

      # Create specific reverse zones for each network
      # e.g., "1.168.192.in-addr.arpa."
      reverseZones = map (x: "${x}.in-addr.arpa.") subnetsInArpa;

      # Create parent zones that need nodefault
      parentZones =
        subnetsInArpa
        |> map (lib.splitString ".")
        |> map (parts:
          if (lib.elemAt parts 1) == "168" && (lib.elemAt parts 2) == "192" then
            "168.192.in-addr.arpa."
          else if (lib.last parts) == "10" then
            "10.in-addr.arpa."
          else if (lib.elemAt parts 1) == "16" && (lib.elemAt parts 2) == "172" then
            "16.172.in-addr.arpa."
          else
            # For other networks, use the parent class
            "${lib.concatStringsSep "." (lib.tail parts)}.in-addr.arpa."
        )
        |> lib.unique;
    in
    {
      inherit reverseZones parentZones;
    };

  mkZoneForNet =
    netName:
    let
      net = lib.homelab.getNetwork netName;
      zone = net.domain;
    in
    {
      ${zone}.data =
        [
          (mkZoneBase {
            domain = zone;
            nameserverIPs = net |> builtins.getAttr "dnsServers";
          })

          # Records for hosts
          (
            net.hostsInNetwork
            |> lib.mapAttrsToList (_: v: { inherit (v) hostName ipAddress; })
            |> map ({ hostName, ipAddress }: mkARecord hostName ipAddress)
          )

        ]
        |> lib.flatten
        |> lib.concatStringsSep "\n";
    };

  /**
    Create base reverse zone configuration with SOA and NS records.

    Arguments:
      `reverseZone`: Reverse zone name (e.g., "1.168.192.in-addr.arpa")
      `forwardDomain`: Forward domain for this network (e.g., "home.arpa")
      `nameserverIPs`: List of nameserver IPs for NS records
      `ttl`: Zone TTL (default 604800)

    Returns NSD reverse zone config with SOA/NS headers as a string
  */
  mkReverseZoneBase =
    {
      reverseZone,
      forwardDomain,
      nameserverIPs,
      ttl ? 604800,
    }:
    ''
      $ORIGIN ${reverseZone}.
      $TTL ${toString ttl}

      @ IN SOA ns1.${forwardDomain}. admin.${forwardDomain}. (
          ${builtins.readFile ./serial} ; Serial
          28800      ; Refresh
          7200       ; Retry
          864000     ; Expire
          ${toString ttl} )   ; Minimum TTL

      ${lib.concatLines (lib.imap1 (i: _: "IN NS ns${toString i}.${forwardDomain}.") nameserverIPs)}

    '';
}
````

## File: homelab-subflake/services/cyberchef/non-functional/endpoints-config.nix
````nix
_:
{ lib, ... }:
{
  services.nginx.virtualHosts.${(lib.homelab.getService "cyberchef").fqdn}.listenAddresses =
    lib.homelab.getOwnIpInNetwork "backbone-inner" |> lib.singleton;
}
````

## File: homelab-subflake/services/cyberchef/non-functional/ssl.nix
````nix
{ serviceName, port }:
{
  config,
  lib,
  self,
  ...
}:
self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
  inherit
    config
    lib
    port
    serviceName
    ;
  allowiFrame = true;
}
````

## File: homelab-subflake/services/cyberchef/cyberchef.nix
````nix
{ pkgs, lib, ... }:
let
  srvName = "cyberchef";
in
{
  config.services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts.${(lib.homelab.getService srvName).fqdn} = {
      forceSSL = false;
      extraConfig = ''
        proxy_buffering off;
      '';
      locations."/" = {
        root = "${pkgs.cyberchef}/share/cyberchef";
      };
    };
  };
}
````

## File: homelab-subflake/services/cyberchef/default.nix
````nix
# Shim to load the manifest
{
  imports = (import ./manifest.nix).default;
}
````

## File: homelab-subflake/services/cyberchef/manifest.nix
````nix
{ lib, serviceName, ... }:
{
  module = ./cyberchef.nix;

  endpoints.web = {
    port = 80;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; port = 80; };

  dashboard = {
    category = "Dev";
    links = [
      {
        icon = "cyberchef";
        name = "Cyberchef";
      }
    ];
  };

  documentation = ./README.md;
}
````

## File: homelab-subflake/services/db/functional/gather-databases-from-manifests.nix
````nix
/**
  Provisions PostgreSQL users and databases for all services that declare
  `database.create = true` in their manifest.

  Uses `ensureUsers` with `ensureDBOwnership` — passwords are managed out of
  band per service.
*/
{ lib, ... }:
{
  imports =
    lib.homelab.getManifests
    |> lib.filterAttrs (_: m: m.database != null && m.database.create)
    |> lib.mapAttrsToList (srvName: _: {
      services.postgresql = {
        ensureDatabases = [ srvName ];
        ensureUsers = [
          {
            name = srvName;
            ensureDBOwnership = true;
          }
        ];
      };
    });
}
````

## File: homelab-subflake/services/db/non-functional/alerts.nix
````nix
{ serviceName, ... }:
{
  lib,
  ...
}:
{
  Emergency = [
    {
      title = "DB service down";
      query = "pg_up";
    }
    {
      title = "DB disk almost full";
      # Relies on the fact that there is a single DB instance
      query =
        let
          label = "mountpoint=~\"/var/lib/postgresql.*\", host=\"${
            serviceName |> lib.homelab.getServiceHost
          }\"";
        in
        "(((node_filesystem_avail_bytes{${label}} * 100) / node_filesystem_size_bytes{${label}}) < 10)";
      addVector = true;
    }
  ];
}
````

## File: homelab-subflake/services/db/non-functional/endpoints-config.nix
````nix
endpoints:
{ ... }:
{
  services.prometheus.exporters.postgres.port = endpoints.metrics.port;
  # Database will listen on all IPs, using `./firewall.nix` and ACL (`pg_hba`) to limit clients
  # TODO: move ACL to dedicated file?
}
````

## File: homelab-subflake/services/db/non-functional/firewall.nix
````nix
# TODO: Allow only specific clients in, based on service dependencies
{ config, ... }:
{
  networking.firewall.allowedTCPPorts = [ config.services.postgresql.settings.port ];
}
````

## File: homelab-subflake/services/db/non-functional/metrics.nix
````nix
{
  lib,
  config,
  pkgs,
  ...
}:
{
  age.secrets.db-exporter-password.owner = config.services.prometheus.exporters.postgres.user;

  services.prometheus.exporters.postgres = {
    enable = true;
    openFirewall = false;
    environmentFile = pkgs.writeTextFile {
      name = "postgres-exporter.env";
      text = ''
        DATA_SOURCE_URI=localhost:5432/postgres?sslmode=disable
        DATA_SOURCE_USER=postgres_exporter
        DATA_SOURCE_PASS_FILE=${config.age.secrets.db-exporter-password.path}
      '';
    };
  };

  # Force disable DATA_SOURCE_NAME, using DATA_SOURCE_URI
  systemd.services.prometheus-postgres-exporter.environment = {
    DATA_SOURCE_NAME = lib.mkForce "";
  };
}
````

## File: homelab-subflake/services/db/non-functional/storage.nix
````nix
{ config, lib, ... }:
let
  luks = {
    device_name = "luks_db";
    UUID = "1e4cc767-a3f7-4990-9398-27670aed1a29";
  };
in
{
  systemd.services.postgresql.unitConfig.RequiresMountsFor = lib.mkOptionDefault [
    config.services.postgresql.dataDir
  ];
  environment.etc."crypttab".text = lib.localLib.mkCryptTab { inherit (luks) device_name UUID; };
  systemd.mounts = [
    (lib.localLib.mkLuksMount {
      inherit (luks) device_name;
      target = config.services.postgresql.dataDir;
    })
  ];
}
````

## File: homelab-subflake/services/db/manifest.nix
````nix
{ ... }:
{
  module = ./postgresql.nix;

  endpoints = {
    db = {
      port = 5432;
      protocol = "tcp";
    };
    metrics = {
      port = 9187;
      protocol = "tcp";
    };
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;
  firewall = ./non-functional/firewall.nix;
  # TODO: firewall

  observability = {
    metrics.main = {
      impl = ./non-functional/metrics.nix;
      endpoint = "metrics";
    };
  };

  storage.impl = ./non-functional/storage.nix;

  backups = {
    paths = [ ];
    localDB = true;
  };
}
````

## File: homelab-subflake/services/db/postgresql.nix
````nix
# NixOS module to configure PostgreSQL backend for all services at home
{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.homelab) getNetwork;

  dbNet = getNetwork "db";
  mgmtNet = getNetwork "mgmt";
in
{
  # Secrets
  age.secrets.psql-ssl-cert = {
    inherit (config.age.secrets.ssl-cert) file;
    owner = config.systemd.services.postgresql.serviceConfig.User;
    group = config.systemd.services.postgresql.serviceConfig.Group;
  };
  age.secrets.psql-ssl-key = {
    inherit (config.age.secrets.ssl-key) file;
    owner = config.systemd.services.postgresql.serviceConfig.User;
    group = config.systemd.services.postgresql.serviceConfig.Group;
  };

  # Service configuration
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_14; # TODO: Migrate to 15
    enableTCPIP = true;
    ensureUsers = [
      {
        name = "sysop";
        ensureClauses.superuser = true;
      }
      {
        name = "pgadmin";
        ensureClauses.superuser = true;
      }
    ];
    settings = {
      ssl = "on";
      ssl_cert_file = config.age.secrets.psql-ssl-cert.path;
      ssl_key_file = config.age.secrets.psql-ssl-key.path;
    };
    authentication = ''
      # TYPE  DATABASE        USER            ADDRESS                 METHOD
      # Secure sysop login
      hostssl    all             sysop           ${mgmtNet.settings.managementNodesSubNet}.0/24             scram-sha-256
      hostssl    all             sysop           all                     reject

      # DB network
      host    all             all             ${dbNet.subnet}.0/24          scram-sha-256

      # backbone inner network
      host    all             all             ${(lib.homelab.getNetwork "backbone-inner").prefix}           scram-sha-256
    '';
  };

  # DB configuration for services
  imports = [
    ./functional/gather-databases-from-manifests.nix
    # TODO: migrate to database.create = true in their manifests
    {
      services.postgresql = {
        ensureDatabases = [
          "nextcloud"
          "docspell"
        ];
        ensureUsers = [
          {
            name = "nextcloud";
            ensureDBOwnership = true;
          }
          {
            name = "docspell";
            ensureDBOwnership = true;
          }
        ];
      };
    }
  ];
}
````

## File: homelab-subflake/services/dhcp/functional/long-lease-times.nix
````nix
/**
  Configures long lease times and renew times. I can always purge everything by
  hand if necessary.

  This will prevent spam in logs.

  Source:
  https://kea.readthedocs.io/en/latest/arm/config-templates.html#template-home-network-of-a-power-user
*/
{
  services.kea.dhcp4.settings = {
    valid-lifetime = 43200; # Leases will be valid for 12h
    renew-timer = 21600; # Clients should renew every 6h
    rebind-timer = 32400; # Clients should start looking for other servers after 9h
  };
}
````

## File: homelab-subflake/services/dhcp/non-functional/alerts.nix
````nix
{ serviceName, ... }:
let
  grafanaDashboardId = "fdwtdpr213zlsf";
in
{
  Critical = [
    {
      title = "DHCP is down";
      expr = ''up{resource="srv:${serviceName}"} == 0'';
    }
  ];
  Warning = [
    {
      title = "DHCP reservation conflict";
      expr = ''rate(kea_dhcp4_reservation_conflicts_total{resource="srv:${serviceName}"}[5m]) > 0'';
      description = "A dynamic lease was assigned to an address reserved for a different client";
    }
    {
      title = "DHCP packet parse failures";
      expr = ''rate(kea_dhcp4_packets_received_total{resource="srv:${serviceName}", operation="parse-failed"}[5m]) > 0'';
      description = "Kea is receiving malformed DHCP packets";
    }
    {
      title = "DHCP packets being dropped";
      expr = ''rate(kea_dhcp4_packets_received_total{resource="srv:${serviceName}", operation="drop"}[5m]) > 0'';
      description = "Kea is dropping DHCP packets";
    }
  ];
}
|> builtins.mapAttrs (_: v: v |> map (it: it // { inherit grafanaDashboardId; }))
````

## File: homelab-subflake/services/dhcp/non-functional/firewall.nix
````nix
{
  networking.firewall.interfaces.lan.allowedUDPPorts = [ 67 ];
}
````

## File: homelab-subflake/services/dhcp/non-functional/metrics.nix
````nix
{
  config,
  lib,
  ...
}:
{
  services.prometheus.exporters.kea = {
    enable =
      assert config.services.kea.dhcp4.enable;
      true;
    listenAddress = lib.homelab.getOwnIpInNetwork "backbone-inner";
    openFirewall = lib.mkForce false;
    targets = lib.catAttrs "socket-name" config.services.kea.dhcp4.settings.control-sockets;
  };

  services.kea.dhcp4.settings.control-sockets = [
    {
      socket-type = "unix";
      socket-name = "/run/kea/control.sock";
    }
  ];
}
````

## File: homelab-subflake/services/dhcp/kea.nix
````nix
{ lib, ... }:
let
  lan = lib.homelab.getNetwork "lan";

  hostConfig = lib.homelab.getOwnHostConfig;

  inherit (hostConfig) netInterfaces;
  inherit (netInterfaces) lan-bridge;
in
{
  services.kea.dhcp4 = {
    enable = true;
    settings = {
      interfaces-config = {
        interfaces = [
          # Where to listen on
          lan-bridge.name
        ];
      };

      # Certain IoT clients (cameras) send a minimal DHCP request with an empty client
      # This should prevent `ALLOC_ENGINE_V4_DISCOVER_ADDRESS_CONFLICT` noise in logs
      # and perceived conflicts
      host-reservation-identifiers = [ "hw-address" ];

      lease-database = {
        name = "/var/lib/kea/dhcp4.leases";
        persist = true;
        type = "memfile";
      };
      subnet4 = [
        {
          id = 1;
          pools = [ { pool = "${lan.subnet}.240 - ${lan.subnet}.254"; } ];
          subnet = "${lan.subnet}.0${lan.settings.netmask}";
          # Some clients have weird behavior. If this is omitted, `kea`
          # will think that there are duplicate leases.
          match-client-id = false;

          # Looks like this is needed as an advertisement from DHCP to get gateway to hosts
          option-data = [
            {
              name = "routers";
              data = lan.hostsInNetwork.hydrogen.ipAddress;
            }
          ];
          # Static DHCP assignments
          reservations =
            lan.hostsInNetwork
            |> lib.mapAttrsToList (
              _: hostData: {
                hw-address = hostData.macAddr;
                ip-address = hostData.ipAddress;
                hostname = hostData.fqdn;
              }
            );
        }
      ];
      option-data = [
        {
          name = "domain-name-servers";
          data = builtins.concatStringsSep ", " lan.dnsServers;
        }
        {
          name = "domain-name";
          data = lan.domain;
        }
        {
          name = "domain-search";
          data = lan.domain;
        }
      ];
    };
  };

  # Construct imports from `./functional` directory by auto-including all files
  imports = ./functional |> lib.fileset.fileFilter (file: file.hasExt "nix") |> lib.fileset.toList;
}
````

## File: homelab-subflake/services/dhcp/manifest.nix
````nix
{ ... }:
{
  # Main service module
  module = ./kea.nix;

  endpoints = {
    dhcp = {
      port = 67;
      protocol = "udp";
    };
    metrics = {
      port = 9547;
      protocol = "tcp";
    };
  };

  # Custom firewall configuration for DHCP port on LAN interface
  firewall = ./non-functional/firewall.nix;

  # Observability configuration
  observability = {
    metrics.main = {
      impl = ./non-functional/metrics.nix;
      path = "/";
    };
    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };

  # Storage and backups omitted - this is a stateless service
  # The DHCP leases are ephemeral and don't need backup
}
````

## File: homelab-subflake/services/dns/functional/blocks.nix
````nix
/**
  Blocks trackers and ads.

  Uses https://github.com/StevenBlack/hosts as the underlying filter.

  Implemented as an include file for unbound that creates always_null zones.

  This method was developed before `stevenblack-blocklist` was in nixpkgs and
  relied on a flake input. Flake input method, strictly speaking, is better
  since it can be updated independently of nixpkgs. However, `pkgs-unstable`
  version seems to be tracking upstream pretty closely.
*/
{ pkgs, pkgs-unstable, ... }:
{
  services.unbound.settings.server.include =
    # This derivation converts the hosts file into an unbound zone format.
    pkgs.stdenv.mkDerivation {
      name = "blocked-hosts";

      dontUnpack = true;

      buildPhase = ''
        cat ${pkgs-unstable.stevenblack-blocklist}/hosts |
          ${pkgs.gawk}/bin/awk '{sub(/\r$/,"")} {sub(/^127\.0\.0\.1/,"0.0.0.0")} BEGIN { OFS = "" } NF == 2 && $1 == "0.0.0.0" { print "local-zone: \"", $2, ".\" always_null"}' |
          tr '[:upper:]' '[:lower:]' |
          sort -u |
          grep -v -F '"local."' > zones
      '';

      installPhase = ''
        mv zones $out
      '';
    }
    |> toString;
}
````

## File: homelab-subflake/services/dns/functional/client-view.nix
````nix
/**
  Sets up the DNS view that the VPN clients get.

  The general idea:
  1. Client device connects to client WG network
  2. Client device requests a service, let's go with `"gitea"`
  3. DNS is listening on backbone-inner, responds with `backbone-inner` IP of the SSL proxy (this is this view) # TODO: assert listen address here
  4. Client connects to SSL proxy
  5. SSL proxy connects to Gitea over backbone-inner, serves response to client

  Same flow, but client is in LAN (standard zone behavior):

  3. DNS is listening on LAN, responds with `lan` address of the SSL proxy

  Implementation note:
  Originally I had the idea of doing something like
  `$SRV_NAME` > `CNAME` `$HOST_NAME`
  $HOST_NAME gets resolved to 192.168 for LAN, $CLIENT_IP for client
  Unfortunately it does not work, see https://github.com/NLnetLabs/unbound/issues/747
*/
{ lib, ... }:
let
  inherit (lib.homelab.getManifest "auth-dns") srvLib;
  clientNetViewName = "client-vpn-vw";
  client = lib.homelab.getNetwork "client";
in
{
  services.unbound.settings.server.access-control-view = [
    "${client.settings.clientSubNet}.1/24 ${clientNetViewName}"
  ];

  services.unbound.settings.view = [
    {
      name = clientNetViewName;
      local-zone = [ ''"${lib.homelab.getSettings.publicDomainName}." static'' ];
      local-data =
        # New logic:
        # Grab all SSL proxied services + services that opt into being available over client network
        (lib.homelab.getManifest "ssl-proxy").srvLib.getProxiedServices
        ++ (
          lib.homelab.services.getAll
          |> lib.filterAttrs (
            _: v:
            v ? "networkAccess" && builtins.elem "client" v.networkAccess && !builtins.elem "nonWeb" v.groups
          )
          |> lib.attrNames
        )
        |> lib.unique
        |> map lib.homelab.getService
        |> map (it: {
          inherit (it) fqdn;
          # If central SSL – point at `ssl-proxy`, otherwise point at the service itself
          targets =
            if it.centralSSL then
              lib.homelab.hosts.getWithService "ssl-proxy" |> map lib.homelab.hosts.getInnerIP
            else
              it.serviceName |> lib.homelab.services.getInnerIP |> lib.singleton;
        })
        |> map (
          it:
          lib.mapCartesianProduct ({ fqdn, target }: srvLib.mkARecord fqdn target) {
            fqdn = it.fqdn |> lib.singleton;
            target = it.targets;
          }
        )
        |> lib.flatten
        |> map (it: "\"${it}\""); # Escape the data, necessary
      view-first = "yes"; # Forces view to be served first. Necessary, the view data is the source of truth. Upstream should not be engaged.
    }
  ];
}
````

## File: homelab-subflake/services/dns/functional/performance.nix
````nix
# Configures unbound performance
# Source:
# https://unbound.docs.nlnetlabs.nl/en/latest/topics/core/performance.html
_:
let
  msg-cache-size' = 128;
  bufSizeMB = 8;
in
{
  services.unbound.settings.server = rec {
    num-threads = 4;
    so-reuseport = "yes";

    # Some sources recommend 2*`num-threads` for the below (if `num-threads` is divisible by 2)
    msg-cache-slabs = 2 * num-threads;
    rrset-cache-slabs = msg-cache-slabs;
    infra-cache-slabs = msg-cache-slabs;
    key-cache-slabs = msg-cache-slabs;

    num-queries-per-thread = 1024;
    outgoing-range = 4096;
    incoming-num-tcp = 25;
    outgoing-num-tcp = 25;

    rrset-cache-size = "${toString (msg-cache-size' * 2)}m";
    msg-cache-size = "${toString msg-cache-size'}m";

    so-rcvbuf = "${bufSizeMB |> toString}m";
    so-sndbuf = so-rcvbuf;

    prefetch = "yes";
    prefetch-key = "yes";
  };

  # Set the `sysctl` values
  boot.kernel.sysctl."net.core.rmem_max" = bufSizeMB * 1024 * 1024;
  boot.kernel.sysctl."net.core.wmem_max" = bufSizeMB * 1024 * 1024;
}
````

## File: homelab-subflake/services/dns/functional/reverse.nix
````nix
# Configure reverse DNS lookups on unbound side
{ lib, ... }:
let
  # Get reverse zone information from `auth-dns` manifest
  # This ensures `dns` and `auth-dns` stay in sync on which zones exist
  authDnsManifest = lib.homelab.getManifest "auth-dns";
  nsdPort = authDnsManifest.endpoints.dns.port;

  # Get reverse zones from `auth-dns` (single source of truth)
  inherit (authDnsManifest.srvLib.getReverseZones) reverseZones parentZones;
in
{
  services.unbound.settings = {
    # Set parent zones to `nodefault` to prevent default local-data
    server.local-zone = map (zone: "${zone} nodefault") parentZones;
    server.domain-insecure = parentZones;

    # Forward specific reverse zones to NSD (authoritative)
    forward-zone = map (name: {
      inherit name;
      forward-addr = "127.0.0.1@${toString nsdPort}";
    }) reverseZones;
  };
}
````

## File: homelab-subflake/services/dns/functional/services-split-view.nix
````nix
/**
  Configures view for services that may be in LAN by default, but they should
  be resolved to `backbone-inner` for all managed hosts, forcing them to go
  over `backbone-inner` network.
*/
{ lib, ... }:
let
  inherit (lib.homelab.getManifest "auth-dns") srvLib;
  clientNetViewName = "mixed-managed-infra-services-vw";

  # Get all managed hosts (those in backbone-inner network)
  managedHosts =
    lib.homelab.hosts.getAll
    |> lib.filterAttrs (hostName: _: lib.homelab.isInNetwork hostName "backbone-inner")
    |> lib.attrNames;

  # Services that need split view (available in LAN for unmanaged, backbone-inner for managed)
  # If this list grows, might need some setting in data
  splitViewServices = [
    "mqtt"
    "log-concentrator"
  ];
in
{
  services.unbound.settings.server.access-control-view =
    # Map all managed hosts' backbone-inner IPs to this view
    # TODO: must also include LAN IPs. Implement in nitrogen migration
    managedHosts |> map (host: "${lib.homelab.hosts.getInnerIP host}/32 ${clientNetViewName}");

  services.unbound.settings.view = [
    {
      name = clientNetViewName;
      # Use transparent to allow fallback to stub-zone for records not defined here
      local-zone = [ ''"${lib.homelab.getSettings.publicDomainName}." transparent'' ];
      local-data =
        # A records for split-view services pointing directly to their host's backbone-inner IP
        splitViewServices
        |> map lib.homelab.getService
        |> map (
          svc:
          srvLib.mkARecord svc.fqdn (lib.homelab.hosts.getInnerIP svc.onHost)
        )
        |> lib.flatten
        |> map (it: "\"${it}\""); # Escape the data, necessary
      view-first = "yes";
    }
  ];
}
````

## File: homelab-subflake/services/dns/non-functional/acl.nix
````nix
/**
  Configures which clients have access to the DNS service.
  Updated to work with multi-instance DNS services.
*/
{ lib, ... }:
let
  inherit (lib.homelab) getServiceConfig getNetwork getOwnHost getService;

  ownHost = getOwnHost;
  dnsServiceName =
    ownHost.servicesAt
    |> builtins.filter (name: (getService name).moduleName == "dns")
    |> builtins.head;
  dnsService = getService dnsServiceName;

  # Get service config using the actual instance name, not module name
  thisSrvConfig = getServiceConfig dnsServiceName;
in
{
  services.unbound.settings.server.access-control =
    # Allow access to clients coming in from default interfaces
    (
      dnsService.networkAccess
      |> map getNetwork
      |> map (builtins.getAttr "prefix")
      |> map (it: "${it} allow")
    )
    ++
      # Forbid some clients
      (
        thisSrvConfig.clientsNonGrata
        |> map (lib.flip lib.homelab.getHostIpInNetwork "lan")
        |> map (it: "${it}/32 deny")
      );
}
````

## File: homelab-subflake/services/dns/non-functional/alerts.nix
````nix
{ serviceName, ... }:
let
  grafanaDashboardId = "58d1eec8-672d-4868-b6db-4b7bb7db10fe";
in
{
  Emergency = [
    {
      title = "DNS is down";
      expr = ''absent(unbound_up{resource="srv:${serviceName}"}) or unbound_up{resource="srv:${serviceName}"} == 0'';
      description = "Unbound is not responding. DNS resolution is unavailable.";
    }
  ];
  Alert = [
    {
      title = "High SERVFAIL rate";
      expr = ''rate(unbound_answer_rcodes_total{rcode="SERVFAIL",resource="srv:${serviceName}"}[5m]) / rate(unbound_answer_rcodes_total{resource="srv:${serviceName}"}[5m]) > 0.05'';
      description = "More than 5% of responses are SERVFAIL. Upstreams may be unreachable.";
    }
  ];
  Error = [
    {
      title = "DNSSEC bogus answers";
      expr = ''unbound_answers_bogus{resource="srv:${serviceName}"} > 0'';
      description = "Unbound is returning DNSSEC validation failures. May indicate a misconfigured domain or an attack.";
    }
  ];
  Warning = [
    {
      title = "Slow upstreams";
      expr = ''unbound_recursion_time_seconds_avg{resource="srv:${serviceName}"} > 0.5'';
      description = "Average upstream recursion time exceeds 500ms. Consider switching upstream resolvers.";
    }
    {
      title = "Request queue overflow";
      expr = ''rate(unbound_request_list_exceeded_total{resource="srv:${serviceName}"}[5m]) > 0'';
      description = "Unbound is dropping queries due to a full request queue. Service may be overloaded.";
    }
    {
      title = "Unwanted replies";
      expr = ''rate(unbound_unwanted_replies_total{resource="srv:${serviceName}"}[5m]) > 0'';
      description = "Unbound is receiving replies that match no pending query. Possible cache poisoning attempt on the LAN.";
    }
  ];
}
|> builtins.mapAttrs (_: v: v |> map (it: it // { inherit grafanaDashboardId; }))
````

## File: homelab-subflake/services/dns/non-functional/endpoints-config.nix
````nix
_: { lib, ... }:
let
  inherit (lib.homelab)
    getOwnIpInNetwork
    getOwnHost
    getService
    ;
  dnsServiceName =
    getOwnHost
    |> builtins.getAttr "servicesAt"
    |> builtins.filter (name: (getService name).moduleName == "dns")
    |> builtins.head;

  thisSrv = getService dnsServiceName;

in
{
  services.unbound.settings.server.interface = thisSrv.networkAccess |> map getOwnIpInNetwork;
}
````

## File: homelab-subflake/services/dns/non-functional/firewall.nix
````nix
{ lib, ... }:
let
  inherit (lib.homelab) getOwnHost getService;

  ownHost = getOwnHost;
  dnsServiceName =
    ownHost.servicesAt
    |> builtins.filter (name: (getService name).moduleName == "dns")
    |> builtins.head;
  dnsService = getService dnsServiceName;

in
{
  # Takes the list of networks the service should access and sets the firewall rules accordingly
  networking.firewall.interfaces =
    dnsService.networkAccess
    |> map (network: ownHost.networks.${network}.adapter or network) # Resolve proper interface name
    |> map (interface: {
      "${interface}".allowedUDPPorts = [ 53 ];
    })
    |> lib.mergeAttrsList;
}
````

## File: homelab-subflake/services/dns/non-functional/logging.nix
````nix
/**
  Configures:

  - dnstap logging for unbound ( http://dnstap.info )
  - vector ingestion of dnstap logs ( https://vector.dev/docs/reference/configuration/sources/dnstap/ )

  Also sets up a mapping between hostnames and IPs that vector does on the fly.
*/
{ pkgs, lib, ... }:
let

  loggingConfig = lib.homelab.getServiceLogging "dns";
in
{
  services = {
    unbound = {
      # Enable dnstap support
      package = pkgs.unbound-full;

      settings.server.log-servfail = "yes";

      # Dnstap logging for unbound
      # https://unbound.docs.nlnetlabs.nl/en/latest/manpages/unbound.conf.html#dnstap-logging-options
      settings.dnstap = {
        dnstap-enable = true;
        dnstap-ip = "127.0.0.1@9000";
        dnstap-tls = false;
        # dnstap-socket-path = config.systemd.sockets.vector.socketConfig.ListenFIFO;

        # Log all messages for now
        # Enable to log resolver query messages. These are messages from Unbound to upstream servers.
        dnstap-log-resolver-query-messages = false;

        # Enable to log resolver response messages. These are replies from upstream servers to Unbound.
        dnstap-log-resolver-response-messages = false;

        # Enable to log client query messages. These are client queries to Unbound.
        dnstap-log-client-query-messages = false;

        # Enable to log client response messages. These are responses from Unbound to clients.
        dnstap-log-client-response-messages = true;

        # Enable to log forwarder query messages.
        dnstap-log-forwarder-query-messages = false;

        # Enable to log forwarder response messages.
        dnstap-log-forwarder-response-messages = false;
      };
    };

    vector = {
      settings = {
        sources = {
          local-dnstap = {
            type = "dnstap";
            address = "127.0.0.1:9000";
            mode = "tcp";
            socket_path = ""; # fake, but needed for schema
          };
        };
        sinks = {
          dnstap-new-sink = {
            type = "vector";
            inputs = [ "local-dnstap" ];
            address = "${lib.homelab.getServiceInnerIP "log-concentrator"}:${
              "log-concentrator" |> lib.homelab.getServiceConfig |> builtins.getAttr "dnstapPort" |> toString
            }";
          };
        };
      };
    };
  };

  # Debug mode
  # systemd.services.vector.serviceConfig.Environment = [ "VECTOR_LOG=debug" ];
}
````

## File: homelab-subflake/services/dns/non-functional/metrics.nix
````nix
{ lib, ... }:
let
  # Metrics port from endpoints (9167)
  metricsPort = 9167;
in
{
  services = {
    # Needed settings for stats
    unbound.settings = {
      server.extended-statistics = "yes";
      remote-control.control-enable = true;
    };
    prometheus.exporters.unbound = {
      enable = true;
      unbound.host = "unix:///run/unbound/unbound.socket";
      # Listen on backbone-inner interface
      listenAddress = lib.homelab.getOwnIpInNetwork "backbone-inner";
      port = metricsPort;
      openFirewall = false;
    };
  };

  # Firewall rule auto-generated from endpoints.metrics by manifest merge system
}
````

## File: homelab-subflake/services/dns/manifest.nix
````nix
{ ... }:
{
  module = ./unbound.nix;

  # Unbound (recursive DNS) listens on port 53
  # Exposed on LAN and other configured networks
  endpoints = {
    dns = {
      port = 53;
      protocol = "udp";
    };
    metrics = {
      port = 9167;
      protocol = "tcp";
    };
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  # Custom firewall - opens DNS port on configured network interfaces (not just backbone)
  firewall = ./non-functional/firewall.nix;

  observability = {
    # Unbound exporter metrics
    metrics.main = {
      impl = ./non-functional/metrics.nix;
    };

    alerts.prometheusImpl = ./non-functional/alerts.nix;
    logging.impl = ./non-functional/logging.nix;
  };

  multiInstance = true;

  # No backups - stateless service
  # No storage - stateless service
}
````

## File: homelab-subflake/services/dns/unbound.nix
````nix
# Module that configures Unbound for recursive DNS, DNSSEC and caching
{
  lib,
  ...
}:
let
  inherit (lib.homelab)
    getServiceConfig
    getOwnHost
    getService
    ;

  # Find which DNS service instance is running on this host
  ownHost = getOwnHost;
  dnsServiceName =
    ownHost.servicesAt
    |> builtins.filter (name: (getService name).moduleName == "dns")
    |> builtins.head;

  # Get service config using the actual instance name, not module name
  thisSrvConfig = getServiceConfig dnsServiceName;

  # Get NSD configuration from auth-dns manifest
  authDnsManifest = lib.homelab.getManifest "auth-dns";
  nsdPort = authDnsManifest.endpoints.dns.port;
  nsdZones = authDnsManifest.srvLib.getZones;
in
{
  imports = lib.localLib.mkImportsFromDir ./functional ++ [
    # ACL configuration for client access control
    ./non-functional/acl.nix
  ];

  services.unbound = {
    enable = true;
    resolveLocalQueries = false;
    localControlSocketPath = "/run/unbound/unbound.socket";
    settings = {
      server = {

        # Custom records go here
        local-zone =
          (map (zone: ''"${zone}" nodefault'') nsdZones) # Forces unbound not to proxy DNS requests for these hosts
          ++ (map (zone: ''"${zone}" always_null'') thisSrvConfig.customBlocklist); # Reply 0.0.0.0 for these hosts
        domain-insecure = nsdZones;

        # Other settings
        cache-max-ttl = 86400;
        # Security
        # Harden against algorithm downgrade when multiple algorithms are
        # advertised in the record.
        harden-algo-downgrade = "yes";

        # RFC 8020 returns NXDomain to queries for a name below another name that
        # is already known to be NXDomain.
        harden-below-nxdomain = "yes";

        # Require DNSSEC data for trust-anchored `nsdZones`, if such data is absent, the
        # zone becomes bogus. If turned off you run the risk of a downgrade attack
        # that disables security for a zone.
        harden-dnssec-stripped = "yes";

        # Only trust glue if it is within the servers authority.
        harden-glue = "yes";

        # Ignore very large queries.
        harden-large-queries = "yes";

        # Perform additional queries for infrastructure data to harden the referral
        # path. Validates the replies if trust anchors are configured and the `nsdZones`
        # are signed. This enforces DNSSEC validation on nameserver NS sets and the
        # nameserver addresses that are encountered on the referral path to the
        # answer. Experimental option.
        harden-referral-path = "no";

        # Ignore very small `EDNS` buffer sizes from queries.
        harden-short-bufsize = "yes";

        # Refuse id.server and hostname.bind queries
        hide-identity = "yes";

        # Refuse version.server and version.bind queries
        hide-version = "yes";

        verbosity = 1;
        identity = "DNS";
        do-not-query-localhost = "no";

        # Not logging these as dnstap takes care of it
        log-queries = "no";
        log-replies = "no";
        # add a "reply: prefix to the logs"
        log-tag-queryreply = "no";
        log-local-actions = "no";
      };

      # Ask NSD for data on entries in the custom zones
      stub-zone = map (zone: {
        name = zone;
        stub-addr = [ "127.0.0.1@${toString nsdPort}" ];
      }) nsdZones;

      # Designated upstream
      forward-zone = [
        # To test DoT: https://www.jwillikers.com/dns-over-tls-with-unbound
        {
          name = ".";
          forward-addr = thisSrvConfig.upstream;
          forward-tls-upstream = "yes";
          forward-first = "no";
        }
        # NOTE: archive.ph needs special treatment.
        {
          name = "archive.ph";
          forward-addr = thisSrvConfig.altUpstream;
          forward-tls-upstream = "yes";
          forward-first = "no";
        }
      ];
    };
  };
}
````

## File: homelab-subflake/services/docspell/non-functional/alerts.nix
````nix

````

## File: homelab-subflake/services/docspell/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  services.docspell-restserver.bind = {
    address = lib.homelab.getOwnIpInNetwork "backbone-inner";
    port = endpoints.web.port;
  };
}
````

## File: homelab-subflake/services/docspell/non-functional/ssl.nix
````nix
{ serviceName, ... }:
{
  config,
  lib,
  self,
  ...
}:
let
  inherit (lib.homelab.getManifest serviceName) endpoints;
in
{
  imports = [
    (self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
      inherit serviceName config lib;
      inherit (endpoints.web) port;
      extraConfig = ''
        client_max_body_size 100M;
      '';
      onlyHumans = true;
    })
  ];

  services.nginx.virtualHosts.${lib.homelab.getServiceFqdn serviceName}.locations."/watch-dir/" = {
    proxyPass = "http://${
      serviceName |> lib.homelab.getServiceInnerIP
    }:${endpoints.filemanager.port |> toString}/watch-dir/";
  };
}
````

## File: homelab-subflake/services/docspell/docspell.nix
````nix
{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  inherit (lib.homelab) getService getServiceConfig;
  srvName = "docspell";

  srv = getService srvName;
  serviceConfig = getServiceConfig srvName;

  full-text-search = {
    enabled = true;
    backend = "postgresql";
    postgresql.use-default-connection = true;
  };

  docspell-packages = inputs.docspell-flake.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.docspell-flake.nixosModules.default
  ];

  services = {
    docspell-joex = {
      enable = true;

      base-url = "https://${srv.fqdn}";

      package = docspell-packages.docspell-joex;

      bind = {
        address = "localhost";
        port = 7878;
      };

      scheduler.pool-size = 1;

      # Joex likes to sleep on the job. Let's wake it up more often.
      scheduler.wakeup-period = "1 minute";

      inherit (serviceConfig) jdbc;
      inherit full-text-search;

      convert.wkhtmlpdf = {
        working-dir = "/tmp/docspell-convert/";
        command = {
          program = lib.mkForce "${pkgs.python3Packages.weasyprint}/bin/weasyprint";
          args = [
            "--optimize-size"
            "all"
            "--encoding"
            "{{encoding}}"
            "-"
            "{{outfile}}"
          ];
        };
      };
    };
    docspell-restserver = {
      enable = true;

      base-url = "https://${srv.fqdn}";

      internal-url = "http://${config.services.docspell-restserver.bind.address}:${
        config.services.docspell-restserver.bind.port |> toString
      }";

      package = docspell-packages.docspell-restserver;

      inherit (serviceConfig) auth admin-endpoint openid;

      inherit full-text-search;
      backend = {
        signup.mode = "closed";
        inherit (serviceConfig) jdbc;
      };

      extraConfig.auth.on-account-source-conflict = "convert";
    };
  };
}
````

## File: homelab-subflake/services/docspell/manifest.nix
````nix
{ lib, serviceName, ... }:
{
  module = ./docspell.nix;

  endpoints = {
    web = {
      port = 7880;
      protocol = "https";
    };
    filemanager = {
      port = 8002;
      protocol = "https";
    };
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; };

  observability = { }; # TODO: implement a probe

  dashboard = {
    category = "Home";
    links = [
      {
        description = "Document storage";
        icon = "docspell";
        name = "Docspell";
      }
      {
        description = "Document dropbox";
        icon = "files";
        name = "Docspell dropbox";
        absoluteURL = "https://${lib.homelab.getServiceFqdn serviceName}/app/upload/${(lib.homelab.getServiceConfig serviceName).watchDirId}";
      }
    ];
  };
}
````

## File: homelab-subflake/services/esphome/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  services.esphome = {
    port = endpoints.web.port;
    address = lib.homelab.getOwnIpInNetwork "backbone-inner";
  };
}
````

## File: homelab-subflake/services/esphome/non-functional/ssl.nix
````nix
{ serviceName, ... }:
{
  config,
  lib,
  self,
  ...
}:
let
  inherit (lib.homelab.getManifest serviceName) endpoints;
in
self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
  inherit config lib serviceName;
  inherit (endpoints.web) port;
  onlyHumans = true;
}
````

## File: homelab-subflake/services/esphome/esphome.nix
````nix
/**
  Some notes:

  - When just deployed – all installs were failing because `g++` binary
    downloaded by esphome was not executable. I fixed it by `chown` everything
    in `/var/lib/private/esphome` to `esphome:esphome`
*/
{
  lib,
  config,
  ...
}:
{
  services.esphome = {
    enable = true;
    allowedDevices = [
      "/dev/serial/by-id/usb-Silicon_Labs_CP2102_USB_to_UART_Bridge_Controller_0001-if00-port0"
      "/dev/serial/by-id/usb-Espressif_USB_JTAG_serial_debug_unit_7C:2C:67:42:CD:C8-if00"
      "/dev/serial/by-id/usb-1a86_USB_Single_Serial_58FA096927-if00"
    ];
  };

  systemd.services.esphome =
    let
      inherit (lib) mkForce;

      cfg = config.services.esphome;
      stateDir = "/var/lib/private/esphome";
      esphomeParams =
        if cfg.enableUnixSocket then
          "--socket /run/esphome/esphome.sock"
        else
          "--address ${cfg.address} --port ${toString cfg.port}";
    in
    {
      environment.PLATFORMIO_CORE_DIR = mkForce "/var/lib/private/esphome/.platformio";

      serviceConfig = {
        ExecStart = mkForce "${cfg.package}/bin/esphome dashboard ${esphomeParams} ${stateDir}";
        WorkingDirectory = mkForce stateDir;
      };
    };

}
````

## File: homelab-subflake/services/esphome/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./esphome.nix;

  endpoints.web = {
    port = 6052;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; };

  backups = {
    paths = [ "/var/lib/esphome/*.yaml" ];
  };

  dashboard = {
    category = "Dev";
    links = [
      {
        description = "Firmware manager for all the random esp32s";
        icon = "esphome";
        name = "ESPhome";
      }
    ];
  };
}
````

## File: homelab-subflake/services/fava/non-functional/observability/metrics/impl.nix
````nix
{ lib, ... }:
{
  services.fava-helper.settings.metrics = {
    query_interval = "5m";
    queries = lib.homelab.getServiceConfig "fava" |> (c: c.metricsQueries or [ ]);
  };
}
````

## File: homelab-subflake/services/fava/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  services.fava = {
    host = lib.homelab.getOwnIpInNetwork "backbone-inner";
    port = endpoints.web.port;
  };

  services.fava-helper.settings = {
    webhook.listen = "${lib.homelab.getOwnIpInNetwork "backbone-inner"}:${endpoints.webhook.port |> toString}";
    metrics.listen = "${lib.homelab.getOwnIpInNetwork "backbone-inner"}:${endpoints.metrics.port |> toString}";
  };
}
````

## File: homelab-subflake/services/fava/non-functional/ssl.nix
````nix
{ serviceName, ... }:
{ config, lib, self, ... }:
let
  inherit (lib.homelab.getManifest serviceName) endpoints;
in
{
  imports = [
    (self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
      inherit serviceName config lib;
      inherit (endpoints.web) port;
    })
  ];

  # Webhook path proxied directly to `fava-helper`, bypassing SSO so Gitea can
  # reach it without authentication.
  services.nginx.virtualHosts.${lib.homelab.getServiceFqdn serviceName}.locations."/webhook" = {
    proxyPass = "http://${lib.homelab.getServiceInnerIP serviceName}:${
      endpoints.webhook.port |> toString
    }/webhook";
    extraConfig = ''auth_request off;'';
  };
}
````

## File: homelab-subflake/services/fava/non-functional/storage.nix
````nix
/**
  Ensures that a partition is mounted for `srv:fava`.

  The partition is mounted at fava's StateDirectory (/var/lib/fava) so both
  the fava process and fava-helper (which writes the beancount checkout there)
  share the same persistent volume.
*/
{ ... }:
{
  systemd = {
    services.fava.unitConfig.RequiresMountsFor = [ "/var/lib/fava" ];
    services.fava-helper.unitConfig.RequiresMountsFor = [ "/var/lib/fava" ];
    mounts = [
      {
        what = "/dev/disk/by-label/fava";
        where = "/var/lib/fava";
        options = "noatime";
      }
    ];
  };
}
````

## File: homelab-subflake/services/fava/fava.nix
````nix
{ lib, config, inputs, ... }:
let
  # Checkout lives inside fava's own StateDirectory so the static fava user
  # can read it directly. fava-helper (DynamicUser, Group = "fava") writes here
  # via group permissions (StateDirectoryMode = "0770", UMask = "0027").
  repoPath = "/var/lib/fava/checkout";
  favaConfig = lib.homelab.getServiceConfig "fava";
in
{
  imports = [
    inputs.fava-helper.nixosModules.default
  ];

  services.fava = {
    enable = true;
    beancountFile = "${repoPath}/${favaConfig.beancountFile or "journal.beancount"}";
  };

  services.fava-helper = {
    enable = true;
    sshKeyCredential = config.age.secrets.fava-ssh-key.path;
    webhookSecretCredential = config.age.secrets.fava-webhook-secret.path;
    logLevel =  "fava_helper=debug";
    settings = {
      git = {
        repo_url = favaConfig.gitRepoUrl or "gitea@${lib.homelab.getServiceFqdn "gitea"}:spacecadet/budget";
        repo_path = repoPath;
        branch = favaConfig.gitBranch or "master";
        sync_interval = "5m";
      };
      # beancount_file is required by fava-helper whenever [metrics] is present.
      # Set it here so the field exists regardless of whether observability is wired.
      metrics.beancount_file = favaConfig.beancountFile or "journal.beancount";
    };
  };

  # fava-helper (DynamicUser) writes the checkout into fava's StateDirectory.
  # Group = "fava" makes created files group-owned by fava; UMask = "0027" makes
  # them group-readable. ReadWritePaths overrides the module default (/var/lib/fava-helper)
  # so ProtectSystem=strict allows writes into /var/lib/fava.
  systemd.services.fava-helper.serviceConfig = {
    Group = config.services.fava.group;
    UMask = "0027";
    ReadWritePaths = lib.mkForce [ "/var/lib/fava" ];
  };

  # The partition mounts at /var/lib/fava with root:root 755 (as formatted).
  # fava.service's StateDirectory would fix this, but fava-helper starts first.
  # tmpfiles.d runs after mounts but before services, so it wins the race.
  systemd.tmpfiles.rules = [ "d /var/lib/fava 0770 fava fava -" ];

  systemd.services.fava-helper.unitConfig = {
    StartLimitBurst = 3;
    StartLimitIntervalSec = 60;
  };
}
````

## File: homelab-subflake/services/fava/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./fava.nix;

  endpoints = {
    web = {
      port = 5001;
      protocol = "https";
    };
    webhook = {
      port = 9001;
      protocol = "tcp";
    };
    metrics = {
      port = 9002;
      protocol = "tcp";
    };
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; };

  observability.metrics.main = {
    impl = ./non-functional/observability/metrics/impl.nix;
    endpoint = "metrics";
  };

  storage.impl = ./non-functional/storage.nix;

  # backups = { paths = [ "/var/lib/fava" ]; }; # TODO

  dashboard = {
    category = "Home";
    links = [
      {
        name = "Fava";
        icon = "fava";
        description = "Beancount web interface";
      }
    ];
  };

  documentation = ./README.md;
}
````

## File: homelab-subflake/services/filedump/non-functional/alerts.nix
````nix

````

## File: homelab-subflake/services/filedump/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  services.nginx.virtualHosts.${(lib.homelab.getService "filedump").fqdn}.listenAddresses =
    lib.homelab.getOwnIpInNetwork "backbone-inner" |> lib.singleton;
}
````

## File: homelab-subflake/services/filedump/non-functional/ssl.nix
````nix
{ serviceName, ... }:
{
  config,
  lib,
  self,
  ...
}:
let
  inherit (lib.homelab.getManifest serviceName) endpoints;
in
self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
  inherit config lib serviceName;
  inherit (endpoints.web) port;
  allowiFrame = true;
}
````

## File: homelab-subflake/services/filedump/filedump.nix
````nix
{
  lib,
  config,
  pkgs,
  ...
}:
let
  srvName = "filedump";
  cfg = config.services.myFiledump;
in
{
  options.services.myFiledump = {
    dir = lib.mkOption {
      type = lib.types.path;
      default = "/var/lib/filedump";
    };
    dashboard-icons = lib.mkOption {
      type = lib.types.str;
      default = "dashboard-icons";
    };
  };

  config.systemd.tmpfiles.rules = [
    "d ${cfg.dir} 0755 root root"
    "L+ ${cfg.dir}/${cfg.dashboard-icons} - - - - ${pkgs.dashboard-icons}"
  ];

  config.services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts.${(lib.homelab.getService srvName).fqdn} = {
      forceSSL = false;
      extraConfig = ''
        proxy_buffering off;
      '';
      locations."/" = {
        extraConfig = ''
          autoindex on;
        '';
        root = config.services.myFiledump.dir;
      };
      locations."~ /${config.services.myFiledump.dashboard-icons}/png" = {
        extraConfig = ''
          error_page 404 /${config.services.myFiledump.dashboard-icons}/png/nginx.png;
        '';
        root = config.services.myFiledump.dir;
      };
    };
  };
}
````

## File: homelab-subflake/services/filedump/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./filedump.nix;

  endpoints.web = {
    port = 80;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; };

  observability = { }; # TODO: implement, probe only

  dashboard = {
    category = "Home";
    links = [
      {
        icon = "filebrowser";
        name = "Filedump";
      }
    ];
  };
}
````

## File: homelab-subflake/services/gitea/functional/mailer.nix
````nix
{ config, lib, ... }:
{
  services.gitea = {
    mailerPasswordFile = config.age.secrets.gitea-mailer-password.path;

    settings.mailer = rec {
      ENABLED = true;
      PROTOCOL = "smtps";
      SMTP_ADDR = "mail" |> lib.homelab.getServiceConfig |> builtins.getAttr "smtphost";
      SMTP_PORT = "mail" |> lib.homelab.getServiceConfig |> builtins.getAttr "smtpport";
      USER = ("gitea" |> lib.homelab.getServiceConfig).mailer.user;
      FROM = "Gitea <${USER}>";
    };

    settings.service.ENABLE_NOTIFY_MAIL = true;
  };
}
````

## File: homelab-subflake/services/gitea/non-functional/observability/metrics/impl.nix
````nix
{ ... }:
{
  services.gitea.settings.metrics = {
    # Gotta be "ENABLED" IN ALL CAPS
    ENABLED = true;
    TOKEN = "";
  };
}
````

## File: homelab-subflake/services/gitea/non-functional/observability/alerts.nix
````nix
{ serviceName, lib, ... }:
let
  grafanaDashboardId = "ddw8m8mjq3tvkf";
  domain = lib.homelab.getServiceFqdn serviceName;
in
{
  Alert = [
    {
      title = "Gitea service down";
      expr = ''absent(up{resource="srv:${serviceName}"}) or up{resource="srv:${serviceName}"} == 0'';
    }
  ];
  Error = [
    {
      title = "Disk critically full";
      expr = ''(node_filesystem_avail_bytes{mountpoint="/var/lib/gitea"} * 100) / node_filesystem_size_bytes{mountpoint="/var/lib/gitea"} < 10'';
      description = "Free disk space < 10%";
    }
  ];
  Warning = [
    {
      title = "Disk almost full";
      expr = ''(node_filesystem_avail_bytes{mountpoint="/var/lib/gitea"} * 100) / node_filesystem_size_bytes{mountpoint="/var/lib/gitea"} < 20'';
      description = "Free disk space < 20%";
    }
    {
      title = "Sustained proxy errors";
      expr = ''rate(ssl_proxy_nginx_http_requests_total{domain="${domain}",result!="2xx_3xx_success"}[5m]) > 0'';
    }
  ];
}
|> builtins.mapAttrs (_: v: v |> map (it: it // { inherit grafanaDashboardId; }))
````

## File: homelab-subflake/services/gitea/non-functional/database.nix
````nix
/**
  Sets up Gitea to use the Postgres instance.
*/
{ config, lib, ... }:
{
  services.gitea.database = {
    user = "gitea";
    type = "postgres";
    passwordFile = config.age.secrets.gitea-db-password.path;
    host = "db" |> lib.homelab.getServiceFqdn;
    createDatabase = false; # Otherwise, a local Postgres instance will be created
  };

  age.secrets.gitea-db-password.owner = config.services.gitea.user;
}
````

## File: homelab-subflake/services/gitea/non-functional/dumps.nix
````nix
/**
  Set up local dumps for extra redundancy.
*/
{

  services.gitea.dump.enable = true;

  systemd.tmpfiles.rules = [
    "d /var/lib/gitea/dump 0755 gitea gitea 7d"
  ];
}
````

## File: homelab-subflake/services/gitea/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
let
  listenInterface = "backbone-inner";
in
{
  services.gitea.settings.server = {
    HTTP_PORT = endpoints.web.port;
    SSH_PORT = endpoints.ssh.port;
    SSH_LISTEN_HOST = lib.homelab.getOwnIpInNetwork listenInterface;
  };
}
````

## File: homelab-subflake/services/gitea/non-functional/monitoring.nix
````nix
# Configures monitoring for the service; allows monitoring access only from a specific host
{ lib, config, ... }:
let
  inherit (lib.homelab)
    getServiceFqdn
    getService
    getHostIpInNetwork
    ;
  srvName = "gitea";

  prometheusIP = lib.pipe "prometheus" [
    getService
    (builtins.getAttr "onHost")
    (lib.flip getHostIpInNetwork "lan") # Request will be through LAN
  ];
in

{
  services.gitea.settings.metrics = {
    # Gotta be "ENABLED" IN ALL CAPS
    ENABLED = true;
    TOKEN = "";
  };

  # Allow /metrics only from specific hosts
  services.nginx.virtualHosts.${getServiceFqdn srvName}.locations."/metrics" = {
    proxyPass = "http://localhost:${toString config.services.gitea.settings.server.HTTP_PORT}/metrics";
    extraConfig = ''
      allow ${prometheusIP};
      deny all;
    '';
  };
}
````

## File: homelab-subflake/services/gitea/non-functional/ssl.nix
````nix
{
  serviceName,
  sshPort,
  webPort,
  ...
}:
{
  config,
  lib,
  self,
  ...
}:
{
  # Standard SSL proxy for web interface
  imports = [
    (self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
      port = webPort;
      inherit config lib serviceName;
    })
  ];

  # Add heatmap proxy token
  services.nginx.virtualHosts.${lib.homelab.getServiceFqdn serviceName}.locations."/api/v1/users/spacecadet/heatmap" =
    {
      proxyPass = "http://localhost:${toString config.services.gitea.settings.server.HTTP_PORT}/api/v1/users/spacecadet/heatmap";
      extraConfig = ''
        proxy_set_header Authorization "${(lib.homelab.getServiceConfig serviceName).heatmapToken}";
      '';
    };

  # Proxy ssh
  services.nginx.streamConfig = ''
    server {
      ${
        config.services.homelab.ssl-proxy.listenAddresses
        |> map (it: "listen ${it}:${sshPort |> toString};")
        |> lib.concatLines
      }
      proxy_pass ${serviceName |> lib.homelab.getServiceInnerIP}:${sshPort |> toString};
    }
  '';
}
````

## File: homelab-subflake/services/gitea/non-functional/storage.nix
````nix
{ config, lib, ... }:
let
  inherit (lib.localLib) mkCryptTab mkLuksMount;
  luks = {
    device_name = "gitea_data";
    UUID = "fdcc8af6-7b4e-443d-b10d-0cd23c412dee";
  };
in
{
  # Order the unit after mount is up
  systemd.services.gitea.unitConfig.RequiresMountsFor = lib.mkOptionDefault [
    config.services.gitea.stateDir
  ];

  # LUKS setup
  environment.etc."crypttab".text = mkCryptTab { inherit (luks) device_name UUID; };
  systemd.mounts = [
    (mkLuksMount {
      inherit (luks) device_name;
      target = config.services.gitea.stateDir;
    })
  ];
}
````

## File: homelab-subflake/services/gitea/default.nix
````nix
{
  imports = (import ./manifest.nix).default;
}
````

## File: homelab-subflake/services/gitea/gitea.nix
````nix
{ lib, ... }:
let
  inherit (lib.homelab) getServiceFqdn;

  srvName = "gitea";
  srvFqdn = getServiceFqdn srvName;
in
{
  # Service configuration
  services.gitea = {
    enable = true;
    settings = {
      server = {
        ROOT_URL = "https://${srvFqdn}";
        DOMAIN = srvFqdn;
        START_SSH_SERVER = true;
      };
      session.COOKIE_SECURE = true;

      # Allows users to create repos by simply pushing it
      repository.ENABLE_PUSH_CREATE_USER = true;

      webhook.ALLOWED_HOST_LIST = "*.${lib.homelab.getSettings.publicDomainName}";
      service = {
        REGISTER_MANUAL_CONFIRM = true;
      };
    };
  };

  # Allow binding on port 22 (privileged port)
  # These settings enable Gitea built-in SSH server to bind to port 22
  systemd.services.gitea.serviceConfig = {
    AmbientCapabilities = lib.mkOverride 10 "CAP_NET_BIND_SERVICE";
    CapabilityBoundingSet = lib.mkOverride 10 "CAP_NET_BIND_SERVICE";
    # TODO: check why/if this is needed. Was it for mail?
    PrivateUsers = lib.mkOverride 10 false;
  };
  imports = [
    ./non-functional/dumps.nix
    ./functional/mailer.nix
  ];
}
````

## File: homelab-subflake/services/gitea/manifest.nix
````nix
{ serviceName, ... }:
{
    module = ./gitea.nix;

    endpoints = {
      web = {
        port = 3000;
        protocol = "https";
      };
      ssh = {
        port = 22;
        protocol = "tcp";
      };
      metrics = {
        port = 3000;
        protocol = "tcp";
        path = "/metrics";
      };
    };

    endpointsConfig = import ./non-functional/endpoints-config.nix;

    sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; sshPort = 22; webPort = 3000; };

    observability = {
      metrics.main.impl = ./non-functional/observability/metrics/impl.nix;
      alerts.prometheusImpl = ./non-functional/observability/alerts.nix;
    };

    storage.impl = ./non-functional/storage.nix;

    backups = {
      paths = [ "/var/lib/gitea" ];
      exclude = [
        "/var/lib/gitea/dump"
        "/var/lib/gitea/tmp"
      ];
    };

    dashboard = {
      category = "Dev";
      links = [
        {
          description = "Local GitHub alternative";
          icon = "gitea";
          name = "Gitea";
        }
      ];
    };

    documentation = ./README.md;

    database = {
      create = true;
      impl = ./non-functional/database.nix;
    };
}
````

## File: homelab-subflake/services/healthchecks/non-functional/alerts.nix
````nix
{ serviceName, ... }:
{
  Emergency = [
    {
      title = "Scrape is down";
      expr = ''absent(up{resource="srv:${serviceName}"}) or up{resource="srv:${serviceName}"} == 0'';
      description = "Cannot retrieve healthchecks status. Check network connection.";
    }
  ];
  Error = [
    {
      title = "Backup checks are down";
      expr = ''absent(hc_check_up{resource="srv:${serviceName}",name=~".*-backup$"}) or hc_check_up{resource="srv:${serviceName}",name=~".*-backup$"} == 0'';
    }
  ];
}
````

## File: homelab-subflake/services/healthchecks/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  # Establish listening port and address
  services.healthchecks = {
    port = endpoints.web.port;
    listenAddress = lib.homelab.getOwnIpInNetwork "backbone-inner";
  };
}
````

## File: homelab-subflake/services/healthchecks/fix-401010-pydantic-error.nix
````nix
/**
  Healthchecks migration fails:

  https://github.com/NixOS/nixpkgs/issues/401010

  This module creates an overlay, pinning the `pydantic` stuff to more recent
  versions.
*/
{
  nixpkgs.overlays = [
    (_: prev: {
      healthchecks =
        let
          inherit (prev) lib;
          # https://discourse.nixos.org/t/python-possible-to-override-packageoverrides/63855/3
          preservePython3PackageOverrides =
            p:
            p
            // {
              override = lib.mirrorFunctionArgs p.override (
                fdrv:
                preservePython3PackageOverrides (
                  p.override (
                    previous:
                    let
                      fdrv' = lib.toFunction fdrv previous;
                    in
                    fdrv'
                    // lib.optionalAttrs (fdrv' ? python3) {
                      python3 = fdrv'.python3 // {
                        override = lib.mirrorFunctionArgs fdrv'.python3.override (
                          fdrv:
                          fdrv'.python3.override (
                            previous:
                            let
                              fdrv' = lib.toFunction fdrv previous;
                            in
                            fdrv'
                            // {
                              packageOverrides =
                                lib.composeExtensions previous.packageOverrides or (_: _: { })
                                  fdrv'.packageOverrides or (_: _: { });
                            }
                          )
                        );
                      };
                    }
                  )
                )
              );
            };
          python =
            let
              packageOverrides = pyfinal: pyprev: {
                pydantic = pyprev.pydantic.overridePythonAttrs rec {
                  version = "2.11.4";
                  src = prev.fetchFromGitHub {
                    owner = "pydantic";
                    repo = "pydantic";
                    tag = "v${version}";
                    hash = "sha256-/LMemrO01KnhDrqKbH1qBVyO/uAiqTh5+FHnrxE8BUo=";
                  };
                };
                pydantic-core = pyprev.pydantic-core.overridePythonAttrs (old: rec {
                  version = "2.33.2";
                  src = prev.fetchFromGitHub {
                    owner = "pydantic";
                    repo = "pydantic-core";
                    tag = "v${version}";
                    hash = "sha256-2jUkd/Y92Iuq/A31cevqjZK4bCOp+AEC/MAnHSt2HLY=";
                  };
                  cargoDeps = prev.rustPlatform.fetchCargoVendor {
                    inherit src;
                    name = "pydantic-core-2.33.2";
                    hash = "sha256-MY6Gxoz5Q7nCptR+zvdABh2agfbpqOtfTtor4pmkb9c=";
                  };
                });
              };
            in
            prev.python3.override {
              self = python;
              inherit packageOverrides;
            };
        in
        (preservePython3PackageOverrides prev.healthchecks).override {
          python3 = python;
        };
    })
  ];
}
````

## File: homelab-subflake/services/healthchecks/healthchecks.nix
````nix
{
  lib,
  config,
  pkgs,
  ...
}:
let
  srvName = "healthchecks";
  fqdn = lib.homelab.getServiceFqdn srvName;

in
{
  # Service itself
  services.healthchecks = {
    enable = true;

    # The package override defines dome Django CSRF settings that are needed for my network setup
    package = pkgs.healthchecks.overrideAttrs (
      super:
      let
        inherit (super) secrets;
      in
      rec {
        localSettings = pkgs.writeText "local_settings.py" ''
          import os

          STATIC_ROOT = os.getenv("STATIC_ROOT")

          ${lib.concatLines (
            map (secret: ''
              ${secret}_FILE = os.getenv("${secret}_FILE")
              if ${secret}_FILE:
                  with open(${secret}_FILE, "r") as file:
                      ${secret} = file.readline()
            '') secrets
          )}
          # CSRF stuff
          SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
          CSRF_ALLOWED_ORIGINS = ["https://${fqdn}"]
          CORS_ORIGINS_WHITELIST = ["https://${fqdn}"]
          REMOTE_USER_HEADER = "HTTP_X_EMAIL"
          AUTHENTICATION_BACKENDS = ["hc.accounts.backends.CustomHeaderBackend"]
        '';

        # Override this to make sure that proper localSettings is passed
        installPhase = ''
          mkdir -p $out/opt/healthchecks
          cp -r . $out/opt/healthchecks
          chmod +x $out/opt/healthchecks/manage.py
          cp ${localSettings} $out/opt/healthchecks/hc/local_settings.py
        '';
      }
    );
    settings = {
      SECRET_KEY_FILE = config.age.secrets."${srvName}-secret".path;
      ALLOWED_HOSTS = [
        fqdn
        (lib.homelab.services.getServiceMetricsFqdn srvName) # So `srv:ssl-proxy` can proxy `srv:prometheus` metrics here
      ];
      INTEGRATIONS_ALLOW_PRIVATE_IPS = "True"; # Allow running checks on classful IPs in LAN
      REGISTRATION_OPEN = false;
      SITE_ROOT = "https://${fqdn}";

      DEBUG = false;

      # Disabled integrations
      MATTERMOST_ENABLED = "False";
      MSTEAMS_ENABLED = "False";
      OPSGENIE_ENABLED = "False";
      PAGERTREE_ENABLED = "False";
      PD_ENABLED = "False";
      SLACK_ENABLED = "False";
      SPIKE_ENABLED = "False";
      VICTOROPS_ENABLED = "False";
      ZULIP_ENABLED = "False";
    };
  };

  imports = [ ./fix-401010-pydantic-error.nix ];
}
````

## File: homelab-subflake/services/healthchecks/manifest.nix
````nix
{ lib, serviceName, ... }:
{
  module = ./healthchecks.nix;

  endpoints.web = {
    port = 8000;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  observability = {
    # TODO: this URL points to the "mostly backups" project in `healthchecks`. While important, it's not proper "service is up" monitoring.
    metrics.main.path = lib.homelab.getServiceConfig serviceName |> (cfg: cfg.metricsURL);
    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };

  # Backups disabled - FIXME: enable after migration of cerium
  # ```
  # backups = {
  #   paths = [ "/var/lib/healthchecks" ];
  #   impl = { lib, ... }:
  #     lib.localLib.mkBkp {
  #       paths = [ "/var/lib/healthchecks" ];
  #       inherit serviceName;
  #       localOnly = true;
  #     };
  # };
  # ```

  dashboard = {
    category = "Admin";
    links = [
      {
        description = "Periodic ping reporting (backups, network check, etc.)";
        icon = "healthchecks";
        name = "Healthchecks";
      }
    ];
  };
}
````

## File: homelab-subflake/services/home-assistant/customComponents/meross_lan.nix
````nix
{ fetchFromGitHub, buildHomeAssistantComponent }:
let
  owner = "krahabb";
  domain = "meross_lan";
  version = "5.2.1";
in
buildHomeAssistantComponent {
  inherit owner domain version;

  src = fetchFromGitHub {
    inherit owner;
    repo = domain;
    rev = "v${version}";
    sha256 = "sha256-lVenFLztOe3HKo2r1QG5kezV4TAiw5McBPh3RQvuF08=";
  };

  propagatedBuildInputs = [ ]; # if you get error like "paho module not found" -- add mqtt to the HA components
}
````

## File: homelab-subflake/services/home-assistant/functional/allow-ui-object-editing.nix
````nix
/**
  Allows users to work on
  - automations
  - scripts
  - scenes

  in HA UI while keeping the nix-managed stuff declarative.

  This file was stole^W inspired by https://wiki.nixos.org/wiki/Home_Assistant
*/
{ config, lib, ... }:
let
  # WARN: relies on default home assistant file names
  uiEditableConfigCategories = [
    "automation"
    "scene"
    "script"
  ];
  inherit (lib) pipe;
in
{
  services.home-assistant.config = pipe uiEditableConfigCategories [
    (map (cat: {
      name = "${cat} ui";
      value = "!include ${cat}s.yaml";
    }))
    builtins.listToAttrs
  ];

  # Otherwise HA might complain about missing file
  systemd.tmpfiles.rules = map (
    cat:
    (lib.concatStringsSep " " [
      "f"
      "${config.services.home-assistant.configDir}/${cat}.yaml"
      "0755"
      "${config.systemd.services.home-assistant.serviceConfig.User}"
      "${config.systemd.services.home-assistant.serviceConfig.Group}"
    ])
  ) uiEditableConfigCategories;
}
````

## File: homelab-subflake/services/home-assistant/functional/outlet-rebooter.nix
````nix
{ pkgs, lib, ... }:
let
  inherit (lib.homelab) getHostInNetwork;
in
{
  systemd.services.reboot-outlet = {
    description = "Reboot the outlet just in case";
    script =
      let
        kasaCli = lib.getExe' pkgs.python3Packages.python-kasa "kasa";
        outletIp = (getHostInNetwork "patio-outlet" "lan").ipAddress;
      in
      ''
        ${kasaCli} --host ${outletIp} reboot
      '';
  };

  systemd.timers.reboot-outlet = {
    description = "Timer to reboot the outlet";
    timerConfig.OnCalendar = "*-*-* 03:00:00";
    wantedBy = [ "multi-user.target" ];
  };
}
````

## File: homelab-subflake/services/home-assistant/functional/zwave.nix
````nix
{
  config,
  ...
}:
{

  services.zwave-js = {
    enable = true;
    serialPort = "/dev/serial/by-id/usb-Silicon_Labs_HubZ_Smart_Home_Controller_516009E5-if00-port0";
    secretsConfigFile = config.age.secrets.zwave-secret.path;
  };
  # /* Sets up the rules for the USB dongle */
  # services.udev.extraRules = ''
  #   KERNEL=="ttyUSB[0-9]*",MODE="0666"
  # '';
}
````

## File: homelab-subflake/services/home-assistant/non-functional/alerts.nix
````nix
{ serviceName, ... }:
let
  grafanaDashboardId = "8b2bb3e2-0b78-48c0-9928-47de6cf7e138";
in
{
  Emergency = [
    {
      title = "Scrape is down";
      expr = ''absent(up{resource="srv:${serviceName}"}) or up{resource="srv:${serviceName}"} == 0'';
      description = "Home Assistant metrics are not being scraped. Service may be down.";
    }
  ];
  Warning = [
    {
      title = "High unavailable entity ratio";
      expr = ''count(homeassistant_entity_available{resource="srv:${serviceName}"} == 0) / count(homeassistant_entity_available{resource="srv:${serviceName}"}) > 0.4'';
      description = "More than 40% of Home Assistant entities are unavailable. May indicate widespread device connectivity issues.";
    }
    {
      title = "Low battery sensor";
      expr = ''homeassistant_sensor_battery_percent{resource="srv:${serviceName}"} < 10 and homeassistant_sensor_battery_percent{resource="srv:${serviceName}"} >= 0'';
      description = "A tracked device's battery is below 10%.";
    }
  ];
}
|> builtins.mapAttrs (_: v: v |> map (it: it // { inherit grafanaDashboardId; }))
````

## File: homelab-subflake/services/home-assistant/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  services.home-assistant.config.http = {
    server_port = endpoints.web.port;
    server_host = lib.homelab.getOwnIpInNetwork "backbone-inner";
    trusted_proxies = lib.homelab.getSSLProxyIPs;
    use_x_forwarded_for = true;
  };
}
````

## File: homelab-subflake/services/home-assistant/non-functional/metrics.nix
````nix
# https://www.home-assistant.io/integrations/prometheus/
{
  services.home-assistant = {
    extraComponents = [ "prometheus" ];
    # ACLs take care of that
    config.prometheus.requires_auth = false;
  };
}
````

## File: homelab-subflake/services/home-assistant/home-assistant.nix
````nix
{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib.homelab) getServiceConfig;

  srvName = "home-assistant";
  srvConfig = getServiceConfig srvName;

in
{
  services.home-assistant = {
    enable = true;
    extraComponents = [
      "isal"
      # Components required to complete the onboarding
      "esphome"
      "met"
      "radio_browser"
      "homekit_controller"
      "zeroconf"
      "mqtt"
      "dhcp"
      "zha"
      "wiz"
      "ntfy"
    ]
    ++ srvConfig.components;

    # Build custom components. { } does not pass deps which is OK for now
    customComponents = map (x: pkgs.callPackage x { }) [ ./customComponents/meross_lan.nix ];

    customLovelaceModules = [
      pkgs.ha-floorplan
    ];

    config = {
      default_config = { };
      homeassistant = {
        media_dirs.recordings = "/var/lib/hass/media/recordings";
        time_zone = config.time.timeZone;
        name = "Home";
      };
    };
  };

  # Additional config
  imports = lib.localLib.mkImportsFromDir ./functional;
}
````

## File: homelab-subflake/services/home-assistant/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./home-assistant.nix;

  endpoints.web = {
    port = 8123;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  backups = {
    paths = [ "/var/lib/hass" ];
  };

  observability = {
    metrics.main = {
      impl = ./non-functional/metrics.nix;
      path = "/api/prometheus";
    };
    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };

  dashboard = {
    category = "Home";
    links = [
      {
        description = "The brains of the smart home";
        icon = "home-assistant";
        name = "Home assistant";
      }
    ];
  };
}
````

## File: homelab-subflake/services/home-dashboard/functional/add-links-from-manifests.nix
````nix
{
  lib,
  ...
}:
{
  services.homepage-dashboard.services =
    # Take data-flake and self `serviceModules`
    lib.homelab.getManifests
    # Filter only ones that have "dashboard" attribute
    |> lib.filterAttrs (
      _: value: (value |> builtins.hasAttr "dashboard") && (!builtins.isNull value.dashboard)
    )
    # The general format at this point is:
    # `service-foo = { category = "bar"; links = [ { { path = "/"; description = "baz"; icon = "foz"; name = "qux"; }}] }`
    |> lib.mapAttrs (
      name: value:
      let
        inherit (value) dashboard;
      in
      {
        "${dashboard.category}" =
          dashboard.links
          |> map (it: {
            "${it.name}" = {

              # Human readable description of the service on the dashboard
              inherit (it) description;

              # This will be the URL that opens when clicking on the tile
              # Explicit `absoluteURL` wins
              # If problems here – check `../../../lib/manifest-options.nix`
              href =
                if !builtins.isNull it.absoluteURL then
                  it.absoluteURL
                else
                  let
                    service = if builtins.isNull it.service then name else it.service;
                  in
                  service
                  |> lib.homelab.getServiceFqdn
                  |> (it': "https://${it'}")
                  |> (it': "${it'}${it.path |> toString}");

              # Get the icon, but fallback to `selfhosted` icon
              icon =
                "filedump"
                |> lib.homelab.getServiceFqdn
                |> (it': "https://${it'}")
                |> (it': "${it'}/dashboard-icons/png")
                |> (it': "${it'}/${if builtins.isNull it.icon then "selfhosted" else it.icon}.png");
            };
          });
      }
    )
    |> builtins.attrValues
    # Merge. This is mostly done so that categories don't override each other.
    # I believe usually first wins by default.
    |> lib.localLib.recursiveMerge
    # Looks like homepage expects a list of single attribute sets per category.
    # Rearrange the list as it wants.
    |> lib.attrsToList
    |> map (it: {
      "${it.name}" = it.value;
    });
}
````

## File: homelab-subflake/services/home-dashboard/functional/maintenance-iframe.nix
````nix
{ lib, ... }:
{
  services.homepage-dashboard.services = [
    {
      Maintenance = [
        {
          Dashboard.widget = {
            type = "iframe";
            src = "https://${lib.homelab.getServiceFqdn "filedump"}/home_maint.html";
          };
        }
      ];
    }
  ];
}
````

## File: homelab-subflake/services/home-dashboard/non-functional/alerts.nix
````nix
{ serviceName, ... }:
{ lib, ... }:
{
  Informational = [
    {
      title = "Spike in proxy errors";
      query = "(vector(0) and on() (irate(ssl_proxy_nginx_http_requests_total{domain=\"${
        serviceName |> lib.homelab.getServiceFqdn
      }\", result!=\"2xx_3xx_success\"}[3m]) > 0)) or on() vector(1) ";
    }
  ];
}
````

## File: homelab-subflake/services/home-dashboard/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  services.homepage-dashboard.allowedHosts = lib.homelab.getServiceFqdn "home-dashboard";
}
````

## File: homelab-subflake/services/home-dashboard/home-dashboard.nix
````nix
# Tiny module that provides configuration for homepage dashboard
{ lib, ... }:
let
  inherit (lib.homelab) getServiceConfig;

  srvName = "home-dashboard";
  srvCfg = getServiceConfig srvName;
in
{
  services.homepage-dashboard = {
    enable = true;
    inherit (srvCfg) bookmarks settings;
  };

  # This bit of code allowed dynamically loading secrets into
  # homepage-dashboard by enumerating them from the service. It relied on a
  # (now, obsolete) function `getSrvSecret`. I am no longer using
  # homepage-dashboard to retrieve stuff from services, but leaving this in
  # case I ever want to come back to this pattern.
  # ```
  #   systemd.services.homepage-dashboard = {
  #     serviceConfig = {
  #       # Inject credentials for services so widgets work.
  #       #
  #       # Uses `LoadCredential` to inject the secrets into systemd unit. Works
  #       # with `DynamicUser` which is what homepage-dashboard service uses.
  #       LoadCredential = lib.mapAttrsToList (
  #         name: _: "${name}:${config.age.secrets.${name}.path}"
  #       ) srv.secrets;
  #     };
  #
  #     # Pass the secret paths in $CREDENTIALS_STORE to homepage-dashboard using %d placeholder
  #     environment = lib.mapAttrs' (
  #       name: _: lib.nameValuePair ("HOMEPAGE_FILE_" + (lib.toUpper name)) "%d/${name}"
  #     ) srv.secrets;
  #   };
  #
  #   # Add homepage-dashboard specific secrets to `agenix`
  #   age.secrets = builtins.mapAttrs (name: _: { file = getSrvSecret srvName name; }) srv.secrets;
  # ```

  imports = lib.localLib.mkImportsFromDir ./functional;
}
````

## File: homelab-subflake/services/home-dashboard/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./home-dashboard.nix;

  endpoints.web = {
    port = 8082;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  observability = { }; # TODO: implement 200 probe and staleness probe for home tasks

  # No dashboard entry for the dashboard itself.
}
````

## File: homelab-subflake/services/homebox/non-functional/alerts.nix
````nix

````

## File: homelab-subflake/services/homebox/non-functional/endpoints-config.nix
````nix
endpoints: { ... }:
{
  services.homebox.settings.HBOX_WEB_PORT = endpoints.web.port |> toString;
}
````

## File: homelab-subflake/services/homebox/non-functional/ssl.nix
````nix
{ serviceName, ... }:
{
  config,
  lib,
  self,
  ...
}:
let
  inherit (lib.homelab.getManifest serviceName) endpoints;
in
self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
  inherit config lib serviceName;
  inherit (endpoints.web) port;
  onlyHumans = true;
}
````

## File: homelab-subflake/services/homebox/non-functional/sso.nix
````nix
{ lib, config, ... }:
let
  keycloakRealm = (lib.homelab.getServiceConfig "keycloak").realmURL;
in
{
  services.homebox.settings = {
    HBOX_OIDC_ENABLED = "true";
    HBOX_OIDC_ISSUER_URL = keycloakRealm;
    HBOX_OIDC_CLIENT_ID = "homebox";
    HBOX_OIDC_AUTO_REDIRECT = "true";
    HBOX_OPTIONS_ALLOW_LOCAL_LOGIN = "false";
    HBOX_OPTIONS_ALLOW_REGISTRATION = "false";
    HBOX_OPTIONS_TRUST_PROXY = "true";
  };

  # HBOX_OIDC_CLIENT_SECRET is injected via the secret file (key=value format)
  systemd.services.homebox.serviceConfig.EnvironmentFile = [
    config.age.secrets.homebox-oidc-secret.path
  ];
}
````

## File: homelab-subflake/services/homebox/homebox.nix
````nix
{ pkgs-unstable, lib, ... }:
let
  homeBoxPkg = pkgs-unstable.homebox;
in
{
  services.homebox.enable = true;

  services.homebox.package =
    assert lib.assertMsg (lib.versionOlder homeBoxPkg.version "1.25.0")
      "Check if the override is still necessary";
    homeBoxPkg;

  services.homebox.settings = {
    HBOX_OPTIONS_GITHUB_RELEASE_CHECK = "false";
  };

  imports = [
    ./non-functional/sso.nix
  ];
}
````

## File: homelab-subflake/services/homebox/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./homebox.nix;

  endpoints.web = {
    port = 7745;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; };

  backups = {
    paths = [ "/var/lib/homebox/data" ];
  };

  observability = { }; # TODO: implement probe and metrics https://homebox.software/en/advanced/opentelemetry/

  dashboard = {
    category = "Home";
    links = [
      {
        description = "Stuff @ home";
        icon = "homebox";
        name = "Homebox";
      }
    ];
  };
}
````

## File: homelab-subflake/services/keycloak/non-functional/probes/prometheus.nix
````nix
/**
  Probes keycloak's own SSL certificate via `srv:ssl-proxy`'s ssl-exporter.
  Keycloak manages its own cert (centralSSL = false), so it gets a dedicated probe job.
*/
{ lib, ... }:
{
  services.prometheus.scrapeConfigs = [
    {
      job_name = "ssl-probe-keycloak";
      metrics_path = "/probe";
      scheme = "https";
      static_configs = [
        {
          targets = [ "${lib.homelab.getServiceFqdn "keycloak"}:443" ];
          labels = {
            cert_type = "own";
            resource = "srv:keycloak";
          };
        }
      ];
      relabel_configs = [
        {
          source_labels = [ "__address__" ];
          target_label = "__param_target";
        }
        {
          source_labels = [ "__param_target" ];
          target_label = "instance";
        }
        # Reuse ssl-proxy's ssl-exporter — no exporter runs on keycloak's host
        {
          target_label = "__address__";
          replacement = lib.homelab.services.getServiceMetricsFqdn "ssl-proxy";
        }
      ];
    }
  ];
}
````

## File: homelab-subflake/services/keycloak/non-functional/alerts.nix
````nix
{ serviceName, lib, ... }:
let
  host = lib.homelab.getServiceHost serviceName;
  fsDiskLabel = ''mountpoint="/", host="${host}"'';
in
{
  Emergency = [
    {
      title = "service down";
      expr = ''absent(up{resource="srv:${serviceName}", job="keycloak-main-metrics"}) or up{resource="srv:${serviceName}", job="keycloak-main-metrics"} == 0'';
    }
    {
      title = "DB pool exhausted";
      expr = ''agroal_awaiting_count{resource="srv:${serviceName}"} > 0'';
      description = "Connections waiting for DB pool — service is degraded";
    }
  ];
  Alert = [
    {
      title = "SSL probe failed";
      expr = ''absent(ssl_probe_success{resource="srv:${serviceName}"}) or ssl_probe_success{resource="srv:${serviceName}"} == 0'';
      description = "Keycloak TLS handshake failing — SSO unavailable for all services";
    }
  ];
  Critical = [
    {
      title = "disk almost full";
      expr = "(node_filesystem_avail_bytes{${fsDiskLabel}} / node_filesystem_size_bytes{${fsDiskLabel}}) * 100 < 10";
      description = "Free disk space < 10%";
    }
  ];
  Warning = [
    {
      title = "auth error events";
      expr = ''rate(keycloak_user_events_total{resource="srv:${serviceName}", error!=""}[5m]) >= 1'';
      description = "Sustained authentication errors — possible brute force or misconfigured client";
    }
    {
      title = "DB pool no connections available";
      expr = ''agroal_available_count{resource="srv:${serviceName}"} == 0'';
      description = "No idle DB connections — pool approaching exhaustion";
    }
  ];
}
````

## File: homelab-subflake/services/keycloak/non-functional/endpoints-config.nix
````nix
{
  services.keycloak.settings.http-host = "0.0.0.0";
}
````

## File: homelab-subflake/services/keycloak/non-functional/firewall.nix
````nix
{ lib, ... }:
{
  networking.firewall.extraInputRules  = ''
    ip daddr ${lib.homelab.getOwnIpInNetwork "lan"} tcp dport 443 accept comment "keycloak main web port"
    ip daddr ${lib.homelab.getOwnIpInNetwork "backbone-inner"} tcp dport 443 accept comment "keycloak main web port"
  '' ;
}
````

## File: homelab-subflake/services/keycloak/non-functional/metrics.nix
````nix
{ ... }:
{
  # Firewall rules for metrics are now auto-generated from endpoints.
  # This module only configures Keycloak's metrics settings.

  services.keycloak.settings = {
    metrics-enabled = true;
    http-management-scheme = "http"; # Otherwise breaks current implementation of Prometheus scrape
    event-metrics-user-enabled = true;
  };
}
````

## File: homelab-subflake/services/keycloak/keycloak.nix
````nix
{ config, lib, ... }:
let
  srvName = "keycloak";
in
{
  services.keycloak = {
    enable = true;

    sslCertificate = config.age.secrets.ssl-cert.path;
    sslCertificateKey = config.age.secrets.ssl-key.path;

    settings = {
      hostname = srvName |> lib.homelab.getServiceFqdn;
    };
    database.passwordFile = config.age.secrets.keycloak-db-password.path;
  };
}
````

## File: homelab-subflake/services/keycloak/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./keycloak.nix;

  endpoints = {
    web = {
      port = 443;
      protocol = "https";
    };
    metrics = {
      port = 9000;
      protocol = "tcp";
    };
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  # Custom firewall: Keycloak handles its own SSL
  firewall = ./non-functional/firewall.nix;


  observability = {
    metrics.main = {
      impl = ./non-functional/metrics.nix;
    };
    alerts.prometheusImpl = ./non-functional/alerts.nix;
    probes = {
      enable = true;
      ssl = true;
      prometheusImpl = ./non-functional/probes/prometheus.nix;
    };
  };

  backups = {
    localDB = true; # Everything in database
  };

  dashboard = {
    category = "Admin";
    links = [
      {
        description = "SSO";
        icon = "keycloak";
        name = "Keycloak";
      }
    ];
  };
}
````

## File: homelab-subflake/services/linkwarden/non-functional/database.nix
````nix
{ config, lib, ... }:
{
  services.linkwarden.database = {
    createLocally = lib.mkForce false;
    host = "maindb.${lib.homelab.getSettings.publicDomainName}"; # TODO: `prj:move-db`
  };

  services.linkwarden.secretFiles.POSTGRES_PASSWORD = config.age.secrets.linkwarden-db-password.path;
}
````

## File: homelab-subflake/services/linkwarden/non-functional/endpoints-config.nix
````nix
endpoints:
{ lib, ... }:
{
  services.linkwarden = {
    host = lib.homelab.getOwnIpInNetwork "backbone-inner";
    port = endpoints.web.port;
  };
}
````

## File: homelab-subflake/services/linkwarden/flaresolverr.nix
````nix
{ pkgs-unstable, pkgs, ... }:
{
  services.flaresolverr = {
    enable = true;
    package = pkgs-unstable.flaresolverr;
  };

  services.linkwarden = {
    package = pkgs.linkwarden.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [ ./linkwarden-flaresolverr.patch ];
    });
    environment.FLARESOLVERR_URL = "http://localhost:8191";
  };
}
````

## File: homelab-subflake/services/linkwarden/linkwarden.nix
````nix
{ lib, config, ... }:
{
  imports = [ ./flaresolverr.nix ];

  services.linkwarden = {
    enable = true;

    environment.NEXTAUTH_URL = "https://${lib.homelab.getServiceFqdn "linkwarden"}/api/v1/auth";

    secretFiles.NEXTAUTH_SECRET = config.age.secrets.linkwarden-nextauth-secret.path;

    environment = {
      NEXT_PUBLIC_KEYCLOAK_ENABLED = "true";
      KEYCLOAK_ISSUER = (lib.homelab.getServiceConfig "keycloak").realmURL;
      KEYCLOAK_CLIENT_ID = "linkwarden";
    };

    secretFiles.KEYCLOAK_CLIENT_SECRET = config.age.secrets.linkwarden-keycloak-secret.path;
  };
}
````

## File: homelab-subflake/services/linkwarden/manifest.nix
````nix
{ ... }:
{
  module = ./linkwarden.nix;

  endpoints.web = {
    port = 3000;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  backups.paths = [ "/var/lib/linkwarden" ];

  database = {
    create = true;
    impl = ./non-functional/database.nix;
  };

  dashboard = {
    category = "Home";
    links = [
      {
        name = "Linkwarden";
        icon = "linkwarden";
        description = "Collaborative bookmark manager";
      }
    ];
  };

  documentation = ./README.md;
}
````

## File: homelab-subflake/services/log-concentrator/functional/collect-access-logs.nix
````nix
/**
  Sets up access logs aggregation from the `srv:ssl-proxy`.
*/
{
  services.vector.settings.sources.access-log-concentrator = {
    type = "vector";
    address =
      let
        port = 9514;
      in
      "0.0.0.0:${port |> toString}"; # Listen on all interfaces, let firewall handle the access
  };
}
````

## File: homelab-subflake/services/log-concentrator/functional/collect-and-remap-rsyslog.nix
````nix
/**
  Sets up `rsyslog` collecting and remapping for certain non-NixOS resources.
*/
{ lib, ... }:
{
  options.homelab.services.log-concentrator.rsyslogClients = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "Hostnames of clients allowed to send rsyslog events";
  };
  config = {
    # Allow clients
    homelab.services.log-concentrator.rsyslogClients = [
      "nas"
      "ruckus-office"
    ];

    services.vector.settings = {
      api.enabled = true;

      sources.syslog-log-concentrator = {
        type = "syslog";
        mode = "udp";
        address = "0.0.0.0:${
          (lib.homelab.getManifest "log-concentrator").endpoints.syslog.port |> toString
        }"; # Listen on all interfaces, let firewall handle the access
      };

      transforms.syslog-to-otel-log = {
        type = "remap";
        inputs = [ "syslog-log-concentrator" ];
        source =
          # vrl
          ''
            severity_text_to_severity_number = {
                "TRACE": "1",
                "DEBUG": "5",
                "INFO": "9",
                "INFO2": "10",
                "WARN": "13",
                "ERROR": "17",
                "ERROR2": "18",
                "ERROR3": "19",
                "FATAL": "21",
            }
            hostname = if (.host == "ZD-APMgr" || ."source_ip" == "${lib.homelab.hosts.getLANIP "ruckus-office"}") { "ruckus-office" } else {.host}


            . = {
                "Timestamp": to_unix_timestamp(.timestamp) ?? null,
                "ObservedTimestamp": to_unix_timestamp(now()),

                # These don't really map to journald
                "TraceID": null,
                "SpanId": null,

                "SeverityText": .severity,
                "SeverityNumber": get(severity_text_to_severity_number, [to_string(.severity) ?? null]) ?? null,

                "Body": strip_ansi_escape_codes(.message) ?? .message,
                "Resource": {
                    "host": {
                        "name": hostname,
                    },
                    "service": {
                        "name": ."app-name" || null,
                    },
                },
                "Attributes": {
                    "syslog": {
                        "facility": .facility || null,
                        "version": .version || null,
                        "procid": .procid || null,
                    },
                },
            }
          '';
      };
    };
  };
}
````

## File: homelab-subflake/services/log-concentrator/functional/collect-deployments.nix
````nix
/**
  Parses incoming logs, looking for deployment events. If there are any –
  sends them down a separate path.
*/
{
  services.vector.settings.transforms.events-deployments = {
    type = "remap";
    inputs = [ "vector-log-concentrator" ];
    source =
      # vrl
      ''
        # Discard non-nixos messages
        if .SYSLOG_IDENTIFIER != "nixos" {
          abort
        }

        # Skip the "starting" message
        .message = string!(.message)
        if contains(.message, "switching to") && !contains(.message, "(status") && !contains(.message, "finished") {
            abort
        }

        # Extract target version and status of switch
        # .*? is non-greedy match for hostname
        target_version = parse_regex!(.message, r'.*nixos-system-.*?-(?P<version>[^ ]*)').version
        status = parse_regex(.message, r'status (?P<status>\d)').status ?? 0

        # Store needed values
        host = .host
        ts = .timestamp  # "timestamp" is reserved

        # clear the object
        del(.)

        # Reconstruct the values
        .target_version = target_version
        .host = host
        .timestamp = ts
        .status = status

      '';
  };
}
````

## File: homelab-subflake/services/log-concentrator/functional/dnstap.nix
````nix
/**
  Aggregate `dnstap` logs from `srv:dns` nodes.
*/
{ lib, ... }:
let
  dnstapPort = (lib.homelab.getManifest "log-concentrator").endpoints.dnstap.port;
in
{
  services.vector.settings = {
    sources.dnstap-concentrator = {
      type = "vector";
      address = "0.0.0.0:${dnstapPort |> toString}";
      # See the private mixin for the write portion
    };

    transforms.dnstap-remap = {
      type = "remap";
      inputs = [ "dnstap-concentrator" ];
      source = # vrl
        ''
          .timestamp = from_unix_timestamp!(.time, unit: "nanoseconds")

          # Network details
          .client_ip = .sourceAddress
          .client_port = .sourcePort
          .responder_ip = .responseAddress
          .responder_port = .responsePort
          .socket_family = .socketFamily
          .socket_protocol = .socketProtocol

          # Message details
          .message_type = .messageType
          .rcode = .responseData.rcodeName || "UNKNOWN"

          # Extract Flags
          .flag_qr = .responseData.header.qr
          .flag_aa = .responseData.header.aa
          .flag_tc = .responseData.header.tc
          .flag_rd = .responseData.header.rd
          .flag_ra = .responseData.header.ra

          # Extract Question (Take the first one)
          q = .responseData.question[0]
          .question_name = q.domainName
          .question_type = q.questionType
          .question_class = q.class

          # Extract Answers (Parallel Arrays)
          # Map the array of objects into arrays of primitives
          answers = []
          if exists(.responseData.answers) && is_array(.responseData.answers) {
              answers = array!(.responseData.answers);
          }

          .answer_names = map_values(answers) -> |v| { v.domainName || "" }
          .answer_types = map_values(answers) -> |v| { v.recordType || "" }
          .answer_rdata = map_values(answers) -> |v| { v.rData || "" }

          # Remove original nested JSON to keep payload clean
          del(.responseData)
          del(.dataType)
          del(.dataTypeId)
          del(.messageTypeId)
          del(.responseAddress)
          del(.responsePort)
          del(.sourceAddress)
          del(.sourcePort)
          del(.source_type)
          del(.time) # Used the ISO timestamp
          del(.timePrecision)
        '';
    };
  };

  # Firewall
  networking.firewall.extraInputRules = ''
    iifname "backbone-inner" ip saddr {${
      lib.homelab.services.getInstances "dns"
      |> map lib.homelab.getServiceInnerIP
      |> lib.concatStringsSep ", "
    }} tcp dport ${dnstapPort |> toString} accept
  '';
}
````

## File: homelab-subflake/services/log-concentrator/functional/remap-journald-to-otel.nix
````nix
/**
    Construct the open telemetry format logs
    https://opentelemetry.io/docs/specs/otel/logs/data-model/

    https://opentelemetry.io/docs/specs/otel/logs/data-model-appendix/#appendix-b-severitynumber-example-mappings
*/
{
  services.vector.settings.transforms.journald-to-otel-log = {
    type = "remap";
    inputs = [ "vector-log-concentrator" ];
    source =
      # vrl
      ''
        # Construct the otel format logs
        # https://opentelemetry.io/docs/specs/otel/logs/data-model/

        # https://opentelemetry.io/docs/specs/otel/logs/data-model-appendix/#appendix-b-severitynumber-example-mappings
        priority_to_severity_number = {
            "0": 21, # Emergency
            "1": 19, # Alert
            "2": 18, # Critical
            "3": 17, # Error
            "4": 13, # Warning
            "5": 10, # Notice
            "6": 9, # Informational
            "7": 5, # Debug
        }

        # Alternative implementation: nested ifs for ranges, but this will do for now
        severity_number_to_severity_text = {
            "1": "TRACE",
            "5": "DEBUG",
            "9": "INFO",
            "10": "INFO2",
            "13": "WARN",
            "17": "ERROR",
            "18": "ERROR2",
            "19": "ERROR3",
            "21": "FATAL",
        }

        severityNumber = get(priority_to_severity_number, [.PRIORITY]) ?? null

        . = {
            "Timestamp": to_unix_timestamp(.timestamp) ?? null,
            "ObservedTimestamp": to_unix_timestamp(now()),
            # These don't really map to journald
            "TraceID": null,
            "SpanId": null,

            # Simple mapper of severities
            # Journald relies on RFC5424 priorities
            "SeverityText": get(severity_number_to_severity_text, [to_string(severityNumber) ?? null]) ?? null,
            "SeverityNumber": severityNumber,

            "Body": strip_ansi_escape_codes(.message) ?? .message,
            "Resource": {
                "host": {
                    "name": .host,
                },
                "service": {
                    "name": ._SYSTEMD_USER_UNIT || ._SYSTEMD_UNIT,
                },
            },
            "Attributes": {
                "syslog": {
                    "facility": .SYSLOG_IDENTIFIER || null,
                    "procid": .PROCID || null,
                },
            },
        }

      '';
  };

}
````

## File: homelab-subflake/services/log-concentrator/non-functional/alerts.nix
````nix
{ serviceName, ... }:
{
  Emergency = [
    {
      title = "Scrape is down";
      query = "up{job=\"${serviceName}-srv-scrape\"}";
      description = "Log concentrator appears to be down.";
    }
  ];

  # TODO: add DLQ monitoring
}
````

## File: homelab-subflake/services/log-concentrator/non-functional/endpoints-config.nix
````nix
endpoints: { ... }:
{
  services.vector.settings.sources.vector-log-concentrator = {
    type = "vector";
    address = "0.0.0.0:${endpoints.vector.port |> toString}";
  };
}
````

## File: homelab-subflake/services/log-concentrator/non-functional/firewall.nix
````nix
{
  config,
  lib,
  ...
}:
let
  inherit (lib.homelab.getManifest "log-concentrator") endpoints;
in
{
  networking.firewall.extraInputRules = ''
    iifname "backbone-inner" tcp dport ${endpoints.vector.port |> toString} accept
    iifname "phy-lan" ip saddr ${
      config.homelab.services.log-concentrator.rsyslogClients
      |> map (lib.homelab.hosts.getLANIP)
      |> lib.concatStringsSep ", "
      |> (it: "{ ${it} }")
    } udp dport ${endpoints.syslog.port |> toString} accept
    iifname "backbone-inner" ip saddr ${"ssl-proxy" |> lib.homelab.getServiceInnerIP} tcp dport ${
      endpoints.access-logs.port |> toString
    } accept comment "Allow log shipper to deposit access logs from the ssl proxy"
  '';
}
````

## File: homelab-subflake/services/log-concentrator/non-functional/metrics.nix
````nix
/**
  Sets up vector to report its own metrics for `srv:prometheus` to scrape.
*/
{ lib, ... }:
{
  services.vector.settings = {
    sources.vector-metrics.type = "internal_metrics";

    sinks.vector-exporter = {
      type = "prometheus_exporter";
      inputs = [ "vector-metrics" ];
      address = "0.0.0.0:${(lib.homelab.getManifest "log-concentrator").endpoints.metrics.port |> toString}";
    };
  };
}
````

## File: homelab-subflake/services/log-concentrator/log-concentrator.nix
````nix
{ lib, ... }:
{
  imports = lib.localLib.mkImportsFromDir ./functional;

  services.vector.enable = true;
}
````

## File: homelab-subflake/services/log-concentrator/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./log-concentrator.nix;

  endpoints = {
    vector = {
      port = 6000;
      protocol = "tcp";
    };
    syslog = {
      port = 514;
      protocol = "udp";
    };
    access-logs = {
      port = 9514;
      protocol = "tcp";
    };
    dnstap = {
      port = 9001;
      protocol = "tcp";
    };
    metrics = {
      port = 8087;
      protocol = "tcp";
    };
  };

  firewall = ./non-functional/firewall.nix;

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  observability = {
    metrics.main = {
      impl = ./non-functional/metrics.nix;
      path = "/metrics";
      endpoint = "metrics";
    };
    alerts.grafanaImpl = import ./non-functional/alerts.nix { inherit serviceName; };
  };
}
````

## File: homelab-subflake/services/lubelogger/non-functional/database.nix
````nix
{ config, ... }:
{
  # `POSTGRES_CONNECTION` must be the full postgres connection string, e.g.:
  # `Host=<db-fqdn>;Database=lubelogger;Username=lubelogger;Password=<password>`
  services.lubelogger.environmentFile = config.age.secrets.lubelogger-env.path;
}
````

## File: homelab-subflake/services/lubelogger/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  services.lubelogger = {
    port = endpoints.web.port;
    settings."Kestrel__Endpoints__Http__Url" =
      "http://${lib.homelab.getOwnIpInNetwork "backbone-inner"}:${endpoints.web.port |> toString}";
  };
}
````

## File: homelab-subflake/services/lubelogger/non-functional/sso.nix
````nix
{ lib, ... }:
let
  keycloakRealm = (lib.homelab.getServiceConfig "keycloak").realmURL;
in
{
  services.lubelogger = {
    enable = true;
    settings = {
      OpenIDConfig__Name = "Keycloak";
      OpenIDConfig__ClientId = "lubelogger";
      OpenIDConfig__AuthURL = "${keycloakRealm}/protocol/openid-connect/auth";
      OpenIDConfig__TokenURL = "${keycloakRealm}/protocol/openid-connect/token";
      EnableAuth = "true";
      OpenIDConfig__RedirectURL = "https://${lib.homelab.getServiceFqdn "lubelogger"}/Login/RemoteAuth";
      OpenIDConfig__DisableRegularLogin = "true"; # optional: skip the login form
      OpenIDConfig__LogOutURL = "${(lib.homelab.getServiceConfig "keycloak").realmURL}/protocol/openid-connect/logout";
      OpenIDConfig__AutoGenerateTokens = "true";
      EnableRootUserOIDC = "true";
      UserNameHash = "280e6555c7b9263d3baa003e2c7433d3ca28741bffc175082709a2e4450f3377";
    };
  };
}
````

## File: homelab-subflake/services/lubelogger/non-functional/storage.nix
````nix
/**
  Ensures that a partition is mounted for `srv:lubelogger`
*/
{ config, ... }:
let
  serviceName = "lubelogger";
  stateDir = "/var/lib/${config.services.${serviceName}.dataDir}";
in
{
  systemd = {
    services.${serviceName}.unitConfig.RequiresMountsFor = [ stateDir ];
    mounts = [
      {
        what = "/dev/disk/by-label/${serviceName}";
        where = stateDir;
        options = "noatime";
      }
    ];
  };
}
````

## File: homelab-subflake/services/lubelogger/lubelogger.nix
````nix
{ ... }:
{
  services.lubelogger.enable = true;

  imports = [
    ./non-functional/sso.nix
  ];
}
````

## File: homelab-subflake/services/lubelogger/manifest.nix
````nix
{ ... }:
{
  module = ./lubelogger.nix;

  endpoints.web = {
    port = 5000;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  database = {
    create = true;
    impl = ./non-functional/database.nix;
  };

  storage.impl = ./non-functional/storage.nix;

  backups = {
    paths = [ "/var/lib/lubelogger" ];
  };

  dashboard = {
    category = "Home";
    links = [
      {
        name = "LubeLogger";
        icon = "lubelogger";
        description = "Vehicle maintenance tracker";
      }
    ];
  };

  documentation = ./README.md;
}
````

## File: homelab-subflake/services/mqtt/non-functional/firewall.nix
````nix
{ lib, ... }:
# TODO: this basically lets it listen on LAN, change when finalizing S2S network
{
  networking.firewall.allowedTCPPorts = [ (lib.homelab.getManifest "mqtt").endpoints.mqtt.port ];
}
````

## File: homelab-subflake/services/mqtt/non-functional/logging.nix
````nix
{
  services.vector.settings = {
    sources.mqtt = {
      type = "mqtt";
      host = "127.0.0.1";
      topic = "#";
    };

    transforms.mqtt-formatted = {
      type = "remap";
      inputs = [ "mqtt" ];
      source = ''
        # Drop snapshots, not needed for debugging
        if ends_with(string!(.topic), "/snapshot") {
            abort
        }

        .payload = .message
        .timestamp = .timestamp || now()

        # Ensure values match the CH table types
        .qos = int!(.qos || 0)
        .retain = int!(.retain || 0)

        # Clean up internal Vector fields before sending
        del(.message)
        del(.source_type)

      '';
    };
  };
}
````

## File: homelab-subflake/services/mqtt/non-functional/ssl.nix
````nix
{ config, lib, ... }:
let
  ownIP = lib.homelab.getOwnIpInNetwork "lan";
in
{
  age.secrets.ssl-cert = {
    owner = config.services.nginx.user;
    inherit (config.services.nginx) group;
  };
  age.secrets.ssl-key = {
    owner = config.services.nginx.user;
    inherit (config.services.nginx) group;
  };

  services.nginx = {
    enable = true;
    streamConfig = ''
      server {
        listen ${ownIP}:8883 ssl; # MQTT over TLS
        ssl_certificate ${config.age.secrets.ssl-cert.path};
        ssl_certificate_key ${config.age.secrets.ssl-key.path};
        proxy_pass 127.0.0.1:1883;
      }
    '';
    # TODO: 1883 for unencrypted?
    # TODO: 443 for websocket?
    # TODO: 14567 for QUIC (if needed)?
  };
}
````

## File: homelab-subflake/services/mqtt/manifest.nix
````nix
{ ... }:
{
  module = ./mqtt.nix;

  endpoints.mqtt = {
    port = 8883;
    protocol = "tcp";
  };

  firewall = ./non-functional/firewall.nix;

  observability = {
    logging.impl = ./non-functional/logging.nix;
  };
}
````

## File: homelab-subflake/services/mqtt/mqtt.nix
````nix
{ pkgs, ... }:
{
  imports = [ ./non-functional/ssl.nix ]; # MQTT manages own SSL

  services.mosquitto = {
    enable = true;
    listeners = [
      {
        # TODO: implement ACLs based on something other than VPN network rules
        acl = [ "pattern readwrite #" ];
        omitPasswordAuth = true;
        settings.allow_anonymous = true;
      }
    ];
  };

  environment.systemPackages = [ pkgs.mqttui ];
}
````

## File: homelab-subflake/services/nextcloud/functional/long-session.nix
````nix
{
  services.nextcloud.settings = rec {
    session_lifetime = 30 * 24 * 60 * 60;
    remember_login_cookie_lifetime = 2 * session_lifetime;
  };

}
````

## File: homelab-subflake/services/nextcloud/functional/mail.nix
````nix
/**
  Set up mailer for Nextcloud
*/
# FIXME: `lib.homelab.services.getSettings` may be a legacy API — verify against
#        lib.homelab.getServiceConfig (used by other services e.g. gitea mailer).
#        Also verify `lib.homelab.getSettings.domain` is still the correct call.
{ lib, ... }:
{
  services.nextcloud.settings = rec {
    mail_smtpauth = true;
    mail_smtpport = 465;
    mail_smtpmode = "smtp";
    mail_smtpsecure = "ssl";
    mail_sendmailmode = "smtp";
    mail_from_address = "Nextcloud Mailer";
    mail_domain = lib.homelab.getSettings.domain;
    mail_smtpauthtype = "LOGIN";
    mail_smtphost = "mail" |> lib.homelab.services.getSettings |> builtins.getAttr "smtphost";
    mail_smtpname = "nextcloud.mailer@${mail_domain}";
  };
}
````

## File: homelab-subflake/services/nextcloud/non-functional/alerts.nix
````nix
{ serviceName, lib, ... }:
{
  Emergency = [
    {
      title = "service down";
      expr = ''absent(nextcloud_up{resource="srv:${serviceName}"}) or nextcloud_up{resource="srv:${serviceName}"} == 0'';
    }
    {
      title = "disk almost full";
      expr =
        let
          host = serviceName |> lib.homelab.getServiceHost;
        in
        ''(node_filesystem_avail_bytes{mountpoint=~"/var/lib/nextcloud.*",host="${host}"} * 100) / node_filesystem_size_bytes{mountpoint=~"/var/lib/nextcloud.*",host="${host}"} < 10'';
      description = "Free disk space < 10%";
    }
  ];
}
````

## File: homelab-subflake/services/nextcloud/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  services.nginx.virtualHosts.${(lib.homelab.getService "nextcloud").fqdn}.listenAddresses =
    lib.homelab.getOwnIpInNetwork "backbone-inner" |> lib.singleton;
}
````

## File: homelab-subflake/services/nextcloud/non-functional/metrics.nix
````nix
{
  lib,
  config,
  ...
}:
let
  port = (lib.homelab.getManifest "nextcloud").endpoints.metrics.port;
in
{
  services.nextcloud.settings.loglevel = 1;
  services.nextcloud.settings.log_type_audit = "syslog";

  services.prometheus.exporters.nextcloud = {
    enable = true;
    inherit port;
    tokenFile = config.age.secrets.nextcloud-exporter-token.path;
    openFirewall = lib.mkForce false;
    url = "nextcloud" |> lib.homelab.getServiceFQDN |> (it: "https://${it}");
  };
}
````

## File: homelab-subflake/services/nextcloud/non-functional/ssl.nix
````nix
{ serviceName, ... }:
{
  config,
  lib,
  self,
  ...
}:
let
  inherit (lib.homelab.getManifest serviceName) endpoints;
in
self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
  inherit config lib serviceName;
  inherit (endpoints.web) port;
  extraConfig = ''
    client_max_body_size 500M;
    # Required for exporter
    allow ${lib.homelab.hosts.getIPInNetwork (lib.homelab.getServiceHost serviceName) "lan"};
  '';
  onlyHumans = true;
}
````

## File: homelab-subflake/services/nextcloud/non-functional/storage.nix
````nix
{ lib, config, ... }:
let
  inherit (lib.localLib) mkCryptTab mkLuksMount;
  luks = {
    device_name = "luks_nextcloud";
    UUID = "0523d6c9-9ea5-4296-85a2-5655189fd0b5";
  };
in
{
  systemd.services.nextcloud-setup.unitConfig.RequiresMountsFor = [ config.services.nextcloud.home ];

  environment.etc."crypttab".text = mkCryptTab { inherit (luks) device_name UUID; };
  systemd.mounts = [
    (mkLuksMount {
      inherit (luks) device_name;
      target = config.services.nextcloud.home;
    })
  ];
}
````

## File: homelab-subflake/services/nextcloud/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./nextcloud.nix;

  endpoints = {
    web = {
      port = 80;
      protocol = "https";
    };
    metrics = {
      port = 9205;
      protocol = "tcp";
    };
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; };

  observability = {
    metrics.main = {
      impl = ./non-functional/metrics.nix;
      path = "/metrics";
      endpoint = "metrics";
    };
    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };

  backups = {
    paths = [ "/var/lib/nextcloud" ];
    exclude = [ "appdata_ochcggcdayyl/preview" ];
  };

  dashboard = {
    category = "Home";
    links = [
      {
        icon = "nextcloud";
        name = "Nextcloud";
      }
    ];
  };

  storage.impl = ./non-functional/storage.nix;
}
````

## File: homelab-subflake/services/nextcloud/nextcloud.nix
````nix
{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib.homelab) getServiceFqdn;
  srvName = "nextcloud";
in
{
  # Service configuration
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud32;
    hostName = getServiceFqdn srvName;

    configureRedis = true;

    phpOptions = {
      "opcache.interned_strings_buffer" = "16";
    };

    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = getServiceFqdn "db";
      dbname = "nextcloud";
      dbpassFile = config.age.secrets.nextcloud-db-password.path;
      adminuser = "root";
      adminpassFile = config.age.secrets.nextcloud-admin-password.path;
    };
    settings = {
      allow_local_remote_servers = true;
      overwriteprotocol = "https";
      trusted_proxies = lib.homelab.getSSLProxyIPs;
      maintenance_window_start = 10; # In UTC, = 2 AM PST
      default_phone_region = "US";
    };

    secretFile = config.age.secrets.nextcloud-secrets.path;
  };

  imports = lib.localLib.mkImportsFromDir ./functional;

}
````

## File: homelab-subflake/services/ntfy-sh/non-functional/alerts.nix
````nix
{ serviceName, ... }:
{
  Emergency = [
    {
      title = "Service is down";
      expr = ''absent(up{resource="srv:${serviceName}"}) or up{resource="srv:${serviceName}"} == 0'';
    }
  ];
  Warning = [
    {
      title = "HTTP 5xx error rate";
      expr = ''rate(ntfy_http_requests_total{resource="srv:${serviceName}",http_code=~"5.."}[5m]) > 0'';
      description = "ntfy-sh is returning HTTP 5xx responses";
    }
    {
      title = "Message publish failures";
      expr = ''rate(ntfy_messages_published_failure{resource="srv:${serviceName}"}[5m]) > 0'';
      description = "ntfy-sh is failing to publish messages";
    }
  ];
}
````

## File: homelab-subflake/services/ntfy-sh/non-functional/endpoints-config.nix
````nix
endpoints: { ... }:
{
  services.ntfy-sh.settings.listen-http = ":${endpoints.web.port |> toString}";
}
````

## File: homelab-subflake/services/ntfy-sh/non-functional/metrics.nix
````nix
{
  services.ntfy-sh.settings.enable-metrics = true;
}
````

## File: homelab-subflake/services/ntfy-sh/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./ntfy-sh.nix;
  endpoints = rec {

    web = {
      port = 8004;
      protocol = "https";
    };

    metrics = {
      inherit (web) port;
      protocol = "tcp";
      path = "/metrics";
    };
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  observability = {
    metrics.main.impl = ./non-functional/metrics.nix;
    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };

  # Backups disabled — no persistent state to back up
  # backups = { ... };

  dashboard = {
    category = "Dev";
    links = [
      {
        description = "Local notifications";
        icon = "ntfy";
        name = "Ntfy";
      }
    ];
  };
}
````

## File: homelab-subflake/services/ntfy-sh/ntfy-sh.nix
````nix
{ lib, ... }:
{
  services.ntfy-sh = {
    enable = true;
    settings.base-url = "https://${lib.homelab.getServiceFqdn "ntfy-sh"}";
  };
}
````

## File: homelab-subflake/services/ntp/non-functional/alerts.nix
````nix
{ serviceName, ... }:
let
  grafanaDashboardId = "edwx5l1c1nym8d";
in
{
  # Not an emergency, hosts will survive for a while on their own
  Critical = [
    {
      title = "NTP is down";
      expr = "up{resource=\"srv:${serviceName}\"} == 0";
    }
    {
      title = "NTP is not synchronized";
      expr = "ntp_system_leap_indicator == 3";
      description = "Leap indicator is 3 (alarm/unsync)";
    }
  ];
  Warning = [
    {
      title = "High NTP offset";
      expr = "abs(ntp_source_offset_seconds) > 0.05";
    }
    {
      title = "High NTP send error rate";
      expr = "rate(ntp_server_response_send_errors_total[5m]) > 0";
    }
    {
      title = "System clock is stepping";
      expr = "rate(ntp_system_accumulated_steps_seconds[5m]) > 0";
    }
  ];
}
|> builtins.mapAttrs (_: v: v |> map (it: it // { inherit grafanaDashboardId; }))
````

## File: homelab-subflake/services/ntp/non-functional/firewall.nix
````nix
{
  networking.firewall.interfaces.lan.allowedUDPPorts = [ 123 ];
}
````

## File: homelab-subflake/services/ntp/non-functional/metrics.nix
````nix
{
  lib,
  ...
}:
{
  services.ntpd-rs = {
    metrics.enable = true;
    # Port 9975 must match endpoints.metrics.port in manifest.nix
    settings.observability.metrics-exporter-listen = "${
      "ntp" |> lib.homelab.getServiceInnerIP
    }:9975";
  };

  # Firewall rules auto-generated from endpoints.metrics definition
}
````

## File: homelab-subflake/services/ntp/manifest.nix
````nix
{ lib, serviceName, ... }:
{
  module = ./service.nix;

  endpoints = {
    ntp = {
      port = 123;
      protocol = "udp";
    };
    metrics = {
      port = 9975;
      protocol = "tcp";
    };
  };

  # Custom firewall needed - opens UDP 123 on LAN interface (not backbone-inner)
  firewall = ./non-functional/firewall.nix;

  observability = {
    metrics.main = {
      impl = ./non-functional/metrics.nix;
      path = "/";
      endpoint = "metrics";
    };
    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };
}
````

## File: homelab-subflake/services/ntp/service.nix
````nix
{
  services.ntpd-rs = {
    enable = true;
    useNetworkingTimeServers = false;
    settings = {
      server = [
        # Listen on all addresses, let `./firewall.nix` deal with it
        { listen = "0.0.0.0:123"; }
      ];
      source = [
        {
          mode = "nts";
          address = "time.cloudflare.com";
        }
        {
          mode = "nts";
          address = "oregon.time.system76.com";
        }
        {
          mode = "pool";
          address = "time.nist.gov";
        }
      ];
    };
  };
}
````

## File: homelab-subflake/services/nut-server/non-functional/alerts.nix
````nix
{ serviceName, ... }:
let
  grafanaDashboardId = "fdydurfmfkbuod";
in
{
  Emergency = [
    {
      title = "UPS check is down";
      expr = ''absent(up{resource="srv:${serviceName}"}) or up{resource="srv:${serviceName}"} == 0'';
    }
    {
      title = "UPS is on battery";
      expr = ''network_ups_tools_ups_status{resource="srv:${serviceName}",flag="OB"} > 0'';
    }
    {
      title = "Battery needs replacement";
      expr = ''network_ups_tools_ups_status{resource="srv:${serviceName}",flag="RB"} > 0'';
    }
    {
      title = "Low remaining runtime";
      expr = ''network_ups_tools_battery_runtime{resource="srv:${serviceName}"} < network_ups_tools_battery_runtime_low{resource="srv:${serviceName}"}'';
    }
    {
      title = "UPS overloaded";
      expr = ''network_ups_tools_ups_status{resource="srv:${serviceName}",flag="OVER"} > 0'';
    }
  ];
  Warning = [
    {
      title = "Low battery charge";
      expr = ''network_ups_tools_battery_charge{resource="srv:${serviceName}"} < 30'';
      description = "Battery charge below 30%";
    }
    {
      title = "UPS in bypass mode";
      expr = ''network_ups_tools_ups_status{resource="srv:${serviceName}",flag="BYPASS"} > 0'';
      description = "UPS is in bypass mode — no battery protection";
    }
    {
      title = "High UPS load";
      expr = ''network_ups_tools_ups_load{resource="srv:${serviceName}"} > 80'';
      description = "UPS load above 80%";
    }
  ];
}
|> builtins.mapAttrs (_: v: v |> map (it: it // { inherit grafanaDashboardId; }))
````

## File: homelab-subflake/services/nut-server/non-functional/firewall.nix
````nix
{ lib, ... }:
let
  inherit (lib.homelab) getHostIpInNetwork getServiceIP;
  nftConcat = lib.concatStringsSep ", "; # TODO: migrate into gateway `srvLib`?

  srvName = "nut-server";

  # TODO: restore this, nut-client should probably be a trait

  # ```
  # clientIPs = lib.pipe "nut-client" [
  #   getService
  #   (builtins.getAttr "onHosts")
  #   (lib.concat [ "nas" ]) # Manually add non-managed NAS in this context
  #   (map (lib.flip getHostIpInNetwork "lan"))
  # ];
  # ```

  clientIPs = [ "nas" ] |> (map (lib.flip getHostIpInNetwork "lan"));

in
{
  # TODO: pass `dport` from endpoints in the manifest
  networking.myFirewall.chains.input-lan-br.rules = ''
    tcp dport 3493 ip saddr { ${nftConcat clientIPs}} accept comment "NUT traffic"
  '';

  # Should be LAN only
  # TODO: migrate to `endpointsConfig`
  power.ups.upsd.listen = [
    {
      address = getServiceIP srvName;
    }
  ];
}
````

## File: homelab-subflake/services/nut-server/non-functional/metrics.nix
````nix
{ config, lib, ... }:
let
  inherit (lib.homelab) getOwnIpInNetwork getServiceFqdn;

  srvName = "nut-server";
in
{
  services.prometheus.exporters.nut = {
    enable =
      assert config.power.ups.mode == "netserver";
      true;
    listenAddress = getOwnIpInNetwork "backbone-inner";
    openFirewall = lib.mkForce false;

    # Exporter-specific services
    nutServer = getServiceFqdn srvName;
    nutVariables = [
      "battery.charge"
      "battery.voltage"
      "battery.voltage.nominal"
      "battery.runtime"
      "battery.runtime.low"
      "input.voltage"
      "input.voltage.nominal"
      "ups.load"
      "ups.status"
      "ups.test.result"
    ];
  };

  # Firewall rules for metrics endpoint are now auto-generated from endpoints.metrics
}
````

## File: homelab-subflake/services/nut-server/manifest.nix
````nix
/**
  Manifest for the NUT (Network UPS Tools) server.

  Provides UPS monitoring and power management over the network.
*/
{ serviceName, ... }:
{
  module = ./nut.nix;

  endpoints = {
    nut = {
      port = 3493;  # Standard NUT server protocol port
      protocol = "tcp";
    };
    metrics = {
      port = 9199;  # Prometheus exporter port
      protocol = "tcp";
    };
  };

  # Custom firewall: configures client IP allowlist and listen address
  firewall = ./non-functional/firewall.nix;

  observability = {
    # NUT exporter provides UPS metrics on dedicated port
    metrics.main = {
      impl = ./non-functional/metrics.nix;
      path = "/ups_metrics";
      endpoint = "metrics";
    };

    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };

  # Stateless service - no backups or storage needed
}
````

## File: homelab-subflake/services/nut-server/nut.nix
````nix
# NixOS module that configures the UPS monitoring daemon
{ config, lib, ... }:
let
  srvName = "nut-server";
  srvCfg = lib.homelab.getServiceConfig srvName;
in
{
  power.ups = {
    enable = true;
    mode = lib.mkForce "netserver";
    ups.${srvCfg.UPS.model} = with srvCfg.UPS; {
      driver = "usbhid-ups";
      port = "auto";
      directives = [
        "vendorid = ${vendorId}" # Result from `lsusb`
        "productid = ${productId}" # Result from `lsusb`
      ];
      inherit description;
    };

    users = {
      # Upsmon makes the following distinction between users:
      # * primary = "UPS is connected to this machine, shut it down last"
      # * secondary = "UPS" is not connected to this machine, start shutdown here first
      primary-client = {
        passwordFile = config.age.secrets.nut-password.path;
        upsmon = "primary";
      };
      secondary-client = {
        passwordFile = config.age.secrets.nut-password.path;
        upsmon = "secondary";
      };
    };
  };
}
````

## File: homelab-subflake/services/pgadmin/non-functional/alerts.nix
````nix
{ serviceName, ... }:
{ lib, ... }:
{
  Informational = [
    {
      title = "Spike in proxy errors";
      query = "(vector(0) and on() (irate(ssl_proxy_nginx_http_requests_total{domain=\"${
        serviceName |> lib.homelab.getServiceFqdn
      }\", result!=\"2xx_3xx_success\"}[3m]) > 0)) or on() vector(1) ";
    }
  ];
}
````

## File: homelab-subflake/services/pgadmin/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  # Listen only on backbone-inner
  services.pgadmin = {
    port = endpoints.web.port;
    settings.DEFAULT_SERVER = "pgadmin" |> lib.homelab.getServiceInnerIP;
  };
}
````

## File: homelab-subflake/services/pgadmin/non-functional/ssl.nix
````nix
{ serviceName, ... }:
{
  config,
  lib,
  self,
  ...
}:
let
  inherit (lib.homelab.getManifest serviceName) endpoints;
in
self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
  inherit config lib serviceName;
  inherit (endpoints.web) port;
  onlyHumans = true;
}
````

## File: homelab-subflake/services/pgadmin/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./pgadmin.nix;

  endpoints.web = {
    port = 5050;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; };

  observability = { }; # TODO: implement, 200 probe only

  dashboard = {
    category = "Admin";
    links = [
      {
        description = "Database admin panel";
        icon = "pgadmin";
        name = "pgAdmin";
      }
    ];
  };
}
````

## File: homelab-subflake/services/pgadmin/pgadmin.nix
````nix
{ config, lib, ... }:
let
  inherit (lib.homelab) getSettings ;
in
{
  # Service config
  services.pgadmin = {
    enable = true;
    initialEmail = "pgadmin@${getSettings.publicDomainName}";
    initialPasswordFile = "${config.age.secrets.pgadmin-password.path}";
    settings = {
      UPGRADE_CHECK_ENABLED = false;
    };
  };
}
````

## File: homelab-subflake/services/prometheus/functional/gather-alerts-from-manifests.nix
````nix
/**
  Gathers Prometheus alerting rules from service manifests.

  Generates:
  - Per-service rule groups from `observability.alerts.prometheusImpl`
  - Per-host "Host Down" rules with severity derived from the services on each host
*/
{ lib, pkgs, ... }:
let
  mkRule = (lib.homelab.getSrvLib "prometheus").mkRule;

  # Import an `alerts.nix` path. Supports both plain attrsets and
  # `{ lib, serviceName, ... }` functions.
  importAlerts =
    srvName: path:
    let
      raw = import path;
    in
    if lib.isFunction raw then
      raw {
        inherit lib;
        serviceName = srvName;
      }
    else
      raw;

  # Expand all alerts from a manifest into a flat list of rule attrsets.
  mkServiceRules =
    srvName: manifest:
    importAlerts srvName manifest.observability.alerts.prometheusImpl
    |> lib.mapAttrsToList (alertLevel: rules: rules |> map (mkRule srvName alertLevel))
    |> lib.flatten;

  # Autogenerated cert expiry alerts for services with `probes.ssl = true`.
  # Uses `min()` across the chain so no `CN` filter is needed.
  mkCertExpiryRules =
    srvName:
    let
      daysToExpire = ''floor((ssl_cert_not_after{resource="srv:${srvName}",dnsnames!=""} - time()) / 86400)'';
    in
    [
      (mkRule srvName "Alert" {
        title = "SSL cert expiring very soon";
        expr = "${daysToExpire} < 2";
        description = "SSL certificate will expire in less than 2 days";
      })
      (mkRule srvName "Informational" {
        title = "Renew SSL cert";
        expr = "${daysToExpire} < 15 unless ${daysToExpire} < 2";
        description = "SSL certificate will expire in less than 15 days";
      })
    ];

in
{
  services.prometheus.ruleFiles = [
    (pkgs.writeText "service-alerts.rules.json" (
      lib.homelab.getManifests
      |> lib.filterAttrs (
        _: m: m.observability.alerts.prometheusImpl or null != null || m.observability.probes.ssl or false
      )
      |> lib.mapAttrsToList (
        srvName: manifest: {
          name = srvName;
          rules =
            lib.optionals (manifest.observability.alerts.prometheusImpl != null) (
              mkServiceRules srvName manifest
            )
            ++ lib.optionals (manifest.observability.probes.ssl or false) (mkCertExpiryRules srvName);
        }
      )
      |> (groups: { inherit groups; })
      |> builtins.toJSON
    ))
  ];
}
````

## File: homelab-subflake/services/prometheus/functional/host-alerts.nix
````nix
/**
  Generic alerting rules for hosts running the monitoring-source trait.

  Covers: disk space, memory, CPU saturation, clock drift, `systemd` units,
  SMART health, and NixOS build state.

  Labels (resource, host, etc.) are inherited from the scraped metric labels
  rather than being set statically, since a single rule group covers all hosts.
*/
{ lib, pkgs, ... }:
let
  mkRule = (lib.homelab.getSrvLib "prometheus").mkRule null;

  monitoredHosts = lib.homelab.traits.get "monitoring-source" |> builtins.getAttr "onHosts";

  # Regex selector matching only hosts in the monitoring-source trait
  hostSelector =
    monitoredHosts |> lib.concatStringsSep "|" |> (hosts: ''resource=~"host:(${hosts})"'');

  # Filesystem selector: skip virtual/read-only/boot mounts.
  fsSelector = ''${hostSelector},fstype!~"tmpfs|overlay|devtmpfs|squashfs|ramfs",mountpoint!~"/boot.*"'';

  # Collapse multiple mountpoints of the same device (bind mounts) into one
  # series per (resource, host, device) to avoid duplicate alerts.
  fsAvail = "min by (resource, host, device) (node_filesystem_avail_bytes{${fsSelector}})";
  fsSize = "min by (resource, host, device) (node_filesystem_size_bytes{${fsSelector}})";

  # Minimum absolute free space: avoids noise on multi-TB disks where a
  # percentage threshold alone is too sensitive (e.g. 20% of 12 terabytes = 2.4 terabytes free).
  minFreeBytesWarn = toString (50 * 1024 * 1024 * 1024); # 50 gigabytes

in
{
  services.prometheus.ruleFiles = [
    (pkgs.writeText "host-alerts.rules.json" (
      {
        groups = [
          {
            name = "host-generic";
            rules = [
              (mkRule "Critical" {
                title = "SMART disk failure";
                expr = "smartctl_device_smart_status{${hostSelector}} == 0";
                description = "SMART self-assessment reports a disk failure";
              })
              (mkRule "Error" {
                title = "Disk space critical";
                expr = "${fsAvail} / ${fsSize} < 0.05";
                description = "Filesystem has less than 5% free space";
              })
              (mkRule "Warning" {
                title = "Disk space low";
                expr = ''
                  (${fsAvail} / ${fsSize} < 0.20)
                  and (${fsAvail} < ${minFreeBytesWarn})
                  unless (${fsAvail} / ${fsSize} < 0.05)
                '';
                description = "Filesystem is between 80-95% full and less than 50 GiB free";
              })
              (mkRule "Warning" {
                title = "Low available memory";
                expr = ''
                  node_memory_MemAvailable_bytes{${hostSelector}}
                  / node_memory_MemTotal_bytes{${hostSelector}}
                  < 0.10
                '';
                description = "Available memory is below 10% of total";
              })
              (mkRule "Warning" {
                title = "High CPU load";
                expr = ''
                  node_load5{${hostSelector}}
                  / on(resource) group_left()
                    count by (resource) (node_cpu_seconds_total{${hostSelector},mode="idle"})
                  > 1
                '';
                description = "5-minute load average exceeds number of CPUs";
              })
              (mkRule "Warning" {
                title = "Systemd unit failed";
                expr = ''node_systemd_unit_state{${hostSelector},state="failed"} > 0'';
                description = "One or more systemd units are in failed state";
              })
              (mkRule "Notice" {
                title = "High service restart rate";
                expr = "increase(node_systemd_service_restart_total{${hostSelector}}[1h]) > 5";
                description = "A systemd service has restarted more than 5 times in the last hour";
              })
              (mkRule "Notice" {
                title = "Clock drift";
                expr = "abs(node_timex_offset_seconds{${hostSelector}}) > 0.1";
                description = "System clock is more than 100ms out of sync with NTP";
              })
              # TODO: fix `nixos_version_info` metric and re-enable
              # ```
              # (mkRule "Informational" {
              #   title = "Dirty NixOS build";
              #   expr = ''nixos_version_info{${hostSelector}} == 1'';
              #   description = "Host is running a locally-modified NixOS build";
              # })
              # ```
            ];
          }
        ];
      }
      |> builtins.toJSON
    ))
  ];
}
````

## File: homelab-subflake/services/prometheus/functional/host-down-rules.nix
````nix
/**
  Generates per-host "Host Down" alerting rules.

  Severity is derived from the highest alert level of services running on each
  host. Hosts with no alerting services default to Warning.
*/
{ lib, pkgs, ... }:
let
  inherit (lib.homelab.getSrvLib "prometheus") severityNumMap numToLevel mkRule;

  defaultHostSeverity = "Warning";

  importAlerts =
    srvName: path:
    let
      raw = import path;
    in
    if lib.isFunction raw then
      raw {
        inherit lib;
        serviceName = srvName;
      }
    else
      raw;

  maxSeverityNum =
    alerts:
    alerts |> lib.mapAttrsToList (alertLevel: _: severityNumMap.${alertLevel}) |> lib.foldl' lib.max 0;

  # `host` -> max `_alertLevelNum` across all alerting service instances on that host.
  hostMaxSeverityNum =
    lib.homelab.getManifests
    |> lib.filterAttrs (_: m: m.observability.alerts.prometheusImpl or null != null)
    |> lib.mapAttrsToList (
      modName: manifest:
      let
        num = importAlerts modName manifest.observability.alerts.prometheusImpl |> maxSeverityNum;
      in
      lib.homelab.services.getInstances modName
      |> map (instanceName: {
        host = lib.homelab.getServiceHost instanceName;
        inherit num;
      })
    )
    |> lib.flatten
    |> lib.foldl' (acc: { host, num }: acc // { ${host} = lib.max (acc.${host} or 0) num; }) { };

  mkHostDownRule =
    hostName:
    let
      maxNum = hostMaxSeverityNum.${hostName} or 0;
      level = if maxNum == 0 then defaultHostSeverity else numToLevel.${toString maxNum};
    in
    mkRule hostName level {
      title = "Host down";
      expr = ''up{resource="host:${hostName}"} == 0'';
      for = "2m";
      description = "${hostName} is unreachable";
    };

in
{
  services.prometheus.ruleFiles = [
    (pkgs.writeText "host-down.rules.json" (
      {
        groups = [
          {
            name = "host-down";
            rules =
              lib.homelab.traits.get "monitoring-source" |> builtins.getAttr "onHosts" |> map mkHostDownRule;
          }
        ];
      }
      |> builtins.toJSON
    ))
  ];
}
````

## File: homelab-subflake/services/prometheus/functional/scrape-from-nodes.nix
````nix
/**
  Implement targets for nodes
*/
{ lib, config, ... }:
{
  services.prometheus.scrapeConfigs =
    lib.homelab.getServiceConfig "prometheus"
    # Grab list of default exporters
    |> builtins.getAttr "exporters"
    # Change the list for easy access later
    |> map (it: {
      exporterName = it;
      # This relies on:
      # - Single port for a scraper
      # - Port is default (expressed through `config` reference)
      exporterPort = config.services.prometheus.exporters.${it}.port;
    })
    # Construct a `scrapeConfig`
    |> map (it: {
      job_name = it.exporterName;
      scrape_interval = "30s";
      static_configs =
        lib.homelab.traits.get "monitoring-source"
        |> builtins.getAttr "onHosts"
        |> map (nodeName: {
          targets =
            let
              hostName = lib.homelab.getHostIpInNetwork nodeName "backbone-inner";
            in
            [
              "${hostName}:${it.exporterPort |> toString}"
            ];
          labels = {
            alias = "${nodeName}.home.arpa";
            host = nodeName;
            exporter = it.exporterName;
            resource = "host:${nodeName}";
          };
        });
    });
}
````

## File: homelab-subflake/services/prometheus/non-functional/alerts.nix
````nix
{ serviceName, lib, ... }:
{
  Alert = [
    {
      title = "service down";
      expr = ''absent(up{resource="srv:${serviceName}"}) or up{resource="srv:${serviceName}"} == 0'';
    }
    {
      title = "disk almost full";
      expr =
        let
          mountpoint = "/var/lib/prometheus2";
          host = serviceName |> lib.homelab.getServiceHost;
        in
        ''(node_filesystem_avail_bytes{mountpoint="${mountpoint}",host="${host}"} * 100) / node_filesystem_size_bytes{mountpoint="${mountpoint}",host="${host}"} < 10'';
      description = "Free disk space < 10%";
    }
  ];
}
````

## File: homelab-subflake/services/prometheus/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  services.prometheus = {
    port = endpoints.web.port;
    listenAddress = lib.homelab.getServiceInnerIP "prometheus";
  };
}
````

## File: homelab-subflake/services/prometheus/non-functional/storage.nix
````nix
{ config, ... }:
{
  systemd = {
    services.prometheus.unitConfig.RequiresMountsFor = [
      "/var/lib/${config.services.prometheus.stateDir}"
    ];
    mounts = [
      {
        what = "/dev/disk/by-label/prometheus";
        where = "/var/lib/${config.services.prometheus.stateDir}";
        options = "noatime";
      }
    ];
  };
}
````

## File: homelab-subflake/services/prometheus/service-scraping/default.nix
````nix
{
  imports = [
    ./gather-services-from-manifests.nix
    ./gather-probes-from-manifests.nix
  ];
}
````

## File: homelab-subflake/services/prometheus/service-scraping/gather-probes-from-manifests.nix
````nix
/**
  This module retrieves the probe targets from the new `manifest.nix`.

  Unlike metric scraping, probe configurations are usually unique per service,
  so this module is only building imports.
*/
{ lib, ... }:
let
  serviceManifests = lib.homelab.getManifests;
in
{
  imports =
    serviceManifests
    # Filter only ones that declare probes
    |> lib.filterAttrs (_: v: v.observability.probes.enable or false)
    # Import the Prometheus implementation
    |> lib.mapAttrsToList (_: it: it.observability.probes.prometheusImpl);
}
````

## File: homelab-subflake/services/prometheus/service-scraping/gather-services-from-manifests.nix
````nix
/**
  Retrieves scrape targets from service manifests.

  Generates one scrape job per (service, exporter) pair. Multi-instance
  services (e.g. `dns-1`, `dns-2`) appear as multiple targets within the same job.
  All targets are scraped via the SSL proxy at
  `<instance>.metrics.<publicDomain>/metrics/<exporterName>`.
*/
{ lib, ... }:
{
  services.prometheus.scrapeConfigs =
    lib.homelab.getManifests
    # Filter only for services that declare metrics
    # If a service is "alien" (e.g. `rsync-net`) – it will have a dedicated
    # SERVICE object for its metrics
    |> lib.filterAttrs (_: m: m.observability.metrics != { })
    # Construct (service, exporter) jobs where multi-instance services appear
    # as multiple `static_configs` targets within the same job.
    # This relies on:
    # 1. `srv:ssl-proxy` handling the domains and path-based routing
    # 2. `srv:auth-dns` resolving the instance names
    |> lib.mapAttrsToList (
      srvName: manifest:
      manifest.observability.metrics
      |> lib.mapAttrsToList (
        exporterName: _: {
          job_name = "${srvName}-${exporterName}-metrics";
          scheme = "https";
          scrape_interval = "30s";
          metrics_path = "/metrics/${exporterName}";
          static_configs =
            lib.homelab.services.getInstances srvName
            |> map (instanceName: {
              targets = [ (lib.homelab.services.getServiceMetricsFqdn instanceName) ];
              labels = {
                service = srvName;
                instance = instanceName;
                exporter = exporterName;
                resource = "srv:${srvName}";
              };
            });
        }
      )
    )
    |> lib.flatten;
}
````

## File: homelab-subflake/services/prometheus/synology/default.nix
````nix
# Configures snmp exporter to run on prometheus node that gets snmp values from synology
{ config, lib, ... }:
{
  services.prometheus.exporters.snmp = {
    enable = true;
    configurationPath = ./synology.yml;
    # To parse passwords
    extraFlags = [ "--config.expand-environment-variables" ];
  };

  # Strictly speaking, LoadCredential would be better but then prometheus-snmp-exporter would need to be wrapped to read from CREDENTIALS_DIRECTORY in an overlay and that's a bit overkill for me.
  systemd.services.prometheus-snmp-exporter.serviceConfig.EnvironmentFile = [
    config.age.secrets."prometheus-synology-secret".path
  ];

  # Source:
  # https://colby.gg/posts/2023-10-17-monitoring-synology/
  services.prometheus.scrapeConfigs = [
    {
      job_name = "nas";
      scrape_interval = "30s";
      static_configs = [ { targets = [ (lib.homelab.getHostInNetwork "nas" "lan").fqdn ]; } ];
      metrics_path = "/snmp";
      params = {
        auth = [ "synology" ];
        module = [
          "if_mib"
          "synology"
        ];
      };
      relabel_configs = [
        {
          source_labels = [ "__address__" ];
          target_label = "__param_target";
        }
        {
          source_labels = [ "__param_target" ];
          target_label = "instance";
        }
        {
          target_label = "__address__";
          replacement = "localhost:9116";
        }
      ];
    }
    {
      job_name = "snmp_exporter";
      static_configs = [ { targets = [ "localhost:9116" ]; } ];
    }
  ];
}
````

## File: homelab-subflake/services/prometheus/default.nix
````nix
{
  imports = (import ./manifest.nix).default;
}
````

## File: homelab-subflake/services/prometheus/manifest.nix
````nix
{ lib, ... }:
{
  module = ./service.nix;

  endpoints.web = {
    port = 9090;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  observability = {
    metrics.main.path = "/metrics";
    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };

  storage.impl = ./non-functional/storage.nix;

  dashboard = {
    category = "Admin";
    links = [
      {
        description = "Scrapes and stores metrics for monitoring";
        icon = "prometheus";
        name = "Prometheus";
      }
    ];
  };

  srvLib = import ./srv-lib.nix { inherit lib; };

  # Backups disabled - data to be replicated
}
````

## File: homelab-subflake/services/prometheus/service.nix
````nix
{ lib, ... }:
{
  services.prometheus = {
    enable = true;
    retentionTime = "120d";
    alertmanagers = [
      {
        static_configs = [
          { targets = [ "${lib.homelab.getServiceInnerIP "alert-manager"}:9093" ]; }
        ];
      }
    ];
  };

  imports = [
    ./synology
    ./service-scraping
  ]
  ++ lib.localLib.mkImportsFromDir ./functional;
}
````

## File: homelab-subflake/services/prometheus/srv-lib.nix
````nix
{ lib, ... }:
rec {
  forDefaults = {
    Emergency = "0m";
    Alert = "2m";
    Critical = "2m";
    Error = "2m";
    Warning = "5m";
    Notice = "5m";
    Informational = "5m";
    Debug = "5m";
  };

  severityNumMap = {
    Emergency = 21;
    Alert = 19;
    Critical = 18;
    Error = 17;
    Warning = 13;
    Notice = 10;
    Informational = 9;
    Debug = 5;
  };

  alertLevels = [
    "Emergency"
    "Alert"
    "Critical"
    "Error"
    "Warning"
    "Notice"
    "Informational"
    "Debug"
  ];

  # Reverse `severityNumMap`:
  numToLevel = severityNumMap |> lib.mapAttrs' (n: v: lib.nameValuePair (toString v) n);

  /**
    Build a single Prometheus alerting rule attrset.

    - `resourceName` — service name (string) or `null` for host-level rules. When
    found in `lib.homelab.services.getAll`, adds `resource = "srv:<name>"` and
    `service` labels automatically.
    - `rule` — attrset with `title`, `expr`, and optionally `for`, `description`,
    `grafanaDashboardId`.
  */
  mkRule =
    resourceName: alertLevel: rule:
    assert lib.assertOneOf "alertLevel" alertLevel alertLevels;
    let
      isService = lib.isString resourceName && lib.homelab.services.getInstances resourceName != [ ];
      isHost = lib.isString resourceName && builtins.hasAttr resourceName lib.homelab.hosts.getAll;
      grafanaFqdn = lib.homelab.getServiceFqdn "grafana";
    in
    lib.warnIf (lib.isString resourceName && !isService && !isHost)
      "mkRule: '${resourceName}' is neither a known service nor a known host"
      {
        alert = rule.title |> lib.splitString " " |> map lib.localLib.uppercase |> lib.concatStrings;
        expr = rule.expr;
        for = rule.for or forDefaults.${alertLevel};
        labels = {
          inherit alertLevel;
          _alertLevelNum = severityNumMap.${alertLevel} |> toString;
        }
        // lib.optionalAttrs isService {
          resource = "srv:${resourceName}";
          service = resourceName;
        }
        // lib.optionalAttrs isHost {
          host = resourceName;
          resource = "host:${resourceName}";
        };
        annotations = {
          summary = rule.title;
        }
        // lib.optionalAttrs (rule ? description) { inherit (rule) description; }
        // lib.optionalAttrs (rule ? grafanaDashboardId) {
          dashboard = "https://${grafanaFqdn}/d/${rule.grafanaDashboardId}";
        };
      };

  /**
    Produce a standard firewall rule that allows Prometheus to scrape metrics.

    TODO: allow comments
  */
  mkBackboneInnerFirewallRules =
    {
      lib,
      ports ? null,
      port ? null,
    }:
    let
      ports' =
        assert lib.assertMsg (lib.xor (isNull ports) (
          isNull port
        )) "`ports` and `port` cannot be specified together, but one of them must be specified.";
        if !isNull ports then ports else port |> lib.toList;
    in
    {
      # The validation is done by nftables, no need to make an extra check
      networking.firewall.extraInputRules =
        ports'
        # Turn into list just in case, so callers don't need to bother.
        |> lib.toList
        # Parse ports coming in as just int. If so – reconstruct attrset.
        # Else leave the value be and let if fail later if needed.
        |> map (
          it:
          if lib.isInt it then
            {
              port = it;
              protocol = "tcp";
            }
          else
            it
        )
        # Construct the firewall rules
        |> map (
          it:
          [
            ''iifname "backbone-inner"''
            "ip saddr { ${"prometheus" |> lib.homelab.getServiceInnerIP} }"
            "${it.protocol} dport ${it.port |> toString} accept"
          ]
          |> builtins.concatStringsSep " "
        )
        |> lib.concatLines;
    };
}
````

## File: homelab-subflake/services/prometheus/wip-sample-alert.nix
````nix
# TODO: needed?
{
  services.prometheus.rules = [
    (
      {
        groups = [
          {
            name = "example-group";
            rules = [
              {
                record = "code:prometheus_http_requests_total:sum";
                expr = "sum by (code) (prometheus_http_requests_total)";
                labels._findme = "record-rule";
              }
              {
                alert = "Instance down";
                expr = "up == 0";
                for = "5m";
                labels._findme = "alert-rule";
              }
            ];
          }
        ];
      }
      |> builtins.toJSON
      |> builtins.toString
    )
  ];
}
````

## File: homelab-subflake/services/prusa-exporter/non-functional/alerts.nix
````nix
{ serviceName, ... }:
{
  Warning = [
    {
      title = "Chamber temp PLA heat creep risk";
      expr = ''
        prusa_chamber_temp{resource="srv:${serviceName}"} > 35
        and on(resource)
        (time() - prusa_last_push_timestamp{resource="srv:${serviceName}"}) < 120
        and on(resource)
        prusa_material_info{resource="srv:${serviceName}", printer_filament="PLA"} == 1
      '';
      description = "Chamber temperature has been above 35°C for 10+ minutes while printing PLA — heat creep risk";
      for = "10m";
    }
    {
      title = "Chamber temp PETG heat creep risk";
      expr = ''
        prusa_chamber_temp{resource="srv:${serviceName}"} > 45
        and on(resource)
        (time() - prusa_last_push_timestamp{resource="srv:${serviceName}"}) < 120
        and on(resource)
        prusa_material_info{resource="srv:${serviceName}", printer_filament="PETG"} == 1
      '';
      description = "Chamber temperature has been above 45°C for 10+ minutes while printing PETG — heat creep risk";
      for = "10m";
    }
  ];
  Critical = [
    {
      title = "Chamber temp PLA heat creep imminent";
      expr = ''
        prusa_chamber_temp{resource="srv:${serviceName}"} > 40
        and on(resource)
        (time() - prusa_last_push_timestamp{resource="srv:${serviceName}"}) < 120
        and on(resource)
        prusa_material_info{resource="srv:${serviceName}", printer_filament="PLA"} == 1
      '';
      description = "Chamber temperature above 40°C while printing PLA — heat creep clog likely imminent";
      for = "5m";
    }
    {
      title = "Chamber temp PETG heat creep imminent";
      expr = ''
        prusa_chamber_temp{resource="srv:${serviceName}"} > 50
        and on(resource)
        (time() - prusa_last_push_timestamp{resource="srv:${serviceName}"}) < 120
        and on(resource)
        prusa_material_info{resource="srv:${serviceName}", printer_filament="PETG"} == 1
      '';
      description = "Chamber temperature above 50°C while printing PETG — heat creep clog likely imminent";
      for = "5m";
    }
  ];
}
````

## File: homelab-subflake/services/prusa-exporter/dashboard.nix
````nix
{ pkgs, ... }:
{
  environment.etc."grafana-dashboards/prusa/prusa-core-one.json".source =
    pkgs.runCommand "prusa-core-one-dashboard.json" { } ''
      cp ${./dashboard.json} $out
    '';
}
````

## File: homelab-subflake/services/prusa-exporter/manifest.nix
````nix
{ ... }:
{
  module = ./service.nix;

  endpoints = {
    # Endpoint for gathering PrusaLink metrics.
    main-metrics = {
      port = 10009;
      protocol = "tcp";
    };
  };

  observability.metrics = {
    main = {
      endpoint = "main-metrics";
      path = "/metrics/prusalink";
    };
    udp = {
      endpoint = "main-metrics";
      path = "/metrics/udp";
    };
  };

  # No backups – stateless exporter

  # Grafana dashboard (HTTP/PrusaLink metrics only – no UDP exporter required)
  observability.dashboards = {
    enable = true;
    mod = ./dashboard.nix;
  };

  observability.alerts.prometheusImpl = ./non-functional/alerts.nix;
}
````

## File: homelab-subflake/services/prusa-exporter/service.nix
````nix
{ config, lib, ... }:
let
  printerName = "prusa-printer";
  credentialId = "prusa-printer-password";
in
{
  services.prometheus.exporters.prusa_exporter = {
    enable = true;
    port = 10009;
    openUdpFirewall = true; # Prusa Core One does not expose chamber state in PrusaLink: https://github.com/prusa3d/Prusa-Firmware-Buddy/issues/4459

    settings.printers = [
      {
        address = (lib.homelab.getHostInNetwork printerName "lan").fqdn;
        username = "maker";
        name = printerName;
        type = "Core One";
      }
    ];

    # Maps printer name → Systemd credential ID; password is kept out of the Nix store
    printerPasswords.${printerName} = credentialId;
  };

  systemd.services.prometheus-prusa-exporter.serviceConfig.LoadCredential = [
    "${credentialId}:${config.age.secrets."prusa-printer-password".path}"
  ];
}
````

## File: homelab-subflake/services/restic-server/non-functional/alerts.nix
````nix
{ serviceName, lib, ... }:
let
  host = lib.homelab.getServiceHost serviceName;
  fsDiskLabel = ''mountpoint="/var/lib/restic", host="${host}"'';
in
{
  Alert = [
    {
      title = "Restic service down";
      expr = ''absent(up{resource="srv:${serviceName}"}) or up{resource="srv:${serviceName}"} == 0'';
    }
  ];
  Warning = [
    {
      title = "Disk almost full";
      expr = "(node_filesystem_avail_bytes{${fsDiskLabel}} / node_filesystem_size_bytes{${fsDiskLabel}}) * 100 < 10";
      grafanaDashboardId = "ec51fd06-a034-4271-90e3-62d95310044a";
    }
    {
      title = "No backup snapshots in 30h";
      expr = ''sum(increase(rest_server_blob_write_total{resource="srv:${serviceName}", type="snapshots"}[30h])) == 0'';
      grafanaDashboardId = "ec51fd06-a034-4271-90e3-62d95310044a";
    }
  ];
}
````

## File: homelab-subflake/services/restic-server/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
{
  # Configure restic-server listen address
  services.restic.server.listenAddress = endpoints.web.port |> toString;
}
````

## File: homelab-subflake/services/restic-server/non-functional/metrics.nix
````nix
{
  services.restic.server = {
    prometheus = true;
    extraFlags = [ "--prometheus-no-auth" ];
  };
}
````

## File: homelab-subflake/services/restic-server/non-functional/ssl.nix
````nix
{ serviceName, port, ... }:
{
  config,
  lib,
  self,
  ...
}:
self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
  inherit
    serviceName
    port
    config
    lib
    ;
  # Restic deals with big files
  extraConfig = ''
    client_max_body_size 500M;
  '';
}
````

## File: homelab-subflake/services/restic-server/non-functional/storage.nix
````nix
/**
  Mounts iSCSI LUN to store the restic repos.

  Using this needs impure configuration on NAS side.

  Source: https://discourse.nixos.org/t/configure-iscsi/50773/5
*/
{
  lib,
  config,
  ...
}:

let
  IQN = "iqn.2000-01.com.synology:nas.default-target.c332d8ce746";
in
{
  imports = [
    (lib.localLib.mkIscsi {
      targetIqn = IQN;
      mountPoint = config.services.restic.server.dataDir;
      part = 1;
      initiatorName = "iqn.2024-09.com.nixos:my-nixos-initiator";
    })
  ];

  systemd.services.restic-rest-server.unitConfig.RequiresMountsFor = [
    config.services.restic.server.dataDir
  ];
}
````

## File: homelab-subflake/services/restic-server/impl.nix
````nix
{ config, pkgs, ... }:
{
  services.restic.server = {
    enable = true;
    privateRepos = true;
    extraFlags = [
      "--htpasswd-file"
      "${config.age.secrets.restic-server-htpasswd.path}"
    ];
  };

  # Needed for testing/examining backups
  environment.systemPackages = [ pkgs.restic ];
}
````

## File: homelab-subflake/services/restic-server/manifest.nix
````nix
{ serviceName, ... }:
{
  module = ./impl.nix;

  endpoints.web = {
    port = 8080;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; port = 8080; };

  observability = {
    metrics.main.impl = ./non-functional/metrics.nix;
    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };

  storage.impl = ./non-functional/storage.nix;
}
````

## File: homelab-subflake/services/ssl-proxy/functional/allow-big-uploads.nix
````nix
{
  services.nginx.clientMaxBodySize = "50M";
}
````

## File: homelab-subflake/services/ssl-proxy/functional/default-no-answer.nix
````nix
/**
  Makes nginx refuse answering when the client asks for a nonexistent virtual host.
*/
{ config, ... }:
{
  services.nginx.virtualHosts."_" = {
    forceSSL = true;
    inherit (config.services.homelab.ssl-proxy) listenAddresses;
    sslCertificate = config.age.secrets."ssl-cert".path;
    sslCertificateKey = config.age.secrets."ssl-key".path;
    extraConfig = "return 444;";
  };
}
````

## File: homelab-subflake/services/ssl-proxy/functional/metrics-vhosts.nix
````nix
/**
  Generates per-service metrics nginx vhosts.

  For each service with `observability.metrics`, creates an nginx vhost at
    <instance>.metrics.<publicDomain>
  with path-based routing per exporter at /metrics/<exporterName>.
  Access is restricted to Prometheus only.
*/
{ config, lib, ... }:
let
  prometheusInnerIP = lib.homelab.getServiceInnerIP "prometheus";

  # Infer which endpoint an exporter uses.
  # Priority: explicit endpoint > endpoint named "metrics" > first https endpoint
  inferEndpoint =
    endpoints: exporter:
    if exporter.endpoint != null then
      endpoints.${exporter.endpoint}
    else if endpoints ? metrics then
      endpoints.metrics
    else
      endpoints
      |> lib.filterAttrs (_: ep: ep.protocol == "https")
      |> lib.attrValues
      |> lib.head;

  mkMetricsVhost =
    instanceName: manifest:
    let
      innerIP = lib.homelab.getServiceInnerIP instanceName;
      fqdn = lib.homelab.services.getServiceMetricsFqdn instanceName;

      metricsLocations = manifest.observability.metrics
        |> lib.mapAttrs' (
          exporterName: exporter:
          let
            endpoint = inferEndpoint manifest.endpoints exporter;
          in
          lib.nameValuePair "/metrics/${exporterName}" {
            proxyPass = "http://${innerIP}:${toString endpoint.port}${exporter.path}";
            extraConfig = ''
              allow ${prometheusInnerIP};
              deny all;
            '';
          }
        );

      probeLocation = lib.optionalAttrs (manifest.endpoints ? probe) {
        "/probe" = {
          proxyPass = "http://${innerIP}:${toString manifest.endpoints.probe.port}";
          extraConfig = ''
            allow ${prometheusInnerIP};
            deny all;
          '';
        };
      };
    in
    {
      "${fqdn}" = {
        forceSSL = true;
        inherit (config.services.homelab.ssl-proxy) listenAddresses;
        sslCertificate = config.age.secrets."ssl-cert".path;
        sslCertificateKey = config.age.secrets."ssl-key".path;
        locations = metricsLocations // probeLocation;
      };
    };
in
{
  services.nginx.virtualHosts =
    lib.homelab.getManifests
    |> lib.filterAttrs (_: m: m.observability.metrics != { } || m.endpoints ? probe)
    |> lib.mapAttrsToList (
      modName: manifest:
      lib.homelab.services.getInstances modName
      |> map (instanceName: mkMetricsVhost instanceName manifest)
    )
    |> lib.flatten
    |> lib.mergeAttrsList;
}
````

## File: homelab-subflake/services/ssl-proxy/functional/proxy-vhosts.nix
````nix
/**
  Generates nginx virtual hosts for all proxied services.

  For each manifest:
  - If sslProxyConfig is declared: use it (custom nginx config)
  - Else if https endpoints exist: auto-generate a standard proxy vhost
  - Otherwise: skip (TCP/UDP-only services don't need a vhost)

  Also handles old-format services with metrics on the web endpoint.
*/
{ lib, ... }:
let
  allManifests = lib.homelab.getManifests;
  srvLib = lib.homelab.getSrvLib "ssl-proxy";

  getSslProxyConfig =
    m:
    if m ? sslProxyConfig && m.sslProxyConfig != null then
      m.sslProxyConfig
    else if m ? ingress && m.ingress ? sslProxyConfig then
      m.ingress.sslProxyConfig
    else
      null;

  mkVhostImport =
    svcName: manifest:
    let
      explicit = getSslProxyConfig manifest;
    in
    if explicit != null then
      explicit
    else
      let
        httpsEndpoints = manifest.endpoints |> lib.filterAttrs (_: ep: ep.protocol == "https");
      in
      if httpsEndpoints == { } then
        null
      else
        let
          # Prefer "web" endpoint; fall back to first https endpoint
          endpoint = httpsEndpoints.web or (lib.head (lib.attrValues httpsEndpoints));
        in
        { config, lib, ... }:
        srvLib.mkStandardProxyVHost {
          serviceName = svcName;
          port = endpoint.port;
          inherit config lib;
        };

  # Old-format services expose metrics as a path on their web vhost.
  # New-format services get dedicated metrics subdomains (see metrics-vhosts.nix).
  metricsOnWebServices =
    allManifests
    |> lib.filterAttrs (_: v: v.observability.metrics.enable or false)
    |> lib.filterAttrs (_: v: !v.observability.metrics ? "port");
in
{
  imports =
    (
      allManifests
      |> lib.mapAttrsToList mkVhostImport
      |> lib.filter (x: x != null)
    )
    ++ (
      metricsOnWebServices
      |> lib.mapAttrsToList (
        svcName: srvManifest:
        srvLib.mkMetricsPathAllowOnlyPrometheus {
          serviceName = svcName;
          inherit lib;
          metricsPath =
            (srvManifest.observability.metrics.path or "/metrics")
            |> (it: if lib.isFunction it then it lib else it);
        }
      )
    );
}
````

## File: homelab-subflake/services/ssl-proxy/non-functional/observability/metrics.nix
````nix
/**
  Sets up a vector instance to extract upstream logs and show them as metrics and in a structured format.:
*/
{ lib, ... }:
let
  vectorListenerPort = 9000; # TODO: grab it from `srv:log-concentrator` manifest
  port = 9598; # TODO: grab from own manifest
in
{
  # Set up the log format for the access log
  services.nginx.commonHttpConfig = ''
     log_format vector_json escape=json '{'
        '"timestamp": "$time_iso8601",'
        '"host": "$server_addr",'
        '"client_ip": "$remote_addr",'
        '"request_method": "$request_method",'
        '"request_path": "$uri",'
        '"query_string": "$args",'
        '"request_length": $request_length,'
        '"status": $status,'
        '"body_bytes_sent": $body_bytes_sent,'
        '"http_referrer": "$http_referer",'
        '"http_user_agent": "$http_user_agent",'
        '"request_time": $request_time,'
        '"domain": "$http_host",'
        '"upstream_name": "$upstream_addr",'
        '"upstream_response_time": "$upstream_response_time",'
        '"upstream_status": "$upstream_status",'
        '"upstream_connect_time": "$upstream_connect_time",'
        '"upstream_header_time": "$upstream_header_time"'
    '}';

    access_log syslog:server=localhost:${vectorListenerPort |> toString},nohostname vector_json;
  '';

  # Local vector instance that will remap the access log and/or ship it for processing

  services.vector = {
    enable = true;
    settings = {
      sources.nginx-log-listener = {
        type = "syslog";
        address = "0.0.0.0:${vectorListenerPort |> toString}";
        mode = "udp"; # `nginx` can only send logs over UDP.
      };

      transforms.parse-nginx-log = {
        type = "remap";
        inputs = [ "nginx-log-listener" ];
        source =
          # vrl
          ''
            . = parse_json!(.message)

            # Discard log entries caused by prometheus querying the metrics endpoints
            # Tied to prometheus having only one IP and talking to the SSL proxy over LAN
            if .client_ip == "${lib.homelab.services.getLANIP "prometheus"}" && .request_path == "/metrics" && .status == 200 {
                abort
            }
          '';
      };

      sinks.access-logs-sink = {
        type = "vector";
        inputs = [ "parse-nginx-log" ];
        address = "${lib.homelab.services.getInnerIP "log-concentrator"}:9514";
      };

      # Turn the logs into metrics
      transforms.nginx-enrich = {
        type = "remap";
        inputs = [ "parse-nginx-log" ];
        source =
          # vrl
          ''
            .status, err = to_int(.status)
            if err != null {
              log("Failed to parse status: " + err, level: "error")
              # Set a default so later logic doesn't fail
              .status = 0
            }

            .upstream_status = string(.upstream_status) ?? ""
            if is_empty(.upstream_status) || (.upstream_status == "-") {
              # Set a default so later logic doesn't fail
              .upstream_status = 0
              # This also indicates that upstream response, connect and header times are empty
              .upstream_response_time = 0
              .upstream_connect_time = 0
              .upstream_header_time = 0
            }
            .upstream_status, err = to_int(.upstream_status)
            if err != null {
              log("Failed to parse upstream_status: " + err, level: "info", rate_limit_secs: 0)
            }

            .upstream_response_time, err = to_float(.upstream_response_time)
            if err != null {
              log("Failed to parse upstream_response_time: " + err, level: "info", rate_limit_secs: 0)
            }

            .upstream_connect_time, err = to_float(.upstream_connect_time)
            if err != null {
              log("Failed to parse upstream_connect_time: " + err, level: "info", rate_limit_secs: 0)
            }

            .upstream_header_time, err = to_float(.upstream_header_time)
            if err != null {
              log("Failed to parse upstream_header_time: " + err, level: "info", rate_limit_secs: 0)
            }

            # --- Enrichment ---
            # Add a convenient label based on the (now integer) upstream_status
            if .upstream_status >= 500 {
              .upstream_result_type = "5xx_server_error"
            } else if .upstream_status >= 400 {
              .upstream_result_type = "4xx_client_error"
            } else if .upstream_status >= 200 || (.status == 301 && .upstream_status == 0) || .upstream_status == 101 {
              # 301 status with 0 upstream means nginx did the redirect
              .upstream_result_type = "2xx_3xx_success"
            } else {
              # This will catch status 0 or other NGINX-side errors (like 502s)
              # where the upstream never provided a status.
              .upstream_result_type = "nginx_error_or_other"
            }

          '';
      };

      transforms.nginx-metrics = {
        type = "log_to_metric";
        inputs = [ "nginx-enrich" ];
        metrics = [
          {
            type = "counter";
            name = "nginx_http_requests_total";
            namespace = "ssl_proxy";
            description = "Total number of HTTP requests";
            field = "domain";
            increment_by_value = false;
            tags = {
              domain = "{{ domain }}";
              upstream = "{{ upstream_name }}";
              method = "{{ request_method }}";
              status = "{{ status }}";
              upstream_status = "{{ upstream_status }}";
              result = "{{ upstream_result_type }}";
            };
          }
        ];
      };

      sinks.prometheus-exporter = {
        type = "prometheus_exporter";
        inputs = [ "nginx-metrics" ];
        address = "0.0.0.0:${port |> toString}";
      };
    };
  };

}
````

## File: homelab-subflake/services/ssl-proxy/non-functional/probes/default.nix
````nix
/**
  Implements `ssl_exporter` probe
  Ref:
  - https://github.com/ribbybibby/ssl_exporter
*/
{ lib, ... }:
let
  port = 9219; # TODO: Grab from own manifest
in
{
  services.prometheus.exporters.ssl_exporter = {
    enable = true;
    inherit port;
  };

  # TODO: use `srv:prometheus` `srvLib` to generate this
  networking.firewall.extraInputRules = ''
    iifname "backbone-inner" ip saddr ${
      "prometheus" |> lib.homelab.getServiceInnerIP
    } tcp dport ${port |> toString} accept comment "Allow prometheus to scrape ssl probes"
  '';

}
````

## File: homelab-subflake/services/ssl-proxy/non-functional/probes/prometheus.nix
````nix
{ lib, ... }:
let
  # All centrally proxied services share one cert — probe one representative
  centralTarget =
    (lib.homelab.getSrvLib "ssl-proxy").getProxiedServices |> lib.head |> lib.homelab.getServiceFqdn;

  metricsFqdn = lib.homelab.services.getServiceMetricsFqdn "ssl-proxy";
in
{
  services.prometheus.scrapeConfigs = [
    {
      job_name = "ssl-probe";
      metrics_path = "/probe";
      scheme = "https";
      static_configs = [
        {
          targets = [ "${centralTarget}:443" ];
          labels = {
            cert_type = "central";
            resource = "srv:ssl-proxy";
          };
        }
      ];
      relabel_configs = [
        # Move target FQDN into `?target=` query parameter
        {
          source_labels = [ "__address__" ];
          target_label = "__param_target";
        }
        # Preserve FQDN as human-readable instance label
        {
          source_labels = [ "__param_target" ];
          target_label = "instance";
        }
        # Route all probes through `srv:ssl-proxy` metrics virtual host
        {
          target_label = "__address__";
          replacement = metricsFqdn;
        }
      ];
    }
  ];
}
````

## File: homelab-subflake/services/ssl-proxy/non-functional/alerts.nix
````nix
{ serviceName, ... }:
{
  Emergency = [
    {
      title = "SSL proxy service down";
      expr = ''absent(up{resource="srv:${serviceName}"}) or up{resource="srv:${serviceName}"} == 0'';
    }
  ];
  Warning = [
    {
      title = "SSL proxy upstream errors";
      expr = ''rate(ssl_proxy_nginx_http_requests_total{resource="srv:${serviceName}",result!="2xx_3xx_success"}[5m]) > 0.01'';
      description = "More than 1% of proxied requests are failing";
    }
  ];
}
````

## File: homelab-subflake/services/ssl-proxy/oauth2-proxy-config/per-service/healthchecks.nix
````nix
{ lib, ... }:
let
  prometheusIP = "prometheus" |> lib.homelab.getServiceHost |> lib.flip lib.homelab.getHostIpInNetwork "lan";
in
{
  services.nginx.virtualHosts.${"healthchecks" |> lib.homelab.getServiceFqdn} = {
    # Disable OAuth on ping and metrics paths
    locations."/ping" = {
      proxyPass = "$srv_upstream";
      extraConfig = ''auth_request off;'';
    };

    locations."~ /metrics/" = {
      proxyPass = "$srv_upstream";
      extraConfig = ''
        auth_request off;
        allow ${prometheusIP};
        deny all;
      '';
    };
  };
}
````

## File: homelab-subflake/services/ssl-proxy/oauth2-proxy-config/default.nix
````nix
/**
  Sets up `oauth2-proxy` for SSO to certain domains
*/
{ lib, config, ... }:
let
  srvName = "oauth2-proxy";
  secretName = "${srvName}-client-secret";
  domainPart = lib.homelab.getSettings.publicDomainName;
in
{
  services.oauth2-proxy = {
    enable = true;
    nginx.domain = lib.homelab.getServiceFqdn srvName;
    provider = "keycloak-oidc";

    clientID = "oauth2-proxy";
    keyFile = config.age.secrets.${secretName}.path;

    setXauthrequest = true;

    cookie = {
      secret = (lib.homelab.getServiceConfig srvName).cookie;
      secure = true;
      domain = ".${domainPart}";
      httpOnly = true;
    };

    extraConfig = {
      "oidc-issuer-url" = "https://${"keycloak" |> lib.homelab.getServiceFqdn}/realms/master";

      "set-xauthrequest" = "true";
      "whitelist-domain" = ".${domainPart}";

      # Optional: If you want to verify email domains
      "email-domain" = "*";

      # Optional: If your upstream requires the OIDC access token
      # "pass-access-token" = "true";

      session-cookie-minimal = true;
      # Reducing the scope helps with "headers" too large
      scope = [
        "email"
        "openid"
      ];
    };

    nginx.virtualHosts =
      [
        "healthchecks"
        "fava"
      ]
      |> map (it: {
        name = lib.homelab.getServiceFqdn it;
        value = { };
      })
      |> lib.listToAttrs;
  };

  age.secrets.${secretName}.owner = "oauth2-proxy";

  imports = lib.localLib.mkImportsFromDir ./per-service;

  services.nginx.virtualHosts.${lib.homelab.getServiceFqdn srvName} = {
    forceSSL = true;
    inherit (config.services.homelab.ssl-proxy) listenAddresses;
    sslCertificate = config.age.secrets."ssl-cert".path;
    sslCertificateKey = config.age.secrets."ssl-key".path;
  };
}
````

## File: homelab-subflake/services/ssl-proxy/firewall.nix
````nix
{ lib, ... }:
let
  allowedTCPPorts = [
    22 # TODO: get this value from nginx streams?
    80
    443
  ];
in
{
  networking.firewall.interfaces = {
    phy-lan = { inherit allowedTCPPorts; };
    backbone = { inherit allowedTCPPorts; };
    backbone-inner = { inherit allowedTCPPorts; };
  };

  networking.firewall.extraReversePathFilterRules = ''
    iifname "backbone" ip saddr { ${
      (lib.homelab.getNetwork "client").settings.clientNodes
      |> builtins.attrValues
      |> builtins.catAttrs "ipAddress"
      |> map (it: "${it}/32")
      |> builtins.concatStringsSep ", "
    } } accept
  '';
}
````

## File: homelab-subflake/services/ssl-proxy/listen-address.nix
````nix
/**
  Sets up an option to easily propagate and change the `listenAddress` for
  the virtual hosts
*/
{ lib, ... }:
{
  options.services.homelab.ssl-proxy.listenAddresses = lib.options.mkOption {
    default =
      [
        "lan"
        "backbone"
        "backbone-inner"
      ]
      |> map lib.homelab.getOwnIpInNetwork;
  };
}
````

## File: homelab-subflake/services/ssl-proxy/manifest.nix
````nix
{ lib, ... }:
{
  module = ./service.nix;

  # Network endpoints for observability
  endpoints = {
    metrics = {
      port = 9598;
      protocol = "tcp";
      path = "/metrics";
    };
    probe = {
      port = 9219;
      protocol = "tcp";
    };
  };

  # Custom firewall configuration
  firewall = ./firewall.nix;

  observability = {
    metrics.main.impl = ./non-functional/observability/metrics.nix;
    probes = {
      enable = true;
      ssl = true;
      impl = ./non-functional/probes;
      prometheusImpl = ./non-functional/probes/prometheus.nix;
    };
    alerts.prometheusImpl = ./non-functional/alerts.nix;
  };

  srvLib = import ./srv-lib.nix { inherit lib; };

  # Stateless service - no backups or storage needed
}
````

## File: homelab-subflake/services/ssl-proxy/service.nix
````nix
/**
  Service implementation for the SSL proxy
*/
{ config, lib, ... }:
{
  age.secrets.ssl-cert = {
    owner = config.services.nginx.user;
    inherit (config.services.nginx) group;
  };
  age.secrets.ssl-key = {
    owner = config.services.nginx.user;
    inherit (config.services.nginx) group;
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    serverNamesHashBucketSize = 128; # Necessary for having many domains
  };

  imports =
    # TODO: `lib.locallib.mkImportsFromDir` ?
    (lib.fileset.fileFilter (file: file.hasExt "nix") ./functional |> lib.fileset.toList)
    ++ [
      ./listen-address.nix
      ./utils.nix
      ./oauth2-proxy-config
    ];
}
````

## File: homelab-subflake/services/ssl-proxy/srv-lib.nix
````nix
{ lib, ... }:
rec {
  /**
    Dynamic function to generate implementation for a proxy for all kinds of services.

    Implementation notes:
    I am not necessarily happy about binding `config` and `lib` this way.
    However, this allows the caller code to be very simple and not bother about
    importing the resulting module.
  */
  _mkProxyVhostInner =
    netName:
    {
      serviceName,
      port,
      config,
      lib,
      extraConfig ? "", # As default `services.nginx.virtualHosts.<name>.extraConfig`
      onlyHumans ? false,
      protocol ? "http",
      allowiFrame ? false,
    }:
    let
      ipLookupFuncs = {
        lan = _: lib.homelab.getHostIpInNetwork (lib.homelab.getService serviceName).onHost "lan";
        backbone-inner = lib.homelab.getServiceInnerIP;
      };
    in
    {
      services.nginx.virtualHosts."${serviceName |> lib.homelab.getServiceFqdn}" = {
        forceSSL = true;
        inherit (config.services.homelab.ssl-proxy) listenAddresses;
        sslCertificate = config.age.secrets."ssl-cert".path;
        sslCertificateKey = config.age.secrets."ssl-key".path;
        locations."/" = {
          proxyPass = "$srv_upstream";
          proxyWebsockets = true;
          extraConfig = /* nginx */ ''
            add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
            add_header X-XSS-Protection "1; mode=block" always;
            add_header X-Content-Type-Options "nosniff" always;
            ${
              (lib.optionalString (!allowiFrame) ''
                add_header X-Frame-Options "SAMEORIGIN" always;
              '')
            }
          '';
        };
        extraConfig = /* nginx */ ''
          add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
          add_header X-XSS-Protection "1; mode=block" always;
          ${(lib.optionalString (!allowiFrame) ''add_header X-Frame-Options "SAMEORIGIN" always;'')}
          add_header X-Content-Type-Options "nosniff" always;

          set $srv_upstream "${protocol}://${serviceName |> ipLookupFuncs."${netName}"}:${port |> toString}";

          ${lib.optionalString onlyHumans (
            lib.homelab.getHumanIPs
            |> map (x: "allow ${x};") # construct allow directives in nginx
            |> lib.concatStringsSep "\n" # turn into a string
          )}
          ${extraConfig}
          ${lib.optionalString onlyHumans "deny all;"}
        '';
      };
    };

  /**
    Produces a module for my default SSL virtual host.
  */
  mkStandardProxyVHost = _mkProxyVhostInner "backbone-inner";
  mkLANProxyVHost = _mkProxyVhostInner "lan";

  /**
    Produces standard firewall rules for the local service to accept traffic from
    the SSL proxy.

    Takes the local `ports` which should be a list of
    `{ port = 1234; protocol = "udp|tcp"; }`.

    Also takes `lib` to bind the functions.
  */
  mkBackboneInnerFirewallRules =
    { lib, ports }:
    {
      # The validation is done by nftables, no need to make an extra check
      networking.firewall.extraInputRules =
        ports
        # Parse ports coming in as just int. If so – reconstruct attrset.
        # Otherwise leave the value be and let if fail later if needed.
        |> map (
          it:
          if lib.isInt it then
            {
              port = it;
              protocol = "tcp";
            }
          else
            it
        )
        # Construct the firewall rules
        |> map (
          it:
          [
            ''iifname "backbone-inner"''
            "ip saddr { ${lib.homelab.getSSLProxyIPs |> lib.concatStringsSep ", "} }"
            "${it.protocol} dport ${it.port |> toString} accept"
          ]
          |> builtins.concatStringsSep " "
        )
        |> lib.concatLines;
    };

  /**
    Produces a module that when imported, allows `prometheus` service and
    only that service to access a specific web path.
  */
  mkMetricsPathAllowOnlyPrometheus =
    {
      serviceName,
      metricsPath,
      # In case metrics are served by a separate process
      lib,
    }:
    let
      prometheusIP =
        "prometheus" |> lib.homelab.getServiceHost |> lib.flip lib.homelab.getHostIpInNetwork "lan";
    in
    {
      services.nginx.virtualHosts."${
        serviceName |> lib.homelab.getServiceFqdn
      }".locations.${metricsPath} =
        {
          proxyPass = "$srv_upstream";
          extraConfig = ''
            allow ${prometheusIP};
            deny all;
          '';
        };
    };

  /**
    Return the list of services that have are terminated here.
  */
  getProxiedServices =
    lib.homelab.services.getAll
    |> lib.filterAttrs (_: builtins.getAttr "centralSSL")
    |> builtins.attrNames;
}
````

## File: homelab-subflake/services/ssl-proxy/utils.nix
````nix
{ pkgs, lib, ... }:
{
  environment.systemPackages =
    ''$EDITOR $(ps aux | grep nginx | head -n1 | awk '{print $NF}') "$@"''
    |> pkgs.writeShellScriptBin "view-nginx-config"
    |> lib.singleton;
}
````

## File: homelab-subflake/services/web-receipt-printer/non-functional/endpoints-config.nix
````nix
endpoints: {
  services.web-receipt-printer.port = endpoints.web.port;
}
````

## File: homelab-subflake/services/web-receipt-printer/non-functional/firewall.nix
````nix
{ port, ... }:
{ self, lib, ... }:
{
  services.web-receipt-printer.port = port;
  imports = [
    (self.serviceModules.ssl-proxy.srvLib.mkBackboneInnerFirewallRules {
      inherit lib;
      ports = [ port ];
    })
  ];
}
````

## File: homelab-subflake/services/web-receipt-printer/non-functional/ssl.nix
````nix
{ serviceName, port }:
{
  config,
  lib,
  self,
  ...
}:
self.serviceModules.ssl-proxy.srvLib.mkStandardProxyVHost {
  inherit
    config
    lib
    port
    serviceName
    ;
  onlyHumans = true;
}
````

## File: homelab-subflake/services/web-receipt-printer/default.nix
````nix
{
  imports = (import ./manifest.nix).default;
}
````

## File: homelab-subflake/services/web-receipt-printer/impl.nix
````nix
{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.services.web-receipt-printer;
in
{
  options.services.web-receipt-printer = {
    enable = mkEnableOption "Web Receipt Printer Service";

    package = mkOption {
      type = types.package;
      description = "The package to use.";
      default = (
        (pkgs.writers.writePython3Bin "webprinter" {
          libraries = [
            pkgs.python3Packages.flask
            pkgs.python3Packages.python-escpos
            pkgs.python3Packages.pyusb
            pkgs.python3Packages.pillow
          ];
          flakeIgnore = [ "E501" ];
        } ./source.py)
        |> (
          it:
          pkgs.runCommand "tinyprinter"
            {
              buildInputs = [ pkgs.makeWrapper ];
            }
            ''
              makeWrapper ${it}/bin/webprinter $out/bin/tinyprinter \
                --prefix LD_LIBRARY_PATH : ${pkgs.libusb1}/lib
            ''
        )
      );
    };

    port = mkOption {
      type = types.port;
      default = 5000;
      description = "Port to bind the web server to.";
    };

    vendorId = mkOption {
      type = types.str;
      default = "04b8"; # Epson default
      description = "USB Vendor ID (lsusb) without 0x prefix";
    };

    productId = mkOption {
      type = types.str;
      default = "0202"; # `TM-T88IIIP` default
      description = "USB Product ID (lsusb) without 0x prefix";
    };
  };

  config = mkIf cfg.enable {
    systemd.services.web-receipt-printer = {
      description = "Web Receipt Printer Interface";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      environment = {
        FLASK_RUN_PORT = toString cfg.port;
        VENDOR_ID = toString cfg.vendorId;
        PRODUCT_ID = toString cfg.productId;
      };

      serviceConfig = {
        ExecStart = "${cfg.package}/bin/tinyprinter";
        Restart = "always";
        RestartSec = "5s";

        DynamicUser = true;
        SupplementaryGroups = [
          "dialout"
        ];
        ProtectHome = true;
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        LockPersonality = true;
        MemoryDenyWriteExecute = true;
        SystemCallArchitectures = "native";
        CapabilityBoundingSet = "";
        SystemCallFilter = [ "@system-service" ];
        ProtectClock = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        ProtectControlGroups = true;
        RestrictAddressFamilies = [
          "AF_INET"
          "AF_INET6"
          "AF_NETLINK"
        ];
      };
    };

    services.udev.extraRules = ''
      SUBSYSTEM=="usb", ATTRS{idVendor}=="${cfg.vendorId}", ATTRS{idProduct}=="${cfg.productId}", MODE="0660", GROUP="dialout"
    '';
  };
}
````

## File: homelab-subflake/services/web-receipt-printer/manifest.nix
````nix
{ lib, serviceName, ... }:
{
  module = ./web-receipt-printer.nix;

  endpoints.web = {
    port = 5000;
    protocol = "https";
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  # SSL proxy metadata
  sslProxyConfig = import ./non-functional/ssl.nix { inherit serviceName; port = 5000; };

  dashboard = {
    category = "Home";
    links = [
      {
        name = "Receipt printer";
        description = "Receipt printer";
        icon = "printer";
      }
    ];
  };

  documentation = ./README.md;
}
````

## File: homelab-subflake/services/web-receipt-printer/web-receipt-printer.nix
````nix
{
  imports = [ ./impl.nix ];
  services.web-receipt-printer.enable = true;
}
````

## File: homelab-subflake/services/your-spotify/non-functional/alerts.nix
````nix

````

## File: homelab-subflake/services/your-spotify/non-functional/endpoints-config.nix
````nix
endpoints: { lib, ... }:
let
  fqdn = "your-spotify" |> lib.homelab.getServiceFqdn;
  clientEndpoint = "https://${fqdn}";
in
{
  services.your_spotify.settings = {
    PORT = endpoints.api.port;
    CLIENT_ENDPOINT = clientEndpoint;
    API_ENDPOINT = clientEndpoint + "/api";
  };
  services.your_spotify.nginxVirtualHost = fqdn;

  services.nginx.virtualHosts.${fqdn} = {
    extraConfig = ''
      client_max_body_size 500M;
    '';
    locations."/api/" = {
      proxyPass = "http://127.0.0.1:${endpoints.api.port |> toString}/";
      extraConfig = ''
        proxy_set_header X-Script-Name /api;
        proxy_pass_header Authorization;
      '';
    };
  };
}
````

## File: homelab-subflake/services/your-spotify/manifest.nix
````nix
/**
  Upstream docs
  https://github.com/Yooooomi/your_spotify?tab=readme-ov-file#installation

  Call for two endpoints:
  - API_ENDPOINT
  - CLIENT_ENDPOINT

  CLIENT_ENDPOINT(port 3000) looks like it should be the domain
  (your-spotify.srv.vtimofeenko.com).

  API_ENDPOINT(port 8080) should be accessible to the user, but Nix docs
  suggest using a different domain.

  I will try to move the API_ENDPOINT to a sub path in nginx...
*/
{ serviceName, ... }:
{
  module = ./your-spotify.nix;

  endpoints = {
    web = {
      port = 80; # nginx frontend
      protocol = "https";
    };
    api = {
      port = 8081; # backend API
      protocol = "tcp";
    };
  };

  endpointsConfig = import ./non-functional/endpoints-config.nix;

  observability = { }; # TODO: implement 200 probe only

  # Backups disabled — TODO
  # backups = { ... };

  dashboard = {
    category = "Media";
    links = [
      {
        description = "Spotify history exporter";
        icon = "your-spotify";
        name = "Your Spotify";
      }
    ];
  };
}
````

## File: homelab-subflake/services/your-spotify/your-spotify.nix
````nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  serviceName = "your-spotify";
in
{
  services.your_spotify = {
    enable = true;
    enableLocalDB = true;

    settings.SPOTIFY_PUBLIC =
      lib.homelab.getServiceConfig serviceName |> builtins.getAttr "spotifyPublic";
    spotifySecretFile = config.age.secrets."${serviceName}-spotify-secret".path;
  };

  services.mongodb = {
    enable = true;
    package = pkgs.mongodb-ce;
    dbpath = "/var/lib/mongodb";
    extraConfig = ''
      storage:
        wiredTiger:
          engineConfig:
            cacheSizeGB: 0.25
      operationProfiling:
        mode: off
    '';
  };

  environment.systemPackages = [
    pkgs.mongodb-tools
    pkgs.mongosh
  ];
}
````

## File: homelab-subflake/tests/dns-test-vm.nix
````nix
/**
  DNS Test VM Configuration

  Creates a test VM that runs only `auth-dns` and `dns` services.
  Uses data-flake's `mkCustom` to extend the data with test VM configuration.

  Usage:
  ```
  nix run .#nixosConfigurations.dns-test-vm.config.system.build.vm
  ```
*/
{
  inputs,
  self,
  lib,
  ...
}:
let
  # Extended data with test VM
  testData = import ./test-data.nix { data-flake = inputs.data-flake; };

  # Create custom homelab lib with test data
  customHomelabLib = inputs.data-flake.lib.homelab.mkCustom testData;

  hostName = "dns-test-vm";

  # Build extended lib that `mkHost` expects
  extendedLib = lib.extend (
    lib.composeManyExtensions [
      # Replace homelab lib with our custom one that has test data
      # Include both base functions and host-specific "Own" functions
      (_: _: {
        homelab =
          customHomelabLib
          // customHomelabLib._mkOwnFuncs hostName
          // {
            inherit (self.lib) getManifest getManifests;
          };
      })
      # Add local lib functions
      (_: _: { localLib = import ../lib/local-lib.nix { inherit lib; }; })
    ]
  );

  hostData = testData.hosts.all.${hostName};

  # Resolve services for test VM (same logic as `mkHost`)
  resolveService =
    serviceName:
    let
      serviceData = testData.services.all.${serviceName};
      moduleName = serviceData.moduleName or null;
      fromPublic = moduleName != null && moduleName != "stub" && self.serviceModules ? ${moduleName};
    in
    if moduleName == null || moduleName == "stub" then
      [ ]
    else if fromPublic then
      self.serviceModules.${moduleName}.default
    else
      [ ];

  serviceModules = hostData.servicesAt |> lib.concatMap resolveService;

  # Resolve traits (minimal for test VM)
  resolveTrait =
    traitName: if self.traitModules ? ${traitName} then [ self.traitModules.${traitName} ] else [ ];

  traitModules = (hostData.traitsAt or [ ]) |> lib.concatMap resolveTrait;

  # Base modules from base flake
  baseFlakeModules = [
    inputs.base.nixosModules.zsh
    inputs.base.nixosModules.tmux
    inputs.base.nixosModules.vim
    inputs.base.nixosModules.my-theme
    { programs.myNeovim.enable = true; }
  ];

in
lib.nixosSystem {
  inherit (hostData) system;
  lib = extendedLib;
  pkgs = import inputs.nixpkgs {
    inherit (hostData) system;
    config.allowUnfree = true;
    overlays = [ inputs.base.overlays.default ];
  };
  modules = [
    ../hosts/${hostName}/configuration
    { networking.hostName = hostName; }

    # Enable VM building with serial console (no graphical window)
    {
      virtualisation.vmVariant = {
        virtualisation = {
          memorySize = 2048;
          cores = 2;
          graphics = false;
          qemu.options = [ "-nographic" ];
        };
      };
    }
  ]
  ++ baseFlakeModules
  ++ serviceModules
  ++ traitModules;

  specialArgs = {
    inherit inputs self;
    pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${hostData.system};
  };
}
````

## File: homelab-subflake/tests/test-data.nix
````nix
/**
  Test data extension for DNS test VM.

  Extends data-flake with a minimal test host configuration
  that includes `dns` and `auth-dns` services.
*/
{ data-flake }:
let
  baseData = data-flake.data;
in
baseData
// {
  hosts.all = baseData.hosts.all // {
    dns-test-vm = {
      description = "Test VM for DNS services";
      groups = [
        "managed"
        "test"
      ];
      hostId = 999;
      hostName = "dns-test-vm";
      inRack = false;
      networks = {
        lan = {
          macAddr = "52:54:00:12:34:56";
        };
        backbone-inner = {
          pubKey = "test-pubkey-backbone-inner";
        };
      };
      # Service instances that will run on this VM
      servicesAt = [
        "test-auth-dns"
        "test-dns"
      ];
      # Minimal traits for a working system
      traitsAt = [
        "network-general-setup"
        "disable-docs"
      ];
      sshPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGtestkeytestkeytestkeytestkeytestkey test-vm";
      system = "x86_64-linux";
      settings = { };
    };
  };

  services.all = baseData.services.all // {
    test-auth-dns = {
      serviceName = "test-auth-dns";
      instance = "test";
      moduleName = "auth-dns";
      onHost = "dns-test-vm";
      groups = [
        "managed"
        "nonWeb"
        "test"
      ];
      centralSSL = false;
      sideEffectOnly = false;
    };

    test-dns = {
      serviceName = "test-dns";
      instance = "test";
      moduleName = "dns";
      onHost = "dns-test-vm";
      networkAccess = [ "lan" ];
      groups = [
        "managed"
        "nonWeb"
        "test"
      ];
      centralSSL = false;
      sideEffectOnly = false;
      settings = {
        # Minimal DNS configuration for testing
        upstream = [
          "1.1.1.1@853#cloudflare-dns.com"
        ];
        altUpstream = [
          "9.9.9.9@853#dns.quad9.net"
        ];
        # Domains to block (return 0.0.0.0)
        customBlocklist = [
          "flurry.com"
          "example.tld"
        ];
        clientsNonGrata = [ ];
      };
    };
  };

  # Extend the lan and backbone-inner networks with our test VM
  networks = baseData.networks // {
    lan = baseData.networks.lan // {
      hostsInNetwork = baseData.networks.lan.hostsInNetwork // {
        dns-test-vm = {
          description = "Test VM for DNS services";
          fqdn = "dns-test-vm.home.arpa";
          groups = [
            "managed"
            "test"
          ];
          hostId = 999;
          hostName = "dns-test-vm";
          inRack = false;
          ipAddress = "192.168.1.199";
          macAddr = "52:54:00:12:34:56";
          networks = {
            lan = {
              macAddr = "52:54:00:12:34:56";
            };
            backbone-inner = {
              pubKey = "test-pubkey-backbone-inner";
            };
          };
          servicesAt = [
            "test-auth-dns"
            "test-dns"
          ];
          traitsAt = [
            "network-general-setup"
            "disable-docs"
          ];
        };
      };
    };
    backbone-inner = baseData.networks."backbone-inner" // {
      hostsInNetwork = baseData.networks."backbone-inner".hostsInNetwork // {
        dns-test-vm = {
          description = "Test VM for DNS services";
          fqdn = "dns-test-vm.backbone-inner.home.arpa";
          groups = [
            "managed"
            "test"
          ];
          hostId = 999;
          hostName = "dns-test-vm";
          inRack = false;
          ipAddress = "10.200.0.199";
          pubKey = "test-pubkey-backbone-inner";
          networks = {
            lan = {
              macAddr = "52:54:00:12:34:56";
            };
            backbone-inner = {
              pubKey = "test-pubkey-backbone-inner";
            };
          };
          servicesAt = [
            "test-auth-dns"
            "test-dns"
          ];
          traitsAt = [
            "network-general-setup"
            "disable-docs"
          ];
        };
      };
    };
  };
}
````

## File: homelab-subflake/traits/base-wayland-environment/xremap/app-jumps.nix
````nix
/**
  Contains xremap side of application jumping.

  The main logic is that Caps Lock when pressed alone emits Escape.

  If Caps Lock is pressed with, say, 'E', focus switches to Emacs.
*/
let
  settings.appMap = {
    # E is for Emacs
    e = "Emacs";
    # B is for browser
    b = "firefox";
    # T is for terminal
    t = "kitty";
    # TODO: `W` is for Whiteboard
    # TODO: `S` if for scratch?

  };
in
{ lib, ... }:
{
  services.xremap.config = {
    virtual_modifiers = [ "F18" ];

    modmap = [
      {
        # Global remap Caps Lock to emit `F18` when held
        name = "Global";
        remap."CapsLock" = {
          held = "F18";
          # Single press of Caps Lock = "escape"
          alone = "Esc";
          alone_timeout_millis = 250;
        };
      }
    ];

    keymap = [
      {
        name = "Remap hyper key";
        # Needs explicit bindings it seems. Maybe accept `F18` as modifier in Hyprland?
        # Basically produces bindings like "`F18-e`" = "SHIFT-C-M-SUPER-e"
        # These are later handled by hyprland
        remap = lib.mapAttrs' (
          name: _: lib.nameValuePair "F18-${name}" "SHIFT-C-M-SUPER-${name}"
        ) settings.appMap;
      }
    ];
  };
}
````

## File: homelab-subflake/traits/base-wayland-environment/xremap/default.nix
````nix
{ inputs, ... }:
{
  imports = [
    inputs.xremap-flake.nixosModules.default
    ./shortcuts.nix
  ];

  services.xremap = {
    enable = true;
    withWlroots = true;
    userName = "spacecadet";
    serviceMode = "user";
    watch = true;
  };
}
````

## File: homelab-subflake/traits/base-wayland-environment/xremap/shortcuts.nix
````nix
let
  consoleLikeApps = [
    "kitty"
    "Emacs"
    "kitty-dropterm"
  ];
in
{
  services.xremap.config = {
    virtual_modifiers = [ "F18" ];
    keymap = [
      {
        name = "Bypass remaps";
        remap = {
          "CTRL_L-SHIFT-ESC" = {
            escape_next_key = true;
          };
        };
      }
      {
        name = "Emacs-like shortcuts";
        exact_match = true;
        application = {
          "not" = consoleLikeApps;
        };
        remap = {
          "CTRL_L-a" = "home";
          "CTRL_L-e" = "end";
          # Same, but select
          "CTRL_L-Shift-a" = "Shift-home";
          "CTRL_L-Shift-e" = "Shift-end";
          "CTRL_L-W" = "C-Backspace";
        };
      }
      {
        name = "Global shortcuts";
        application = {
          "not" = consoleLikeApps;
        };
        remap = {
          # Select all
          "SUPER-a" = "C-a";
          # Copy
          "SUPER-c" = "C-c";
          # Cut
          "SUPER-x" = "C-x";
          # Undo
          "SUPER-z" = "C-z";
          # Paste
          "SUPER-v" = "Shift-insert";
          # Generic "close thing"
          "SUPER-w" = "C-w";
        };
      }
      {
        name = "Emacs-only paste";
        application.only = [ "Emacs" ];
        remap."SUPER-v" = "Shift-insert";
      }

      {
        name = "Global-like shortcuts for terminal and emacs";
        application.only = [
          "kitty"
          "kitty-dropterm"
        ];
        remap = {
          # Copy
          "SUPER-c" = "C-Shift-c";
          # Paste
          "SUPER-v" = "C-Shift-v";
        };
      }

      {
        name = "Close stuff by super-w";
        application = {
          "only" = [
            "firefox"
            "brave-browser"
          ];
        };
        remap = {
          "SUPER-w" = "C-w";
          "SUPER-SHIFT-w" = "C-Shift-w";
          "SUPER-t" = "C-t";
          "SUPER-SHIFT-t" = "C-Shift-t";
        };
      }
      {
        name = "Brave set incognito to a sane shortcut";
        application = {
          "only" = "brave-browser";
        };
        remap = {
          "C-Shift-p" = "C-Shift-n";
        };
      }
      {
        # Easier to press with a thumb
        name = "Remap alt-backspace to ctrl-backspace";
        remap = {
          "ALT-Backspace" = "C-Backspace";
        };
      }
    ];
  };
}
````

## File: homelab-subflake/traits/base-wayland-environment/default.nix
````nix
{
  imports = [
    # ./greeter
    # ./notifications
    # ./lock
    # Whatever else from current desktop env
    ./xremap
    ./xdg-portal.nix
    {
      home-manager.users.spacecadet.imports = [ ./wallpaper.nix ];
    }
  ];
}
````

## File: homelab-subflake/traits/base-wayland-environment/wallpaper-orig.nix
````nix
/** Original implementation of wallpaper. I need to redo it. */
{ nixpkgs-unstable, pkgs, ... }:
let
  pkgs-unstable = nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  target = "graphical-session.target";
in
{
  systemd.user = {
    services = {
      swww = {
        Unit = {
          Description = "Wallpaper daemon";
          PartOf = [ target ];
          After = [ target ];
          ConditionEnvironment = "WAYLAND_DISPLAY";
        };
        Service = {
          Type = "simple";
          ExecStart = "${pkgs-unstable.swww}/bin/swww-daemon";
          Restart = "always";
        };
        Install = {
          WantedBy = [ target ];
        };
      };
      set-random-wallpaper = {
        Unit = {
          Description = "random wallpaper setter";
          Requires = [ "swww.service" ];
          After = [ "swww.service" ];
          ConditionEnvironment = "WAYLAND_DISPLAY";
        };
        Service = {
          Type = "oneshot";
          ExecStart =
            (pkgs.writeShellApplication {
              name = "set-random-wallpaper";
              runtimeInputs = [
                pkgs-unstable.swww
                pkgs.coreutils-full
                pkgs.fd
              ];
              text = ''
                WALLPAPER=$(fd --absolute-path --full-path ~/Pictures/Wallpapers/ | shuf | head -n1)
                swww img "''${WALLPAPER}"
              '';
            })
            + "/bin/set-random-wallpaper";
        };
      };
    };

    timers.set-random-wallpaper = {
      Unit = {
        Description = "random wallpaper setter";
      };
      Timer = {
        OnCalendar = "hourly";
        Unit = "set-random-wallpaper.service";
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
}
````

## File: homelab-subflake/traits/base-wayland-environment/wallpaper.nix
````nix
/** TODO:

- Restore original wallpaper timer and stuff (see `./wallpaper-orig.nix`)
- Bring in my desktop images. Small package, get from filedump?
*/
{ pkgs, ... }:
{
  home.packages = [ pkgs.swww ];
}
````

## File: homelab-subflake/traits/base-wayland-environment/xdg-portal.nix
````nix
{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    # config.common.default = [ "hyprland" ];
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
````

## File: homelab-subflake/traits/client-hardware/default.nix
````nix
{
  imports = [
    ./flipper.nix
    ./keyboard.nix
    ./printer.nix
    ./scanner.nix
    ./rtl.nix
  ];
}
````

## File: homelab-subflake/traits/client-hardware/flipper.nix
````nix
/**
  Configures udev rules and programs so that Flipper can be managed from the
  userspace.
*/
{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.qFlipper ];

  services.udev.extraRules = ''
    #Flipper Zero serial port
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", ATTRS{manufacturer}=="Flipper Devices Inc.", TAG+="uaccess", GROUP="users"
    #Flipper Zero DFU
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", ATTRS{manufacturer}=="STMicroelectronics", TAG+="uaccess", GROUP="users"
    #Flipper ESP32s2 BlackMagic
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="40??", ATTRS{manufacturer}=="Flipper Devices Inc.", TAG+="uaccess", GROUP="users"
    #Flipper U2F
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5741", ATTRS{manufacturer}=="Flipper Devices Inc.", ENV{ID_SECURITY_TOKEN}="1"
  '';
}
````

## File: homelab-subflake/traits/client-hardware/keyboard.nix
````nix
{
  # taken from https://github.com/dygmalab/bazecor/blob/159eed1d37f3fd1fbf5c17023c12bb683b778281/src/main/index.js#l223
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idvendor}=="1209", ATTR{idproduct}=="2201", GROUP="users", MODE="0666"
    SUBSYSTEM=="usb", ATTR{idvendor}=="1209", ATTR{idproduct}=="2200", GROUP="users", MODE="0666"
  '';
}
````

## File: homelab-subflake/traits/client-hardware/printer.nix
````nix
{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  users.users.spacecadet.extraGroups = [ "lp" ];
}
````

## File: homelab-subflake/traits/client-hardware/rtl.nix
````nix
/** Configures support for USB-based RTL SDR */
{ pkgs, ... }:
{
  hardware.rtl-sdr.enable = true;
  users.users.spacecadet.extraGroups = [ "plugdev" ];
  environment.systemPackages = [
    pkgs.sdrpp
    pkgs.rtl-sdr
  ];
}
````

## File: homelab-subflake/traits/client-hardware/scanner.nix
````nix
{ pkgs, ... }:
{
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
  users.users.spacecadet.extraGroups = [ "scanner" ];
}
````

## File: homelab-subflake/traits/disable-docs/default.nix
````nix
{
  # Only install manuals
  documentation = {
    enable = true;
    man.enable = true;
    doc.enable = false;
    nixos.enable = false;
  };
}
````

## File: homelab-subflake/traits/lan-net/default.nix
````nix
{ lib, config, ... }:
let
  inherit (lib.homelab) getOwnHostInNetwork amInNetwork;
in
{
  networking = {
    # Disable autogenerated names
    usePredictableInterfaceNames = false;
    useNetworkd = true;
    enableIPv6 = false;
  };

  systemd.network =
    lib.mkIf
      (
        amInNetwork "lan" # does not make sense if not in lan
        && (config.networking.hostName != "hydrogen") # Poor man's "am router, need custom config!"
      )
      {

        networks."10-lan" = {
          enable = true;
          name = "10-lan";
          # Default is to match the name of the network
          matchConfig.Name = lib.mkForce config.systemd.network.links."10-phy-lan".linkConfig.Name;
          networkConfig = {
            DHCP = "yes";
            # This will also disable ipv6 assigning
            LinkLocalAddressing = "no";
          };
        };

        links."10-phy-lan" = {
          enable = true;
          linkConfig.Name = "phy-lan";
          matchConfig.PermanentMACAddress = (getOwnHostInNetwork "lan").macAddr;
        };
      };

}
````

## File: homelab-subflake/traits/logs-in-ram-only/default.nix
````nix
{
  /** Keeps logs only in RAM */
  services.journald.extraConfig = ''
    Storage=volatile
    RuntimeMaxUse=50M
  '';
}
````

## File: homelab-subflake/traits/microvm-guest/default.nix
````nix
/**
  MicroVM guest infrastructure.

  Applied automatically to any host with `isMicroVM == true`.
  Covers everything a microvm guest needs that isn't service/secret-specific.
*/
{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  hostName = lib.homelab.getOwnHost.hostName;
  lan = lib.homelab.getNetwork "lan";
in
{
  imports = [
    inputs.microvm.nixosModules.microvm
    inputs.impermanence.nixosModules.impermanence
  ];

  # TODO: remove this post-deploy, should be managed by trait now
  services.openssh = {
    enable = true;
    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
    settings.PermitRootLogin = lib.mkForce "yes";
  };
  users.users.root.openssh.authorizedKeys.keys = lib.homelab.getSettings.SSHKeys;

  networking.firewall.interfaces =
    [
      "phy-lan"
    ]
    |> map (it: {
      ${it}.allowedTCPPorts = [ 22 ];
    })
    |> lib.mergeAttrsList;

  # TODO: remove this post-deploy,
  systemd.network = {
    networks."10-lan" = {
      enable = true;
      name = "10-lan";
      matchConfig.Name = lib.mkForce "phy-lan";
      networkConfig = {
        Address = [ "${lib.homelab.getOwnIpInNetwork "lan"}/24" ];
        Gateway = lan.settings.defaultGateway.address;
        DNS = lan.dnsServers;
        LinkLocalAddressing = "no";
      };
    };

    links."10-phy-lan" = {
      enable = true;
      linkConfig.Name = "phy-lan";
      matchConfig.PermanentMACAddress = lib.homelab.getOwnHost.networks.lan.macAddr;
    };
  };

  networking.nftables.enable = true;
  networking.useNetworkd = true;
  networking.enableIPv6 = false;

  # Needs persistence
  age.identityPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ];

  # Persistence config
  fileSystems."/persist".neededForBoot = lib.mkForce true;
  environment.persistence."/persist" = {
    directories = [ "/var/lib/nixos" ];
    files = [ "/etc/ssh/ssh_host_ed25519_key" ];
  };

  # Swap
  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "lz4";
    priority = 100;
  };

  # MicroVM volumes and shares
  microvm.shares = [
    {
      source = "/vms/${hostName}";
      mountPoint = "/persist";
      tag = "persist";
      proto = "virtiofs";
    }
  ];

  fileSystems."/var/lib".neededForBoot = true;
  microvm.volumes = [
    {
      image = "/var/lib/microvms/${hostName}/data";
      mountPoint = "/var/lib";
      autoCreate = true;
      size = 10 * 1024; # MiB
    }
  ];

  system.stateVersion = "24.11";

  # Revert `trait:nix-config` setting
  nix.gc.automatic = lib.mkForce false;
  nix.optimise.automatic = lib.mkForce false;

  environment.systemPackages = [
    pkgs.lsof
    pkgs.inetutils
    pkgs.nftables
  ];
}
````

## File: homelab-subflake/traits/microvm-host/default.nix
````nix
/**
  MicroVM host infrastructure.

  Applied automatically to any host with at least one microvm (`microvms != []`).
  Sets up macvtap network interfaces and persistence filesystem mounts for each
  hosted microvm, driven entirely by `lib.homelab.getOwnMicrovms`.
*/
{ lib, inputs, ... }:
let
  microvms = lib.homelab.getOwnMicrovms;
in
{
  imports = [ inputs.microvm.nixosModules.host ];

  microvm.vms = lib.genAttrs microvms (microvmName: {
    config.microvm.shares = [
      {
        source = "/nix/store";
        mountPoint = "/nix/.ro-store";
        tag = "ro-store";
        proto = "virtiofs";
      }
    ];

    config.microvm.interfaces = [
      {
        type = "macvtap";
        id = "mvm-${microvmName}";
        mac = (lib.homelab.getHost microvmName).networks.lan.macAddr;
        macvtap = {
          link = "phy-lan";
          mode = "bridge";
        };
      }
    ];
  });

  fileSystems = lib.listToAttrs (
    microvms
    |> map (
      microvmName:
      lib.nameValuePair "/vms/${microvmName}" {
        device = "/dev/disk/by-label/VMs";
        options = [
          "defaults"
          "noatime"
          "subvol=${microvmName}"
        ];
        depends = [ "/vms" ];
      }
    )
  );
}
````

## File: homelab-subflake/traits/monitoring-source/collect-nixos-version.nix
````nix
{ pkgs, config, ... }:
{
  systemd = {
    services.prometheus-node-export-nixos-version = {
      description = "Get the value of nixos-version file for prometheus";
      script = ''
        cd $RUNTIME_DIRECTORY
        NIXOS_VERSION=$(cat /run/current-system/nixos-version)
        VERSION_PARSED=(''${NIXOS_VERSION//-/ })

        if [[ ''${VERSION_PARSED[1]} =~ "dirty" ]]; then
          NIXOS_VERSION_DIRTY=1
        else
          NIXOS_VERSION_DIRTY=0
        fi

        # Strings are not a type in prometheus, so passing this as a label
        echo "nixos_version_info{version=\"''${VERSION_PARSED[0]}\"} $NIXOS_VERSION_DIRTY" > nixos_version.prom
      '';
      path = [ pkgs.coreutils ];
      serviceConfig = {
        Type = "oneshot";
        RuntimeDirectory = [ "node_exporter_text" ];
        inherit (config.systemd.services.prometheus-node-exporter.serviceConfig) User;
        RuntimeDirectoryPreserve = true;
        # Hardening
        PrivateTmp = true;
        WorkingDirectory = "/tmp";
        DynamicUser = false;
        CapabilityBoundingSet = [ "" ];
        DeviceAllow = [ "" ];
        LockPersonality = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        PrivateDevices = true;
        ProtectClock = true;
        ProtectControlGroups = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        ProtectSystem = "strict";
        RemoveIPC = true;
        RestrictAddressFamilies = [ ];
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        SystemCallArchitectures = "native";
        UMask = "0077";
      };
    };

    timers.prometheus-node-export-nixos-version = {
      timerConfig = {
        OnCalendar = "*:0/1";
        Persistent = true;
      };
      wantedBy = [ "multi-user.target" ];
    };
  };
}
````

## File: homelab-subflake/traits/monitoring-source/default.nix
````nix
_: {
  imports = [
    ./service.nix
    ./firewall.nix
  ];
}
````

## File: homelab-subflake/traits/monitoring-source/firewall.nix
````nix
{
  lib,
  config,
  self,
  ...
}:
let
  inherit (lib.homelab) getServiceConfig;
  inherit (getServiceConfig "prometheus") exporters;
in
{
  imports = [
    (self.serviceModules.prometheus.srvLib.mkBackboneInnerFirewallRules {
      inherit lib;
      ports = exporters |> map (it: config.services.prometheus.exporters.${it}.port);
    })
  ];
}
````

## File: homelab-subflake/traits/monitoring-source/service.nix
````nix
{ lib, ... }:
let
  inherit (lib) pipe;
  inherit (lib.homelab) getServiceConfig;
  listenAddress = lib.homelab.getOwnIpInNetwork "backbone-inner";
  inherit (getServiceConfig "prometheus") exporters;
in
{
  imports = [ ./collect-nixos-version.nix ];

  # lib.mkMerge is effectively here:
  # lib.foldl lib.recursiveUpdate { }
  services.prometheus.exporters = lib.mkMerge [
    # Enable exporters with standard options
    #
    (pipe exporters [
      (map (x: {
        name = x;
        value = {
          enable = true;
          inherit listenAddress;
        };
      }))
      builtins.listToAttrs
    ])
    {
      node = {
        enabledCollectors = [
          "conntrack"
          "diskstats"
          "filesystem"
          "loadavg"
          "meminfo"
          "netdev"
          "netstat"
          "stat"
          "time"
          "systemd"
          "hwmon"
          "processes"
        ];
        extraFlags = [ "--collector.textfile.directory=/var/run/node_exporter_text" ];
      };
    }
    {
      systemd.extraFlags = [
        "--systemd.collector.enable-restart-count"
        "--systemd.collector.enable-ip-accounting"
      ];

    }
  ];

  # W/a to allow nvme devices access
  # Source: https://github.com/NixOS/nixpkgs/issues/210041 and linked PRs
  users.groups.rawio = { };
  services.udev.extraRules = ''
    SUBSYSTEM=="nvme", KERNEL=="nvme[0-9]*", GROUP="rawio"
  '';
  systemd.services."prometheus-smartctl-exporter".serviceConfig.SupplementaryGroups = [
    "disk"
    "rawio"
  ];
}
````

## File: homelab-subflake/traits/network-access-check/default.nix
````nix
{ pkgs, lib, ... }:
let
  inherit (lib.homelab) getServiceConfig getServiceFqdn;
  srvName = "network-access-check";
in
{
  systemd = {
    timers."ping-${srvName}" = {
      timerConfig = {
        OnCalendar = "*:0/5";
        Persistent = true;
      };
      wantedBy = [ "multi-user.target" ];
      # Maybe after network?
    };

    services."ping-${srvName}" = {
      description = "Reboot the outlet just in case";
      script =
        let
          curl = lib.getExe' pkgs.curl "curl";
          baseUrl = "https://${getServiceFqdn "healthchecks"}/ping/${(getServiceConfig "healthchecks").pingKey}";
        in
        # bash
        ''
          ${curl} \
                --fail `#fail fast on server errors` \
                --show-error --silent `#show error <=> it fails` \
                --max-time 10 \
                --retry 3 \
                "${baseUrl}/${srvName}?create=1"
        '';
    };
  };
}
````

## File: homelab-subflake/traits/network-general-setup/default.nix
````nix
{
  networking = {
    firewall.enable = true;
    nftables.enable = true;
    useNetworkd = true;
  };

  services.resolved.enable = true;
}
````

## File: homelab-subflake/traits/nix-config/default.nix
````nix
/** Configures nix-the-package manager. */
{
  inputs,
  self,
  lib,
  ...
}:
let
  inherit (inputs) nixpkgs nixpkgs-unstable;
in
{
  nix = {
    extraOptions = "experimental-features = nix-command flakes pipe-operators";

    # Higher download buffer size
    settings.download-buffer-size = 1048576000; # 1GB

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = lib.mkForce [ "weekly" ];
    };
    registry = {
      ns.flake = nixpkgs;
      nu.flake = nixpkgs-unstable;
    };
  };
  system.nixos.label = toString (
    self.shortRev or self.dirtyShortRev or self.lastModified or "unknown"
  );
}
````

## File: homelab-subflake/traits/ntp-config/default.nix
````nix
{ lib, ... }:
{
  time.timeZone = "America/Los_Angeles";
  # TODO: add some fallbacks or just rely on DHCP handing this out
  services.timesyncd.servers = lib.mkForce [ (lib.homelab.getServiceFqdn "ntp") ];
}
````

## File: homelab-subflake/traits/nut-client/default.nix
````nix
{ lib, config, ... }:
let
  inherit (lib.homelab) getServiceConfig getServiceIP;
  serverServiceName = "nut-server";
  serverCfg = getServiceConfig serverServiceName;
in
{
  power.ups = {
    enable = true;
    mode = "netclient"; # This will be overridden by `mkForce "netserver"` on the actual server

    upsmon.settings = {
      POWERDOWNFLAG = "/var/state/ups/killpower";
      NOTIFYFLAG = [
        [
          "ONLINE"
          "SYSLOG+WALL"
        ]
        [
          "ONBATT"
          "SYSLOG+WALL"
        ]
        [
          "LOWBATT"
          "SYSLOG+WALL"
        ]
        [
          "FSD"
          "SYSLOG+WALL"
        ]
        [
          "COMMOK"
          "EXEC"
        ]
        [
          "COMMBAD"
          "EXEC"
        ]
        [
          "SHUTDOWN"
          "SYSLOG+WALL"
        ]
        [
          "REPLBATT"
          "SYSLOG+WALL"
        ]
        [
          "NOCOMM"
          "SYSLOG+WALL+EXEC"
        ]
        [
          "NOPARENT"
          "SYSLOG+WALL"
        ]
      ];
    };
    upsmon.monitor.${serverCfg.UPS.model} = {
      user = if config.power.ups.mode == "netserver" then "primary-client" else "secondary-client";
      system = "${serverCfg.UPS.model}@${getServiceIP serverServiceName}:3493";
      passwordFile = config.age.secrets.nut-password.path;
      type =
        let
          match = {
            netserver = "primary";
            netclient = "secondary";
          };
        in
        match.${config.power.ups.mode};
    };

  };
  imports = [ ./upssched.nix ];
}
````

## File: homelab-subflake/traits/nut-client/upssched.nix
````nix
{ pkgs, lib, ... }:
let
  # How many seconds the system should wait for the server/UPS to come back
  systemGraceTime = "120";

  upssched-dispatch = pkgs.writeShellApplication {
    name = "upssched-dispatch";
    runtimeInputs = [ pkgs.logger ];
    text =
      # bash
      ''
        # This script should be called by upssched via the CMDSCRIPT directive.
        # The first argument passed to your CMDSCRIPT is the name of the timer from your AT lines or the value of EXECUTE directive
        case $1 in
          halt)
            logger -t upssched-dispatch "Got the halt event"
            # ${pkgs.systemd}/bin/shutdown now
            ;;
          *)
            logger -t upssched-dispatch "Unrecognized command: $1"
        		;;
        esac
      '';
  };
in
{
  power.ups.schedulerRules =
    lib.pipe
      # help:
      # https://networkupstools.org/docs/man/upssched.conf.html
      ''
        CMDSCRIPT ${lib.getExe upssched-dispatch}

        PIPEFN /var/state/ups/upssched.pipe
        LOCKFN /var/state/ups/upssched.lock
        # Syntax:
        # AT <notifyType> <upsName> <command>
        AT ONLINE * CANCEL-TIMER halt

        # If UPS is on battery -- start countdown timer and die
        AT ONBATT * START-TIMER halt ${systemGraceTime}
        # Just halt on low battery
        AT LOWBATT * EXECUTE halt
        # Halt on forced shutdown
        AT FSD * EXECUTE halt

        # Comms restored -- cancel the timer just in case
        AT COMMOK * CANCEL-TIMER halt
        # If communication to the server is lost -- start countdown timer and die
        AT COMMBAD * START-TIMER halt ${systemGraceTime}

        # Do nothing, this will be caught by monitoring
        AT REPLBATT * EXECUTE REPLBATT

        AT NOCOMM * START-TIMER halt ${systemGraceTime}

        # This will log the state as unknown command
        # I might want to catch this using monitoring
        AT NOPARENT * EXECUTE NOPARENT
        AT CAL * EXECUTE CAL
        AT NOTCAL * EXECUTE NOTCAL
        AT OFF * EXECUTE OFF
        AT NOTOFF * EXECUTE NOTOFF
        AT BYPASS * EXECUTE BYPASS
        AT NOTBYPASS * EXECUTE NOTBYPASS
        AT SUSPEND_STARTING * EXECUTE SUSPEND_STARTING
        AT SUSPEND_FINISHED * EXECUTE SUSPEND_FINISHED
      ''
      [
        (pkgs.writeText "upssched.conf")
        toString
      ];

}
````

## File: homelab-subflake/traits/root-env/default.nix
````nix
{ pkgs, ... }:
{
  users.users.root.shell = pkgs.zsh;
  environment.systemPackages = [ pkgs.git ];
}
````

## File: homelab-subflake/traits/ship-journald-logs/default.nix
````nix
{ lib, ... }:
{
  services.vector = {
    enable = true;

    settings = {
      sources.local-journald.type = "journald";

      sinks.log-concentrator = {
        type = "vector";
        inputs = [ "local-journald" ];
        # 6000 is not stable. I need to establish "endpoints" logic for the service manifests and update this
        address = "log-concentrator" |> lib.homelab.services.getInnerIP |> (it: "${it}:6000");
      };
    };

    journaldAccess = true;
  };
}
````

## File: homelab-subflake/traits/user-base/default.nix
````nix
{ inputs, pkgs-unstable, ... }:
{
  imports = [
    ./user.nix
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs pkgs-unstable; };
  };

  home-manager.users.spacecadet.imports = [
    ./general-home-manager.nix
    inputs.base.homeManagerModules.my-theme
  ];
}
````

## File: homelab-subflake/traits/user-base/general-home-manager.nix
````nix
{
  # WARN: `stateVersion` is set here. Changing it on a live system is
  # destructive. If a host needs a different value, add a per-host
  # override rather than changing this shared module.
  home.stateVersion = "22.11";
}
````

## File: homelab-subflake/traits/user-base/user.nix
````nix
{ pkgs, ... }:
{
  users.users.spacecadet = {
    isNormalUser = true;
    shell = pkgs.zsh; # NOTE: shell is configured further in a different trait
  };
}
````

## File: homelab-subflake/traits/user-environment/broot.nix
````nix
/**
  Client(read: desktop) only settings for `broot`.
*/
{ pkgs, ... }:
{
  programs.broot = {
    settings.preview_transformers = [
      {
        input_extensions = [ "pdf" ];
        output_extension = "png";
        mode = "image";
        command = [
          "${pkgs.mupdf-headless}/bin/mutool"
          "draw"
          "-w"
          "1000"
          "-o"
          "{output-path}"
          "{input-path}"
          "1"
        ];
      }
    ];
  };

}
````

## File: homelab-subflake/traits/user-environment/default.nix
````nix
/**
  Configures applications that are used by users. Separate from
  `../base-wayland-environment` to keep git history cleaner.

  Formerly `modules/applications` and `modules/home-manager`
*/
{ inputs, ... }:
{
  imports = [
    ./user.nix
    ./firejail.nix
    ./flatpak.nix
    ./virtualization.nix

    inputs.home-manager.nixosModules.default
  ];

  home-manager.users.spacecadet.imports = [
    ./general-home-manager.nix
    ./file-associations.nix
    ./media.nix
    ./fonts.nix
    ./swayimg.nix
    ./zathura.nix
    ./my-vim-config.nix
    ./broot.nix
    ./packages.nix # Dumping ground for one-off things
    ./ripgrep.nix

    inputs.base.homeManagerModules.my-theme
    inputs.base.homeManagerModules.git
    inputs.base.homeManagerModules.zsh
    inputs.base.homeManagerModules.kitty
    inputs.base.homeManagerModules.ideavim
    inputs.base.homeManagerModules.emacs
  ];
}
````

## File: homelab-subflake/traits/user-environment/file-associations.nix
````nix
/**
  Contains forced file associations with programs.
*/
let
  apps =
    let
      ff = [ "firefox.desktop" ];
      nvim = [ "nvim.desktop" ];
      swayimg = [ "swayimg.desktop" ];
    in
    {
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "text/html" = ff;
      "x-scheme-handler/http" = ff;
      "x-scheme-handler/https" = ff;
      "x-scheme-handler/chrome" = ff;
      "application/x-extension-htm" = ff;
      "application/x-extension-html" = ff;
      "application/x-extension-shtml" = ff;
      "application/x-extension-xhtml" = ff;
      "application/x-extension-xht" = ff;
      "application/rss+xml" = ff;
      "application/xhtml+xml" = nvim;
      "application/xhtml_xml" = nvim;
      "application/xml" = nvim;
      "image/gif" = swayimg;
      "image/jpeg" = swayimg;
      "image/png" = swayimg;
      "image/webp" = swayimg;
    };

in
{
  xdg.mimeApps = {
    enable = true;
    associations.added = apps;
    defaultApplications = apps;
  };
}
````

## File: homelab-subflake/traits/user-environment/firejail.nix
````nix
/**
  Creates firejailed desktop shortcuts.
*/
{ pkgs, lib, ... }:
{
  programs.firejail.enable = true;
  programs.firejail.wrappedBinaries = {
    thunderbird = {
      executable = "${lib.getBin pkgs.thunderbird}/bin/thunderbird";
      profile = "${pkgs.firejail}/etc/firejail/thunderbird.profile";
    };
    telegram-desktop = {
      executable = lib.getExe pkgs.telegram-desktop;
      profile = "${pkgs.firejail}/etc/firejail/telegram.profile";
    };
  };

  home-manager.users.spacecadet = _: {
    xdg.desktopEntries = {
      thunderbird = {
        # Taken from Thunderbird v 91.5.0
        name = "Thunderbird";
        comment = "🦊Firejailed";
        genericName = "Mail Client";
        exec = "thunderbird %U";
        icon = "thunderbird";
        terminal = false;
        mimeType = [
          "text/html"
          "text/xml"
          "application/xhtml+xml"
          "application/vnd.mozilla.xul+xml"
          "x-scheme-handler/http"
          "x-scheme-handler/https"
          "x-scheme-handler/ftp"
        ];
      };
      telegram = {
        # Taken from Telegram v 3.1.11
        name = "Telegram";
        comment = "🦊Firejailed";
        exec = "telegram-desktop -- %u";
        icon = "telegram";
        terminal = false;
        mimeType = [ "x-scheme-handler/tg" ];
      };
    };

    home.packages = [
      (pkgs.writeShellApplication {
        name = "firejail-kill-fuzzy";

        runtimeInputs = [
          pkgs.firejail # Better be "config.programs.firejail.package" but no such option as of Mar 11, 2026
          pkgs.fzf
          pkgs.gnused
          pkgs.awk
          pkgs.findutils # `xargs` here
        ];

        text = ''
          firejail --list | fzf | sed 's;:; ;g' | awk '{print $1}' | xargs kill -9
        '';
      })
    ];
  };
}
````

## File: homelab-subflake/traits/user-environment/flatpak.nix
````nix
/**
  TODO: there was a way to declare Flatpak apps?
*/
{
  services.flatpak.enable = true;
  xdg.portal.enable = true;
}
````

## File: homelab-subflake/traits/user-environment/fonts.nix
````nix
{ pkgs, ... }:
{
  fonts = {
    packages = builtins.attrValues {
      inherit (pkgs) roboto twitter-color-emoji font-awesome;
      inherit (pkgs.nerd-fonts) jetbrains-mono;
      inherit (pkgs) goldman good-timings russo-one; # My fonts
    };
    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Roboto" ];
        serif = [ "Roboto" ];
        emoji = [ "Twitter Color Emoji" ];
      };
    };
  };
}
````

## File: homelab-subflake/traits/user-environment/general-home-manager.nix
````nix
{
  home.stateVersion = "22.11";
  useGlobalPkgs = true;
  useUserPackages = true;
}
````

## File: homelab-subflake/traits/user-environment/my-vim-config.nix
````nix
{ inputs, ... }:
{
  imports = [
    inputs.base.homeManagerModules.vim
  ];
  programs.myNeovim = {
    enable = true;
    type = "max";
  };
}
````

## File: homelab-subflake/traits/user-environment/packages.nix
````nix
{ pkgs, ... }:
{
  home.packages = [
    pkgs.calibre
    pkgs.pavucontrol
    pkgs.blueman
    pkgs.libreoffice
    pkgs.brave
    pkgs.gthumb
  ];
}
````

## File: homelab-subflake/traits/user-environment/ripgrep.nix
````nix
{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--smart-case" # lowercase = ignorecase
      "--follow" # need symlinks often
    ];
  };
}
````

## File: homelab-subflake/traits/user-environment/user.nix
````nix
{ pkgs, ... }:
{
  users.users.spacecadet = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
````

## File: homelab-subflake/traits/user-environment/virtualization.nix
````nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ virt-manager ];

  programs.dconf.enable = true;

  users.users.spacecadet.extraGroups = [
    "libvirtd"
    "podman"
  ];

  virtualisation = {
    libvirtd.enable = true;

    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true; # Required for containers under `podman-compose` to be able to talk to each other.
    };
  };
}
````

## File: homelab-subflake/traits/user-environment/zathura.nix
````nix
{
  programs.zathura = {
    enable = true;
    options = {
      # Allows `zathura` to use system clipboard
      selection-clipboard = "clipboard";
      database = "sqlite";
    };
  };
}
````

## File: homelab-subflake/traits/user-scratch/default.nix
````nix
/**
  Temporary home for one-off packages before they earn a proper trait.
*/
{ pkgs, inputs, ... }:
{
  imports = [ inputs.xremap-flake.nixosModules.default ];

  services.xremap.enable = true;
  services.xremap.config.modmap = [
    {
      name = "Global";
      remap = {
        "CapsLock" = "Esc";
      }; # globally remap CapsLock to Esc
    }
  ];
  home-manager.users.spacecadet.home.packages = with pkgs; [
    pavucontrol
    blueman
  ];
}
````

## File: homelab-subflake/traits/user-shell/broot.nix
````nix
{ pkgs, ... }:
{
  programs.broot = {
    settings.preview_transformers = [
      {
        input_extensions = [ "pdf" ];
        output_extension = "png";
        mode = "image";
        command = [
          "${pkgs.mupdf-headless}/bin/mutool"
          "draw"
          "-w"
          "1000"
          "-o"
          "{output-path}"
          "{input-path}"
          "1"
        ];
      }
    ];
  };

}
````

## File: homelab-subflake/traits/user-shell/default.nix
````nix
{ inputs, ... }:
{
  home-manager.users.spacecadet.imports = [
    ./broot.nix
    ./ripgrep.nix
    ./gh.nix
    inputs.base.homeManagerModules.git
    inputs.base.homeManagerModules.zsh
  ];
}
````

## File: homelab-subflake/traits/user-shell/gh.nix
````nix
{
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}
````

## File: homelab-subflake/traits/user-shell/ripgrep.nix
````nix
{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--smart-case" # lowercase = ignorecase
      "--follow" # need symlinks often
    ];
  };
}
````

## File: homelab-subflake/traits/wg-ddns/default.nix
````nix
{ lib, config, ... }:
{

  services.cloudflare-dyndns = {
    enable = true;
    inherit (lib.homelab.traits.getSettings "wg-ddns") domains;
    apiTokenFile = config.age.secrets.cfApifile.path;
  };
  # Hardening
  systemd.services.cloudflare-dyndns = {
    serviceConfig = {
      # It's a simple one-shot network service, nothing fancy
      CapabilityBoundingSet =
        "~"
        + builtins.concatStringsSep " " [
          # CapabilityBoundingSet = [
          "CAP_SYS_TIME" # Service processes may change the system clock
          "CAP_SYS_PACCT" # Service may use acct()
          "CAP_KILL" # Service may send UNIX signals to arbitrary processes
          "CAP_WAKE_ALARM" # Service may program timers that wake up the system
          "CAP_DAC_OVERRIDE" # Service may override UNIX file/IPC permission checks
          "CAP_DAC_READ_SEARCH"
          "CAP_FOWNER" # Service may override UNIX file/IPC permission checks
          "CAP_IPC_OWNER" # Service may override UNIX file/IPC permission checks
          "CAP_LINUX_IMMUTABLE" # Service may mark files immutable
          "CAP_IPC_LOCK" # Service may lock memory into RAM
          "CAP_SYS_MODULE" # Service may load kernel modules
          "CAP_SYS_TTY_CONFIG" # Service may issue vhangup()
          "CAP_SYS_BOOT" # Service may issue reboot()
          "CAP_SYS_CHROOT" # Service may issue chroot()
          "CAP_BLOCK_SUSPEND" # Service may establish wake locks
          "CAP_LEASE" # Service may create file leases
          "CAP_MKNOD" # Service may create device nodes
          "CAP_CHOWN" # Service may change file ownership/access mode/capabilities unrestricted
          "CAP_FSETID" # Service may change file ownership/access mode/capabilities unrestricted
          "CAP_SETFCAP" # Service may change file ownership/access mode/capabilities unrestricted
          "CAP_SETUID" # Service may change UID
          "CAP_SETGID" # Service may change GID identities/capabilities
          "CAP_SETPCAP" # Service may change capabilities
          "CAP_MAC_ADMIN" # Service may adjust SMACK MAC
          "CAP_MAC_OVERRIDE"
          "CAP_SYS_RAWIO" # Service has raw I/O access
          "CAP_SYS_PTRACE" # Service has ptrace() debugging abilities
          "CAP_SYS_NICE" # Service has privileges to change resource use parameters
          "CAP_SYS_RESOURCE" # Service has privileges to change resource use parameters
          "CAP_NET_ADMIN" # Service has network configuration privileges
          "CAP_NET_BIND_SERVICE" # Service has elevated networking privileges
          "CAP_NET_BROADCAST" # Service has elevated networking privileges
          "CAP_NET_RAW" # Service has elevated networking privileges
          "CAP_AUDIT_CONTROL" # Service has audit subsystem access
          "CAP_AUDIT_READ"
          "CAP_AUDIT_WRITE"
          "CAP_SYS_ADMIN" # Service has administrator privileges
          "CAP_SYSLOG" # Service has access to kernel logging
        ];
      ProtectClock = true;
      ProtectKernelLogs = true;
      ProtectKernelModules = true;
      RestrictNamespaces =
        "~"
        + builtins.concatStringsSep " " [
          "user"
          "pid"
          "net"
          "uts"
          "mnt"
          "cgroup"
          "ipc"
        ];
      ProtectHostname = true;
      ProtectKernelTunables = true;
      ProtectHome = true;
      ProtectControlGroups = true;
      ProtectProc = true;
      PrivateUsers = true;
    };
  };
}
````

## File: homelab-subflake/flake-lib.nix
````nix
/**
  Functions that operate on flake itself.
*/
{ lib, self, ... }:
let
  inherit (self.inputs) data-flake nixpkgs;
in
rec {
  /**
    Extends `lib` with `lib.homelab` bound to a specific hostname and
    `lib.localLib`. Used for both regular hosts and microvm guests.
  */
  mkExtendedLib =
    hostName:
    lib.extend (
      lib.composeManyExtensions [
        /**
          Adds `lib.homelab.<functions>`.

          `_mkOwnFuncs` generates functions like `getOwnIPInNetwork`
        */
        (_: _: {
          homelab =
            builtins.removeAttrs data-flake.lib.homelab [ "_mkOwnFuncs" ]
            // data-flake.lib.homelab._mkOwnFuncs hostName
            // {
              inherit getManifest getManifests getSrvLib;
            };
        })
        /**
          Adds my custom functions.
          TODO: Review callsites, probably not needed as much
        */
        (_: _: { localLib = import ./lib/local-lib.nix { inherit lib; }; })
      ]
    );

  /**
    Resolves all NixOS modules for a given host: services, traits, secrets,
    base flake modules, and private modules. Used by both `mkHost` (for real
    hosts) and `mkMicroVMHostModule` (for inline microvm guest configs).

    Returns an attrset with:
      - `extendedLib`: lib extended with homelab + localLib bound to hostName
      - `hostData`: raw host data from data-flake
      - `pkgs`: nixpkgs instance with overlays applied
      - `modules`: all resolved NixOS modules (base + services + traits + private + secrets)
      - `specialArgs`: standard specialArgs for nixosSystem / microvm.vms
      - `dbg`: trace helper (no-ops when debug = false)
  */
  mkHostConfig =
    {
      hostName,
      debug ? false,
    }:
    let
      inherit (self) inputs;
      inherit (builtins) trace;

      dbg = label: val: if debug then trace "[mkHost:${hostName}] ${label}" val else val;

      hostData = data-flake.data.hosts.all.${hostName};

      extendedLib = mkExtendedLib hostName;

      resolveService =
        serviceName:
        let
          serviceData = data-flake.data.services.all.${serviceName};
          moduleName = serviceData.moduleName or null;
          hasPublic =
            moduleName != null
            && !serviceData.sideEffectOnly
            && builtins.pathExists (./services + "/${moduleName}");
          hasPrivate =
            moduleName != null
            && !serviceData.sideEffectOnly
            && inputs.private-modules.serviceModules ? ${moduleName};
          hasMerged =
            moduleName != null && !serviceData.sideEffectOnly && self.serviceModules ? ${moduleName};
        in
        if moduleName == null || serviceData.sideEffectOnly then
          [ ]
          |> dbg "service ${serviceName} (moduleName=${toString moduleName}) is a stub or has no moduleName"
        else
          let
            loggedPublic =
              if hasPublic then dbg "service ${serviceName} -> ${moduleName} (public)" hasPublic else hasPublic;
            loggedPrivate =
              if hasPrivate then
                dbg "service ${serviceName} -> ${moduleName} (private)" hasPrivate
              else
                hasPrivate;

            allModules =
              if hasMerged then
                builtins.seq loggedPublic (builtins.seq loggedPrivate self.serviceModules.${moduleName}.default)
              else
                [ ];
          in
          lib.warnIf (lib.length allModules == 0)
            "service: ${serviceName} (moduleName: ${moduleName}) could not be resolved to an implementation!"
            allModules;

      resolveTrait =
        traitName:
        let
          traitData = data-flake.data.traits.all.${traitName};
          fromPublic = self.traitModules ? ${traitName};
          fromPrivate = inputs.private-modules.traitModules ? ${traitName};
        in
        if traitData.sideEffectOnly then
          [ ] |> dbg "trait ${traitName} is a stub"
        else
          (
            (
              lib.optional fromPublic (dbg "trait ${traitName} (public)" self.traitModules.${traitName})
              ++ lib.optional fromPrivate (
                dbg "trait ${traitName} (private)" inputs.private-modules.traitModules.${traitName}
              )
            )
            |> (
              it:
              lib.warnIf (lib.length it == 0) "trait: ${traitName} could not be resolved to an implementation!" it
            )
          );

      serviceModules = hostData.servicesAt |> lib.concatMap resolveService;
      traitModules = (hostData.traitsAt or [ ]) |> lib.concatMap resolveTrait;

      secretModules =
        let
          has = inputs.private-modules.secretModules ? ${hostName};
        in
        lib.optional has (dbg "secrets (private-modules)" inputs.private-modules.secretModules.${hostName});

      baseFlakeModules = [
        inputs.base.nixosModules.zsh
        inputs.base.nixosModules.tmux
        inputs.base.nixosModules.vim
        inputs.base.nixosModules.my-theme
        inputs.base.nixosModules.apprise-api # TODO: just import all once `de` is migrated
        inputs.base.nixosModules.prometheus-ssl-exporter
        inputs.base.nixosModules.frigate-notify
        inputs.base.nixosModules.fava
        inputs.base.nixosModules.prusa-exporter
        { programs.myNeovim.enable = true; }
      ];

      # These modules are side-effect free by convention
      privateModules = inputs.private-modules.nixosModules |> builtins.attrValues;

      pkgs = import nixpkgs {
        inherit (hostData) system;
        config.allowUnfree = true;
        config.nvidia.acceptLicense = true;
        overlays = [
          inputs.base.overlays.default
          inputs.private-modules.overlays.default
        ];
      };
    in
    {
      inherit
        extendedLib
        hostData
        pkgs
        dbg
        ;
      modules = baseFlakeModules ++ serviceModules ++ traitModules ++ privateModules ++ secretModules;
      specialArgs = {
        inherit inputs self;
        pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${hostData.system};
      };
    };

  mkHost =
    {
      hostName,
      extraModules ? [ ],
      debug ? false,
    }:
    let
      cfg = mkHostConfig { inherit hostName debug; };
      hostedMicrovms = data-flake.lib.homelab.getMicrovms hostName;
      microvmHostModules = hostedMicrovms |> map mkMicroVMHostModule;
    in
    cfg.dbg "system=${cfg.hostData.system}" lib.nixosSystem {
      inherit (cfg.hostData) system;
      lib = cfg.extendedLib;
      inherit (cfg) pkgs specialArgs;
      modules = [
        { networking.hostName = hostName; }
      ]
      ++ lib.optionals (builtins.pathExists (./hosts + "/${hostName}/configuration")) [
        (./hosts + "/${hostName}/configuration")
      ]
      ++ cfg.modules
      ++ microvmHostModules
      ++ extraModules;
    };

  /**
    Produces a NixOS module that wires one microvm's guest config into the host.

    The host-side infrastructure (macvtap, filesystems) is handled by the
    `microvm-host` trait. This function only sets specialArgs and config.imports
    for the guest, using the same service/trait/secret resolution as mkHost.
  */
  mkMicroVMHostModule =
    microvmName:
    let
      cfg = mkHostConfig { hostName = microvmName; };
      microvmMem = cfg.hostData.settings.mem or null;
    in
    {
      microvm.vms.${microvmName} = {
        specialArgs = cfg.specialArgs // {
          lib = cfg.extendedLib;
        };
        config.imports =
          cfg.modules ++ lib.optionals (microvmMem != null) [ { microvm.mem = microvmMem; } ];
      };
    };

  /**
    Returns attrset in format expected by `deploy-rs`.
  */
  mkDeployRsNode =
    { nodeName, system }:
    let
      inherit (self) inputs;
      pkgs = import inputs.nixpkgs { inherit system; };
      deployPkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          inputs.deploy-rs.overlays.default
          (_: super: {
            deploy-rs = {
              inherit (pkgs) deploy-rs;
              inherit (super.deploy-rs) lib;
            };
          })
        ];
      };
    in
    {
      hostname = "${nodeName}.${inputs.data-flake.data.networks.mgmt.domain}";
      sshUser = "root";
      profiles.system = {
        user = "root";
        path = deployPkgs.deploy-rs.lib.activate.nixos self.nixosConfigurations.${nodeName};
      };
    };

  /**
    Discovers service/trait modules and returns unevaluated modules.
    For services: returns NixOS modules that will be merged later.
    For traits: returns modules directly.
  */
  discoverModules =
    dir: format:
    let
      entries = builtins.readDir dir;
      fileMarker = {
        service = "manifest.nix";
        trait = "default.nix";
      };
    in
    builtins.foldl' (
      acc: name:
      if
        entries.${name} == "directory" && builtins.pathExists (dir + "/${name}/${fileMarker.${format}}")
      then
        acc // { ${name} = import (dir + "/${name}/${fileMarker.${format}}"); }
      else
        acc
    ) { } (builtins.attrNames entries);

  /**
    Returns the manifest for a given service.

    This allows service modules to access their own manifest data, making it
    easier to propagate endpoints and other configuration from the manifest
    into the service implementation.

    Example:
    ```nix
    { self, ... }:
    let
      manifest = self.lib.getManifest "web-receipt-printer";
    in
    {
      services.web-receipt-printer = {
        enable = true;
        port = manifest.endpoints.web.port;
      };
    }
    ```
  */
  getManifest = serviceName: self.serviceModules.${serviceName};

  /**
    Returns all manifests. Easier to pass around as `lib` extension instead of `self`.
  */
  getManifests = self.serviceModules;

  /**
    Shortcut to get a service's `srvLib`
  */
  getSrvLib = serviceName: serviceName |> getManifest |> builtins.getAttr "srvLib";

  /**
    Pass `homelab` through
  */
  homelab = builtins.removeAttrs data-flake.lib.homelab [ "_mkOwnFuncs" ];

}
````

## File: homelab-subflake/flake.nix
````nix
{
  description = "A very basic flake";

  inputs = {
    base.url = "..";
    nixpkgs.follows = "base/nixpkgs";
    nixpkgs-unstable.follows = "base/nixpkgs-unstable";
    flake-parts.follows = "base/flake-parts";

    data-flake.url = "git+ssh://gitea@gitea.srv.vtimofeenko.com/spacecadet/private-data-flake.git"; # REMOTE_SRC
    # data-flake.url = "path:///home/spacecadet/code/private-data-flake"; # LOCAL_SRC

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    impermanence.url = "github:nix-community/impermanence";
    deploy-rs.follows = "base/deploy-rs";
    devshell.follows = "base/devshell";

    wg-namespace-flake = {
      url = "github:VTimofeenko/wg-namespace-flake";
    };

    microvm = {
      url = "github:astro/microvm.nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    private-modules = {
      url = "git+ssh://gitea@gitea.srv.vtimofeenko.com/spacecadet/private-modules.git"; # REMOTE_SRC
      # url = "path:///home/spacecadet/code/private-modules"; # LOCAL_SRC
      inputs.data-flake.follows = "data-flake";
    };

    docspell-flake = {
      url = "github:eikek/docspell?ref=v0.43.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    miniflux-yt-helper = {
      url = "git+ssh://gitea@gitea.srv.vtimofeenko.com/spacecadet/miniflux-yt-helper.git";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs-unstable";
      };
    };

    fava-helper = {
      url = "git+ssh://gitea@gitea.srv.vtimofeenko.com/spacecadet/fava-helper.git";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs-unstable";
      };
    };

    xremap-flake = {
      url = "github:xremap/nix-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        crane.follows = "base/crane";
      };
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, self, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, ... }:
      let
        inherit (inputs.base.lib) flakeModuleLoader;
        inherit (inputs.nixpkgs) lib;
      in
      {
        imports = [
          inputs.devshell.flakeModule
          inputs.base.flake-modules.devShellCmds
        ]
        ++ (flakeModuleLoader {
          dir = ./flake-modules;
          inherit self withSystem lib;
          debug = true;
        });
        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];
        perSystem =
          { ... }:
          {
            devshellCmds.deployment = {
              enable = true;
              useDeployRs = true;
              localDeployment = true;
              desktopNotifications = true;
            };

            devshells.default = import ./devshell;
          };
        flake =
          let
            # Microvms: built as nixosConfigurations for inspection, but not
            # deployed via deploy-rs (they are managed through their parent host).
            microVMs = inputs.data-flake.lib.homelab.hosts.getAllMicroVMs |> builtins.attrNames;
            realHosts =
              inputs.data-flake.lib.homelab.hosts.getManaged |> builtins.attrNames |> lib.subtractLists microVMs;

            # Merge library
            mergeLib = import ./lib/merge-manifests.nix {
              lib = lib.extend (
                lib.composeManyExtensions [
                  # There is no "Own" here, but this is useful so a `lib` with `homelab` functions is passed to the `serviceManifests`
                  (_: _: {
                    homelab = inputs.data-flake.lib.homelab |> lib.flip builtins.removeAttrs [ "_mkOwnFuncs" ];
                  })
                  # Add localLib so manifests can use it (e.g., `srv-lib.nix`)
                  (_: _: { localLib = import ./lib/local-lib.nix { inherit lib; }; })
                ]
              );
            };

            # Discover public manifests (unevaluated NixOS modules)
            publicServices = self.lib.discoverModules ./services "service";

            # Get private manifests (unevaluated NixOS modules)
            privateServices = inputs.private-modules.serviceModules or { };

            # Merge and evaluate to produce final manifests with auto-assembled `.default`
            mergedServices = mergeLib.mergeServiceManifests publicServices privateServices;
          in
          {
            nixosConfigurations =
              lib.genAttrs (realHosts ++ microVMs) (
                hostName:
                self.lib.mkHost {
                  inherit hostName;
                  debug = true;
                }
              )
              // {
                # Test VMs with custom data
                dns-test-vm = import ./tests/dns-test-vm.nix { inherit inputs self lib; };
              };

            deploy.nodes = lib.genAttrs realHosts (
              nodeName:
              self.lib.mkDeployRsNode {
                inherit nodeName;
                system = inputs.data-flake.data.hosts.all.${nodeName}.system;
              }
            );

            # Export merged, evaluated manifests
            serviceModules = mergedServices;

            traitModules = self.lib.discoverModules ./traits "trait";

            lib = import ./flake-lib.nix { inherit lib self; };

            # Passthrough data-flake data for easy discovery
            data = inputs.data-flake.data;
          };
      }
    );
}
````

## File: homelab-subflake/README.md
````markdown
This subflake's main goal is to produce deployable machine configurations for my
homelab.

# Terminology

- **HOST**: a physical or virtual machine running one ore mote **SERVICE**s.
- **SERVICE**: a deployed homelab service with a manifest. Has side effects (DNS
  entries, dashboard links, monitoring targets, etc.). Mapped to hosts via
  data-flake `servicesAt`.
- **TRAIT**: a NixOS configuration module applied to hosts. Mapped to
  hosts via data-flake `traitsAt`, is effectful
- **MODULE**: a NixOS configuration module that only provides an implementation
  and has no effect on its own (exactly like standard NixOS module)

# Architecture

Four flakes:

1. `data-flake`: contains data on hosts services and networks, produces raw data and
   internal `lib.homelab` functions. Private to mask existence and mapping of
   services to hosts.

2. `private-modules`: contains implementations of TRAITs SERVICEs and MODULEs that
   should not be public for whatever reason

3. `base`: the top-level flake of this repository. Contains easily reusable
   modules with few dependencies

4. `homelab`: this flake. Gathers outputs from other flakes, produces NixOS and
   other configurations
````
