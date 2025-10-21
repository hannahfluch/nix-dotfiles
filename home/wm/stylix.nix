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

  # wallpaper chaning script
  home.packages = [
    (pkgs.writeShellScriptBin "wallpaper" ''
      #!/usr/bin/env bash
      set -eo pipefail

      name="$1"

      # Iterate over home-manager generations
      ${lib.getExe pkgs.home-manager} generations | while IFS= read -r line; do
        # Extract the first /nix/store/... path from the line
        path="$(grep -oE '/nix/store/[^ ]+' <<<"$line" | head -n1 || true)"

        # Skip if no valid store path found
        [[ -n "${"path:-"}" ]] || continue

        specdir="$path/specialisation"
        if [[ -d "$specdir" ]]; then
          echo "Found specialisations at: $specdir"
          echo "Available specialisations:"
          ls "$specdir"
          echo

          if [[ -z "$name" ]]; then
            echo "Usage: wallpaper <specialisation-name>"
            exit 0
          fi

          activate="$specdir/$name/activate"
          if [[ -x "$activate" ]]; then
            echo "Attempting to activate '$name'..."
            "$activate"
            exit 0
          else
            echo "Error: activation script not found for '$name'"
            exit 1
          fi
        fi
      done
    '')
  ];
}
