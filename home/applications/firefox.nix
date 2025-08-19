{ extra, ... }:
{
  persist.data.contents = [
    ".mozilla/"
  ];

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
      OfferToSaveLogins = true;
      PasswordManagerEnabled = true;

      ExtensionSettings = {
        "*".installation_mode = "force_installed";
      };
    };

    profiles.default = {
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
          ];
      };
      search.force = true;
    };
  };
}
