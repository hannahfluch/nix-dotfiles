{
  lib,
  extra,
  assets,
  ...
}:
{
  imports = [
    extra.noctalia-hm
  ];

  # colors generated based on wallpaper
  persist.session.contents = [
    ".config/noctalia/colors.json"
  ];

  stylix.targets.noctalia-shell.enable = false; # dont generate color symlinks
  programs.noctalia-shell =
    let
      widgetArray = x: map (s: { id = s; }) x;
    in
    {
      enable = true;

      settings = {

        bar = {
          barType = "framed";
          position = "top";
          monitors = [ ];
          density = "default";
          showOutline = false;
          showCapsule = true;
          capsuleColorKey = "none";
          widgetSpacing = 6;
          contentPadding = 2;
          fontScale = 1.2;
          enableExclusionZoneInset = true;
          useSeparateOpacity = false;
          marginVertical = 4;
          marginHorizontal = 4;
          frameThickness = 8;
          frameRadius = 12;
          outerCorners = true;
          hideOnOverview = false;
          displayMode = "always_visible";
          autoHideDelay = 500;
          autoShowDelay = 150;
          showOnWorkspaceSwitch = true;
          widgets = {
            left = [
              {
                id = "CustomButton";
                enable = true;
                leftClickExec = "uwsm app -- ${lib.getExe extra.honklet} ipc call goose toggle";
                icon = "hyprland";
              }
            ]
            ++ widgetArray [
              "SystemMonitor"
              "ActiveWindow"
              "MediaMini"
            ];
            center = widgetArray [
              "Workspace"
            ];
            right = widgetArray [
              "Clock"
              "Tray"
              "NotificationHistory"
              "Battery"
              "Network"
              "Volume"
              "Brightness"
              "ControlCenter"
            ];
          };
          mouseWheelAction = "none";
          reverseScroll = false;
          mouseWheelWrap = true;
          middleClickAction = "none";
          middleClickFollowMouse = false;
          middleClickCommand = "";
          rightClickAction = "controlCenter";
          rightClickFollowMouse = true;
          rightClickCommand = "";
          screenOverrides = [ ];
        };
        general = {
          avatarImage = "${assets.outPath}/pfp.jpg";
          showScreenCorners = false;
          forceBlackScreenCorners = false;
          scaleRatio = 1;
          radiusRatio = 1;
          iRadiusRatio = 1;
          boxRadiusRatio = 1;
          screenRadiusRatio = 1;
          animationSpeed = 1;
          animationDisabled = false;

          compactLockScreen = true;
          lockScreenAnimations = true;
          lockOnSuspend = true;
          showSessionButtonsOnLockScreen = false;
          showHibernateOnLockScreen = false;
          enableLockScreenMediaControls = false;

          enableShadows = true;
          enableBlurBehind = true;
          shadowDirection = "bottom_right";
          shadowOffsetX = 2;
          shadowOffsetY = 3;
          language = "";
          allowPanelsOnScreenWithoutBar = true;
          showChangelogOnStartup = true;
          telemetryEnabled = false;
          enableLockScreenCountdown = true;
          lockScreenCountdownDuration = 10000;
          autoStartAuth = false;
          allowPasswordWithFprintd = true;
          clockStyle = "custom";
          clockFormat = "hh\nmm";
          passwordChars = true;
          lockScreenMonitors = [ ];
          lockScreenBlur = 0;
          lockScreenTint = 0;
          reverseScroll = false;
          smoothScrollEnabled = true;
        };
        ui = {
          fontDefaultScale = 1;
          fontFixedScale = 1;
          tooltipsEnabled = true;
          scrollbarAlwaysVisible = true;
          boxBorderEnabled = false;
          translucentWidgets = false;
          panelsAttachedToBar = true;
          settingsPanelMode = "attached";
          settingsPanelSideBarCardStyle = false;
        };
        location = {
          name = "";
          weatherEnabled = true;
          weatherShowEffects = true;
          weatherTaliaMascotAlways = false;
          useFahrenheit = false;
          use12hourFormat = false;
          showWeekNumberInCalendar = false;
          showCalendarEvents = true;
          showCalendarWeather = true;
          analogClockInCalendar = false;
          firstDayOfWeek = -1;
          hideWeatherTimezone = false;
          hideWeatherCityName = false;
          autoLocate = true;
        };
        calendar = {
          cards = [
            {
              enabled = true;
              id = "calendar-header-card";
            }
            {
              enabled = true;
              id = "calendar-month-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
          ];
        };
        wallpaper = {
          enabled = true;
          overviewEnabled = false;
          directory = "${assets.outPath}/wallpapers";
          monitorDirectories = [ ];
          enableMultiMonitorDirectories = false;
          showHiddenFiles = false;
          viewMode = "single";
          setWallpaperOnAllMonitors = true;
          linkLightAndDarkWallpapers = true;
          fillMode = "crop";
          fillColor = "#000000";
          useSolidColor = false;
          automationEnabled = false;
          wallpaperChangeMode = "random";
          randomIntervalSec = 300;
          transitionDuration = 1500;
          transitionType = [
            "fade"
            "disc"
            "stripes"
            "wipe"
            "pixelate"
            "honeycomb"
          ];
          skipStartupTransition = false;
          transitionEdgeSmoothness = 0.05;
          panelPosition = "follow_bar";
          hideWallpaperFilenames = true;
          useOriginalImages = false;
          overviewBlur = 0.4;
          overviewTint = 0.6;
          sortOrder = "name";
          favorites = [ ];
        };
        appLauncher = {
          enableClipboardHistory = true;
          autoPasteClipboard = false;
          enableClipPreview = true;
          clipboardWrapText = true;
          enableClipboardSmartIcons = true;
          enableClipboardChips = true;
          clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
          clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
          position = "bottom_center";
          pinnedApps = [ ];
          sortByMostUsed = true;
          terminalCommand = "alacritty -e";
          customLaunchPrefixEnabled = false;
          customLaunchPrefix = "";
          viewMode = "list";
          showCategories = false;
          iconMode = "tabler";
          showIconBackground = false;
          enableSettingsSearch = true;
          enableWindowsSearch = true;
          enableSessionSearch = true;
          ignoreMouseInput = false;
          screenshotAnnotationTool = "";
          overviewLayer = false;
          density = "default";
        };
        controlCenter = {
          position = "close_to_bar_button";
          diskPath = "/";
          shortcuts = {
            left = widgetArray [
              "Network"
              "Bluetooth"
              "WallpaperSelector"
              "NoctaliaPerformance"
            ];
            right = widgetArray [
              "Notifications"
              "PowerProfile"
              "KeepAwake"
              "NightLight"
            ];
          };
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = true;
              id = "brightness-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
          ];
        };
        systemMonitor = {
          cpuWarningThreshold = 80;
          cpuCriticalThreshold = 90;
          tempWarningThreshold = 80;
          tempCriticalThreshold = 90;
          gpuWarningThreshold = 80;
          gpuCriticalThreshold = 90;
          memWarningThreshold = 80;
          memCriticalThreshold = 90;
          swapWarningThreshold = 80;
          swapCriticalThreshold = 90;
          diskWarningThreshold = 80;
          diskCriticalThreshold = 90;
          diskAvailWarningThreshold = 20;
          diskAvailCriticalThreshold = 10;
          batteryWarningThreshold = 20;
          batteryCriticalThreshold = 5;
          enableDgpuMonitoring = false;
          useCustomColors = false;
          warningColor = "";
          criticalColor = "";
          externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
        };
        noctaliaPerformance = {
          disableWallpaper = true;
          disableDesktopWidgets = true;
        };
        dock.enabled = false;
        network = {
          bluetoothRssiPollingEnabled = false;
          bluetoothRssiPollIntervalMs = 60000;
          networkPanelView = "wifi";
          wifiDetailsViewMode = "grid";
          bluetoothDetailsViewMode = "grid";
          bluetoothHideUnnamedDevices = false;
          disableDiscoverability = false;
          bluetoothAutoConnect = true;
        };
        sessionMenu = {
          enableCountdown = true;
          countdownDuration = 10000;
          position = "center";
          showHeader = true;
          showKeybinds = true;
          largeButtonsStyle = true;
          largeButtonsLayout = "single-row";
          powerOptions = [
            {
              action = "lock";
              enabled = true;
              keybind = "1";
            }
            {
              action = "suspend";
              enabled = true;
              keybind = "2";
            }
            {
              action = "hibernate";
              enabled = true;
              keybind = "3";
            }
            {
              action = "reboot";
              enabled = true;
              keybind = "4";
            }
            {
              action = "logout";
              enabled = true;
              keybind = "5";
            }
            {
              action = "shutdown";
              enabled = true;
              keybind = "6";
            }
            {
              action = "rebootToUefi";
              enabled = true;
              keybind = "7";
            }
          ];
        };
        notifications = {
          enabled = true;
          enableMarkdown = false;
          density = "default";
          monitors = [ ];
          location = "top_right";
          overlayLayer = true;
          respectExpireTimeout = false;
          lowUrgencyDuration = 3;
          normalUrgencyDuration = 8;
          criticalUrgencyDuration = 15;
          clearDismissed = true;
          saveToHistory = {
            low = true;
            normal = true;
            critical = true;
          };
          sounds = {
            enabled = false;
            volume = 0.5;
            separateSounds = false;
            criticalSoundFile = "";
            normalSoundFile = "";
            lowSoundFile = "";
            excludedApps = "discord,firefox,chrome,chromium,edge";
          };
          enableMediaToast = false;
          enableKeyboardLayoutToast = true;
          enableBatteryToast = true;
        };
        osd = {
          enabled = true;
          location = "top_right";
          autoHideMs = 2000;
          overlayLayer = true;
          enabledTypes = [
            0
            1
            2
          ];
          monitors = [ ];
        };
        audio = {
          volumeStep = 5;
          volumeOverdrive = false;
          spectrumFrameRate = 30;
          visualizerType = "linear";
          spectrumMirrored = true;
          mprisBlacklist = [ ];
          preferredPlayer = "";
          volumeFeedback = false;
          volumeFeedbackSoundFile = "";
        };
        brightness = {
          brightnessStep = 5;
          enforceMinimum = true;
          enableDdcSupport = false;
          backlightDeviceMappings = [ ];
        };
        colorSchemes = {
          useWallpaperColors = true;
          darkMode = true;
          schedulingMode = "off";
          manualSunrise = "06:30";
          manualSunset = "18:30";
          generationMethod = "tonal-spot";
          monitorForColors = "";
          syncGsettings = true;
        };
        templates = {
          activeTemplates = [ ];
          enableUserTheming = false;
        };
        nightLight = {
          enabled = false;
          forced = false;
          autoSchedule = true;
          nightTemp = "4000";
          dayTemp = "6500";
          manualSunrise = "06:30";
          manualSunset = "18:30";
        };
        hooks = {
          enabled = true;
          wallpaperChange = "wallpaper $1";
          darkModeChange = "";
          screenLock = "";
          screenUnlock = "";
          performanceModeEnabled = "";
          performanceModeDisabled = "";
          startup = "";
          session = "";
          colorGeneration = "";
        };
        plugins = {
          autoUpdate = false;
          notifyUpdates = true;
        };
        idle = {
          enabled = false;
          screenOffTimeout = 600;
          lockTimeout = 660;
          suspendTimeout = 1800;
          fadeDuration = 5;
          screenOffCommand = "";
          lockCommand = "";
          suspendCommand = "";
          resumeScreenOffCommand = "";
          resumeLockCommand = "";
          resumeSuspendCommand = "";
          customCommands = "[]";
        };
        desktopWidgets = {
          enabled = false;
          overviewEnabled = true;
          gridSnap = false;
          gridSnapScale = false;
          monitorWidgets = [ ];
        };
      };
    };
}
