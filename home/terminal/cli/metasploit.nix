{ pkgs, ... }:
{
  home.packages = [
    pkgs.metasploit
  ];

  persist.data.contents = [
    ".msf4/"
  ];
}
