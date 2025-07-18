{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # cli essentails
    wl-clipboard
    fd
    ripgrep
    fastfetch
    tokei
    tlrc
    screen
    docker
    docker-compose
    podman
    podman-compose
    unp

    # ctf
    hash_extender
    qemu
    gdb

  ];
  persist.data.contents = [
    # docker containers
    "/var/lib/docker/"
    # docker config
    "/root/.docker/"

    # podman containers & config
    ".local/share/containers/storage/"
  ];
  persist.caches.contents = [
    # podman
    ".local/share/containers/cache/"
  ];
}
