{
  config,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      (import ../rust-toolchain.nix pkgs)
      pyright
      ruff

      nil
      nixfmt-classic

      omnisharp-roslyn
      csharpier

      nodePackages.typescript-language-server
      nodePackages.prettier

      taplo

      clang-tools
      clang
    ];
    settings = {
      theme = "everblush_transparent";
      editor.lsp.display-inlay-hints = true;
    };
    themes = {
      everblush_transparent = {
        "inherits" = "everblush";
        "ui.background" = {};
      };
    };

    languages = {
      langauge = [
        {
          name = "rust";
          language-servers = ["rust-analyzer"];
          formatter.command = "rustfmt";
          auto-format = true;
        }

        {
          name = "python";
          language-servers = ["pyright" "ruff"];
        }
        {
          name = "nix";
          language-servers = ["nil"];
          formatter.command = "nixfmt";
          auto-format = true;
        }
        {
          name = "c-sharp";
          language-servers = ["omnisharp-roslyn"];
          formatter.command = "csharpier";
          auto-format = true;
        }
        {
          name = "typescript";
          language-servers = ["typescript-language-server"];
          formatter.command = "prettier";
          auto-format = true;
        }
        {
          name = "toml";
          language-servers = ["taplo"];
        }
        {
          name = "c";
          language-servers = ["clangd"];
        }
      ];
    };
  };
}
