{ pkgs, ... }:
{
  home.packages = [ pkgs.ida-classroom ];

  persist.data.contents = [
    ".idapro/"
  ];
}
