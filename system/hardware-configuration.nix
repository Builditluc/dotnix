# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];

  boot.kernelParams = [ "i915.force_probe=a720" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = with config.boot.kernelPackages; [ turbostat ];
  
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7d63fe70-703e-4be0-a6d5-3afee365558b";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-e3210aa5-99fc-421c-bb62-41e291148b0e".device = "/dev/disk/by-uuid/e3210aa5-99fc-421c-bb62-41e291148b0e";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/6D4D-EFB6";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/0de8b5ca-d598-420c-a672-3695ab8f948a"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp170s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
