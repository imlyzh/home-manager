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

    firefox
    discord
    spotify
    kotatogram-desktop
    transmission_4-gtk

    clash-verge-rev
    # vscode
    file-roller

    #podman-desktop

    firefox
    discord
    spotify
    telegram-desktop
    transmission_4-gtk
    mumble

    obsidian
    logseq
    syncplay
    teamspeak3
    # teamspeak_client
    # teamspeak_server
    # zoom-us
    qbittorrent-enhanced
    localsend
    # steam

    anki
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
