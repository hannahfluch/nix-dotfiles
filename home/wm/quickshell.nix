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

  persist.session.contents = [
    ".local/share/chicken-shell/"
  ];
}
