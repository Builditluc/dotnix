{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ pkgs.hyprpaper ];
  xdg.configFile."hypr/hyprpaper.conf".source = ./hyprpaper.conf;
}
