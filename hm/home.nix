{ inputs, config, pkgs, ... }:
{
  imports = [
    ./nixvim
    ./gnome
    ./git
    ./direnv
    ./alacritty
    ./zellij
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
  ];
}
