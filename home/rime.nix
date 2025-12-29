{ config, pkgs, inputs, dotfiles, ... }:
let
  rimeDir = if pkgs.stdenv.isDarwin
            then "Library/Rime"
            else "${config.xdg.dataHome}/fcitx5/rime";

  mergeRimeConfigs = pkgs.buildEnv {
    name = "rime-merged";
    paths = [
      inputs.rime-ice
      inputs.rime-without-ice
    ];
    pathsToLink = [ "/" ];

    ignoreCollisions = false;
  };
in
{
  home.file."${rimeDir}" = {
    source = mergeRimeConfigs;
    recursive = true;
  };

  # home.file."${rimeDir}/default.custom.yaml".source = "${dotfiles}/rime/default.custom.yaml";
  # home.file."${rimeDir}/squirrel.custom.yaml".source = "${dotfiles}/rime/squirrel.custom.yaml";
}