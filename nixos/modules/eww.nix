{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ eww pamixer brightnessctl upower ];
}