{ pkgs, ... }:
{
  home.packages = [ pkgs.ghidra ];
  persist.data.contents = [
    # tool configs, user preferences, ...
    ".config/ghidra/"
  ];
}
