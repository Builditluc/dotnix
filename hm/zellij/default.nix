{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      on_force_close = "quit";
      default_layout = "compact";
      default_mode = "locked";
    };
  };
}
