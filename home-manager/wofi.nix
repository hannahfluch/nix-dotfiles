{
  config,
  pkgs,
  ...
}: {
  programs.wofi = {
    enable = true;
    settings = {
      width = 650;
      height = 400;
      prompt = "application launcher";
      show = "drun";
      allow_images = true;
    };
  };
}
