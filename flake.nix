{
  description = "This flake serves as the entry point for my various system configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = {nixpkgs, ...}: let 
    forAllSystems = nixpkgs.lib.genAttrs ["x86_64-linux"];
  in {
    templates = {
      nixos-test-vm = {
        description = ''
	  Configuration for the virtual machine I have been testing NixOS out on.
	'';
	path = ./nixos-test-vm;
      };
    };
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
