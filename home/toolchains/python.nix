{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (python3.withPackages (
      pythonPackages: with pythonPackages; [
        virtualenv
        requests
        pwntools # todo: shellcraft requires gcc at runtime
        angr
        z3-solver
        libdebug
      ]
    ))
    ruff
    uv
  ];
}
