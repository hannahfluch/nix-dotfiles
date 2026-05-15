{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # dotnet-sdk
    dotnet-sdk_9
    dotnet-ef
  ];
}
