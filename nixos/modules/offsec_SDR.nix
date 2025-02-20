{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (urh.override { USRPSupport = true; })
    hackrf
    uhd
    gnuradio
  ];
  hardware.hackrf.enable = true;
  users.users.evi1_f4iry.extraGroups = [ "plugdev" ];
}
