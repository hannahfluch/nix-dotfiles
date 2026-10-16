prev:
(builtins.mapAttrs (_: p: prev.callPackage p { }) {
  ciscoPacketTracer8 = import ./packetTracer.nix;
})
// rec {
  python3Packages = python3.pkgs;
  python3 = prev.python3.override {
    packageOverrides =
      python-self: python-super:
      {
        qiling = python-self.callPackage ./qiling.nix { };
        libdebug = prev.python3Packages.callPackage ./libdebug.nix { };
        vagd = prev.python3Packages.callPackage ./vagd.nix { };
      }
      // import ./angr.nix prev python-self python-super;
  };
}
