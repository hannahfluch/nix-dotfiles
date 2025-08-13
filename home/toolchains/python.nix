{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (python3.withPackages (
      pythonPackages: with pythonPackages; [
        virtualenv
        requests
        pwntools
        angr
        z3-solver
      ]
    ))
    ruff
    uv
  ];
}
