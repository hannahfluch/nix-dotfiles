{ pkgs, ... }:
{
  imports = [
    ./terminal
    ./hyprland
    ./wofi.nix
    ./ssh.nix
    ./git.nix
    ./applications
  ];

  xdg.userDirs.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = rec {
    username = "hannah";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      # python

      # js
      # nodejs-slim
      # bun

      # c-sharp
      # dotnet-sdk
      # dotnet-ef

      # c
      # libgcc

      # java
      # zulu8
      # zulu17
      # zulu24

      # fonts
      meslo-lgs-nf

      # cli essentails
      wl-clipboard
      fd
      ripgrep
      fastfetch
      tokei
      tlrc
      screen
      docker
      podman
      # ctf
      # binaryninja-free
      # ghidra-bin
      # bytecode-viewer
      # recaf-launcher
      # networkminer
      # wireshark
      # hash_extender
      # wineWowPackages.waylandFull
      # qemu
      # gdb

      # apps
      # libreoffice
      # geogebra6
      # baobab
      # gimp
      # obsidian
      # teams-for-linux
      # packetTracer
      # nautilus

    ];

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";
  };

  persist.data.contents = [
    # user data
    "music/"
    "pictures/"
    "documents/"
    "videos/"
    "dev/"

    # nixos config
    "nixcfg/"
  ];

  persist.caches.contents = [
    ".cache/"
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
