{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    urh
    hackrf
  ];
  hardware.hackrf.enable = true;
  users.users.evi1_f4iry.extraGroups = [ "plugdev" ];
}
