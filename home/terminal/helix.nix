{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      (import ../toolchains/rust.nix pkgs)
      pyright
      ruff

      nixd
      nixfmt-rfc-style

      omnisharp-roslyn
      csharpier

      nodePackages.typescript-language-server
      nodePackages.prettier

      jdt-language-server

      taplo

      clang-tools
      clang
    ];
    settings = {
      editor.lsp.display-inlay-hints = true;
    };
    themes = {
      everblush_transparent = {
        "inherits" = "everblush";
        "ui.background" = { };
      };
    };

    languages = {
      language = [
        {
          name = "rust";
          language-servers = [ "rust-analyzer" ];
          formatter.command = "rustfmt";
          auto-format = true;
        }

        {
          name = "python";
          language-servers = [ "pyright" ]; # maybe: ruff
        }
        {
          name = "nix";
          language-servers = [ "nixd" ];
          formatter.command = "nixfmt";
          auto-format = true;
        }
        {
          name = "c-sharp";
          language-servers = [ "omnisharp-roslyn" ];
          formatter.command = "csharpier";
          auto-format = true;
        }
        {
          name = "typescript";
          language-servers = [ "typescript-language-server" ];
          formatter.command = "prettier";
          auto-format = true;
        }
        {
          name = "toml";
          language-servers = [ "taplo" ];
        }
        {
          name = "c";
          language-servers = [ "clangd" ];
        }
        {
          name = "qml";
          language-servers = [ ];
        }
      ];
    };
  };
}
