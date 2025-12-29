{ config, pkgs, lib, dotfiles, ... }:
{
  home = {
    username = "lyzh";
    homeDirectory = "/home/lyzh";
    stateVersion = "25.05";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = lib.mkDefault pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    tailscale
    zsh

    clang
    #zig

    #v2raya
    #clash-rs
    #clashtui

    anki-sync-server
  ];

  programs.direnv = {
    enable = true;
  };

  programs.home-manager.enable = true;
  # backupFileExtension = "backup";

  xdg.configFile."ghostty/config.toml".source = "${dotfiles}/.config/ghostty/config.toml";
  xdg.configFile."helix/config.toml".source = "${dotfiles}/.config/helix/config.toml";
  xdg.configFile."nvim" = {
    source = pkgs.fetchFromGitHub {
      owner = "imlyzh";
      repo = "lazyvim-starter";
      rev = "f8e157b8ca922ef4578ca5f10076b89226f68998";
      sha256 = "sha256-SMLIbqvOV9FhRMkdzFM9ZRebwDzIiqp1LxECcR47ads=";
    };
    recursive = true;
  };
}
