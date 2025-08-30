{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      (import ../toolchains/rust.nix pkgs)
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

      sqls
    ];
    settings = {
      editor = {
        lsp.display-inlay-hints = true;
        mouse = false;
      };
      keys.normal = {
        left = "no_op";
        right = "no_op";
        down = "no_op";
        up = "no_op";
      };
    };
    themes = {
      everblush_transparent = {
        "inherits" = "everblush";
        "ui.background" = { };
      };
    };

    languages = {
      language = builtins.map (lang: lang // { auto-format = true; }) [
        {
          name = "rust";
          formatter.command = "rustfmt";
        }
        {
          name = "python";
          formatter.command = "ruff format";
        }
        {
          name = "nix";
          formatter.command = "nixfmt";
        }
        {
          name = "c-sharp";
          formatter.command = "csharpier";
        }
        {
          name = "typescript";
          formatter.command = "prettier";
        }
      ];
    };
  };
}
