{ pkgs, ... }:
{
  home.packages = [
    pkgs.burpsuite
  ];
  persist.data.contents = [
    ".BurpSuite/"
    ".java/.userPrefs/burp/"
  ];
}
