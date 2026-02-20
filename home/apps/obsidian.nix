{ pkgs, ... }:
{
  home.packages = [
    pkgs.obsidian
  ];

  persist.session.contents = [
    ".config/obsidian/"
  ];
}
