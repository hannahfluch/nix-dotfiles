{ config, ... }:
{
  networking.firewall.allowedUDPPorts = [ 5180 ];
  networking.wireguard.enable = true;
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "192.168.51.24/32" ];
      listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers)
      mtu = 1300;

      # Path to the private key file.
      privateKeyFile = config.age.secrets.wg1.path;

      peers = [
        # For a client configuration, one peer entry for the server will suffice.

        {
          # Public key of the server (not a file path).
          publicKey = "gor1hU/DAuNULki0lSk4xwEOn3ocJ+g8QqS64BlIVyQ=";

          # Forward all the traffic via VPN.
          allowedIPs = [
            "192.168.51.0/24"
            "192.168.43.0/24"
            "fd66:666::/32"
            "fd66:777::/32"
            "fe80::/64"
          ];

          # Set this to the server IP and port.
          endpoint = "195.201.23.142:443"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

          # Send keepalives every 25 seconds. Important to keep NAT tables alive.
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
