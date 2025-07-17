{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dotnet-sdk
    dotnet-ef
  ];

  persist.data.contents = [
    ".dotnet/"
    ".aspnet/"
  ];

  persist.cache.contents = [
    ".nuget/packages/"
    ".templateengine/"
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "dotnet-runtime-6.0.36"
  ]; # todo: patch networkminer to use a modern alternative
}
