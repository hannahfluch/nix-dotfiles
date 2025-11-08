{ ... }:
{
  imports = [
    ./alacritty.nix
    ./starship.nix
    ./helix.nix
    ./cli
    ./zellij.nix
    ./zsh.nix
  ];
  programs.nix-index = {
    enable = true;
  };
}
