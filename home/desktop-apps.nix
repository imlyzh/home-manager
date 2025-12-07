{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts-cjk-sans # 中日韩字体，防止乱码
  ];
}
