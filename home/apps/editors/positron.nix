{ pkgs, ... }:
{
  home.packages = [ pkgs.positron-bin ];

  persist.data.contents = [
    ".config/Positron/"
    ".positron/"
  ];
}
