{
  description = "My test virtual machine configuration"

  inputs = {
    nixpkgs.url = "github.com:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github.com:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github.com:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = ["x86_64-linux"];

    # This is a function that generates an attribute by calling a function you 
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Custom packages
    # Accessible via 'nix-build', 'nix-shell', etc.
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${systems});

    # Formatter for nix files, available via 'nix fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};

    # Reusable nixos modules to export
    nixosModules = import ./modules/nixos;

    # Reusable home-manager modules to export
    homeManagerModules = import ./modules/home-manager;

    ### NixOS configuration entrypoint ###
    # Available through nixos-rebuild --flake .#nixos-test-vm
    nixosConfigurations = {
      nixos-test-vm = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
	modules = [
	  # Main NixOS configuration file (replaces /etc/nixos/configuration.nix)
	  ./nixos/default.nix
	];
      };
    };

    ### Standalone home-manager configuration entrypoint ###
    # Available through nixos-rebuild --flake .#cody@nixos-test-vm
    homeConfigurations = {
      "cody@nixos-test-vm" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # home-manager requires pkgs instance
	extraSpecialArgs = {inherit inputs outputs;};
        modules = [
	  # Main home-manager configuration file
	  ./home-manager/default.nix
	];
      };
    };
  };
}
