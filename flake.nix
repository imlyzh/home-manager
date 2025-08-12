{
  description = "Lyzh's NixOS and Home Manager configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, rust-overlay, ... } @ inputs: {
    homeConfigurations = {
      "linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [
            rust-overlay.overlays.default
          ];
          };
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home/home.nix
          ./home/shell.nix
          ./home/dev.nix
          ./home/docker.nix
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
          })
        ];
      };
      "linux-desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [
            rust-overlay.overlays.default
          ];
          };
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home/home.nix
          ./home/shell.nix
          ./home/dev.nix
          ./home/docker.nix
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
          })
        ];
      };
    };
  };
}
