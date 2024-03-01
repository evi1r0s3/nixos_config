{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ hyprland ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
  };
}
