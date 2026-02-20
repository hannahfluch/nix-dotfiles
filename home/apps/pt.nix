{ pkgs, ... }:
{
  home.packages = [ pkgs.ciscoPacketTracer8 ];
  persist.logs.contents = [
    "pt/logs/"
  ];

  persist.data.contents = [
    "pt/saves/"
  ];

  persist.session.contents = [
    "pt/"
    ".local/share/Cisco Packet Tracer/"
  ];
}
