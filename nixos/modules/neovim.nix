{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [
    ripgrep
    fd
  ];
}
