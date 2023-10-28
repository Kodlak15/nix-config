{
  description = "https://github.com/Kodlak15 NixOS Configurations";

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

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    nixvim,
    eww,
    ...
  } @inputs:
  let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = [ "x86_64-linux" ];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    });
  in 
  {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
    formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      # Desktop
      "everest" = lib.nixosSystem {
        modules = [ ./hosts/everest ];
        specialArgs = { inherit inputs outputs; };
      };
      # Laptop
      "denali" = lib.nixosSystem {
        modules = [ ./hosts/denali ];
        specialArgs = { inherit inputs outputs; };
      };
      # Test VM
      "rainier" = lib.nixosSystem {
        modules = [ ./hosts/rainier ];
        specialArgs = { inherit inputs outputs; };
      };
    };

    homeConfigurations = {
      # Desktop
      "cody@everest" = lib.homeManagerConfiguration {
        modules = [ ./home/cody/everest.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
      # Laptop
      "cody@denali" = lib.homeManagerConfiguration {
        modules = [ ./home/cody/denali.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
      # Test VM
      "cody@rainier" = lib.homeManagerConfiguration {
        modules = [ ./home/cody/rainier.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
  };
}
