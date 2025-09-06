{ pkgs, ... }:
{
  imports = [
    ./java.nix
    ./dotnet.nix
    ./python.nix
    ./java-script.nix
    ./r.nix
  ];
  home.packages = [
    (import ./rust.nix pkgs)
    pkgs.gcc
    pkgs.kdePackages.qtdeclarative # qmlformat todo: add to helix

  ];

  persist.caches.contents = [
    # rust
    ".cargo/"
  ];
}
