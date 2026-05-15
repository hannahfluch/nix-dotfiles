{ pkgs, ... }:
{
  home.packages = [ pkgs.libreoffice ];
  atlas.libreoffice.enable = true;
}
