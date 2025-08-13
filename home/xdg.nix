{ config, pkgs, ... }:
{
  xdg = {
    userDirs =
      let
        base = "${config.home.homeDirectory}";
      in
      {
        enable = true;
        createDirectories = true;
        download = "${base}/downloads";
        desktop = null;
        templates = null;
        publicShare = null;
        documents = "${base}/documents";
        music = "${base}/music";
        pictures = "${base}/pictures";
        videos = "${base}/videos";
      };
    # hyprland portal is added automatically, gtk for file-chooser
    portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
