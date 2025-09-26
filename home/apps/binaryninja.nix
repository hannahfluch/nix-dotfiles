{ pkgs, ... }:
{

  home.packages = [
    pkgs.binaryninja-personal
  ];

  persist.data.contents = [
    ".config/Vector 35/Binary Ninja.conf"
    ".binaryninja/"
  ];
}
