{ pkgs, ... }:
{
  home.packages = [ pkgs.libreoffice ];
  persist.data.contents = [
    ".config/libreoffice/"
  ];
}
