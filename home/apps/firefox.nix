{ lib, extra, ... }:
{
  stylix.targets.firefox = {
    profileNames = [ "default" ];
    colorTheme.enable = true;
  };

  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "always";
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;

      ExtensionSettings = {
        "*".installation_mode = "force_installed";
      };
    };

    profiles.default = {
      settings = {
        "sidebar.verticalTabs" = true;
        # mouse selection
        "ui.highlight" = "white";
        "ui.highlighttext" = "#002d75";
      };
      bookmarks = {
        force = true;
        settings =
          let
            search = d: "${d}?channel=${lib.trivial.release}&query=%s";
            bookmarks = lib.mapAttrsToList (
              k: u: {
                name = lib.removePrefix "@" k;
                keyword = k;
                url = "https://" + lib.removePrefix "https://" u;
              }
            );
          in
          [
            {
              toolbar = true;
              bookmarks = bookmarks {
                "@np" = search "search.nixos.org/packages";
                "@no" = search "search.nixos.org/options";
                "@ho" = search "search.nixos.org/options" + "&source=home_manager";
                "@wiki" = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
                "@duckle" = "https://duckle.crouchkick.com/";
                # ctf stuff:
                "@syscall" = "https://filippo.io/linux-syscall-table/";
                "@errno" = "https://github.com/torvalds/linux/blob/master/include/uapi/asm-generic/errno-base.h";
                # enter version like 2.42
                "@libc" = "https://elixir.bootlin.com/glibc/glibc-%s/source";
              };
            }
          ];
      };

      containersForce = true;
      extensions = {
        force = true;
        packages =
          with extra;
          with extensions;
          [
            ublock-origin
            tree-style-tab
            bitwarden
            sponsorblock
            ccnace
            copai
            re-enable-right-click
            violentmonkey
          ];
      };
      search.force = true;
    };
  };
}
