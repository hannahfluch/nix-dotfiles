{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    typescript
    nodejs-slim
  ];
  atlas.npm.enable = true;
}
