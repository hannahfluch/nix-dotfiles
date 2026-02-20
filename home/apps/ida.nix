{ extra, ... }:
{
  home.packages = [ extra.ida-pro ];

  persist.session.contents = [
    ".idapro/"
  ];
}
