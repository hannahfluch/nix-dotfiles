{ pkgs, lib, ... }:
{

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      bindkey "^H" backward-kill-word
      WORDCHARS=''${WORDCHARS//[\/-]/}

      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word

      autoload -U up-line-or-beginning-search
      zle -N up-line-or-beginning-search
      bindkey "^[OA" up-line-or-beginning-search
      bindkey '^[[A' up-line-or-beginning-search

      autoload -U down-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey "^[OB" down-line-or-beginning-search
      bindkey '^[[B' down-line-or-beginning-search

      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    '';

    shellAliases =
      let
        path = "/home/hannah/nixcfg";
      in
      {
        nrs = "sudo nixos-rebuild switch --flake ${path}";
        nrt = "sudo nixos-rebuild test --flake ${path}";
        nd = "nix develop -c zsh";
        ls = "ls --color=auto";
        reload = "source ~/.zshrc; rehash";
        erm = "${lib.getExe pkgs.erdtree} --level=1 --sort=size -H --hidden --no-ignore";
        diff = "diff --color=auto";
        yoink = "${lib.getExe pkgs.git} clone --depth 1";
        pwninit = "${lib.getExe pkgs.pwninit} --template-path ${path}/scripts/pwninit-template.py";
        pdf = "${lib.getExe pkgs.libreoffice} --headless --convert-to pdf";
      };

    history = {
      append = true;
      ignorePatterns = [
        "poweroff"
        "reboot"
      ];
      size = 100000;
    };

  };
}
