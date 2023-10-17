{
  description = "Kodlak's NixOS Flake";

  # Think of `inputs` as the parameters that are fed to `outputs`
  inputs = {
    # Nixpkgs
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    # Home manager
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
    ... } @inputs: {
    # Nixos configuration entrypoint
    nixosConfigurations = {
      myconfig = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

	modules = [
	  # Load old configuration as a module
	  ./hosts/test-vm/configuration.nix

	  # Make home-manager a module of nixos so that home-manager will be
	  # automatically deployed when nixos-rebuild switch is run
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.cody = import ./home/default.nix;
	  }

	  # Add hyprland modules
	  hyprland.nixosModules.default
	  {programs.hyprland.enable = true;}
	];
      };
    };

    # Home manager configuration entrypoint
    homeConfigurations."cody@nixos" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      modules = [
        ./home/default.nix
        hyprland.homeManagerModules.default
        {wayland.windowManager.hyprland.enable = true;}
      ];
    };
  };
}
