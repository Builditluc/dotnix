{ config, pkgs, ...}:
{
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
