{ pkgs, ... }:
{
  imports = [
    ./vesktop.nix
    ./editors
    ./binaryninja.nix
    ./firefox.nix
    ./warp.nix
    ./ghidra.nix
    ./bytecode-viewer.nix
    ./libreoffice.nix
    ./burpsuite.nix
  ];
  home.packages = [
    pkgs.baobab
  ];
}
