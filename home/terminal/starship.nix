{ ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      format =
        "[╭─](fg:frame)"
        + "["
        + (
          # Left prompt
          "[](fg:os_bg)"
          + "[](fg:os bg:os_bg)"
          + "[](fg:os_bg bg:bg) "
          + "$directory"
          + "( | $git_branch)( $git_status)( $git_state)"
          + "[](fg:bg)"
          # Right prompt
          + "$fill("
          + (
            "[](fg:bg)"
            + "( $status|)"
            + "( $cmd_duration |)"
            + "( $sudo |)"
            + "( $jobs |)"
            + "( $package |)"
            + "( $rust |)"
            + "( $python |)"
            + "( $shlvl |)"
            + "( \${custom.nix_flake} |)"
            + "" # this is a \b not a whitespace!
            + "[](fg:bg)"
          )
          + ")"
        )
        + ''
          ](fg:fg bg:bg)
        ''
        + "[╰─](fg:frame)$character";

      # todo: proper theming based on stylix (currently just extending theme)
      palettes.base16 = {
        bg = "#303030";
        fg = "#87875F";

        frame = "#6C6C6C";
        os_bg = "#484848";

        success_character = "#5FD700";
        failure = "#FF0000";

        os = "#EEEEEE";
        dir = "#00AFFF";

        sudo = "fg";
        jobs = "#5FAF00";
        package = "#AC7647";
        rust = "#F74C00";
        python = "#00AFAF";
        nix = "#7EBAE4";
        shlvl = "088167";

        git_branch = "#5FD700";
        git_status = "#D7AF00";
        git_state = "#FF0000"; # operations like rebasing/cherry-picking
      };

      # Left prompt
      directory = {
        format = "[ﱮ $path( $read_only)](fg:dir bg:bg)";
        read_only = "";

        truncation_length = 5;
        truncation_symbol = "…/";
        truncate_to_repo = false; # disable forced truncation if in a git repo
      };

      git_branch = {
        format = "[$symbol $branch](fg:git_branch bg:bg)";
        symbol = "";
      };

      git_status = {
        format = "[($all_status$ahead_behind)](fg:git_status bg:bg)";
        stashed = "~";
      };

      git_state = {
        format = "[$state $progress_current/$progress_total]($style bg:bg)";
        style = "fg:git_state";
      };
      shlvl = {
        disabled = false;

        format = "[$symbol $shlvl](fg:shlvl bg:bg)";
        symbol = "";
      };

      character = {
        success_symbol = "[❯](success_character)";
        error_symbol = "[❯](failure)";
      };

      # Right prompt
      fill.symbol = " "; # filler between left & right prompt

      status = {
        disabled = false;
        style = "fg:failure bg:bg";
      };

      cmd_duration.format = "[󱎫 $duration](fg:duration bg:bg)";

      sudo = {
        disabled = false;
        format = "[](fg:sudo bg:bg)";
      };

      jobs = {
        format = "[ $number](fg:jobs bg:bg)";
        number_threshold = 1;
      };

      package.format = "[󰏗 $version](fg:package bg:bg)";

      rust.format = "[ $version](fg:rust bg:bg)";

      python.format = "[ $version](fg:python bg:bg)";

      # nix shell heuristics only apply, when the shell is active.
      custom.nix_flake = {
        format = "[](fg:nix bg:bg)";

        detect_files = [
          "flake.nix"
          "flake.lock"
        ];

        description = "Displays a nix icon, when in a nix flake directory";
      };

    };
  };
}
