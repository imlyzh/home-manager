{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    direnv

    typst

    verilator
    gtkwave

    openjdk

    rustup

    qemu

    #lunarvim
    neovim

    # (pkgs.rust-bin.stable.latest.default.override {
    #   extensions = [ "cargo" "clippy" "rust" "rust-src" "rust-std" "rustc" "rustfmt" "rust-docs" "rust-analyzer" "miri" ];
    # })
  ];

  programs.direnv = {
    enable = true;
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];
}