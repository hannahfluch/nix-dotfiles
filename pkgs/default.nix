prev:
(builtins.mapAttrs (_: p: prev.callPackage p { }) {
  ciscoPacketTracer8 = import ./packetTracer.nix;
  ida-pro = import ./ida.nix;
})
// {
  python3 = prev.python3.override {
    packageOverrides = python-self: python-super: {
      libdebug = prev.python3Packages.callPackage ./libdebug.nix { };
    };
  };
}
// {
  binaryninja-personal = prev.kdePackages.callPackage ./binja.nix { };
}
