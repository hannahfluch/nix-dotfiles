{ pkgs, ... }:
{
  home.packages = [ pkgs.telegram-desktop ];

  persist.data.contents = [
    ".local/share/TelegramDesktop/"
  ];
}
