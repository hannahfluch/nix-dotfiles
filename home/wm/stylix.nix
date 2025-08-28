{
  pkgs,
  assets,
  lib,
  ...
}:
let
  wallpapers = lib.filesystem.listFilesRecursive "${assets.outPath}/wallpapers";
in
{
  stylix.enable = true;
  stylix.fonts.monospace = {
    name = "MesloLGSNF";
    package = pkgs.meslo-lgs-nf;
  };
  stylix.polarity = "dark";
  stylix.opacity.terminal = 0.65;
  stylix.overlays.enable = false;

  # make every wallpaper it's own specialisation
  specialisation = builtins.listToAttrs (

    map (path: {
      # strip suffix if there is one
      name =
        let
          parts = lib.splitString "." (builtins.baseNameOf path);
        in
        builtins.unsafeDiscardStringContext (
          if builtins.length parts > 1 then
            lib.removeSuffix ("." + lib.last parts) (builtins.baseNameOf path)
          else
            builtins.baseNameOf path
        );
      # set image as stylix wallpaper
      value = {
        configuration.stylix.image = lib.mkForce path;
      };
    }) wallpapers

  );
  stylix.image = "${assets.outPath}/wallpapers/mountains.jpg"; # default wallpaper
}
