{ ... }:
{
  imports = [
    ./fish.nix
    ./alacritty.nix
    ./starship.nix
    ./helix.nix
    ./cli.nix
    ./wine.nix
  ];
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
}
