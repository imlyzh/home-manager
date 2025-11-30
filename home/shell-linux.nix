{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    netavark
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "imlyzh";
      email = "enterindex@gmail.com";
    };
  };
}