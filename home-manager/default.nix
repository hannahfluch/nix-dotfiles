{ config, lib, pkgs, ... }: {
  imports = [ ./terminal ./hyprland ./wofi.nix ./ssh.nix ./git.nix ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = rec {
    username = "hannah";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      # rust
      (import ./rust-toolchain.nix pkgs)

      # python
      (python3.withPackages
        (pythonPackages: with pythonPackages; [ virtualenv requests ]))
      ruff
      uv

      # js
      nodejs-slim
      bun

      # c-sharp
      dotnet-sdk
      dotnet-ef

      # c
      libgcc

      # java
      zulu8
      zulu17
      zulu24

      # editors
      zed-editor
      jetbrains.datagrip
      jetbrains.idea-ultimate

      # fonts
      meslo-lgs-nf

      # cli essentails
      wl-clipboard
      fd
      ripgrep
      fastfetch
      tokei
      tldr
      screen
      docker

      # apps
      libreoffice
      geogebra6
      baobab
      warp
      gimp
      obsidian
      teams-for-linux
      packetTracer
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
