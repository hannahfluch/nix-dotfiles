{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jdk24
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
