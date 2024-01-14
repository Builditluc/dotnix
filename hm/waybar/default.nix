{ config, pkgs, ... }:
{
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [ "wireplumber" "battery" "clock" ];

      "hyprland/window" = {
        max-length = 200;
        separate-outputs = true;
      };

      "hyprland/workspaces" = {
        persistent-workspaces = {
          "*" = 5;
        };
      };

      "clock" = {
        interval = 60;
        format = "{:%H:%M %d/%m/%Y}";
      };

      "battery" = {
        full-at = 80;
        states = {
          warning = 20;
          critical = 10;
        };
        format = "{icon} {capacity}%";
        format-charging = "{icon} {capacity}% - {time}";
        format-full = "󱐋{icon} Charged";
        format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        tooltip = false;
      };
    };
  };
  programs.waybar.style = (builtins.readFile ./style.css);
  programs.waybar.systemd.enable = true;
}
