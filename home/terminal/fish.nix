{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    functions = {
      switchwall = ''
        if test (count $argv) -lt 1
          echo "Usage: switchwall <wallpaper name>"
          return 1
        end

        if test "$argv[1]" = "-l"
          echo "Available specialisations:"
          for dir in /nix/store/*-home-manager-generation/specialisation/*
              echo (basename $dir)
          end | sort -u
          return 0
        end

        set wallpaper $argv[1]
        set activate (ls -d /nix/store/*-home-manager-generation/specialisation/$wallpaper/activate 2>/dev/null | sort | tail -n 1)
        if test -z "$activate"
          echo "No specialisation '$wallpaper' found in /nix/store"
          return 1
        end

        echo "Activating specialisation: $wallpaper"
        $activate
      '';
    };
  };

  persist.data.contents = [
    ".local/share/fish/"
  ];
}
