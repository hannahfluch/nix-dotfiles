{ pkgs, ... }:
{
  imports = [
    ./java.nix
    ./dotnet.nix
    ./python.nix
    ./java-script.nix
    ./r.nix
    ./go.nix
    ./rust.nix
  ];
  home.packages = [
    pkgs.gcc
    pkgs.kdePackages.qtdeclarative # qmlformat todo: add to helix

  ];
}
