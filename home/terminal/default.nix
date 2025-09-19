{ ... }:
{
  imports = [
    ./alacritty.nix
    ./starship.nix
    ./helix.nix
    ./cli.nix
    ./wine.nix
    ./rclone.nix
    ./zellij.nix
    ./nushell.nix
  ];
  programs.nix-index = {
    enable = true;
  };
}
