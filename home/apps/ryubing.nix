{ extra, ... }:
{
  home.packages = [ extra.ryubing ];
  persist.logs.contents = [
    ".config/Ryujinx/Logs/"
  ];

  persist.data.contents = [
    ".config/Ryujinx/bis/user/"
  ];

  persist.session.contents = [
    ".config/Ryujinx/"
  ];
}
