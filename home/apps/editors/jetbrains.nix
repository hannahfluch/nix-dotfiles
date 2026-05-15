{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.datagrip
    jetbrains.idea
  ];

  atlas.jetbrains.enable = true;
}
