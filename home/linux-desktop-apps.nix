# 你可以把这个文件保存为 desktop.nix，然后在你的主 home.nix 中导入它
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    font-awesome # 好看的图标字体，waybar会用到

    tailscale-gtk
    # tailscale-systray

    firefox-devedition
    telegram-desktop

    kitty
    ghostty
    fuzzel

    #fcitx5
    ibus

    file-roller

    clash-verge-rev

    ungoogled-chromium
    # firefox
    vlc

    motrix

    anki

    vscode

    # podman-desktop

    # discord
    # obsidian
    # logseq

    # teamspeak3
    # teamspeak_client
    # teamspeak_server
    # zoom-us

    # steam
  ];

  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
  };
  programs.ghostty = {
    enable = true;
  };

  programs.firefox.enable = true;

  # xdg.configFile = {
  #   "./.config/assets".text = import ../dotfiles/.config/assets;
  #   "./.config/waybar".text = import ../dotfiles/.config/waybar;
  #   "./.config/niri/config.kdl".text = import .../dotfiles/.config/niri/config.kdl;
  # };
}
