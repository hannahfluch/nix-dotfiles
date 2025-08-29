{
  config,
  lib,
  pkgs,
  extra,
  ...
}:
{
  programs.hyprlock.enable = true; # temporary until quickshell is done

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      exec-once = [
        "${lib.getExe' pkgs.wl-clipboard "wl-paste"} --watch ${lib.getExe pkgs.cliphist} store"
        "uwsm app -- ${lib.getExe extra.shell}"
      ];
      # keybinds
      "$mod" = "SUPER";
      bind =
        let
          ipc = "${lib.getExe extra.shell} ipc call";
        in
        [
          "$mod, Q, exec,uwsm app -- alacritty" # bluetooth doesnt work without uwsm-specific launch
          "$mod, X, killactive"
          "$mod, F, exec, fullscreen"
          "$mod, W, exec, uwsm app -- ${ipc} appLauncher load"
          "$mod, A, exec, uwsm app -- ${ipc} wallpaper load"
          "$mod, L, exec, uwsm app -- hyprlock"
          "$mod, M, exec, uwsm stop"
          "$mod, Space, togglefloating"
          "$mod SHIFT, Space, centerwindow"
          "$mod, F, fullscreen"
          "$mod, V, exec, ${ipc} clipboard load"
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"

          "$mod, S, togglespecialworkspace, magic"
          "$mod SHIFT, S, movetoworkspace, special:magic"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (
            builtins.genList (
              i:
              let
                ws = i + 1;
              in
              [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            ) 9
          )
        );
      binde =
        let
          amixer = lib.getExe' pkgs.alsa-utils "amixer";
          brightnessctl = lib.getExe pkgs.brightnessctl;
        in
        [
          ", XF86AudioRaiseVolume, execr, ${amixer} set Master 5%+"
          ", XF86AudioLowerVolume, execr, ${amixer} set Master 5%-"
          ", XF86AudioMute,        execr, ${amixer} set Master toggle"
          ", XF86AudioMicMute,     execr, ${amixer} set Capture toggle"

          ", XF86MonBrightnessUp,   execr, ${brightnessctl} s 10%+"
          ", XF86MonBrightnessDown, execr, ${brightnessctl} s 10%-"
        ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # input
      input = {
        kb_layout = "de";
        touchpad = {
          natural_scroll = true;
        };
        follow_mouse = 1;
      };

      # graphics
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      master.new_status = "master";
      gestures.workspace_swipe = "true";
      misc = {
        force_default_wallpaper = 0;
        disable_splash_rendering = true;
      };
      ecosystem.no_update_news = true;
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
        allow_tearing = false;
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = false;
        };
      };

      # monitors
      monitor = [
        "eDP-1,preferred,auto,1.333333"
        # ",preferred,auto,1,mirror,eDP-1" # ,prefered,auto,1
        ",preferred,auto,1"
      ];

      # animations
      layerrule = [ "noanim, gtk4-layer-shell" ];
      windowrulev2 = [
        "noanim, class:^(waybar)$"
        "opacity 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"
        "maxsize 1 1, class:^(xwaylandvideobridge)$"
        "noblur, class:^(xwaylandvideobridge)$"
      ];
      animations = {
        enabled = true;
        bezier = [
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeInOutQuart, 0.76, 0, 0.24, 1"
          "easeInOutCubic, 0.65, 0, 0.35, 1"
        ];
        animation = [
          "windows, 1, 5, easeInOutCubic"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 5.25, easeInOutQuart"
        ];
      };
    };
  };

  # wm env vars
  home.file."${config.xdg.configHome}/uwsm/env".text = ''
    # perfer wayland for qt apps
    export QT_QPA_PLATFORM=wayland;xcb

    # perfer wayland for gtk apps
    export GDK_BACKEND=wayland,x11,*

    # run sdl2 apps on wayland
    export SDL_VIDEODRIVER=wayland

    # autoscale qt apps based on monitor
    export QT_AUTO_SCREEN_SCALE_FACTOR=1

    # force electron apps to use wayland
    export NIXOS_OZONE_WL=1
  '';

  persist.data.contents = [
    ".local/share/hyprland/lastVersion"
  ];
}
