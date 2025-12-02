{
  extra,
  pkgs,
  ...
}:
{
  home.packages = [
    extra.shell
    pkgs.quickshell
  ];

  qt.enable = true; # for qmlls

  persist.data.contents = [
    ".local/share/chicken-shell/"
  ];
}
