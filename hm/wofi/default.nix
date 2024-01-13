{ config, pkgs, ... }:
{
  programs.wofi.enable = true;
  programs.wofi.settings = {
    width = "50%";
    height = "40%";
    show = "drun";
    insensitive = true;

    key_up = "Ctrl+k";
    key_down = "Ctrl+j";
    key_left = "Ctrl+h";
    key_right = "Ctrl+l";
  };
}
