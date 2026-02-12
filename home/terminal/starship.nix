{ ... }:
let
  os_bg = "base07";
  bg = "base01";
  fg = "base03";
  dir = "base00";
  dir_bg = "base04";
  failure = "base08";
  rust = "base17";
  python = "base09";
  package = "brown";
  success = "base14";
  git = "green";
  git_stage = "yellow";
  git_action = "red";

  sudo = fg;
  os = "base00";
in
{
  programs.starship = {
    enable = true;

    settings = {
      format =
        "[╭─](fg:${bg})"
        + "["
        + (
          # Left prompt
          "[](fg:${os_bg})"
          + "[](fg:${os} bg:${os_bg})"
          + "[ ](fg:${os_bg} bg:${dir_bg})"
          + "$directory"
          + "( | $git_branch)( $git_status)( $git_state)"
          + "[ ](fg:${bg})"
          # Right prompt
          + "$fill("
          + (
            "[](${bg})"
            + "( $status|)"
            + "( $cmd_duration |)"
            + "( $sudo |)"
            + "( $package |)"
            + "( $rust |)"
            + "( $python |)"
            + "( $shlvl |)"
            + "( \${custom.nix_flake} |)"
            + "" # this is a \b not a whitespace!
            + "[](fg:${bg})"
          )
          + ")"
        )
        + ''
          ](fg:${fg} bg:${bg})
        ''
        + "[╰─](fg:${bg})$character";

      palettes.base16 = {
        nix = "#7EBAE4";
      };

      # Left prompt
      directory = {
        format = "[ﱮ $path( $read_only)](fg:${dir} bg:${dir_bg})[](fg:${dir_bg} bg:${bg})";
        read_only = "";

        truncation_length = 5;
        truncation_symbol = "…/";
        truncate_to_repo = false; # disable forced truncation if in a git repo
      };

      git_branch = {
        format = "[$symbol $branch](fg:${git} bg:${bg})";
        symbol = "";
      };

      git_status = {
        format = "[($all_status$ahead_behind)](fg:${git_stage} bg:${bg})";
        stashed = "~";
      };

      git_state = {
        format = "[$state $progress_current/$progress_total]($style bg:${bg})";
        style = "fg:${git_action}";
      };
      shlvl = {
        disabled = false;

        format = "[$symbol $shlvl](fg:${fg} bg:${bg})";
        symbol = "";
      };

      character = {
        success_symbol = "[❯](${success})";
        error_symbol = "[❯](${failure})";
      };

      # Right prompt
      fill.symbol = " "; # filler between left & right prompt

      status = {
        disabled = false;
        style = "fg:${failure} bg:${bg}";
      };

      cmd_duration.format = "[󱎫 $duration](fg:duration bg:${bg})";

      sudo = {
        disabled = false;
        format = "[](fg:${sudo} bg:${bg})";
      };

      package.format = "[󰏗 $version](fg:${package} bg:${bg})";

      rust.format = "[ $version](fg:${rust} bg:${bg})";

      python.format = "[ $version](fg:${python} bg:${bg})";

      # nix shell heuristics only apply, when the shell is active.
      custom.nix_flake = {
        format = "[](fg:nix bg:${bg})";

        detect_files = [
          "flake.nix"
          "flake.lock"
        ];

        description = "Displays a nix icon, when in a nix flake directory";
      };

    };
  };
}
