{ pkgs, ... }:
{
  home.packages = [ pkgs.mattermost-desktop ];

  persist.data.contents = [
    ".config/Mattermost/"
  ];
}
