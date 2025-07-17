{pkgs, ...}:
{
home.packages = with pkgs; [
  dotnet-sdk
  dotnet-ef
];  
}
