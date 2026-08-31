{ pkgs, ... }:
{
  home.packages = [
    pkgs.quickemu
  ];

  # directory where I store all vm's
  persist.session.contents = [
    ".quickemu/"
  ];

}
