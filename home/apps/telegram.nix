{ pkgs, ... }:
{
  home.packages = [ pkgs.telegram-desktop ];

  persist.session.contents = [
    ".local/share/TelegramDesktop/"
  ];
}
