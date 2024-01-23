{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./nixvim
    ./git
    ./direnv
    ./alacritty
    ./bash
    ./qutebrowser

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
    obsidian

    bitwarden
    blightmud
  ];
}
