{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "hannahfluch";
    userEmail = "hannah@diefluchs.at";
    signing = {
      signByDefault = true;
      key = "${config.home.homeDirectory}/nixcfg/keys/id_ed25519.pub";
      format = "ssh";
    };

    extraConfig = {
      core.editor = "hx";
      init.defaultBranch = "main";
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };
}
