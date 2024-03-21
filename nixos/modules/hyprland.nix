{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprland
    hypridle
    hyprlock
    hyprpaper
    xorg.xrdb
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # enableNvidiaPatches = true; # unstable nixpkgs dont need this
  };
}
