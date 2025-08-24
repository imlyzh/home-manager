{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWowPackages.full
    winetricks

    lutris
    steam-run

    noto-fonts
    noto-fonts-cjk
    wqy_zenhei
  ];

  home.sessionVariables = {
    WINEPREFIX = "/home/lyzh/Games/battlenet";
    WINEARCH   = "win64";
  };
}