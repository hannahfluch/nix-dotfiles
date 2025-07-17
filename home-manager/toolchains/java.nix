{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zulu24
    maven
  ];

  persist.data.contents = [
    # maven
    ".m2/"
  ];

  persist.caches.contents = [
    # java font cache
    ".java/fonts/"
  ];
}
