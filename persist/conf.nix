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

    # Keys
    ".gnupg/"
    ".ssh/"
    ".local/share/keyrings/"

    # Hyprland version
    ".local/share/hyprland/lastVersion"

    # Fish history
    ".local/share/fish/fish_history"

    # JetBrains IDEs
    ".local/share/JetBrains"

    # zed
    ".local/share/zed/"

    # PacketTracer
    ".local/share/'Cisco Packet Tracer'"
  ];

  persist.location.caches.contents = [
    "/var/cache/"
    ".cache/"

    # zed
    ".local/share/zed/node/cache/"
  ];

  persist.location.logs.contents = [
    "/var/log/"

    # zed
    ".local/share/zed/node/cache/_logs/"
    ".local/share/zed/logs/"
  ];
}
