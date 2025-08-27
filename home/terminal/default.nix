{ ... }:
{
  imports = [
    ./fish.nix
    ./alacritty.nix
    ./starship.nix
    ./helix.nix
    ./cli.nix
    ./wine.nix
    ./rclone.nix
    ./zellij.nix
  ];
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
}
