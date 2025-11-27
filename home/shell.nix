{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    tlrc
    netavark
    nushell
    ripgrep
    broot
    procs
    bottom
    dua
    fd
    sd
    bat
    jaq
    skim
    dust
    delta
    difftastic
    dtach
    zellij
    rustscan
    # uutils-coreutils

    rsync
    zsh
    fish
    wget
    curl
    htop
    btop
    tree
    git
    emacs
    jq
    fzf
    neofetch
    tmux
    screen
    mosh
    coreutils

    aria2
    mihomo
    proxychains-ng
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "robbyrussell";
    };
    syntaxHighlighting.highlighters = [
      "main" "brackets" "pattern" "cursor" "regexp" "root" "line"
    ];
  };
}