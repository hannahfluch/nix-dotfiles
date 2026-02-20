{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.datagrip
    jetbrains.idea
  ];

  persist.session.contents = [
    ".local/share/JetBrains/"
    ".config/JetBrains/"
  ];
}
