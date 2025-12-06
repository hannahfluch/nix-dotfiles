{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jdk25
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
