prev:
(builtins.mapAttrs (_: p: prev.callPackage p { }) {
  ciscoPacketTracer8 = import ./packetTracer.nix;
})
