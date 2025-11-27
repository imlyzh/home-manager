{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    netavark
  ];
}