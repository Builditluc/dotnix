{ pkgs, ... }: {
  config = {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Enable Auto-Login
    services.xserver.displayManager.autoLogin.enable = true;
    services.xserver.displayManager.autoLogin.user = "builditluc";

    # Fix for Auto-Login (see https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229)
    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;


    # Remove bloat
    services.gnome.core-utilities.enable = false;
    services.gnome.core-developer-tools.enable = false;

    environment.gnome.excludePackages = with pkgs; [ gnome-tour ];

    services.xserver.excludePackages = with pkgs; [ xterm ];

    programs.dconf.enable = true;

    # Setup Nautilus
    environment.systemPackages = [ pkgs.gnome.nautilus pkgs.gjs pkgs.evince ];
    services.gnome.sushi.enable = true;
 };
}
