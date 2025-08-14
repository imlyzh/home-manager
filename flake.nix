{
  description = "Lyzh's NixOS and Home Manager configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # rust-overlay = {
      # url = "github:oxalica/rust-overlay";
      # inputs.nixpkgs.follows = "nixpkgs";
    # };

    dotfiles = {
      url = "github:imlyzh/dotfiles";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, dotfiles, ... } @ inputs: rec {
    linux-modules = [
          ./home/home.nix
          ./home/shell.nix
          ./home/dev.nix
          ./home/docker.nix
          # ({ pkgs, ... }: {
            # nixpkgs.overlays = [ rust-overlay.overlays.default ];
          # })
        ];
    linux-desktop-modules = [
          ./home/home.nix
          ./home/shell.nix
          ./home/dev.nix
          ./home/docker.nix
          ./home/desktop-apps.nix
          # ({ pkgs, ... }: {
            # nixpkgs.overlays = [ rust-overlay.overlays.default ];
          # })
        ];
    darwin-modules = [
          ./home/darwin-home.nix
          ./home/shell.nix
          ./home/dev.nix
          # ({ pkgs, ... }: {
            # nixpkgs.overlays = [ rust-overlay.overlays.default ];
          # })
        ];

    homeConfigurations = {
      "linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          # config.allowUnfree = true;
          # overlays = [
            # rust-overlay.overlays.default
          # ];
          };
        extraSpecialArgs = {
          inherit inputs;
          inherit dotfiles;
          };
        modules = linux-modules;
      };
      "linux-desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          # config.allowUnfree = true;
          # overlays = [
            # rust-overlay.overlays.default
          # ];
          };
        extraSpecialArgs = {
          inherit inputs;
          inherit dotfiles;
          };
        modules = linux-desktop-modules;
      };
      "darwin" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          # config.allowUnfree = true;
          # overlays = [
            # rust-overlay.overlays.default
          # ];
          };
        extraSpecialArgs = {
          inherit inputs;
          inherit dotfiles;
          };
        modules = darwin-modules;
      };
    };
  };
}
