{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;

    signing = {
      signByDefault = true;
      key = "${config.home.homeDirectory}/nixcfg/keys/id_ed25519.pub";
      format = "ssh";
    };

    settings = {
      user = {
        name = "hannahfluch";
        email = "hannah@diefluchs.at";
      };

      alias = {
        d = "diff";
        ds = "diff --staged";
        cm = "commit -m";
        ca = "commit --amend --no-edit";
        a = "add";
        p = "push";
        s = "status";
        l = "log";
        rbi = "rebase -i";
      };

      core.editor = "hx";
      init.defaultBranch = "main";
      # credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };
}
