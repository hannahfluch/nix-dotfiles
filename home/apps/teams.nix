{ pkgs, ... }:
{
  home.packages = [
    pkgs.teams-for-linux
  ];

  persist.data.contents = [ ".config/teams-for-linux/" ];
}
