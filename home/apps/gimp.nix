{ pkgs, ... }:
{
  home.packages = [ pkgs.gimp ];
  persist.session.contents = [
    ".config/GIMP/"
  ];

}
