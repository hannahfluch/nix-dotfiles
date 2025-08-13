{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # dotnet-sdk
    dotnet-sdk_9
    dotnet-ef
  ];

  persist.data.contents = [
    ".dotnet/"
    ".aspnet/"
  ];

  persist.caches.contents = [
    ".nuget/packages/"
    ".nuget/NuGet/NuGet.Config"
    ".templateengine/"
    ".local/share/NuGet/"
  ];
}
