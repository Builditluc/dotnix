{ config, pkgs, ... }:
{
  fonts = {
    enableFontDir = true;
    fonts = [
      pkgs.nerdfonts # this takes sooooooooooo long to build
    ];
  };
}
