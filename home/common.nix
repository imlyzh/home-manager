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
in {
  home.packages = with pkgs; [
    # --- Shells & Prompt (终端外壳与提示符) ---
    zsh
    fish
    nushell
    starship
    direnv

    # --- Modern CLI Replacements (现代 Rust 命令行替代工具) ---
    eza          # ls 替代
    bat          # cat 替代
    fd           # find 替代
    ripgrep      # grep 替代
    sd           # sed 替代
    procs        # ps 替代
    choose       # cut/awk 替代
    zoxide       # cd 替代
    delta        # diff 翻页器
    difftastic   # 结构化 diff
    tlrc         # tldr 客户端
    ouch         # 压缩/解压工具

    # --- Terminal Multiplexers & Session (终端复用与会话) ---
    tmux
    screen
    zellij
    dtach
    mosh

    # --- Editors (编辑器) ---
    neovim
    helix
    # emacs

    # --- File & Disk Utilities (文件与磁盘管理) ---
    broot        # 树状文件管理器
    tree         # 传统树状查看
    fzf          # 模糊查找
    skim         # Rust 版 fzf
    dua          # 磁盘占用分析 (Rust)
    dust         # 磁盘占用分析 (Rust)
    gdu          # 磁盘占用分析 (Go)
    rsync        # 文件同步
    coreutils    # 基础工具集
    # uutils-coreutils

    # --- System Monitoring & Information (系统监控与信息) ---
    htop         # 传统监控
    btop         # 现代监控 (C++)
    bottom       # 现代监控 (Rust)
    neofetch     # 系统信息展示
    tokei        # 代码行数统计

    # --- Network & Download (网络工具与下载) ---
    curl
    wget
    xh           # HTTP 客户端 (类似 HTTPie)
    aria2        # 下载工具
    mihomo       # 代理工具 (Clash)
    proxychains-ng
    gping        # 图形化 ping
    rustscan     # 端口扫描
    bandwhich    # 流量监控

    # --- Data Processing (数据处理) ---
    jq           # JSON 处理 (C)
    jaq          # JSON 处理 (Rust)
    qsv          # CSV 处理

    # --- Development & Languages (开发工具与语言) ---
    git
    just         # 任务运行器 (类似 make)
    rustup       # Rust 工具链
    clang        # C 编译器
    openjdk      # Java 运行环境
    #zig         # Zig 编译器

    # --- Hardware & Simulation (硬件仿真与排版) ---
    qemu         # 虚拟机/仿真
    verilator    # Verilog 仿真
    gtkwave      # 波形查看

    # --- Typesetting (排版) ---
    typst        # 现代 LaTeX 替代
  ];

  programs.direnv = {
    enable = true;
  };

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

  programs.git = {
    enable = true;
    settings.user = {
      name = "imlyzh";
      email = "enterindex@gmail.com";
    };
  };

  # home.sessionVariables = {
  #   RUSTUP_HOME = "$HOME/.rustup";
  #   CARGO_HOME = "$HOME/.cargo";
  # };

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];
  home.file."${rimeDir}" = {
    source = mergeRimeConfigs;
    recursive = true;
  };
  home.file.".config/ibus/rime" = {
    source = mergeRimeConfigs;
    recursive = true;
  };


  xdg.configFile."ghostty/config.toml".source = "${dotfiles}/.config/ghostty/config.toml";
  xdg.configFile."helix/config.toml".source = "${dotfiles}/.config/helix/config.toml";
  xdg.configFile."nvim" = {
    source = pkgs.fetchFromGitHub {
      owner = "imlyzh";
      repo = "lazyvim-starter";
      rev = "f8e157b8ca922ef4578ca5f10076b89226f68998";
      sha256 = "sha256-SMLIbqvOV9FhRMkdzFM9ZRebwDzIiqp1LxECcR47ads=";
    };
    recursive = true;
  };
}