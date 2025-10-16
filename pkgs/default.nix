prev:
(builtins.mapAttrs (_: p: prev.callPackage p { }) {
  ciscoPacketTracer8 = import ./packetTracer.nix;
})
// {
  python3 = prev.python3.override {
    packageOverrides = python-self: python-super: {
      libdebug = prev.python3Packages.callPackage ./libdebug.nix { };
    };
  };
}
