{ pkgs, ... }:
{
  home.packages = [
    pkgs.obsidian
  ];

  persist.data.contents = [
    ".config/obsidian/"
  ];
}
