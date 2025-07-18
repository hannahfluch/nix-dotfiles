{
  persist.users = [ "hannah" ];

  persist.location.data.contents = [
    "/var/lib/nixos/"
    "/etc/machine-id"
    "/etc/NetworkManager/system-connections/"
    # docker containers
    "/var/lib/docker/"
    # docker config
    "/root/.docker/"

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
