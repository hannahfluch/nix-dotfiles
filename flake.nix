{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, disko, impermanence, home-manager, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.chicken = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        ./hosts/lenovo-v15-g3-iap.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.hannah = ./home-manager/home.nix;
        }

        disko.nixosModules.disko
        ./disko/disko-config.nix

        impermanence.nixosModules.impermanence
        ./impermanence.nix

        ./persist/persist.nix
        ./persist/conf.nix
      ];
    };
    nixosConfiguration.hatcher = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ pkgs, modulesPath, ... }: {
          imports =
            [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
          networking.wireless.enable = false;
          isoImage.squashfsCompression = "zstd";

          isoImage.contents = [{
            source = self;
            target = "/source";
          }];

          isoImage.storeContents =
            [ self.nixosConfigurations.chicken.config.system.build.toplevel ];

          environment.systemPackages = [
            disko.packages.x86_64-linux.disko-install

            (pkgs.writeShellScriptBin "install-with-disko"
              (builtins.readFile ./scripts/install-with-disko.sh))
          ];
        })
        ./hatcher.nix
        ./hosts/lenovo-v15-g3-iap.nix
      ];

    };
  };
}
