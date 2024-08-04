{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    qFlipper
  ];
  hardware.flipperzero.enable = true;
}
