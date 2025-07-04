{ config, pkgs, ... }:

{
  programs.kitty.enable = true;
  programs.kitty.extraConfig = ''
    background_opacity 0.8
    font_family      family="CommitMono Nerd Font"
    bold_font        auto
    italic_font      auto
    bold_italic_font auto
  '';
}
