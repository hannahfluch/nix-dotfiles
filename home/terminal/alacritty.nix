{ pkgs, lib, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal = {
        shell = lib.getExe pkgs.fish;
      };
    };
  };
}
