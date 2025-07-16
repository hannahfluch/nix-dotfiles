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
    fenix = {
      url = "github:nix-community/fenix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, impermanence, home-manager, fenix, ... }:
    let
      system = "x86_64-linux";
      overlays = [ fenix.overlays.default ];
      pkgs = pkgsExternal.extend (_: prev: import ./pkgs prev);

      pkgsExternal = import nixpkgs {
        inherit system overlays;
        config.permittedInsecurePackages = [
          "dotnet-sdk-6.0.428"
          "dotnet-runtime-6.0.36"
        ]; # todo: patch networkminer to use a modern alternative
        config.allowUnfreePredicate = pkg:
          builtins.elem (pkgs.lib.getName pkg) [
            "datagrip"
            "idea-ultimate"
            "geogebra"
            "obsidian"
            "packetTracer"
            "binaryninja-free"
          ];
      };

    in {
      # Please replace my-nixos with your hostname
      nixosConfigurations.chicken = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          { nixpkgs.pkgs = pkgs; }
          {
            # pin system nixpkgs to the same version as the flake input
            # (don't see a way to declaratively set channels but this seems to work fine?)
            nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
          }
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./configuration.nix
          ./hosts/lenovo-v15-g3-iap.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit pkgs; };
            home-manager.users.hannah = ./home-manager/default.nix;
          }

          disko.nixosModules.disko
          ./disko/disko-config.nix

          impermanence.nixosModules.impermanence
          ./impermanence.nix

          ./persist/persist.nix
          ./persist/conf.nix
        ];
      };
      nixosConfigurations.hatcher = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({ pkgs, modulesPath, ... }: {
            imports = [
              (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
            ];
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
