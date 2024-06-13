{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    eww
    pamixer
    brightnessctl
    upower
  ];
  services.upower.enable = true;
}
