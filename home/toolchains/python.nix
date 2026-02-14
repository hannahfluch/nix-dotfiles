{
  config,
  pkgs,
  extra,
  lib,
  ...
}:
let
  pwn = (
    pkgs.python3Packages.pwntools.override {
      debugger = extra.pwndbg;
    }
  ); # todo: shellcraft requires gcc at runtime

  py = pkgs.python3.withPackages (
    pythonPackages: with pythonPackages; [
      virtualenv
      requests
      angr
      z3-solver
      libdebug
      ropper
      pwn
      (vagd.override { pwntools = pwn; })
    ]
  );
in
{

  home.packages = [ py ];
  home.shellAliases =
    let
      pypath = lib.getExe py;
    in
    {
      py = pypath;
      venv = "uv venv --python ${pypath}";
    };

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
        # lamda assignment
        "E731"
      ];
    };
  };
}
