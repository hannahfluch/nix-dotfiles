{ pkgs, ... }:
{
  home.packages = [ pkgs.go ];

  persist.caches.contents = [
    "go/"
  ];
}
