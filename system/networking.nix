{ pkgs, ... }:
{ 
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 8083 9090 ];

  networking.networkmanager.enable = true;
  networking.networkmanager.plugins = [ pkgs.networkmanager-openvpn ];

  networking.firewall.allowedUDPPorts = [ 57769 ];
  environment.systemPackages = [ pkgs.wireguard-tools ];
}
