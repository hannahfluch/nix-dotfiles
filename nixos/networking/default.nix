{

  imports = [
    ./netbird.nix
  ];
  # networking
  networking.hostName = "chicken";
  # Pick only one of the below networking options.
  networking.networkmanager = {
    enable = true;

  };
  networking.firewall.allowedUDPPorts = [ 50000 ];
  networking.firewall.allowedTCPPorts = [
    50000
    8000
  ];

}
