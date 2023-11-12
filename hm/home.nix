{ inputs, config, pkgs, ... }:
{
  imports = [
    ./programs.nix
  ];

  #home.username = "buildituc";
  #home.homeDirectory = "/home/builditluc";
  
  home.stateVersion = "23.05";
  
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    librewolf
    kate
    btop
    typst
    typst-live
    # Thunderbolt System Settings Panel for Plasma
    plasma5Packages.plasma-thunderbolt
    enpass
    prismlauncher
    peaclock
  ];
}
