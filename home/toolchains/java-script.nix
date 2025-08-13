{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    typescript
    nodejs-slim
  ];
  persist.caches.contents = [
    ".bun/install/cache/"
    ".npm/_cacache/"
  ];
  persist.logs.contents = [
    ".npm/_logs/"
  ];
  persist.data.contents = [
    ".npm/_update-notifier-last-checked"
  ];
}
