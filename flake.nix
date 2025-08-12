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

  outputs = { nixpkgs, home-manager, rust-overlay, ... } @ inputs: rec {
    homeConfigurations = {
      "linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          # config.allowUnfree = true;
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
          # config.allowUnfree = true;
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
      "darwin" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          # config.allowUnfree = true;
          overlays = [
            rust-overlay.overlays.default
          ];
          };
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home/darwin-home.nix
          ./home/shell.nix
          ./home/dev.nix
          ({
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
          })
        ];
      };
    };
    linuxConfig = homeConfigurations."linux";
    linuxDesktopConfig = homeConfigurations."linux-desktop";
    darwinConfig = homeConfigurations."darwin";
  };
}
