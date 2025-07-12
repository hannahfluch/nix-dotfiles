prev:
(builtins.mapAttrs (_: p: prev.callPackage p { }) {
  packetTracer = import ./packetTracer.nix;
})
