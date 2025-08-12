{ config, pkgs, dotfiles, ... }:
{
  home = {
    username = "lyzh";
    homeDirectory = "/Users/lyzh";
    stateVersion = "25.05";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    tailscale
    the-unarchiver

    raycast           # 新一代应用启动器
    rectangle         # 开源窗口管理

    iterm2
    syncplay
    iina
    qbittorrent-enhanced
    localsend
    appcleaner
    keycastr
    ollama

    zed-editor

    obsidian
    # logseq
    # teamspeak3
    # teamspeak_client
    # teamspeak_server

    firefox
    discord
    spotify
    telegram-desktop
    transmission_4-gtk
    mumble

    whisky
  ];
  programs.home-manager.enable = true;

  home.file = {
    ".config/ghostty/config.toml".text = builtins.readFile ../dotfiles/.config/ghostty/config.toml;
  };
}
