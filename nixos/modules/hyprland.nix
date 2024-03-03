{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprland
    xorg.xrdb
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
  };
}
