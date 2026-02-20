{ pkgs, ... }:
{
  home.packages = [
    pkgs.geogebra6
  ];
  persist.session.contents = [
    ".config/GeoGebra/"
  ];
}
