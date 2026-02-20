{
  persist.users = [ "hannah" ];

  persist.location.data.contents = [
    "/var/lib/nixos/"
    "/etc/machine-id"
    # system ssh keys
    "/etc/ssh/"
  ];

  persist.location.caches.contents = [
    "/var/cache/"
  ];

  persist.location.session.contents = [
    "/etc/NetworkManager/system-connections/"
    # sudo: saves first time using sudo
    "/var/db/sudo/lectured/"
    # bluetooth connections
    {
      directory = "/var/lib/bluetooth/";
      mode = "0700";
    }
  ];

  persist.location.logs.contents = [
    "/var/log/"
  ];
}
