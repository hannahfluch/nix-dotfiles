{
  imports = [ ./wireguard.nix ];

  # networking
  networking.hostName = "chicken";
  # Pick only one of the below networking options.
  networking.networkmanager = {
    enable = true;
  };

}
