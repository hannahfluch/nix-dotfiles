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
    # keys
    {
      directory = ".ssh/";
      mode = "0700";
    }

    {
      directory = ".gnupg/";
      mode = "0700";
    }
    {
      directory = ".local/share/keyrings/";
      mode = "0700";
    }
  ];

  programs.ssh.enable = true;
}
