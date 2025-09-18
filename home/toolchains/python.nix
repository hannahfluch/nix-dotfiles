{ config, pkgs, ... }:
let
  py = pkgs.python3.withPackages (
    pythonPackages: with pythonPackages; [
      virtualenv
      requests
      pwntools # todo: shellcraft requires gcc at runtime
      angr
      z3-solver
      libdebug
    ]
  );
in
{

  home.packages = [ py ];

  programs.uv = {
    enable = true;
    settings = {
      python-downloads = "never";
      python-preference = "system";
      # pip.python = py;
    };
  };

  programs.ruff = {
    enable = true;
    settings = {
      line-length = 120;
      cache-dir = config.xdg.cacheHome + "/ruff";
      lint.ignore = [
        # * import related
        "F403"
        "F405"
      ];
    };
  };
}
