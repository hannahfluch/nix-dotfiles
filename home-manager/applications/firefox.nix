{ pkgs, ... }:
{
  home.packages = [ pkgs.firefox ];
  persist.data.contents = [
    ".mozilla/"
  ];
}
