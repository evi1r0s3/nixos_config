{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    (urh.override { USRPSupport = true; })
    hackrf
    uhd
    gnuradio
  ];
  hardware.hackrf.enable = true;
  users.users.evi1_f4iry.extraGroups = [ "plugdev" ];
}
