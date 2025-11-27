{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    tlrc
    nushell
    ripgrep
    broot
    procs
    bottom
    ouch
    eza
    qsv
    dua
    fd
    sd
    bat
    jaq
    skim
    dust
    just
    tokei
    gitui
    delta
    difftastic
    choose
    zoxide
    starship
    dtach
    zellij
    gping
    netavark
    rustscan
    bandwhich
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