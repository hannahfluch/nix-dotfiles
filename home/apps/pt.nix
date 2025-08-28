{ pkgs, ... }:
{
  home.packages = [ pkgs.ciscoPacketTracer8 ];
  # todo: split off logs dir
  persist.data.contents = [
    "pt/"
    ".local/share/Cisco Packet Tracer/"
  ];
}
