{
  config,
  pkgs,
  extra,
  ...
}:
let
  py = pkgs.python3.withPackages (
    pythonPackages: with pythonPackages; [
      virtualenv
      requests
      (pwntools.override {
        debugger = extra.pwndbg;
      }) # todo: shellcraft requires gcc at runtime
      angr
      z3-solver
      libdebug
      ropper
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
        # lamda assignment
        "E731"
      ];
    };
  };
}
