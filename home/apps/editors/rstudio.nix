{ pkgs, ... }:
let
  wrapper = pkgs.rstudioWrapper.override {
    packages = with pkgs.rPackages; [ languageserver ];
  };
in
{
  home.packages = [ wrapper ];

  persist.data.contents = [
    ".local/share/rstudio/"
    ".config/RStudio/"
  ];
}
