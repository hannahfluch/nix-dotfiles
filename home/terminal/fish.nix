{ ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  persist.data.contents = [
    ".local/share/fish/"
  ];
}
