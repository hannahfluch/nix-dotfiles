{ pkgs, ... }:
let
  packages = with pkgs.rPackages; [
    tidyverse
    languageserver
    ggplot2
    patchwork
    readxl
    GGally
    plotly
  ];
  wrapper = pkgs.rWrapper.override { inherit packages; };
  rstudio = pkgs.rstudioWrapper.override { inherit packages; };
in
{
  home.packages = [
    wrapper
    rstudio
  ];

  atlas.rstudio.enable = true;

  programs.helix.extraPackages = [ wrapper ];
}
