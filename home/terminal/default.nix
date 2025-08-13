{ ... }:
{
  imports = [
    ./fish.nix
    ./alacritty.nix
    ./starship.nix
    ./helix.nix
    ./cli.nix
  ];
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
}
