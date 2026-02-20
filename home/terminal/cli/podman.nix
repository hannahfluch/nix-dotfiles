{ ... }:
{

  services.podman.enable = true;
  persist.session.contents = [
    # podman containers & config
    ".local/share/containers/storage/"
  ];
  persist.caches.contents = [
    # podman
    ".local/share/containers/cache/"
  ];
}
