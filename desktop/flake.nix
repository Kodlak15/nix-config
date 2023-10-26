{
  description = "Main desktop configuration - Hyprland";

  # -------------------------------------------------------
  # Think of inputs as system parameters
  # -------------------------------------------------------
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    eww = {
      url = "github:elkowar/eww";
    };
  };

  # -------------------------------------------------------
  # Think of outputs as function that produces system
  # -------------------------------------------------------
  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    nixvim,
    eww,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = ["x86_64-linux"];

    # -------------------------------------------------------
    # This is a function that generates an attribute by
    # calling a function you pass to it, with each system as
    # an argument
    # -------------------------------------------------------
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${systems});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    # -------------------------------------------------------
    # System configuration entrypoint
    # -------------------------------------------------------
    nixosConfigurations = {
      "hypr" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/default.nix
        ];
      };
    };

    # -------------------------------------------------------
    # Home configuration entrypoint
    # -------------------------------------------------------
    homeConfigurations = {
      "cody@hypr" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home-manager/default.nix
        ];
      };
    };
  };
}
