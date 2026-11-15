{ pkgs, ... }:
{

  imports = [
    ./netbird.nix
  ];
  # networking
  networking.hostName = "chicken";
  networking.networkmanager.enable = true;
  networking.networkmanager.plugins = [ pkgs.networkmanager-openvpn ];

  networking.firewall.allowedUDPPorts = [ 50000 ];
  networking.firewall.allowedTCPPorts = [
    50000
    8000
  ];

}
