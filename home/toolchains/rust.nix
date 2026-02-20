{ pkgs, ... }:
let
  toolchain = pkgs.fenix.complete.withComponents [
    "rust-std"
    "cargo"
    "rustc"

    "rust-analyzer"
    "rustfmt"
    "clippy"
    "miri"

    "rust-src"
    "rustc-dev"
    "llvm-tools-preview"
  ];
in
{
  home.packages = [ toolchain ];
  programs.helix.extraPackages = [ toolchain ];

  persist.caches.contents = [
    ".cargo/registry/cache/"
  ];

  persist.session.contents = [
    ".cargo/"
  ];
}
