{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      terminal = {shell = lib.getExe pkgs.fish;};

      window = {
        dynamic_padding = true;
        opacity = 0.8;
      };

      font.normal = {
        family = "MesloLGSNF";
        style = "Regular";
      };
    };
  };
}
