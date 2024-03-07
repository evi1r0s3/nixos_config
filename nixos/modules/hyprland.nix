{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprland
    hypridle
    hyprlock
    xorg.xrdb
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
  };
}
