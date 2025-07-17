{ pkgs, ... }:
{
  imports = [./java.nix ./dotnet.nix ];
  home.packages = [ (import ./rust.nix pkgs) ];
}
