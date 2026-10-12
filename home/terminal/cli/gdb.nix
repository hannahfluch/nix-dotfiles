{ extra, pkgs, ... }: {
  home.packages = [
    pkgs.gdb
    extra.pwndbg
  ];

  xdg.configFile."gdb/gdbinit".text = ''
    set debuginfod urls https://debuginfod.elfutils.org/
    set debuginfod enabled on
  '';
}
