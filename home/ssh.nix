{ config, ... }:
let
  authKey = "${config.home.homeDirectory}/nixcfg/keys/id_ed25519";
in
{
  programs.ssh.matchBlocks = {
    "gitlab.com".identityFile = authKey;
    "github.com".identityFile = authKey;
    "h4xx.eu" = {
      identityFile = authKey;
      checkHostIP = false;
      extraOptions."StrictHostKeychecking" = "no";
    };
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
