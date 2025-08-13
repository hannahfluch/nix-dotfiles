{...}: {
  programs.zed-editor.enable = true;
  persist.data.contents = [
    ".local/share/zed/"
  ];

  persist.caches.contents = [
    ".local/share/zed/node/cache/"
  ];

  persist.logs.contents = [
    ".local/share/zed/node/cache/_logs/"
    ".local/share/zed/logs/"
  ];
}
