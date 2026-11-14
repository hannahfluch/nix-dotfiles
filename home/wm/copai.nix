{ config, extra, ... }:
{
  imports = [ extra.copai-shell-hm ];

  programs.copai-shell = {
    enable = true;
    environmentFile = "${config.home.homeDirectory}/documents/licenses/copai.env";
    niri.enable = true;
    appearance = {
      opacity = 0.18;
      fontSize = 14;
    };
    timing = {
      hideDelay = 60;
      initialDelay = 550;
    };
  };
}
