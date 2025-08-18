{ pkgs, ... }:
let
  dirPath = "/persistent/data/home/hannah/.wine";
in
{
  home.packages = [
    (pkgs.wineWowPackages.waylandFull.overrideAttrs (
      finalAttrs: previousAttrs: {
        postInstall = ''
          ${previousAttrs.postInstall or ""}
          wrapProgram $out/bin/wine --set WINEPREFIX ${dirPath}
        '';
      }
    ))
  ];
}
