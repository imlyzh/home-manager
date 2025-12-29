{ config, pkgs, inputs, dotfiles, ... }:
let
  rimeDir = if pkgs.stdenv.isDarwin
            then "Library/Rime"
            else "${config.xdg.dataHome}/fcitx5/rime";
in
{
  home.file."${rimeDir}" = {
    source = inputs.rime-ice;
    recursive = true;
  };

  home.file."${rimeDir}/default.custom.yaml".source = "${dotfiles}/rime/default.custom.yaml";
  home.file."${rimeDir}/squirrel.custom.yaml".source = "${dotfiles}/rime/squirrel.custom.yaml";
}