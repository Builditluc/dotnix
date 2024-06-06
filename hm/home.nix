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
    ./btop

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
    typst
    typst-live
    tree
    mpv
    enpass
    prismlauncher
    calibre
    tor-browser
    obsidian
    libreoffice
    librewolf
    lutris
    strawberry

    bitwarden
    rcu
  ];
}
