# 你可以把这个文件保存为 desktop.nix，然后在你的主 home.nix 中导入它
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts-cjk-sans # 中日韩字体，防止乱码
    font-awesome # 好看的图标字体，waybar会用到

    kitty
    ghostty

    fuzzel

    #fcitx5
    ibus

    clash-verge-rev
    vscode
    file-roller

    firefox
    firefox-devedition
    spotify
    telegram-desktop
    mumble
    syncplay

    localsend
    motrix
    qbittorrent-enhanced
    transmission_4-gtk

    anki

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
      size = 14;
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
