{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.datagrip
    jetbrains.idea-ultimate
  ];

  persist.data.contents = [
    ".local/share/JetBrains/"
    ".config/JetBrains/"
  ];
}
