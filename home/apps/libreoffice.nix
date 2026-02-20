{ pkgs, ... }:
{
  home.packages = [ pkgs.libreoffice ];
  persist.session.contents = [
    ".config/libreoffice/"
  ];
}
