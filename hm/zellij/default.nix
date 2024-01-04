{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      on_force_close = "quit";
      default_layout = "zen";
      theme = "gruvbox";
      session_serialization = false;
      pane_frames = false;
    };
  };

  xdg.configFile."zellij/layouts/zen.kdl".source = ./zen-layout.kdl;
}
