{ config, pkgs, ... }:
{
  home = {
    username = "lyzh";
    homeDirectory = "/home/lyzh";
    stateVersion = "25.05";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    tailscale
    #v2raya
    zsh

    clang
    #zig

    #clash-rs
    #clashtui

    anki-sync-server
  ];

  programs.direnv = {
    enable = true;
  };

  programs.home-manager.enable = true;
    # backupFileExtension = "backup";

  home.file = {
    ".config/ghostty/config.toml".text = builtins.readFile ../dotfiles/.config/ghostty/config.toml;
  };
}
