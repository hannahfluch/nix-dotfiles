{ config, ... }:
let
  authKey = "${config.home.homeDirectory}/nixcfg/keys/id_ed25519";
in
{
  programs.ssh.enableDefaultConfig = false;
  programs.ssh.matchBlocks."*" = {
    identityFile = authKey;
    compression = true;
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
