{ lib, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    gnupg 
    gpgme
    yubikey-personalization 
    yubikey-manager 
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    #pinentryPackage = pkgs.pinentry-curses;
  };

  programs.ssh.startAgent = false;
  services.pcscd.enable = true;

  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  services.udev.packages = [ pkgs.yubikey-personalization ];

  hardware.gpgSmartcards.enable = true;

  # u2f PAM
  security.pam.services = {
    #login.u2fAuth = true; # users in $HOME/.config/Yubico/u2f_keys can log in 
    sudo.u2fAuth = true;  # with U2F Key(s)
  };

  security.pam.u2f.control = "required"; # multi factor authentication with yubikey

  # disable gnome keyring
  services.gnome.gnome-keyring.enable = lib.mkForce false;

  # public key: 62F515FE2B41AE9ED18792A86139D472C7AE6CB0
  # import it from the `hkps://keyserver.ubuntu.com` keyserver
  # (see this answer on so for more: https://superuser.com/questions/1485213/gpg-cant-import-key-new-key-but-contains-no-user-id-skipped/1485255#1485255)
}
