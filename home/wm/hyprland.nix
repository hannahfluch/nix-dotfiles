{
  config,
  lib,
  pkgs,
  extra,
  ...
}:
let
  noctalia-shell = lib.getExe config.programs.noctalia-shell.package;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    configType = "lua"; # ;(
    settings =
      let

        # soooooo goooooffffyyyy why lua
        lua = lib.generators.mkLuaInline;
        dsp = {
          exec = cmd: lua ''hl.dsp.exec_cmd("${cmd}")'';
          close = lua "hl.dsp.window.close()";
          exit = lua "hl.dsp.exit()";
          float = lua ''hl.dsp.window.float({ action = "toggle" })'';
          center = lua "hl.dsp.window.center()";
          fullscreen = lua "hl.dsp.window.fullscreen()";
          focus = dir: lua ''hl.dsp.focus({ direction = "${dir}" })'';
          toggleSpecial = name: lua ''hl.dsp.workspace.toggle_special("${name}")'';
          moveToSpecial = name: lua ''hl.dsp.window.move({ workspace = "special:${name}" })'';
          focusWorkspace = ws: lua ''hl.dsp.focus({ workspace = "${toString ws}" })'';
          moveToWorkspace = ws: lua ''hl.dsp.window.move({ workspace = "${toString ws}" })'';
          drag = lua "hl.dsp.window.drag()";
          resize = lua "hl.dsp.window.resize()";
        };
        bind = keys: dispatcher: {
          _args = [
            keys
            dispatcher
          ];
        };
        bindOpts = keys: dispatcher: opts: {
          _args = [
            keys
            dispatcher
            opts
          ];
        };
        autostart =
          cmds:
          let
            execStr = cmd: ''hl.exec_cmd("${cmd}")'';
          in
          {
            _args = [
              "hyprland.start"
              (lua ''
                function()
                  ${lib.concatMapStringsSep "\n    " execStr cmds}
                end
              '')
            ];
          };
        amixer = lib.getExe' pkgs.alsa-utils "amixer";
        brightnessctl = lib.getExe pkgs.brightnessctl;
        mod = "SUPER";

      in
      {
        on = autostart [
          "uwsm app -- ${noctalia-shell}"
          "uwsm app -- ${lib.getExe extra.honklet}"
        ];

        # move between workspaces with touchpad
        gesture = [
          {
            fingers = 3;
            direction = "horizontal";
            action = "workspace";
          }
        ];

        # keybinds
        bind =
          let
            ipc = "${noctalia-shell} ipc call";
          in
          [
            (bind "${mod} + Q" (dsp.exec "uwsm app -- alacritty")) # bluetooth doesnt work without uwsm-specific launch
            (bind "${mod} + B" (dsp.exec "uwsm app -- firefox")) # bluetooth doesnt work without uwsm-specific launch
            (bind "${mod} + W" (dsp.exec "uwsm app -- ${ipc} launcher toggle"))
            (bind "${mod} + A" (dsp.exec "uwsm app -- ${ipc} wallpaper toggle"))
            (bind "${mod} + D" (dsp.exec "uwsm app -- ${ipc} controlCenter toggle"))
            (bind "${mod} + C" (
              dsp.exec "uwsm app -- ${lib.getExe pkgs.hyprshot} -m region -s -o ${config.home.homeDirectory}/screenshots/"
            ))
            (bind "${mod} + L" (dsp.exec "uwsm app -- ${ipc} lockScreen lock"))
            (bind "${mod} + V" (dsp.exec "${ipc} launcher clipboard"))

            (bind "${mod} + X" dsp.close)
            (bind "${mod} + F" dsp.fullscreen)
            (bind "${mod} + M" dsp.exit)
            (bind "${mod} + Space" dsp.float)
            (bind "${mod} + SHIFT + Space" dsp.center)

            (bind "${mod} + left" (dsp.focus "left"))
            (bind "${mod} + right" (dsp.focus "right"))
            (bind "${mod} + up" (dsp.focus "up"))
            (bind "${mod} + down" (dsp.focus "down"))

            (bind "${mod} + mouse_down" (dsp.focusWorkspace "e+1"))
            (bind "${mod} + mouse_up" (dsp.focusWorkspace "e-1"))

            (bind "${mod} + S" (dsp.toggleSpecial "magic"))
            (bind "${mod} + SHIFT + S" (dsp.moveToSpecial "magic"))
            (bindOpts "XF86AudioRaiseVolume" (dsp.exec "${amixer} set Master 5%+") {
              locked = true;
              repeating = true;
            })
            (bindOpts "XF86AudioLowerVolume" (dsp.exec "${amixer} set Master 5%-") {
              locked = true;
              repeating = true;
            })
            (bindOpts "XF86AudioMute" (dsp.exec "${amixer} set Master toggle") { locked = true; })
            (bindOpts "XF86AudioMicMute" (dsp.exec "${amixer} set Capture toggle") { locked = true; })

            (bindOpts "XF86MonBrightnessUp" (dsp.exec "${brightnessctl} s 10%+") {
              locked = true;
              repeating = true;
            })
            (bindOpts "XF86MonBrightnessDown" (dsp.exec "${brightnessctl} s 10%-") {
              locked = true;
              repeating = true;
            })

            (bindOpts "SUPER + mouse:272" dsp.drag { mouse = true; })
            (bindOpts "SUPER + mouse:273" dsp.resize { mouse = true; })

          ]
          ++ (
            # workspaces
            # binds $${mod} + [shift +] {1..9} to [move to] workspace {1..9}

            lib.concatMap (
              i:
              let
                key = toString (lib.mod i 9);
              in
              [
                (bind "${mod} + ${key}" (dsp.focusWorkspace i))
                (bind "${mod} + SHIFT + ${key}" (dsp.moveToWorkspace i))
              ]
            ) (lib.range 1 9)

          );

        config = {
          # graphics
          general = {
            gaps_in = 5;
            gaps_out = 10;
            border_size = 3;
            layout = "dwindle";
            allow_tearing = false;
          };
          decoration = {
            rounding = 10;
            blur = {
              enabled = false;
            };
          };

          dwindle = {
            preserve_split = true;
          };

          master.new_status = "master";

          misc = {
            force_default_wallpaper = 0;
            disable_splash_rendering = true;
          };
          ecosystem.no_update_news = true;

          animations.enabled = true;

          # input
          input = {
            kb_layout = "at";
            kb_variant = "nodeadkeys";
            touchpad.natural_scroll = true;
            follow_mouse = 1;
          };
        };

        # monitors
        monitor = [
          {
            output = "eDP-1";
            mode = "preferred";
            position = "auto";
            scale = "1.333333";
          }
          {
            output = "";
            mode = "preferred";
            position = "auto";
            scale = "1";
            mirror = "eDP-1";

          }
        ];

        # animations
        curve = [
          {
            _args = [
              "easeInOutCirc"
              {
                type = "bezier";
                points = lua "{ {0.85, 0}, {0.15, 1} }";
              }
            ];
          }
          {
            _args = [
              "easeInOutQuart"
              {
                type = "bezier";
                points = lua "{ {0.76, 0}, {0.24, 1} }";
              }
            ];
          }
          {
            _args = [
              "easeInOutCubic"
              {
                type = "bezier";
                points = lua "{ {0.65, 0}, {0.35, 1} }";
              }
            ];
          }
        ];

        animation = [
          {
            leaf = "windows";
            enabled = true;
            speed = 5;
            bezier = "easeInOutCubic";
          }
          {
            leaf = "windowsOut";
            enabled = true;
            speed = 7;
            bezier = "default";
            style = "popin 80%";
          }
          {
            leaf = "border";
            enabled = true;
            speed = 10;
            bezier = "default";
          }
          {
            leaf = "borderangle";
            enabled = true;
            speed = 8;
            bezier = "default";
          }
          {
            leaf = "fade";
            enabled = true;
            speed = 7;
            bezier = "default";
          }
          {
            leaf = "workspaces";
            enabled = true;
            speed = 5.25;
            bezier = "easeInOutQuart";
          }
        ];

        layer_rule = [
          {
            match = {
              namespace = "gtk4-layer-shell";
            };
            no_anim = true;
          }
        ];
        window_rule = [
          {
            match = {
              class = "xwaylandvideobridge";
            };
            opacity = 0.0;
            no_initial_focus = true;
            no_focus = true;
            no_blur = true;
            no_anim = true;
            max_size = "1 1";
          }
        ];

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
    export ELECTRON_OZONE_PLATFORM_HINT=auto
  '';
}
