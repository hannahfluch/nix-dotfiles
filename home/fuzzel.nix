{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        layer = "overlay";
        terminal = "${pkgs.alacritty}/bin/alacritty";
      };
    };
  };
}
