{ pkgs, ... }:
{
  imports = [
    ./vesktop.nix
    ./editors
    ./binaryninja.nix
    ./firefox.nix
    ./warp.nix
    ./geogebra.nix
    ./ghidra.nix
    ./bytecode-viewer.nix
    ./libreoffice.nix
    ./burpsuite.nix
    ./obsidian.nix
    ./networkminer.nix
  ];
  home.packages = [
    pkgs.baobab
  ];
}
