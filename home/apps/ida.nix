{ extra, ... }:
{
  home.packages = [ extra.ida-pro ];

  persist.data.contents = [
    ".idapro/"
  ];
}
