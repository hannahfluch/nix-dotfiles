{ pkgs, ... }:
{
  home.packages = [
    pkgs.burpsuite
  ];
  persist.data.contents = [
    ".BurpSuite/"
    ".java/.userPerfs/burp/"
  ];
}
