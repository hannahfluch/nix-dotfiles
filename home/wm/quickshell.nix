{
  extra,
  ...
}:
{
  home.packages = [
    extra.shell
  ];

  persist.data.contents = [
    ".local/share/chicken-shell/"
  ];
}
