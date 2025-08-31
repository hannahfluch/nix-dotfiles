{ pkgs, ... }:
let
  username = "hannah";
  homeDirectory = "/home/${username}";
in
{
  imports = [
    ./xdg.nix
    ./terminal
    ./wm
    ./fuzzel.nix
    ./ssh.nix
    ./git.nix
    ./agenix.nix
    ./apps
    ./toolchains
  ];

  # make nixcfg writeable by `hannah`
  systemd.user.services.writableConfig =
    let
      after = "multi-user.target";
    in
    {
      Unit = {
        Description = "Make nixcfg writable by `hannah`";
        After = [ "${after}" ];
      };

      Service = {
        ExecStart = "chown -R hannah /home/hannah/nixcfg; chmod -R 0700 /home/hannah/nixcfg;";
        Restart = "on-failure";
      };

      Install.WantedBy = [ "${after}" ]; # starts after login
    };

  systemd.user.startServices = "sd-switch"; # make sure agenix is activated before rclone runs

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    inherit username homeDirectory;

    packages = with pkgs; [
      # fonts
      meslo-lgs-nf

      # apps
      # mysql workbench
      # vlc

    ];

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";
  };

  age.identityPaths = [ "${homeDirectory}/nixcfg/keys/id_ed25519" ];

  persist.data.contents = [
    # user data
    "music/"
    "pictures/"
    "documents/"
    "videos/"
    "dev/"
    "screenshots/"
    ".secrets/"
    "assets/"
    "shell/"

    # nixos config
    "nixcfg/"

    # chromium certificates
    ".pki/"

    # audio
    ".config/pulse/"
    ".local/state/wireplumber/"
  ];

  persist.caches.contents = [
    ".cache/"
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
