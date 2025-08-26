{ pkgs, ... }:
{
  stylix.enable = true;
  stylix.image = ../../assets/wallpapers/mountains.jpg;
  stylix.fonts.monospace = {
    name = "MesloLGSNF";
    package = pkgs.meslo-lgs-nf;
  };
  stylix.polarity = "dark";
  stylix.opacity.terminal = 0.65;
  stylix.overlays.enable = false;
}
