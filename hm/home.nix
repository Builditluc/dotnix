{ inputs, config, pkgs, ... }:
{
  imports = [
    ./nixvim
    ./git
    ./direnv
    ./alacritty
    ./bash

    ./waybar
    ./wofi
    ./dunst

    ./hyprpaper
    ./hyprland
  ];

  #home.username = "buildituc";
  #home.homeDirectory = "/home/builditluc";
  
  home.stateVersion = "23.05";
  
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    librewolf
    btop
    typst
    typst-live
    tree
    mpv
    enpass
    prismlauncher
    peaclock
    calibre
    tor-browser

    bitwarden
  ];
}
