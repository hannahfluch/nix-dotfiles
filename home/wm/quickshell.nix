{
  extra,
  pkgs,
  ...
}:
{
  home.packages = [
    extra.honklet
    pkgs.quickshell
  ];

  qt.enable = true; # for qmlls
}
