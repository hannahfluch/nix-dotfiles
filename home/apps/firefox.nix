{ extra, ... }:
{
  persist.data.contents = [
    ".mozilla/"
  ];
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
        settings = [
          {
            name = "wikipedia";
            tags = [ "wiki" ];
            keyword = "@wiki";
            url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
          }
          {
            name = "docs.rs";
            tags = [
              "rust"
              "docs"
            ];
            keyword = "@rd";
            url = "https://docs.rs/%s";
          }
          {
            name = "ghithub";
            tags = [ "github" ];
            keyword = "@git";
            url = "https://github.com/%s";
          }
          {
            name = "nixpkgs";
            tags = [
              "nixpkgs"
              "package"
            ];
            keyword = "@np";
            url = "https://search.nixos.org/packages?channel=25.05&query=%s";
          }
          {
            name = "home-manager options";
            tags = [
              "nixos"
              "home-manager"
              "options"
            ];
            keyword = "@ho";
            url = "https://home-manager-options.extranix.com/?channel=25.05&query=%s";
          }
          {
            name = "nixos options";
            tags = [
              "nixos"
              "options"
            ];
            keyword = "@no";
            url = "https://search.nixos.org/options?channel=25.05&query=%s";
          }
          {
            name = "duckle";
            tags = [ "game" ];
            keyword = "@duckle";
            url = "https://duckle.crouchkick.com/";
          }
          {
            name = "errno";
            tags = [
              "linux"
              "errno"
            ];
            keyword = "@errno";
            url = "https://github.com/torvalds/linux/blob/master/include/uapi/asm-generic/errno-base.h";
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
