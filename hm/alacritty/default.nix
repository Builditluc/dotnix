{ config, pkgs, ... }:
{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    cursor.shape = "block";
    shell.program = "bash";
    window.decorations = "none";

    font.normal = { family = "FiraCode Nerd Font Mono"; };
    font.bold = { family = "FiraCode Nerd Font Mono"; style = "bold"; };
    font.italic = { family = "FiraCode Nerd Font Mono"; style = "italic"; };
    font.bold_italic = { family = "FiraCode Nerd Font Mono"; style = "bold italic"; };
    font.size = 11;

    colors.primary = {
      background = "0x1d2021";
      foreground = "0xebdbb2";
    };

    colors.normal = {
      black = "0x282828";
      red = "0xcc241d";
      green = "0x98971a";
      yellow = "0xd79921";
      blue = "0x458588";
      magenta = "0xb16286";
      cyan = "0x689d6a";
      white = "0xa89984";
    };

    colors.bright = {
      black = "0x928374";
      red = "0xfb4934";
      green = "0xb8bb26";
      yellow = "0xfabd2f";
      blue = "0x83a598";
      magenta = "0xd3869b";
      cyan = "0x8ec07c";
      white = "0xebdbb2";
    };
  };
}
