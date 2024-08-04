{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    urh
    hackrf
  ];
  hardware.hackrf.enable = true;
}
