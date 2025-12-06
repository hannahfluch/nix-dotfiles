{ pkgs, ... }:
{
  home.packages = [

    (pkgs.networkminer.overrideAttrs (
      finalAttrs: previousAttrs: {
        postPatch = ''
          ${previousAttrs.postPatch or ""}
          # fix corrupted desktop file (filter for printable ascii chars)
          tail --bytes +4 NetworkMiner/NetworkMiner.desktop > tmp
          mv tmp NetworkMiner/NetworkMiner.desktop
        '';
      }
    ))
  ];

  persist.caches.contents = [
    ".local/share/NetworkMiner/AssembedFiles/cache/"
  ];
}
