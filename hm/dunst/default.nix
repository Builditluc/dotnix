{ config, pkgs, ... }:
{
  services.dunst.enable = true;
  services.dunst.settings.global = {
    follows = "keyboard";
    notification_limit = 3;
  };
}
