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
    ./xdg

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
    ffmpeg
    yt-dlp
    obs-studio
    unstable.codecrafters-cli

    unstable.bitwarden
    rcu
    lmstudio
    syncthing
    syncthingtray

    thunderbird gpgme
    ferdium
    zathura
  ];
}
