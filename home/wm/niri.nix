{
  pkgs,
  lib,
  config,
  extra,
  ...
}:
let
  noctalia-shell = config.programs.noctalia-shell.package;
in
{
  home.packages = [
    pkgs.xwayland-satellite
  ];

  programs.niri = {
    package = pkgs.niri;
    settings = {
      spawn-at-startup = [
        { argv = [ (lib.getExe noctalia-shell) ]; }
        { argv = [ (lib.getExe extra.honklet) ]; }
        {
          argv = [
            (lib.getExe (
              pkgs.writeShellScriptBin "tmp" ''
                #!/bin/sh
                while :; do ${lib.getExe' extra.miri "miri"} service start; sleep 0.5; done
              ''
            ))
          ];
        }
      ];

      layer-rules = [
        {
          matches = [ { namespace = "^noctalia-wallpaper*"; } ];
          place-within-backdrop = true;
        }
      ];
      screenshot-path = "${config.home.homeDirectory}/screenshots/";

      gestures.hot-corners.enable = false;
      input = {
        keyboard = {
          xkb.layout = "at(nodeadkeys)";
          repeat-delay = 500;
          repeat-rate = 25;
        };
        focus-follows-mouse.enable = true;

        touchpad = {
          natural-scroll = true;
        };

        mouse.natural-scroll = false;
      };

      outputs.eDP-1 = {
        scale = 1.333333;
        mode = {
          width = 1920;
          height = 1080;
        };
      };

      hotkey-overlay.skip-at-startup = true;
      debug.honor-xdg-activation-with-invalid-serial = true;

      workspaces."1" = { };
      workspaces."2" = { };
      workspaces."3" = { };
      workspaces."4" = { };
      workspaces."5" = { };
      workspaces."6" = { };

      binds =
        with config.lib.niri.actions;
        let
          alacritty = lib.getExe pkgs.alacritty;
          spawnIpc = a: {
            spawn = [
              (lib.getExe noctalia-shell)
              "ipc"
              "call"
            ]
            ++ (lib.splitString " " a);
          };
          amixer = lib.getExe' pkgs.alsa-utils "amixer";
          brightnessctl = lib.getExe pkgs.brightnessctl;
        in
        {
          # Apps
          "Mod+Q".action = spawn alacritty;
          "Mod+B".action = spawn (lib.getExe pkgs.firefox);
          "Mod+W".action = spawnIpc "launcher toggle";
          "Mod+A".action = spawnIpc "wallpaper toggle";
          "Mod+D".action = spawnIpc "controlCenter toggle";
          "Mod+X".action = close-window;
          "Mod+M".action = quit;

          "Mod+L".action = spawnIpc "lockScreen lock";
          "Mod+V".action = spawnIpc "launcher clipboard";

          # Audio
          XF86AudioRaiseVolume.action.spawn = [
            amixer
            "set"
            "Master"
            "5%+"
          ];
          XF86AudioLowerVolume.action.spawn = [
            amixer
            "set"
            "Master"
            "5%-"
          ];

          XF86AudioMute.action.spawn = [
            amixer
            "set"
            "Master"
            "toggle"
          ];
          XF86AudioMicMute.action.spawn = [
            amixer
            "set"
            "Capture"
            "toggle"
          ];

          # Brightness
          XF86MonBrightnessUp.action.spawn = [
            brightnessctl
            "s"
            "10%+"
          ];
          XF86MonBrightnessDown.action.spawn = [
            brightnessctl
            "s"
            "10%-"
          ];

          # Movement
          "Mod+Left".action = focus-column-left;
          "Mod+Down".action = focus-window-down;
          "Mod+Up".action = focus-window-up;
          "Mod+Right".action = focus-column-right;

          "Mod+Ctrl+Left".action = move-column-left;
          "Mod+Ctrl+Down".action = move-window-down;
          "Mod+Ctrl+Up".action = move-window-up;
          "Mod+Ctrl+Right".action = move-column-right;

          "Mod+Page_Down".action = focus-workspace-down;
          "Mod+Page_Up".action = focus-workspace-up;

          "Mod+Shift+Page_Down".action = move-window-to-workspace-down;
          "Mod+Shift+Page_Up".action = move-window-to-workspace-up;

          # Resize windows
          "Mod+Shift+Left".action = set-column-width "-5%";
          "Mod+Shift+Right".action = set-column-width "+5%";

          # Screenshots (FIXME: sodiboo/niri-flake#1380)
          "Mod+C".action.screenshot = [ ];
          # "Mod+Shift+C".action.screenshot-window = [ ];

          # Workspaces
          "Mod+1".action = focus-workspace "1";
          "Mod+2".action = focus-workspace "2";
          "Mod+3".action = focus-workspace "3";
          "Mod+4".action = focus-workspace "4";
          "Mod+5".action = focus-workspace "5";
          "Mod+6".action = focus-workspace "6";
          "Mod+7".action = focus-workspace 7;
          "Mod+8".action = focus-workspace 8;
          "Mod+9".action = focus-workspace 9;

          "Mod+Shift+1".action.move-window-to-workspace = "1";
          "Mod+Shift+2".action.move-window-to-workspace = "2";
          "Mod+Shift+3".action.move-window-to-workspace = "3";
          "Mod+Shift+4".action.move-window-to-workspace = "4";
          "Mod+Shift+5".action.move-window-to-workspace = "5";
          "Mod+Shift+6".action.move-window-to-workspace = "6";
          "Mod+Shift+7".action.move-window-to-workspace = 7;
          "Mod+Shift+8".action.move-window-to-workspace = 8;
          "Mod+Shift+9".action.move-window-to-workspace = 9;

          "Mod+O".action = toggle-overview;
          "Mod+F".action = maximize-column;
          "Mod+Shift+F".action = fullscreen-window;
          "Mod+Space".action = toggle-window-floating;
        };

      overview.workspace-shadow.enable = false;

      layout = {
        border.width = 2.0;
        gaps = 5;
        struts = {
          bottom = 4;
          top = 4;
          right = 4;
          left = 4;
        };
        shadow.enable = true;
        background-color = "transparent";
      };

      environment = {
        QT_QPA_PLATFORM = "wayland";
        GDK_BACKEND = "wayland,x11,*";
        SDL_VIDEODRIVER = "wayland";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };

      prefer-no-csd = true;
      window-rules = [
        {
          matches = [
            { app-id = "vesktop"; }
          ];
          open-on-workspace = "6";
        }
        {
          matches = [
            { app-id = "^telegram$"; }
            { app-id = "^teams$"; }
          ];
          open-on-workspace = "5";
        }
        {
          matches = [
            { app-id = "^firefox$"; }
          ];
          open-on-workspace = "2";
        }
        {
          matches = [
            {
              app-id = ".*";
            }
          ];

          clip-to-geometry = true;
          geometry-corner-radius = {
            bottom-left = 10.0;
            bottom-right = 10.0;
            top-left = 10.0;
            top-right = 10.0;
          };

        }
        {
          matches = [
            { app-id = "^firefox$"; }
            { app-id = "^com.vector35.binaryninja$"; }
          ];

          popups = {
            opacity = 0.8;
            geometry-corner-radius = {
              bottom-left = 10.0;
              bottom-right = 10.0;
              top-left = 10.0;
              top-right = 10.0;
            };
            background-effect = {
              blur = true;
              saturation = 3;
            };
          };
        }
        {
          matches = [
            {
              app-id = "^firefox$";
              title = "^Picture-in-Picture$";
            }
          ];

          open-floating = true;
          default-floating-position = {
            relative-to = "bottom-right";
            x = 32;
            y = 32;
          };

          default-column-width.proportion = 0.25;
          default-window-height.proportion = 0.25;
          focus-ring.enable = false;
          border.enable = false;
        }
      ];
    };
  };
}
