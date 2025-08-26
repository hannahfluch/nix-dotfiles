{
  persist.users = [ "hannah" ];

  persist.location.data.contents = [
    "/var/lib/nixos/"
    "/etc/machine-id"
    "/etc/NetworkManager/system-connections/"
    # bluetooth connections
    {
      directory = "/var/lib/bluetooth/";
      mode = "0700";
    }
    # system ssh keys
    "/etc/ssh/"
  ];

  persist.location.caches.contents = [
    "/var/cache/"

    # sudo: saves first time using sudo
    "/var/db/sudo/lectured/"
  ];

  persist.location.logs.contents = [
    "/var/log/"
  ];
}
