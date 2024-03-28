{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = [
    pkgs.hyprland
    pkgs.hyprpaper
    pkgs.xorg.xrdb
    pkgs.wev
    pkgs-unstable.hypridle
    pkgs-unstable.hyprcursor
  ];
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # enableNvidiaPatches = true; # unstable nixpkgs dont need this
  };
}
