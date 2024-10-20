#
# This file is auto-generated from "README.org"
#
{
  description = "My NixOS config & more!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay.url = "github:nix-community/emacs-overlay";

    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake = {
      url = "github:xremap/nix-flake";
    };

    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = { self, nixpkgs, nixos-cosmic, ... }@inputs:
    let
      system = "x86_64-linux";
      nixpkgsUnfree = nixpkgs { config.allowUnfree = true; };
      pkgs = nixpkgsUnfree.legacyPackages.${system};
    in
      {
        nixosConfigurations = {
          Z13 = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
              inputs.home-manager.nixosModules.default
              ./hosts/Z13/configuration.nix
              ./overlay.nix
              { nix.registry.nixpkgs.flake = nixpkgs; }
              {
                nix.settings = {
                  substituters = [
                    "https://cache.nixos.org"
                  ];
                  trusted-public-keys = [
                    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                  ];
                };
              }
            ];
          };
        };
      };
}
