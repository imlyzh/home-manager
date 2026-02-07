{
  description = "Lyzh's NixOS and Home Manager configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # rust-overlay = {
      # url = "github:oxalica/rust-overlay";
      # inputs.nixpkgs.follows = "nixpkgs";
    # };

    rime-ice = {
      url = "github:iDvel/rime-ice";
      flake = false;
    };

    rime-without-ice = {
      url = "github:imlyzh/rime-without-ice";
      flake = false;
    };

    dotfiles = {
      url = "github:imlyzh/dotfiles";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, dotfiles, ... } @ inputs: rec {
    linux-modules = [
          ./home/home.nix
          ./home/common.nix
          ./home/linux-desktop-apps.nix
          # ({ pkgs, ... }: {
            # nixpkgs.overlays = [ rust-overlay.overlays.default ];
          # })
        ];
    linux-desktop-modules = [
          ./home/home.nix
          ./home/common.nix
          ./home/linux-desktop-apps.nix
          ./home/battlenet-games.nix
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
    };
  };
}
