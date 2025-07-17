{ pkgs, ... }:
{
  home.packages = [
    pkgs.warp
  ];
  persist.data.contents = [
    # prevent welcome message from being shown
    ".config/warp/config.json"
  ];
}
