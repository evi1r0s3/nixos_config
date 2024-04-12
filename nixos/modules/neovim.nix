{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    ripgrep
    fd
  ];
}
