{ pkgs, ... }:
let
  packages = with pkgs.rPackages; [
    tidyverse
    languageserver
    ggplot2
    patchwork
    readxl
  ];
  wrapper = pkgs.rWrapper.override { inherit packages; };
  rstudio = pkgs.rstudioWrapper.override { inherit packages; };
in
{
  home.packages = [
    wrapper
    rstudio
  ];

  persist.data.contents = [
    ".local/share/rstudio/"
    ".config/RStudio/"
  ];

  programs.helix.extraPackages = [ wrapper ];
}
