{ pkgs, ... }:
{
  home.packages = [ pkgs.gimp ];
  persist.data.contents = [
    ".config/GIMP/"
  ];

}
