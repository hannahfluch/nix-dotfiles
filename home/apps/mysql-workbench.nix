{ pkgs, ... }:
{
  home.packages = [ pkgs.mysql-workbench ];

  persist.data.contents = [
    ".mysql/"
  ];
}
