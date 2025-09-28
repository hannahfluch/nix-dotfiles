{
  pkgs,
  assets,
  ...
}:
{
  programs.vesktop = {
    enable = true;
    package = (
      pkgs.vesktop.overrideAttrs (
        finalAttrs: previousAttrs: {
          postUnpack = ''
            cp ${assets.outPath}/custom_vesktop.gif $sourceRoot/static/shiggy.gif

            ${previousAttrs.postUnpack or ""}

          '';
        }
      )
    );
    vencord.settings = {
      autoUpdate = false;
      autoUpdateNotification = false;
      useQuickCss = true;
      notifyAboutUpdates = false;
      plugins = {
        FakeNitro.enabled = true;
        UserMessagesPronouns.enabled = true;
        CopyFileContents.enabled = true;
      };

    };
  };
  persist.data.contents = [ ".config/vesktop/" ];
}
