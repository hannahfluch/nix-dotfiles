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
    ./obsidian.nix
    ./networkminer.nix
  ];
  home.packages = [
    pkgs.baobab
  ];
}
