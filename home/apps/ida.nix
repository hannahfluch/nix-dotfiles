{ pkgs, ... }:
{
  home.packages = [ pkgs.ida-pro ];

  persist.data.contents = [
    ".idapro/"
  ];
}
