{ config, pkgs, ...}:
{
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.displayManager.sddm.autoNumlock = true;

  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "builditluc";

  environment.systemPackages = with pkgs; [ where-is-my-sddm-theme ];
  services.displayManager.sddm.theme = "where-is-my-sddm-theme";

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
