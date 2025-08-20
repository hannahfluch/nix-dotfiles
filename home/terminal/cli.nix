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
    man-pages
    man-pages-posix

    # ctf
    hash_extender
    qemu
    gdb
    volatility3
    rubyPackages_3_4.seccomp-tools
  ];
  persist.data.contents = [
    # podman containers & config
    ".local/share/containers/storage/"
  ];
  persist.caches.contents = [
    # podman
    ".local/share/containers/cache/"
  ];
}
