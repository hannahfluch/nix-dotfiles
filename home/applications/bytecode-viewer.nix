{ pkgs, ... }:
{
  home.packages = [ pkgs.bytecode-viewer ];
  persist.data.contents = [
    ".Bytecode-Viewer/"
  ];
}
