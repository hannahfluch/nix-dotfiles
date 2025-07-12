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

    # Hyprland version
    ".local/share/hyprland/lastVersion"

    # Fish history
    ".local/share/fish/fish_history"
  ];

  persist.location.caches.contents = [
    "/var/cache/"
    ".cache/"
  ];

  persist.location.logs.contents = ["/var/log/"];
}
