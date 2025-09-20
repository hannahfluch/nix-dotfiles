{ pkgs, extra, ... }:
{
  home.packages =
    with pkgs;
    [
      # cli essentails
      wl-clipboard
      fd
      ripgrep
      fastfetch
      tokei
      tlrc
      screen
      podman
      podman-compose
      unp
      file
      man-pages
      man-pages-posix
      traceroute
      bottom
      zip
      imagemagick

      # ctf
      hash_extender
      qemu
      gdb
      volatility3
      rubyPackages_3_4.seccomp-tools
      nmap
      metasploit
      steam-run
      binwalk
      snicat
      binaryen
      wordlists
      gobuster
      rubyPackages_3_4.one_gadget
    ]
    ++ [ extra.pwndbg ];

  services.podman.enable = true;
  persist.data.contents = [
    # podman containers & config
    ".local/share/containers/storage/"
  ];
  persist.caches.contents = [
    # podman
    ".local/share/containers/cache/"
  ];
}
