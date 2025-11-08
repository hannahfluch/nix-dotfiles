{ pkgs, ... }:
{
  home.packages = [ pkgs.go ];
  home.sessionVariables.GOPATH = "/persistent/caches/home/hannah/go/";
}
