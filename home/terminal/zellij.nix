{ ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "fish";
      copy_on_select = false;
      show_startup_tips = false;
      mouse_mode = false;
    };
  };
}
