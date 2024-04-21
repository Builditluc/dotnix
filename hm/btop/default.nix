{ config, pkgs, ... }:
{
  programs.btop.enable = true;
  programs.btop.settings = {
    color_theme = "gruvbox_dark";
    theme_background = false;
    update_ms = 1000;
  };
}
