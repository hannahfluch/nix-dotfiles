{ pkgs, ... }:
let
  dirPath = "/persistent/data/home/hannah/.binaryninja";
in
{
  home.packages = [
    (pkgs.binaryninja-free.overrideAttrs

      (
        finalAttrs: previousAttrs: {
          nativeBuildInputs = previousAttrs.nativeBuildInputs ++ [ pkgs.makeWrapper ];
          postInstall = ''
            wrapProgram $out/bin/binaryninja --set BN_USER_DIRECTORY ${dirPath}
            ${previousAttrs.postInstall or ""}
          '';
        }
      )
    )
  ];
  persist.data.contents = [
    ".config/Vector 35/Binary Ninja.conf"
  ];
}
