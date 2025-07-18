{ pkgs, ... }:
{
  home.packages = [
    pkgs.geogebra6
  ];
  persist.data.contents = [
    ".config/GeoGebra/"
  ];
}
