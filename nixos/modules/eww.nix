{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [
    eww
    #pamixer
    brightnessctl
    upower
  ];
  services.upower.enable = true;
}
