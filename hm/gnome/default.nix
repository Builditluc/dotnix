{ config, pkgs, ... }: 
{
  imports = [ ./dconf.nix ];

  home.packages = with pkgs.gnomeExtensions; [
    dash-to-panel
    gtk4-desktop-icons-ng-ding
    gtile
    vitals
  ] ++ [
    pkgs.plasma5Packages.plasma-thunderbolt
  ];
}
