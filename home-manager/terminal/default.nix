{ ... }: {
  imports = [ ./fish.nix ./alacritty.nix ./starship.nix ./helix.nix ];
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
}
