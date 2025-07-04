{
  persist.users.hannah = "/home/hannah";

  persist.location.data.contents = [
    # System
    "/var/lib/nixos/"
    "/etc/machine-id"

    # User data
    "music/"
    "pictures/"
    "documents/"
    "videos/"
    "dev/"

    # NixOS config
    "nixcfg/"

    # Keys (TODO: Fix permissions)
    ".gnupg/"
    ".ssh/"
    ".local/share/keyrings/"

    # Ly state
    "/etc/ly"

  ];

  persist.location.caches.contents = [
    "/var/cache/"
    ".cache/"
    # Hyprland
    ".local/share/hyprland/lastVersion"
  ];

  persist.location.logs.contents = [ "/var/log/" ];
}
