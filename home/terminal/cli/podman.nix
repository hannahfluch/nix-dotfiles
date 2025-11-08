{ ... }:
{

  services.podman.enable = true;
  persist.data.contents = [
    # podman containers & config
    ".local/share/containers/storage/"
  ];
  persist.caches.contents = [
    # podman
    ".local/share/containers/cache/"
  ];
}
