{ pkgs, ... }:
{
  imports = [
    ./java.nix
    ./dotnet.nix
    ./python.nix
    ./java-script.nix
  ];
  home.packages = [
    (import ./rust.nix pkgs)
    pkgs.libgcc
  ];
}
