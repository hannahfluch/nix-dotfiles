{ pkgs, ... }:
{
  stylix.enable = true;
  stylix.image = ../../assets/wallpaper.jpeg;
  stylix.fonts.monospace = {
    name = "MesloLGSNF";
    package = pkgs.meslo-lgs-nf;
  };
  stylix.polarity = "dark";
  stylix.opacity.terminal = 0.65;
  stylix.overlays.enable = false;
}
