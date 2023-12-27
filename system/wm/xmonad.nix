{ config, lib, pkgs, ... }:
{
  services = {
    upower.enable = true;
    dbus.enable = true;

    xserver = {
      enable = true;
      layout = "us";

      libinput.enable = true;

      displayManager.defaultSession = "none+xmonad";

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };

      xkbOptions = "caps:ctrl_modifier";
    };

    blueman.enable = true;
  };

  hardware.bluetooth.enable = true;
  systemd.services.upower.enable = true;
}
