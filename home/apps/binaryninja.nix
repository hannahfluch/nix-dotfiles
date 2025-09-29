{ pkgs, ... }:
{
  programs.binary-ninja = {
    enable = true;
    package = pkgs.binary-ninja-personal-wayland;
  };

  persist.data.contents = [
    ".config/Vector 35/Binary Ninja.conf"
    ".binaryninja/"
  ];
}
