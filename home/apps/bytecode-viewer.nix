{ pkgs, ... }:
{
  home.packages = [ pkgs.bytecode-viewer ];
  persist.session.contents = [
    ".Bytecode-Viewer/"
  ];
}
