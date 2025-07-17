{ pkgs, ... }:
{
  home.packages = [ pkgs.networkminer ];

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "dotnet-runtime-6.0.36"
  ]; # todo: patch networkminer to use a modern alternative

  persist.caches.contents = [
    ".local/share/NetworkMiner/AssembedFiles/cache/"
  ]  

}
