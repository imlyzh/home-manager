{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWowPackages.full
    winetricks

    lutris
    steam-run
    wqy_zenhei
  ];

  home.sessionVariables = {
    WINEPREFIX = "/home/lyzh/Games/battlenet";
    WINEARCH   = "win64";
  };
}