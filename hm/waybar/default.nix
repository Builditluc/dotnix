{ config, pkgs, ... }:
{
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;

      modules-left = [ "hyprland/workspaces" ];
      modules-right = [ "tray" "pulseaudio" "battery" "clock" ];

      "clock" = {
        format = "{:%H:%M %d/%m/%Y}";
        interval = 60;
      };

      "battery" = {
        full-at = 80;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = "{icon} {capacity}%";
        format-full = "󱐋{icon} Charged";
        format-icons = [ "" "" "" "" "" ];
        tooltip = false;
      };

      "pulseaudio" = {
        scroll-step = 10;
        on-click = "pavucontrol";
        format = " {icon} {volume}% {format_source}";
        format-muted = " {format_source}";
        format-source = "";
        format-source-muted = "";
        format-bluetooth = "󰂯 {icon} {volume}% {format_source}";
        format-bluetooth-muted = " 󰂯 {icon} {format_source}";
      };
    };
  };
  programs.waybar.style = (builtins.readFile ./style.css);
  programs.waybar.systemd.enable = true;
}
