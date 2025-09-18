{ pkgs, ... }:
{
  imports = [
    ./vesktop.nix
    ./ida.nix
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
    ./teams.nix
    ./telegram.nix
    ./pt.nix
    ./gimp.nix
    ./mysql-workbench.nix
  ];
  home.packages = [
    pkgs.baobab
  ];
}
