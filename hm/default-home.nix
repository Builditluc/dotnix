{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;
  home.stateVersion = "21.11";

  home.packages = with pkgs; [
    # cli tools
    gh
    bat
    wget
    git
    lazygit

    # nix stuff
    update-nix-fetchgit

    # docker stuff
    docker
    docker-compose

    # video/audio stuff
    yt-dlp    
    ffmpeg
    mpv
  ];
}
