{ pkgs, ... }:
{
  home.packages = [
    pkgs.metasploit
  ];

  persist.session.contents = [
    ".msf4/"
  ];
}
