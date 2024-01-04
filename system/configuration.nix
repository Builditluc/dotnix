{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-8f57f477-cd2b-400d-9bb6-c2191628ceaa".device = "/dev/disk/by-uuid/8f57f477-cd2b-400d-9bb6-c2191628ceaa";
  networking.hostName = "ash";

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable thunderbolt support
  services.hardware.bolt.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable thermal data
  services.thermald.enable = true;

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
  services.printing.enable = true;

  services.printing.drivers = [ pkgs.hplip ];

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };


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
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    vim
    git
    bat
    wget
  ];

  fonts.packages = [ (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; }) ];

  system.stateVersion = "23.05";

}
