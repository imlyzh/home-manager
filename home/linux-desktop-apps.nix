{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Fonts
    noto-fonts-cjk-sans
    font-awesome # 好看的图标字体，waybar会用到

    # Network & Tools
    tailscale-systray
    clash-verge-rev
    localsend

    # Browsers
    firefox
    # firefox-devedition
    ungoogled-chromium

    # Communication
    telegram-desktop
    mumble
    # discord
    # teamspeak3
    # teamspeak_client
    # teamspeak_server
    # zoom-us

    # Terminal
    kitty
    ghostty

    # Launchers
    # fuzzel

    # Input Method
    # fcitx5-rime
    # ibus-engines.rime
    # rime-ice

    # File Manager
    file-roller

    # Media Players
    syncplay
    mpv
    vlc

    # Download Tools
    qbittorrent-enhanced
    transmission_4-gtk
    motrix

    # Productivity & Study
    anki
    vscode
    # obsidian
    # logseq

    # Development & Virtualization
    podman-desktop

    krita
    blender
    inkscape
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

  # xdg.configFile = {
  #   "./.config/assets".text = import ../dotfiles/.config/assets;
  #   "./.config/waybar".text = import ../dotfiles/.config/waybar;
  #   "./.config/niri/config.kdl".text = import .../dotfiles/.config/niri/config.kdl;
  # };
}
