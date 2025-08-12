{ pkgs, ... }: {
  home.packages = with pkgs; [
    direnv

    typst

    verilator
    gtkwave

    openjdk

    # rustup

    qemu

    lunarvim
    neovim

    (rust-bin.stable.latest.default.override {
      extensions = [ "rust-src" "rust-analyzer" "format" "clippy" "pest-language-server" ];
    })
  ];

  programs.git = {
    enable = true;
    userName = "imlyzh";
    userEmail = "enterindex@gmail.com";
  };

  programs.direnv = {
    enable = true;
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

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