{
  extra,
  unstablePkgs,
  ...
}:
{
  home.packages = [
    extra.shell
    unstablePkgs.quickshell
  ];

  qt.enable = true; # for qmlls

  persist.data.contents = [
    ".local/share/chicken-shell/"
  ];
}
