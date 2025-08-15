{ config, ... }:
let
  authKey = "${config.home.homeDirectory}/nixcfg/keys/id_ed25519";
in
{
  programs.ssh.matchBlocks = {
    "gitlab.com".identityFile = authKey;
    "github.com".identityFile = authKey;
  };

  persist.data.contents = [
    # TODO: fix permissions
    # keys
    ".ssh/"
    ".gnupg/"
    ".local/share/keyrings/"
  ];

  programs.ssh.enable = true;
}
