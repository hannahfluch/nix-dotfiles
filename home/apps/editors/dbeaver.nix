{ pkgs, ... }:
{

  home.packages = [ pkgs.dbeaver-bin ];

  persist.data.contents = [
    ".local/share/DBeaverData/"
    ".eclipse/"
  ];
}
