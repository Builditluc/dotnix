{ config, pkgs, ... }:
{ 
  home.packages = with pkgs; [
    brightnessctl
    playerctl
    pamixer
    pavucontrol
  ];

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "alacritty";
    exec-once = [
      "hyprpaper"
      "dunst"
    ];
    bindl = [
      ", switch:Lid Switch, exec,  ~/dotnix/hm/hyprland/lid-switch.sh"
    ];
    bind = [
      "$mod,        Return, exec, alacritty"
      "$mod_SHIFT,  Return, exec, wofi"
      "$mod,        b,      exec, librewolf"
      "$mod_SHIFT,  c,      killactive"
      "$mod_SHIFT,  r,      forcerendererreload"
      "$mod_SHIFT,  q,      exit"
      "$mod,        Space,  fullscreen, 1"

      "$mod, h, movefocus, l"
      "$mod, j, movefocus, d"
      "$mod, k, movefocus, u"
      "$mod, l, movefocus, r"

      "$mod_SHIFT, h, movewindow, l"
      "$mod_SHIFT, j, movewindow, d"
      "$mod_SHIFT, k, movewindow, u"
      "$mod_SHIFT, l, movewindow, r"

      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      "$mod_SHIFT, 1, movetoworkspace, 1"
      "$mod_SHIFT, 2, movetoworkspace, 2"
      "$mod_SHIFT, 3, movetoworkspace, 3"
      "$mod_SHIFT, 4, movetoworkspace, 4"
      "$mod_SHIFT, 5, movetoworkspace, 5"
      "$mod_SHIFT, 6, movetoworkspace, 6"
      "$mod_SHIFT, 7, movetoworkspace, 7"
      "$mod_SHIFT, 8, movetoworkspace, 8"
      "$mod_SHIFT, 9, movetoworkspace, 9"
      "$mod_SHIFT, 0, movetoworkspace, 10"

      "$mod, f, togglefloating"

      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up,   workspace, e-1"
      ];
    binde = [
      ", XF86AudioMute,        exec, ~/dotnix/hm/hyprland/change-volume.sh mute"
      ", XF86AudioLowerVolume, exec, ~/dotnix/hm/hyprland/change-volume.sh down 10"
      ", XF86AudioRaiseVolume, exec, ~/dotnix/hm/hyprland/change-volume.sh up   10"

      ", XF86MonBrightnessDown, exec, ~/dotnix/hm/hyprland/change-brightness.sh down 10"
      ", XF86MonBrightnessUp,   exec, ~/dotnix/hm/hyprland/change-brightness.sh up   10"

      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"
    ];
    monitor = [
      ",      preferred, auto, 1"
      "eDP-1, preferred, auto, 1"
      "DP-3,  preferred, auto, 1"
    ];
    input.touchpad.natural_scroll = true;
    input.touchpad.clickfinger_behavior = true;
    input.kb_options = "compose:caps";
  };
}
