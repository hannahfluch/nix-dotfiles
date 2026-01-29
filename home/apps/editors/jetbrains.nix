{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.datagrip
    jetbrains.idea
  ];

  persist.data.contents = [
    ".local/share/JetBrains/"
    ".config/JetBrains/"
  ];
}
