{ config, pkgs, ... }:
{
  programs.gh = {
    enable = true; 

    settings.editor = "nvim";
    settings.git_protocoll = "ssh";
  };
}
