{
  lib,
  config,
  extra,
  assets,
  ...
}:
{
  imports = [
    extra.noctalia-hm
  ];

  # Wallpaper colors belong to Noctalia; app themes remain managed by Stylix.
  stylix.targets.noctalia-shell.enable = false;

  # persist notification & clipboard history
  persist.data.contents = [
    ".local/state/noctalia/clipboard/"

    ".local/state/noctalia/notification_history.enc"
    ".local/state/noctalia/notification_history_assets/"

    ".local/state/noctalia/recently_used.json"
    ".local/state/noctalia/usage_counts.json"
  ];

  programs.noctalia = {
    enable = true;
    checkConfig = true;

    settings = {
      # encryption at rest of notifications & clipboard
      storage = {
        key_source = "file";
        key_file = config.age.secrets.noctalia-storage.path;

      };

      bar.default = {
        position = "top";
        thickness = 36;
        margin_edge = 0;
        margin_ends = 0;
        padding = 8;
        widget_spacing = 6;
        radius = 14;
        radius_top_left = 0;
        radius_top_right = 0;
        concave_edge_corners = true;
        border_width = 0;
        background_opacity = 1.0;
        shadow = true;
        font_scale = 1.1;
        capsule = true;
        capsule_fill = "surface_container";
        capsule_radius = 12;
        capsule_thickness = 0.78;
        capsule_border_width = 0;
        start = [
          "honklet"
          "sysmon"
          "active_window"
          "media"
        ];
        center = [ "workspaces" ];
        end = [
          "clock"
          "tray"
          "notifications"
          "battery"
          "network"
          "volume"
          "brightness"
          "control-center"
        ];
      };
      widget = {
        honklet = {
          type = "custom_button";
          glyph = "feather";
          tooltip = "Toggle goose";
          actions.left = "exec WAYLAND_DISPLAY=wayland-1 ${lib.getExe extra.honklet} ipc call goose toggle";
        };
        sysmon = {
          stat = "cpu_usage";
          visualization = "none";
          label_min_width = 32;
        };
        active_window = {
          min_length = 40;
          max_length = 160;
          title_scroll = "on_hover";
        };
        media = {
          min_length = 40;
          max_length = 160;
          hide_artist = true;
          hide_when_no_media = true;
          title_scroll = "on_hover";
        };
        workspaces = {
          style = "regular";
          hide_when_empty = true;
          capsule = false;
          capsule_radius = 12;
          active_pill_size = 1.6;
        };
      };
      shell = {
        corner_radius_scale = 1.25;
        button_borders = false;
        input_borders = false;
        popup_borders = false;
        card_borders = false;
        animation = {
          enabled = true;
          speed = 1.0;
        };
        shadow = {
          direction = "down";
          alpha = 0.25;
        };
        avatar_path = "${assets.outPath}/pfp.jpg";
        telemetry_enabled = false;
        setup_wizard_enabled = false;
        clipboard_enabled = true;
        clipboard_auto_paste = "off";
        panel = {
          borders = false;
          shadow = true;
          transparency_mode = "solid";
          # Independent placement lets these panels open opposite the top bar.
          launcher_placement = "floating";
          clipboard_placement = "floating";
          control_center_placement = "attached";
          control_center_position = "top_right";
          wallpaper_placement = "attached";
          session_placement = "attached";
          polkit_placement = "attached";
          floating_offset = 0;
          wallpaper_show_names = false;
          launcher_position = "bottom_center";
          clipboard_position = "bottom_center";
        };
        launcher = {
          app_grid = false;
          sort_by_usage = true;
          providers.session.global = true;
        };
      };

      wallpaper = {
        enabled = true;
        directory = "${assets.outPath}/wallpapers";
        default.path = "${assets.outPath}/wallpapers/mountains.jpg";
        per_monitor_directories = false;
        fill_mode = "crop";
        fill_color = "#000000";
        transition_duration = 1500;
        transition_on_startup = true;
        edge_smoothness = 0.05;
        automation = {
          enabled = false;
          order = "random";
          interval_seconds = 300;
        };
      };

      theme = {
        source = "wallpaper";
        mode = "dark";
        wallpaper_scheme = "m3-tonal-spot";
        sync_color_scheme = true;
        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
        };
      };
      # v5 passes the wallpaper through the environment, not $1.
      hooks.wallpaper_changed = ''theme "$NOCTALIA_WALLPAPER_PATH"'';

      lockscreen = {
        lock_before_suspend = true;
        blur_intensity = 0.0;
        tint_intensity = 0.0;
      };
      # A simple clock and compact password row; Enter submits.
      lockscreen_widgets = {
        enabled = true;
        # TODO: fix that this is goofy and just for eDP-1
        widget."lockscreen-clock@eDP-1" = {
          type = "clock";
          output = "eDP-1";
          cx = 1080.0;
          cy = 450.0;
          placement_width = 2160.0;
          placement_height = 1350.0;
          box_width = 360.0;
          box_height = 120.0;
          settings = {
            clock_style = "digital";
            format = "{:%H:%M}";
            center_text = true;
            background = false;
            color = "on_surface";
            shadow = true;
          };
        };
        widget."lockscreen-login-box@eDP-1" = {
          type = "login_box";
          output = "eDP-1";
          cx = 1080.0;
          cy = 1168.0;
          placement_width = 2160.0;
          placement_height = 1350.0;
          box_width = 360.0;
          settings = {
            layout = "compact";
            show_session_buttons = false;
            show_media = false;
            show_weather = false;
            show_password_reveal = false;
            show_login_button = false;
            show_unlock_hint = false;
            show_keyboard_layout = false;
            show_caps_lock = true;
            background_opacity = 0.0;
            input_opacity = 1.0;
            input_radius = 12.0;
            center_password_text = true;
          };
        };
      };
      audio = {
        enable_overdrive = false;
        enable_volume_sounds = false;
        enable_notification_sounds = false;
      };
      location.auto_locate = true;
      weather = {
        enabled = true;
        effects = true;
        unit = "metric";
      };
      nightlight = {
        enabled = false;
        temperature_day = 6500;
        temperature_night = 4000;
      };
      dock.enabled = false;
      notification = {
        position = "top_right";
        layer = "overlay";
        keep_dismissed_in_history = false;
        border = false;
        background_opacity = 1.0;
        offset_x = 0;
        offset_y = 0;
        width = 360;
        max_visible = 3;
        # Hide niri's "Screenshot captured" toast (niri has no option for it)
        filter_order = [ "niri-screenshot" ];
        filter.niri-screenshot = {
          enabled = true;
          match = "niri";
          match_content = "Screenshot captured";
          show_toast = false;
          save_history = false;
          play_sound = false;
        };
      };
      osd = {
        position = "top_right";
        hide_delay_ms = 2000;
        position_vertical = "top_right";
        border = false;
        offset_x = 0;
        offset_y = 0;
        kinds.media = false;
      };
    };
  };
}
