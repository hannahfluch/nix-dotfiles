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
    file

    # ctf
    hash_extender
    qemu
    gdb
    winetricks
    wineWowPackages.waylandFull
    volatility3
  ];
  persist.data.contents = [
    ".wine/"
    # podman containers & config
    ".local/share/containers/storage/"
  ];
  persist.caches.contents = [
    # podman
    ".local/share/containers/cache/"
  ];
}
