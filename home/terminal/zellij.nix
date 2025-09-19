{
  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "nu";
      # copy_on_select = false;
      show_startup_tips = false;
      # mouse_mode = false;
      # reconfigure keybinds that conflict with helix
      keybinds =
        let
          session = "Ctrl k";
          search = "Ctrl 7";
        in
        {
          unbind._args = [
            "Ctrl o"
            "Ctrl s"
          ];
          "shared_except \"session\" \"locked\"" = {
            bind = {
              _args = [ session ];
              SwitchToMode._args = [ "Session" ];
            };
          };
          session = {
            "bind \"${session}\"" = {
              SwitchToMode._args = [ "Normal" ];
            };
            "bind \"${search}\"" = {
              SwitchToMode._args = [ "Scroll" ];
            };
          };
          "shared_except \"scroll\" \"locked\"" = {
            bind = {
              _args = [ search ];
              SwitchToMode._args = [ "Scroll" ];
            };
          };
          scroll = {
            bind = {
              _args = [ search ];
              SwitchToMode._args = [ "Normal" ];
            };
          };
          search = {
            bind = {
              _args = [ search ];
              SwitchToMode._args = [ "Normal" ];
            };
          };
        };
    };
  };
}
