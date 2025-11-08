{ pkgs, extra, ... }:
{
  imports = [
    ./fzf.nix
    ./metasploit.nix
    ./wine.nix
    ./rclone.nix
    ./podman.nix
    ./n.nix
  ];

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
      sshfs

      # ctf
      hash_extender
      qemu
      gdb
      volatility3
      rubyPackages_3_4.seccomp-tools
      nmap
      steam-run
      binwalk
      snicat
      binaryen
      wordlists
      gobuster
      rubyPackages_3_4.one_gadget
      patchelf
      dsniff
    ]
    ++ [ extra.pwndbg ];

}
