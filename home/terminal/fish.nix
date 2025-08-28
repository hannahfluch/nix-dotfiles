{ pkgs, lib, ... }:
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
          set wallpaper $argv[1]
          for line in (${lib.getExe pkgs.home-manager} generations)
            set path (string match -r '/nix/store/\S+' -- $line)
            if test -d "$path/specialisation"
                echo "Found specialisations at: $path"
                set path "$path/specialisation"
                echo "Available specialisations:"
                ls "$path"
                echo "Attempting to activate $wallpaper ..."
                echo 
                set activate (ls "$path/$wallpaper/activate")
                $activate
                break
            end
        end

      '';
    };
  };

  persist.data.contents = [
    ".local/share/fish/"
  ];
}
