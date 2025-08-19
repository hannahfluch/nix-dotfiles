{ extra, lib, ... }:
{
  home.packages = [
    extra.quickshell
  ];

  # start quickshell after hyprland
  systemd.user.services.quickshell =
    let
      quickshellTarget = "hyprland-session.target";
    in
    {
      Unit = {
        Description = "quickshell";
        Documentation = "https://quickshell.outfoxxed.me/docs/";
        After = [ "${quickshellTarget}" ];
      };

      Service = {
        ExecStart = lib.getExe extra.quickshell + " --config /home/hannah/nixcfg/quickshell/";
        Restart = "on-failure";
      };

      Install.WantedBy = [ "${quickshellTarget}" ];
    };

}
