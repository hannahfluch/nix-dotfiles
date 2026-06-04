{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    typescript
  ];
  atlas.npm.enable = true;

  programs.helix.extraPackages = with pkgs; [
    typescript-language-server
    prettier
  ];
}
