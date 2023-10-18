{
  description = "Configuration for my main desktop";

  inputs = {
    # NixPkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home-Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
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
    # Available through nixos-rebuild --flake .#main-desktop
    nixosConfigurations = {
      main-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          # Main NixOS configuration file (replaces /etc/nixos/configuration.nix)
          ./nixos/default.nix
        ];
      };
    };
  };
}
