{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprland
    hypridle
    hyprpaper
    hyprcursor
    #hyprlock
    xorg.xrdb
    wev
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # enableNvidiaPatches = true; # unstable nixpkgs dont need this
  };
}
