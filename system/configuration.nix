{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  services.logind.lidSwitch = "suspend-then-hibernate";
  services.logind.lidSwitchDocked = "ignore";

  services.logind.extraConfig = ''
    LidSwitchIgnoreInhibited=yes
  '';

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=20m
  '';

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 20;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-8f57f477-cd2b-400d-9bb6-c2191628ceaa".device = "/dev/disk/by-uuid/8f57f477-cd2b-400d-9bb6-c2191628ceaa";
  networking.hostName = "ash";

  boot.plymouth.enable = true;
  boot.plymouth.theme = "breeze";

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  # boot.blacklistedKernelModules = [ "bluetooth" "btusb" ];

  # Enable thunderbolt support
  services.hardware.bolt.enable = true;

  services.fwupd.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable CUPS to print documents.
  #services.printing.enable = true;
  #services.printing.drivers = [ pkgs.hplip ];

  # Enable SANE scanner support
  hardware.sane.enable = true;
  services.ipp-usb.enable = true; # usb scanner
  hardware.sane.extraBackends = [ pkgs.epkowa ];
  hardware.sane.disabledDefaultBackends = [ "escl" ];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.builditluc = {
    isNormalUser = true;
    description = "builditluc";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
  };

  # Enable flakes support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    vim
    git
    bat
    wget
  ];

  fonts.packages = [ (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; }) ];

  security.pki.certificateFiles = [ ./localca.pem ];

  system.stateVersion = "23.05";

}
