{
  lib,
  config,
  pkgs,
  ...
}:
{
  persist.data.contents = [
    ".config/nushell/history.txt"
  ];

  programs.nushell = {
    enable = true;
    settings.show_banner = false;
    extraEnv = ''
      ${lib.getExe pkgs.bash-env-json} ${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh
         | from json
         | get env
         | load-env
    '';
    # todo: use nix-index: command-not-found
    extraConfig = ''

      def wallpaper [name?: string] {
        let gens = (${lib.getExe pkgs.home-manager} generations | lines | parse --regex '(/nix/store/\S+)' | get capture0)
        for p in $gens {
          let specdir = ($p | path join 'specialisation')
          if ($specdir | path exists) {
            print $"Found specialisations at: ($specdir)"
            print "Available specialisations:"
            ls $specdir | get name | path basename | print
            match $name {
              null => { print "Usage: wallpaper <specialisation-name>"  }
              _ => {
                print $"Attempting to activate ($name) ..."
                ^($specdir | path join $name | path join "activate")
              }
            }
            break
          }
        }
      }

      $env.config.hooks.command_not_found = { |cmd_name|
        let install = { |pkgs|
          $pkgs | each {|pkg| $"  nix shell nixpkgs#($pkg)" }
        }
        let run_once = { |pkgs|
          $pkgs | each {|pkg| $"  nix shell nixpkgs#($pkg) --command '($cmd_name) ...'" }
        }
        let single_pkg = { |pkg|
          let lines = [
            $"The program '($cmd_name)' is currently not installed."
            ""
            "You can install it by typing:"
            (do $install [$pkg] | get 0)
            ""
            "Or run it once with:"
            (do $run_once [$pkg] | get 0)
          ]
          $lines | str join "\n"
        }
        let multiple_pkgs = { |pkgs|
          let lines = [
            $"The program '($cmd_name)' is currently not installed. It is provided by several packages."
            ""
            "You can install it by typing one of the following:"
            (do $install $pkgs | str join "\n")
            ""
            "Or run it once with:"
            (do $run_once $pkgs | str join "\n")
          ]
          $lines | str join "\n"
        }
        let pkgs = (nix-locate --minimal --no-group --type x --type s --whole-name --at-root $"/bin/($cmd_name)" | lines)
        let len = ($pkgs | length)
        let ret = match $len {
          0 => null,
          1 => (do $single_pkg ($pkgs | get 0)),
          _ => (do $multiple_pkgs $pkgs),
        }
        return $ret
      }
    '';
  };

}
